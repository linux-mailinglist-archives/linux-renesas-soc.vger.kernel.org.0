Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11941304665
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 19:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbhAZRWl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 12:22:41 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:42465 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389977AbhAZI0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 03:26:16 -0500
Received: by mail-oi1-f173.google.com with SMTP id x71so17660251oia.9;
        Tue, 26 Jan 2021 00:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EW5jtfgLGU8vGm7HIAnya+nHmPgJ1972fS8Y7UjkROc=;
        b=pGdhOoZuzHdHFg7YXBZR+fZKIOzU476NU5nza/7KLL+BqEqCXHrxZIZpvyBF1uN/62
         ujVcqwVMI5lc+i4+tBscBBP8AlvZR4/8oLT/0GMfSFO8b8TI9IeDpwuxd5wCQjlARIKG
         lxoxCm5FAIKDzGa57dsY0CkVr5H4ZD50JKYbEkl09M1elmzCjJkDaxlDCgrmRi1mWkrv
         4b9qRB7W2OW/BXmDZBEu/ZB5Q1DqJorab2P8nczC3V3XpCDMIGx2pev7gX8lbtvmPPOu
         RC6HvCnhQ97zg01FCJIvoim5UOZVTtoVN1nY6uLUwLoxFY5ltk1V89migWjvFLPOTmCT
         vB5Q==
X-Gm-Message-State: AOAM531Kgj5NcHvuzQmtgpcdAHhuMt1cCeqAZFf/IQ3Ld/kcQVCC3IXK
        wE3VkGXTNxkiCwExCldPsigg3gs6apBneie6AtU=
X-Google-Smtp-Source: ABdhPJy0J3nuvuAIbwqq7v9KFzbOufzOYMscdPPFXJkfXyNGSs7gKFvVMUNXR+Bdr6C+x212+2P3tKgvt7TQFoFYOWo=
X-Received: by 2002:aca:1219:: with SMTP id 25mr2555820ois.54.1611649533302;
 Tue, 26 Jan 2021 00:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org> <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
 <CAGETcx_aroLLf_U50=KgfOBL-DW+VrgvgrSNEyHAyeSxWKZTgQ@mail.gmail.com>
 <CAMuHMdVTKEy3rbdYYUKS+L1pY0y0ctMWRXNf7o+hJWyGR7L-Dg@mail.gmail.com>
 <CAGETcx-ax00kGq=u_XCaQ0phgc_iCqtqD7k2aiQ1qSLFmrQG=g@mail.gmail.com>
 <CAGETcx_dVCsLObf_APFur6jNiS_7+ymXEjDx4Sy-tBoMCSx71w@mail.gmail.com>
 <CAMuHMdUnxSW+a8Z2dRg4T61VPwJXFBeJ+myFY=xb+mQZmmF0Eg@mail.gmail.com>
 <CAMuHMdVhwdq32krAxgo3UKdVkciwnhN3sRgHrbZ6xPkTvJgh2w@mail.gmail.com>
 <CAGETcx_g60Vw1K0c5JngoLGGYUHh7PCKCsFopRv5++EpKfk6KA@mail.gmail.com>
 <CAMuHMdVDZogiy78CTg4p8pkAhv2MyGQiDgfnawAXQFbNta1jgg@mail.gmail.com> <CAGETcx-GMR1F01TeRW09=sRuA8FF088kyuCnqsP6iF5ePzXFqg@mail.gmail.com>
In-Reply-To: <CAGETcx-GMR1F01TeRW09=sRuA8FF088kyuCnqsP6iF5ePzXFqg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Jan 2021 09:25:22 +0100
Message-ID: <CAMuHMdVMzW=pgqM3XcZvcPd2eyHWr+xNZR4NeAmrmiLnMMfO5A@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

