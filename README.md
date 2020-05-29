# EOSIO-Shell-Startup

I used those Scripts to start my compiled EOSIO Node for EOSIO Jungle Testnet. It requires you to start multiple Scripts in in correct order for it to work.
This might be outdated very soon but maybe someone might find a use for it. 
Create an folder 'startstopscripts' inside our node folder and place those script in there.
Then sudo bash the control.sh '$ sudo ./control.sh start' or '$ sudo ./ control.sh stop' to start and stop the required Modules.
This might not be the most elegant solution but certainly saved me a bunch of time since you have to manually start and stop all the stuff in order to not break you Node state. 
This might get fixed soon i hope.
