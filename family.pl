%Jacob Pawlak | CS463G | October 28th, 2017
%Program 4 - Family Trees in Prolog

%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%The Pawlak Geneology Knowledge Base.

%my Pawlaks

age(jacob_Pawlak, 21).
age(matthew_Pawlak, 16).
age(luke_Pawlak, 10).
age(kristen_Pawlak, 50).
age(ralph_Pawlak, 55).

%the Matasichs

age(dolice_Matasich, 78).  
age(josef_Matasich, 82).

%the OConnors

age(pamela_OConnor, 65). 
age(bill_OConnor, 68).
age(will_OConnor, 34).
age(kelly_Spana, 36).

%the other Pawlaks

age(sherri_Pawlak, 58).
age(rick_Pawlak, 59).
age(ricky_Pawlak, 33).
age(andrea_Pawlak, 32).

age(terry_Pawlak, 57).
age(steve_Shwartz, 61).
age(amy_Dow, 30).
age(rebecca_Miller, 31).

age(michelle_Pawlak, 52).
age(jim_Pawlak, 57).
age(nik_Pawlak, 35).
age(tyler_Pawlak, 34).

age(juli_Pawlak, 52).
age(nicole_McFarland, 37).
age(jon_Sylvester, 38).

age(marge_Pawlak, 91).
age(willem_Pawlak, 95).



%children of Marge and Willem: Ralph, Jim, Rick, Terry, Pam, Juli

child(marge_Pawlak, ralph_Pawlak).
child(marge_Pawlak, jim_Pawlak).
child(marge_Pawlak, rick_Pawlak).
child(marge_Pawlak, terry_Pawlak).
child(marge_Pawlak, pamela_OConnor).
child(marge_Pawlak, juli_Pawlak).

child(willem_Pawlak, ralph_Pawlak).
child(willem_Pawlak, jim_Pawlak).
child(willem_Pawlak, rick_Pawlak).
child(willem_Pawlak, terry_Pawlak).
child(willem_Pawlak, pamela_OConnor).
child(willem_Pawlak, juli_Pawlak).

%children of Dolice and Josef: Kristen

child(josef_Matasich, kristen_Pawlak).
child(dolice_Matasich, kristen_Pawlak).

%children of Ralph and Kristen: Jacob, Matthew, Luke

child(ralph_Pawlak, jacob_Pawlak).
child(ralph_Pawlak, matthew_Pawlak).
child(ralph_Pawlak, luke_Pawlak).

child(kristen_Pawlak, jacob_Pawlak).
child(kristen_Pawlak, matthew_Pawlak).
child(kristen_Pawlak, luke_Pawlak).

%children of Pamela and Bill: Will, Kelly

child(bill_OConnor, kelly_Spana).
child(bill_OConnor, will_OConnor).

child(pamela_OConnor, kelly_Spana).
child(pamela_OConnor, will_OConnor).

%children of Sherri and Rick: Ricky, Andrea

child(sherri_Pawlak, ricky_Pawlak).
child(sherri_Pawlak, andrea_Pawlak).

child(rick_Pawlak, ricky_Pawlak).
child(rick_Pawlak, andrea_Pawlak).

%children of Terry and Steve: Amy, Rebecca

child(terry_Pawlak, amy_Dow).
child(terry_Pawlak, rebecca_Miller).

child(steve_Shwartz, amy_Dow).
child(steve_Shwartz, rebecca_Miller).

%children of Juli: Nicole, Jon

child(juli_Pawlak, nicole_McFarland).
child(juli_Pawlak, jon_Sylvester).

%children of Jim and Michelle: Nik, Tyler

child(jim_Pawlak, nik_Pawlak).
child(jim_Pawlak, tyler_Pawlak).

child(michelle_Pawlak, nik_Pawlak).
child(michelle_Pawlak, tyler_Pawlak).


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%The rest of these need to be written implicitly

%parent()

parent(Child, Parent) :- child(Parent, Child).


%sibling()

sibling(Siba, Sibb) :- child(Parent, Siba), child(Parent, Sibb), (Siba \== Sibb).


%nth_cousin()

nth_cousin(Cousa, Cousb, 1) :- parent(Cousa, Siba), parent(Cousb, Sibb), sibling(Siba, Sibb).

nth_cousin(Cousa, Cousb, Nth) :- Next is Nth-1, parent(Cousa, Siba), parent(Cousb, Sibb), nth_cousin(Siba, Sibb, Next).


%nth_cousin_k_times_removed()

nth_cousin_k_times_removed(Cousa, Cousb, Nth, 0) :- nth_cousin(Cousa, Cousb, Nth).

nth_cousin_k_times_removed(Cousa, Cousb, Nth, K) :- Next is K-1, parent(Cousb, Cousc), nth_cousin_k_times_removed(Cousa, Cousc, Nth, Next).


%grandparent()

grandparent(Child, Grandparent) :- child(Parent, Child), child(Grandparent, Parent).


%older_than()

older_than(Fama, Famb) :- age(Fama, Agea), age(Famb, Ageb), (Agea > Ageb).