On Tue, Jan 26, 2021 at 12:31 AM Saravana Kannan <saravanak@google.com> wrote:
> On Thu, Jan 21, 2021 at 8:04 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Jan 20, 2021 at 6:23 PM Saravana Kannan <saravanak@google.com> wrote:
> > > On Wed, Jan 20, 2021 at 6:27 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, Jan 20, 2021 at 10:40 AM Geert Uytterhoeven
> > > > <geert@linux-m68k.org> wrote:
> > > > > On Tue, Jan 19, 2021 at 10:51 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > > On Tue, Jan 19, 2021 at 10:08 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > > > > On Tue, Jan 19, 2021 at 1:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > > On Mon, Jan 18, 2021 at 10:19 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > > > > > On Mon, Jan 18, 2021 at 11:16 AM Geert Uytterhoeven
> > > > > > > > > <geert@linux-m68k.org> wrote:
> > > > > > > > > > On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > > > > > > On 2021-01-18 17:39, Geert Uytterhoeven wrote:
> > > > > > > > > > > > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
> > > > > > > > > > > > wrote:
> > > > > > > > > > > >> Cyclic dependencies in some firmware was one of the last remaining
> > > > > > > > > > > >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> > > > > > > > > > > >> dependencies don't block probing, set fw_devlink=on by default.
> > > > > > > > > > > >>
> > > > > > > > > > > >> Setting fw_devlink=on by default brings a bunch of benefits
> > > > > > > > > > > >> (currently,
> > > > > > > > > > > >> only for systems with device tree firmware):
> > > > > > > > > > > >> * Significantly cuts down deferred probes.
> > > > > > > > > > > >> * Device probe is effectively attempted in graph order.
> > > > > > > > > > > >> * Makes it much easier to load drivers as modules without having to
> > > > > > > > > > > >>   worry about functional dependencies between modules (depmod is still
> > > > > > > > > > > >>   needed for symbol dependencies).
> > > > > > > > > > > >>
> > > > > > > > > > > >> If this patch prevents some devices from probing, it's very likely due
> > > > > > > > > > > >> to the system having one or more device drivers that "probe"/set up a
> > > > > > > > > > > >> device (DT node with compatible property) without creating a struct
> > > > > > > > > > > >> device for it.  If we hit such cases, the device drivers need to be
> > > > > > > > > > > >> fixed so that they populate struct devices and probe them like normal
> > > > > > > > > > > >> device drivers so that the driver core is aware of the devices and
> > > > > > > > > > > >> their
> > > > > > > > > > > >> status. See [1] for an example of such a case.
> > > > > > > > > > > >>
> > > > > > > > > > > >> [1] -
> > > > > > > > > > > >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> > > > > > > > > > > >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > > > > > > >
> > > > > > > > > > > > Shimoda-san reported that next-20210111 and later fail to boot
> > > > > > > > > > > > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
> > > > > > > > > > > > is enabled.
> > > > > > > > > > > >
> > > > > > > > > > > > I have bisected this to commit e590474768f1cc04 ("driver core: Set
> > > > > > > > > > > > fw_devlink=on by default").
> >
> > > > > > You'll need to convert drivers/soc/renesas/rcar-sysc.c into a platform
> > > > > > driver. You already have a platform device created for it. So just go
> > > > > > ahead and probe it with a platform driver. See what Marek did here
> > > > > > [1].
> > > > > >
> > > > > > You probably had to implement it as an "initcall based driver"
> > > > > > because you had to play initcall chicken to make sure the PD hardware
> > > > > > was initialized before the consumers. With fw_devlink=on you won't
> > > > > > have to worry about that. As an added benefit of implementing a proper
> > > > > > platform driver, you can  actually implement runtime PM now, your
> > > > > > suspend/resume would be more robust, etc.
> > > > >
> > > > > On R-Car H1, the system controller driver needs to be active before
> > > > > secondary CPU setup, hence the early_initcall().
> > > > > platform_bus_init() is called after that, so this is gonna need a split
> > > > > initialization.  Or a dummy platform driver to make devlinks think
> > > > > everything is fine ;-)
> > >
> > > I was wondering if you could still probe the "not needed by CPU" power
> > > domains (if there are any) as devices. Using driver-core brings you
> > > good things :)
> >
> >  1. That would mean splitting the driver in two parts, looping over the
> >     tables twice, while everything can just be done in the first pass?
> >
> >  2. Which "good things" do you have in mind? Making the driver modular?
> >     Ignoring the dependency for secondary CPU setup on R-Car H1, this
> >     driver could indeed be modular on R-Car Gen2 and Gen3, as long as
> >     the boot loader would pass a ramdisk with the module to the kernel.
> >     The ramdisk could not be loaded in any other way, as all I/O
> >     devices are part of a PM Domain, and thus depend on the SYSC driver.
> >     Note that on some (non-R-Car) SoCs, the timers may be part of a PM
> >     Domain, too.
>
> "Good things" like being able to implement runtime pm, suspend/resume
> robustness (due to device links). There were a few more benefits I had
> in mind when I wrote it, but I don't remember what it was.

While that is valid for I/O devices, the System Controller is a power
provider, and thus provides Runtime PM services itself.  It does not use
Runtime PM itself, as it is always-on.

Note that, in theory, you can have a power provider that can be
powered-down, and thus would use (need) Runtime PM, but then you need to
have a second power provider that is always-on to control the first one,
and the problem would just shift to the second one.

> The double pass itself is not that big of a deal IMHO. It probably
> adds less than a millisecond.

Not all embedded systems run at multi-GHz speed...

