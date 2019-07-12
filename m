Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B74669E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 11:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfGLJ14 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 05:27:56 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42703 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfGLJ1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 05:27:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id l15so8816661otn.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2019 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jYy0XP6ethrem4b19nt43P11ZiYCCwivtW53JRcikeE=;
        b=X22GS1wk91UjPm6+zhjoIjTp6TANbMdrUt6PVMNOW9CW/5FPKoxIlUCGugAB+NRfRQ
         monlxmvfGjdkXHE0ZXj5TSesu/oigagcXG+j6OYS3f9S8e/jIh/2BrFN70n632G8bJlr
         ArRi2NabuE5PXCf2lJC1fyNzO3ZGV7RMpfSmQmT5SJv8S0yYl8b5duVEmdRMT9zOjLV6
         MMlp4NQ2biV1cCjV+lAXpJShoHW000qTR2iSqk+SzD7uaPhNExUrMOch2dzqjkDkaiI0
         Wi1yENBcScRkf2Hq1RIw7hwJWljm7CgJxis3HKB0cvCOtLD888T6G++Uniy7ZJtM3XzJ
         hhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jYy0XP6ethrem4b19nt43P11ZiYCCwivtW53JRcikeE=;
        b=DNEfdwjOP2n/qJufg2zSVO5I8ECKaoIdAWFxYZpzx5CJoc21FeOEdzHhjP4BUW6Xld
         N1Qr4c4mo9nrsi9cEvegkSIAT8CApIZYHfNfQXIX4BNwK5Fn3KFvVpaYDS8jRufFuIu/
         YAaspD6aL6EBiIqQOLpSPocm7uOX/5u0y2RPmNI0bShGjNRIwFh3tqzvEY20GV0jQYHF
         1N2RSzGKnWke+2pR3zRnfXGfehanRStsfq2BbaaqqDhq061ielVngl16y7SVRzrsXUH5
         /ZSbsaL+b8Fi3GnIj7xhtsX+WgZmD8lxg+i863KIjOBlpMZTYSmYeyGjG5DEA6bbcl0q
         OLVA==
X-Gm-Message-State: APjAAAXvO0L6Fi4G52a9FqbXNTWWOrs2Caav1SSiwXP3owatJ91HHh0S
        8Bz949QJQesoVDzvoeUoxOkpbacFKS0Fz6oz4rzYUw==
X-Google-Smtp-Source: APXvYqxmQFQAuZwu//RzFgfnJxLEi/izHgwx7Kkeq/oXPVKBHwaEP5wdAyHZxZ54Z6rZrZsRLEQzcJL5gRduQ6uOogU=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr2470502otk.292.1562923674988;
 Fri, 12 Jul 2019 02:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <CAMpxmJXOrDLdw6ZPBHxzsDRYiLmhRNCb-s_Z=Gu=Ecg1XA5ONQ@mail.gmail.com>
 <CAMuHMdWdb0dcS8Nvk-Poz2dT7nuHjFhqpsRPZZnSKsc3VffcRA@mail.gmail.com>
 <CAMpxmJUF1s1zyXVtoUGfbV7Yk+heua4rNjY=DrX=jr-v8UfNxA@mail.gmail.com> <CAMuHMdUkF32+wOLkfd2BL4h-=0nZjPDMtVOpOcyDYzBbhWXteQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUkF32+wOLkfd2BL4h-=0nZjPDMtVOpOcyDYzBbhWXteQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Jul 2019 11:27:43 +0200
Message-ID: <CAMpxmJXCYeGjCu_PhCPffZQZ+ST9YCp27-PTHfL2SJ0Bh8SJFQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

wt., 9 lip 2019 o 17:59 Geert Uytterhoeven <geert@linux-m68k.org> napisa=C5=
=82(a):
>
> Hi Bartosz,
>
> On Tue, Jul 9, 2019 at 4:59 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > pon., 8 lip 2019 o 12:24 Geert Uytterhoeven <geert@linux-m68k.org> napi=
sa=C5=82(a):
> > > On Mon, Jul 8, 2019 at 11:45 AM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > > > pt., 5 lip 2019 o 18:05 Geert Uytterhoeven <geert+renesas@glider.be=
> napisa=C5=82(a):
> > > > > GPIO controllers are exported to userspace using /dev/gpiochip*
> > > > > character devices.  Access control to these devices is provided b=
y
> > > > > standard UNIX file system permissions, on an all-or-nothing basis=
:
> > > > > either a GPIO controller is accessible for a user, or it is not.
> > > > > Currently no mechanism exists to control access to individual GPI=
Os.
> > > > >
> > > > > Hence add a virtual GPIO driver to aggregate existing GPIOs (up t=
o 32),
> > > > > and expose them as a new gpiochip.  This is useful for implementi=
ng
> > > > > access control, and assigning a set of GPIOs to a specific user.
> > > > > Furthermore, it would simplify and harden exporting GPIOs to a vi=
rtual
> > > > > machine, as the VM can just grab the full virtual GPIO controller=
, and
> > > > > no longer needs to care about which GPIOs to grab and which not,
> > > > > reducing the attack surface.
> > > > >
> > > > > Virtual GPIO controllers are instantiated by writing to the "new_=
device"
> > > > > attribute file in sysfs:
> > > > >
> > > > >     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> > > > >            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> > > > >             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> > > > >
> > > > > Likewise, virtual GPIO controllers can be destroyed after use:
> > > > >
> > > > >     $ echo gpio-virt-agg.<N> \
> > > > >             > /sys/bus/platform/drivers/gpio-virt-agg/delete_devi=
ce
>
> > Am I doing it right? I'm trying to create a device and am only getting =
this:
> >
> > # echo gpiochip2 23 > new_device
> > [  707.507039] gpio-virt-agg gpio-virt-agg.0: Cannot find gpiochip gpio=
chip2
> >
> > gpiochip2 *does* exist in the system.
>
> Please try the name of the platform device instead.
> I.e. for my koelsch (R-Car M2-W), it needs "e6052000.gpio" instead
> of "gpiochip2".
>
> Probably the driver should match on both.
>
> > I see. I'll try to review it more thoroughly once I get to play with
> > it. So far I'm stuck on creating the virtual chip.
>
> Thanks, good luck!
>

This is not a show-stopper but one thing that's bothering me in this
is that lines used by the aggregator are considered 'used' in regard
to the original chip. I'm wondering how much effort would it take to
have them be 'muxed' into two (real and virtual) chips at once.

Other than that - seems to works pretty nice other than the matching
by chip name and by line names.

Bart

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
