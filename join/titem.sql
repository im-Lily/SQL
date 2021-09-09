SELECT * FROM titem;
SELECT * FROM tcategory;

-- 10.5 상품 정보를 조사하되 할인율과 배송비 같이 출력
select i.item, c.discount, c.delivery
from titem i
inner join tcategory c
on i.category = c.category;