> > > > > So basically all producer DT drivers not using a platform (or e.g. i2c)
> > > > > driver are now broken?
> > > > > Including all clock drivers using CLK_OF_DECLARE()?
> > > >
> > > > Oh, of_link_to_phandle() ignores device nodes where OF_POPULATED
> > > > is set, and of_clk_init() sets that flag.  So rcar-sysc should do so, too.
> > > > Patch sent.
> > > > >     $ git grep -L "\<[a-z0-9]*_driver\>" -- $(git grep -l
> > > > > "\.compatible\>") | wc -l
> > > > >     249
> > > > >
> > > > > (includes false positives)
> > > > >
> > > > > I doubt they'll all get fixed for v5.12, as we're already at rc4...
> > > >
> > > > Still more than 100 drivers to fix?
> > >
> > > Not fully sure what the grep is trying to catch, but fw_devlink
> > > supports devices on any bus (i2c, platform, pci, etc). So that's not a
> > > problem. It'll be a problem when a struct device is never created for
> > > a real device. Or if it's created, but never probed.
> >
> > The grep tries to catch drivers using DT matching (i.e. matching ".compatible")
> > and not using a driver model driver (i.e. not matching "*_driver").
>
> Ah TIL about -L and -l. Thanks.
>
> > > I'm also looking into a bunch of other options for fallback when
> > > fw_devlink=on doesn't work. Too much to explain here -- patches are
> > > easier :)
> >
> > I gave it a try on all Renesas platforms I have local access to:
>
> Thanks a lot! Really appreciate the testing and reporting.
>
> >
> >   - R-Car Gen2/Gen3:
> >     Setting OF_POPULATED in the rcar-sysc driver[1] made my standard
> >     config boot again.  Remaining issues:
> >       - CONFIG_IPMMU_VMSA=n hangs: supplier fe990000.iommu not ready
> >       - CONFIG_RCAR_DMAC=n hangs: supplier e7310000.dma-controller not ready
> >         Note that Ethernet does not use the R-Car DMAC, so DHCP works.
> >         Nevertheless, after that everything hangs, and the board does not
> >         respond to pings anymore
> >     Both IOMMU and DMAC dependencies are optional, hence should be dropped
> >     at late boot (late_initcall?).
>
> Yeah, I'm looking into a good/clean way of handling optional
> suppliers. There are a bunch of corner cases I need to consider. But
> in the end, I need to have it behave as closely as possible to
> fw_devlink=permissive.

OK.

> >   - SH-Mobile AG5 and R-Mobile APE6:
> >     The rmobile-sysc driver is similar to the rcar-sysc driver, and does
> >     not use a platform device.
> >     Still, it works, because all dependencies on the System Controller
> >     become unblocked when the rmobile-reset driver binds against the
> >     "renesas,sysc-rmobile" device.  Obviously it would fail if no
> >     support for that driver is included in your kernel...
>
> Yeah, IMHO two real drivers (not stubs) for a single device tree node
> is wrong/weird at a high level. I'd think one should be a child of the
> other. But too late to fix that DT now.
>
> Does it make sense for the rmobile-sysc driver to create a new
> platform device and have the rmobule-reset bind to that instead? And
> then you can bind a stub driver to the "renesas,sysc-rmobile" device?
> I know this can be handled by whatever solution I come up with for the
> IOMMU case, but that doesn't seem right for this case. We don't have
> to decide on this now, but that's my current view.

I guess registering the (system) reset handler in the rmobile-sysc driver
is the simplest solution.  We already have clock drivers
registering (device) reset support, as module clock and module reset
are typically combined in the same hardware block.

> >   - R-Mobile A1:
> >     Also using the rmobile-sysc driver.
> >     However, this is a single core Cortex-A9, i.e. it does not have an
> >     ARM architectured timer (like R-Mobile APE6) or Cortex-A9 Global
> >     Timer (like SH-Mobile AG5).  The timer used (TMU) is located in a PM
> >     Domain controlled by the rmobile-sysc driver, and driver
> >     initialization is postponed beyond the point where something relies
> >     on a working timer, causing a hang.
> >
> >     Setting OF_POPULATED (like in my fix for the rcar-sysc driver) fixes
> >     this, but prevents the rmobile-reset driver from binding against the
> >     same device node, so the reset handling will have to be incorporated
> >     into the rmobile-sysc driver (and will thus be registered very
> >     early).

So the rmobile-sysc driver has to stay a DT driver.

> Or you can do the "create a child device" option I suggested above.

Registering a reset handler from the rmobile-sysc driver is fine.

> >   - RZ/A1 and RZ/A2:
> >     These are not affected, as the timer used (OSTM) is not a platform
> >     driver, but uses TIMER_OF_DECLARE().
> >     Note that the RZ/A2 clock driver uses split initialization:
> >       1. Early (timer) clocks are initialized from CLK_OF_DECLARE_DRIVER,
> >       2. Other clocks are initialized by platform_driver_probe() from a
> >          subsys_initcall.
> >     If the OSTM driver would be a platform_driver, it would block on the
> >     block dependency.  Setting the OF_POPULATED flag in the clock driver
> >     would not work: while that flag would unblock probing of the timer
> >     driver, it would also prevent the second part of the clock driver
> >     initialization.
>
> So this looks like it's all working fine, right? Yeah, I already took
> into account the *OF*_DECLARE macros when I wrote this and was aware
> of the split driver implementations. So hopefully this all works out
> fine.

Some of it is working by accident.

I expect there are systems where the timer driver has been converted
from TIMER_OF_DECLARE() to a platform driver (which people are
recommending, as it is needed for Runtime PM support etc.), and that
will break.  It's hard to predict.

I tested on all Renesas boards I had, as I expected to discover
breakage.  But what exactly broke, and why, was sometimes a bit of a
surprise to me ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
