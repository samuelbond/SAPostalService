/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.util.List;

/**
 *
 * @author samuelbond
 */
public class Pagination {
    private int pageStart;
    private int pageEnd;
    private int currentPage = 1;
    private int pageSize = 10;
    private double totalPage;
    private List item;
    
    
    public Pagination(List item){
    this.item = item;    
    }
    
    public Pagination(List item, int pageSize){
        this.item = item;
        this.pageSize = pageSize;
    }
    
    public void doPagination(){
    int max = this.item.size();
    totalPage = max/pageSize;
    totalPage = Math.ceil(totalPage);
    if(currentPage < 1){
        currentPage = 1;
    }
    
    pageStart = (currentPage - 1) * pageSize;
    pageEnd = pageStart + pageSize;
    pageEnd = ((pageEnd > max) ? pageEnd = max : pageEnd);
    }
    
    public int getPageStart() {
        return pageStart;
    }

    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public double getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(double totalPage) {
        this.totalPage = totalPage;
    }

    public List getItem() {
        return item;
    }

    public void setItem(List item) {
        this.item = item;
    }
    
    
}
