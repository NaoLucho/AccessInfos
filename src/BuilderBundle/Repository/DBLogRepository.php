<?php

namespace BuilderBundle\Repository;

/**
 * DBLogRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class DBLogRepository extends \Doctrine\ORM\EntityRepository
{

    public function checkIfDBLogExists($createAt, $username)
    {
        $qb = $this->createQueryBuilder('dblog')
            ->where("dblog.createdAt = :createAt")
            ->andWhere('dblog.userName = :username')
            ->setParameter('createAt', $createAt, \Doctrine\DBAL\Types\Type::DATETIME)
            ->setParameter('username', $username)
            ->setMaxResults(1);

        return $qb
            ->getQuery()
            ->getOneOrNullResult();
    }

}
