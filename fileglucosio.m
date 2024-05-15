
[id_paz,A,a,b,valore_basale]=textread('parglucosio_ospedale_1.txt', ' %d %f %f %f %f', 'delimiter', '\t');
t=[0:1/60:5];
v_max=zeros(50,1);
t_max=zeros(50,1);
intolleranza=zeros(50,1);
area=zeros(50,1);
BGP=zeros(50,length(t));
BGP_norm=zeros(50,301);
t_norm=zeros(50,1);
ind_norm=zeros(50,1);



for i=1:length(id_paz)
    %calcolo della curva glicemica per ogni paziente
       
        BGP(i,:)= A(i).*(exp(-a(i).*t)-exp(-b(i).*t));
        BGP_TOT(i,:)= BGP(i,:) + valore_basale(i);
       
            
        
     %grafico le curve di concentrazione
     %figure(i), plot(t, BGP_TOT(i,:),'r'),title('Curva Glicemica'), xlabel('tempo'), ylabel('BGP');  
     %valore massimo e tempo al quale questo viene misurato
        [v_max(i),ind_max(i)]= max(BGP_TOT(i,:));
        t_max(i)= t(ind_max(i));
      %calcolo delle aree sottese alla curva  
        fun=@(t,c) A(i).*(exp(-a(i).*t)-exp(-b(i).*t))+ valore_basale(i);
        area(i)= integral(@(t)fun(t,valore_basale(i)),0,5);
      %pazienti che hanno intolleranza al glucosio
    if(valore_basale(i) >= 110 || (v_max(i)) >= 250)
        intolleranza(i)= 1;
    else
        intolleranza(i)=0;
    end
end


%tempo in cui la curva ritorna al di sotto dello scarto positivo del 5%
%calcolo scarto positivo
scarto_positivo = valore_basale + ((valore_basale).*(5/100));
%creo una matrice che contiene solo i valori al di sotto dello scarto,
%altrimenti zero 
for i=1:length(id_paz)
   for j=1:301
    if (BGP_TOT(i,j) < scarto_positivo(i))
       BGP_norm(i,j)=BGP_TOT(i,j);
    else 
        BGP_norm(i,j)=0;
    end
   end
end

for i=1:length(id_paz)
   ind_norm(i)=(max(find(BGP_norm(i,:)==min(BGP_norm(i,:)))))+1;
   t_norm(i)=t(ind_norm(i));

end
    
 %modello compartimentale
 global A_ode;
 global a_ode;
 global b_ode;
 A_ode=mean(A); 
 a_ode=mean(a);
 b_ode=mean(b);
 D=10000;
 V=(D*b_ode)/((b_ode-a_ode)*A_ode);
 
 [t1,q]=ode23(@modello, [0 5], [D 0]);
 
 figure(51), plot(t1,q(:,1),t1,q(:,2));
 xlabel('tempo');
 ylabel('quantità');
 legend('quantità di glucosio nel cavo orale','quantità di glucosio nel compartimento plasmatico');
 
 figure(52)
 BG= q(:,2)/V;

 
 plot(t1,BG+mean(valore_basale),'r');

 legend('concentrazione di glucosio nel compartimento plasmatico');
 xlabel('tempo');
 ylabel('concentrazione');


  
 
 
    

  
  
  
    