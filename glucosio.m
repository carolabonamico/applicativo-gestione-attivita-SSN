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
        BGP(i,:)=A(i).*(exp(-a(i).*t)-exp(-b(i).*t));
        BGP_TOT(i,:)= BGP(i,:) + valore_basale(i);
    %grafico le curve di concentrazione
         figure(i), plot(t, BGP_TOT(i,:));  
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
%
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
  % nella nuova matrice trovo per ogni riga l'indice del valore maggiore e
  % da questo ne ricavo il tempo 
    for i=1:length(id_paz)
     ind_norm(i)=find(BGP_norm(i,:)== max(BGP_norm(i,:)));
     ind_norm(15)= 83;
     t_norm(i)= t(ind_norm(i));
     end

%scrivo file json
s.paziente(i).id_paz=id_paz(i);
s.paziente(i).area=area(i);
s.paziente(i).v_max= v_max(i);
s.paziente(i).t_max=t_max(i);
s.paziente(i).t_norm=t_norm(i);
s.paziente(i).intolleranza=intolleranza(i);

glucosio_ospedale_4=jsonencode(s)

    
    
