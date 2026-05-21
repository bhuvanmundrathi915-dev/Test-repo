public class counttest {

    public static Integer count_num=0;
    @auraEnabled
    public static Integer countit(Integer cou)
    {
        count_num=count_num+1; 
       cou= cou+count_num;
        return cou;
        
    }
}