* Create new and blank DoFile
file open  RecodeFile using "${DoFi}Logic/02_recode.do", write replace
file close RecodeFile

* Write combinations
include ${DoFi}Logic/combinations/11113.do	
include ${DoFi}Logic/combinations/11213.do 
include ${DoFi}Logic/combinations/11313.do
include ${DoFi}Logic/combinations/12313.do
include ${DoFi}Logic/combinations/13113.do
include ${DoFi}Logic/combinations/13313.do
include ${DoFi}Logic/combinations/22313.do 	// create log file for extracting combinations that occur in the dataset and excluding all others
include ${DoFi}Logic/combinations/31113.do
include ${DoFi}Logic/combinations/31121.do
include ${DoFi}Logic/combinations/31122.do
include ${DoFi}Logic/combinations/31123.do
include ${DoFi}Logic/combinations/31213.do
include ${DoFi}Logic/combinations/31221.do
include ${DoFi}Logic/combinations/31222.do
include ${DoFi}Logic/combinations/31223.do
include ${DoFi}Logic/combinations/31313.do
include ${DoFi}Logic/combinations/31321.do
include ${DoFi}Logic/combinations/31322.do
include ${DoFi}Logic/combinations/31323.do


include ${DoFi}Logic/combinations/32313.do
include ${DoFi}Logic/combinations/32321.do
include ${DoFi}Logic/combinations/32322.do
include ${DoFi}Logic/combinations/32323.do
include ${DoFi}Logic/combinations/33113.do
include ${DoFi}Logic/combinations/33121.do
include ${DoFi}Logic/combinations/33123.do
*include ${DoFi}Logic/combinations/33213.do
include ${DoFi}Logic/combinations/33221.do
include ${DoFi}Logic/combinations/33222.do
include ${DoFi}Logic/combinations/33223.do
include ${DoFi}Logic/combinations/33313.do
include ${DoFi}Logic/combinations/33321.do
include ${DoFi}Logic/combinations/33322.do
include ${DoFi}Logic/combinations/33323.do
