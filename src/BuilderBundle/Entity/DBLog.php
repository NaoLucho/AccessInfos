<?php
namespace BuilderBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

use Application\Sonata\UserBundle\Entity\User;

/**
 * @ORM\Entity(repositoryClass="BuilderBundle\Repository\DBLogRepository")
 * @ORM\Table(name="db_log")
 * @ORM\HasLifecycleCallbacks
 */
class DBLog
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(name="env",  type="string", length=255, nullable=true)
     */
    private $env;

    /**
     * @ORM\Column(name="created_at", type="datetime")
     */
    private $createdAt;
    
    /**
     * @ORM\ManyToOne(targetEntity="Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumn(name="userid", referencedColumnName="id", nullable=true)
     */
    private $user;
    
    /**
     * @ORM\Column(name="username", type="string", length=255, nullable=true)
     */
    private $userName;

    /**
     * @ORM\Column(name="action", type="string", length=255, nullable=true)
     */
    private $action;

    /**
     * @ORM\Column(name="entityname", type="string", length=255, nullable=true)
     */
    private $entityName;

    /**
     * @ORM\Column(name="entityid", type="integer", nullable=true)
     */
    private $entityId;

    /**
     * @ORM\Column(name="propertyname",  type="string", length=255, nullable=true)
     */
    private $propertyName;

    /**
     * @ORM\Column(name="oldvalue", type="text", nullable=true)
     */
    private $oldValue;

    /**
     * @ORM\Column(name="newvalue", type="text", nullable=true)
     */
    private $newValue;

    /**
     * @ORM\Column(name="status",  type="string", length=255, nullable=true)
     */
    private $status = 'done';


    /**
     * @ORM\PrePersist
     */
    public function onPrePersist()
    {
        if($this->createdAt == null)
        {
            $this->createdAt = new \DateTime();
        }
    }

    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set env.
     *
     * @param string $env
     *
     * @return DBLog
     */
    public function setEnv($env)
    {
        $this->env = $env;

        return $this;
    }

    /**
     * Get env.
     *
     * @return string
     */
    public function getEnv()
    {
        return $this->env;
    }

    /**
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return DBLog
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get createdAt.
     *
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Set userName.
     *
     * @param string $userName
     *
     * @return DBLog
     */
    public function setUserName($userName)
    {
        $this->userName = $userName;

        return $this;
    }

    /**
     * Get userName.
     *
     * @return string
     */
    public function getUserName()
    {
        return $this->userName;
    }

    /**
     * Set action.
     *
     * @param string $action
     *
     * @return DBLog
     */
    public function setAction($action)
    {
        $this->action = $action;

        return $this;
    }

    /**
     * Get action.
     *
     * @return string
     */
    public function getAction()
    {
        return $this->action;
    }

    /**
     * Set entityName.
     *
     * @param string $entityName
     *
     * @return DBLog
     */
    public function setEntityName($entityName)
    {
        $this->entityName = $entityName;

        return $this;
    }

    /**
     * Get entityName.
     *
     * @return string
     */
    public function getEntityName()
    {
        return $this->entityName;
    }

    /**
     * Set entityId.
     *
     * @param int $entityId
     *
     * @return DBLog
     */
    public function setEntityId($entityId)
    {
        $this->entityId = $entityId;

        return $this;
    }

    /**
     * Get entityId.
     *
     * @return int
     */
    public function getEntityId()
    {
        return $this->entityId;
    }

    /**
     * Set propertyName.
     *
     * @param string $propertyName
     *
     * @return DBLog
     */
    public function setPropertyName($propertyName)
    {
        $this->propertyName = $propertyName;

        return $this;
    }

    /**
     * Get propertyName.
     *
     * @return string
     */
    public function getPropertyName()
    {
        return $this->propertyName;
    }

    /**
     * Set oldValue.
     *
     * @param string $oldValue
     *
     * @return DBLog
     */
    public function setOldValue($oldValue)
    {
        $this->oldValue = $oldValue;

        return $this;
    }

    /**
     * Get oldValue.
     *
     * @return string
     */
    public function getOldValue()
    {
        return $this->oldValue;
    }

    /**
     * Set newValue.
     *
     * @param string $newValue
     *
     * @return DBLog
     */
    public function setNewValue($newValue)
    {
        $this->newValue = $newValue;

        return $this;
    }

    /**
     * Get newValue.
     *
     * @return string
     */
    public function getNewValue()
    {
        return $this->newValue;
    }

    /**
     * Set user.
     *
     * @param \Application\Sonata\UserBundle\Entity\User|null $user
     *
     * @return DBLog
     */
    public function setUser(\Application\Sonata\UserBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user.
     *
     * @return \Application\Sonata\UserBundle\Entity\User|null
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set status.
     *
     * @param string $status
     *
     * @return DBLog
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status.
     *
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }
}
