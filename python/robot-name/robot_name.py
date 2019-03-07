import random

class Robot(object):
    @staticmethod
    def new_name():
        return "{0}{1}{2}{3}{4}".format(chr(random.randint(65,90)),
                                        chr(random.randint(65,90)),
                                        random.randint(0,9),
                                        random.randint(0,9),
                                        random.randint(0,9))

    def __init__(self):
        self.name = Robot.new_name()

    def reset(self):
        random.seed(self.name)
        self.name = Robot.new_name()
