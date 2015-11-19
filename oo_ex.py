#!/usr/bin/env python

class Customer(object):
    
    def __init__(self, name, balance=0.0):
        self.name = name
        self.balance = balance

    def withdraw(self, amount):
        if amount > self.balance:
            raise RuntimeError('Amount greater than available balance.')
        self.balance -= amount
        return self.balance

    def deposit(self, amount):
        self.balance += amount
        return self.balance


class Vehicle(object):

    wheels = 4
    color = 'orange'

    def __init__(self, make, model):
        self.make = make
        self.model = model

    @staticmethod
    def make_car_sound():
        print 'VRooooommmm!'

    @classmethod
    def is_motorcycle(cls):
        cls.wheels = 2

def __main__():

    scott = Customer('Scott Gillespie', 2000.0)
    print scott.balance

    scott.withdraw(400)
    print scott.balance

    scott.deposit(700)
    print scott.balance

    wrx = Vehicle('Subaru', 'WRX')
    print wrx.wheels
    print wrx.color
    print Vehicle.wheels
    print Vehicle.color

    wrx.make_car_sound()

    ktm = Vehicle('KTM', 'Enduro')
    ktm.is_motorcycle()
    print ktm.wheels

__main__()
