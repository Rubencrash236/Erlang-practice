-module(overall).
-export([product/1]).

%When the list is empty
product([])->0;
%If not empty call product/2
product(List) -> product(List, 1).

%When list empty, stop, report
product([],Product)->Product;
product([Head|Tail], Product) -> product(Tail, Product*Head).
