Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9F62FEFC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 17:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbhAUQHS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 11:07:18 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:41793 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731320AbhAUQFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 11:05:24 -0500
Received: by mail-ot1-f51.google.com with SMTP id k8so2058510otr.8;
        Thu, 21 Jan 2021 08:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8mfQmfReT25wnQKj1DJyK9QKKsiDgkbRHQ53nVBYZ6c=;
        b=LpK9yOhZ2Z9AuzvTJgHjwbkuqLIFyGoeIZnzbBZH7gYENxSe4YXqhYak8GMnTL30qO
         YSjxUM17eIW/LtwkfUkrjqTK4GqYKW8E3vOK1V0NeE0t2khhyU/9lbPuAg9k6JLmSOal
         Z/8Ay9bA9ZxeYxVWKHEIh92J5UTaPfwbzPuWIiOh/v0kpCxiZk7GejTg7ejNKFH2Tt1k
         LxDW4w2V1qzmqLZJUu5zSFq/xgLHIW9EFIJxrkroMXSNET1BiI92Kjr4LuR3RsNue0U6
         k7r1BR/E3aOJsoCui7GtMEejPX57q++U6ycsWE2o5WMDJUazC4nMIkuy5ZiTuTvP92sd
         z4Yw==
X-Gm-Message-State: AOAM530U0XrwQFH4fYMVJ6Gle0dfr2SNOjqznHQfxKDszVrlJi+dAtXh
        CDNTzv/E9AfMJd+k+l92FEHXeCa4Crxs/q8o/nU=
X-Google-Smtp-Source: ABdhPJxfu70OeyxHDUy8/WMEV1rZFWNot/MBaxZHDWLPf3F1afGn4Vht1OPy+yXvxDlC0GEA+1tZJdnm80MBgvfLBIc=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr10962450oth.250.1611245079559;
 Thu, 21 Jan 2021 08:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org> <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
 <CAGETcx_aroLLf_U50=KgfOBL-DW+VrgvgrSNEyHAyeSxWKZTgQ@mail.gmail.com>
 <CAMuHMdVTKEy3rbdYYUKS+L1pY0y0ctMWRXNf7o+hJWyGR7L-Dg@mail.gmail.com>
 <CAGETcx-ax00kGq=u_XCaQ0phgc_iCqtqD7k2aiQ1qSLFmrQG=g@mail.gmail.com>
 <CAGETcx_dVCsLObf_APFur6jNiS_7+ymXEjDx4Sy-tBoMCSx71w@mail.gmail.com>
 <CAMuHMdUnxSW+a8Z2dRg4T61VPwJXFBeJ+myFY=xb+mQZmmF0Eg@mail.gmail.com>
 <CAMuHMdVhwdq32krAxgo3UKdVkciwnhN3sRgHrbZ6xPkTvJgh2w@mail.gmail.com> <CAGETcx_g60Vw1K0c5JngoLGGYUHh7PCKCsFopRv5++EpKfk6KA@mail.gmail.com>
In-Reply-To: <CAGETcx_g60Vw1K0c5JngoLGGYUHh7PCKCsFopRv5++EpKfk6KA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Jan 2021 17:04:28 +0100
Message-ID: <CAMuHMdVDZogiy78CTg4p8pkAhv2MyGQiDgfnawAXQFbNta1jgg@mail.gmail.com>
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

On Wed, Jan 20, 2021 at 6:23 PM Saravana Kannan <saravanak@google.com> wrote:
> On Wed, Jan 20, 2021 at 6:27 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Jan 20, 2021 at 10:40 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Tue, Jan 19, 2021 at 10:51 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > On Tue, Jan 19, 2021 at 10:08 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > > On Tue, Jan 19, 2021 at 1:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Mon, Jan 18, 2021 at 10:19 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > > > On Mon, Jan 18, 2021 at 11:16 AM Geert Uytterhoeven
> > > > > > > <geert@linux-m68k.org> wrote:
> > > > > > > > On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > > > > On 2021-01-18 17:39, Geert Uytterhoeven wrote:
> > > > > > > > > > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
> > > > > > > > > > wrote:
> > > > > > > > > >> Cyclic dependencies in some firmware was one of the last remaining
> > > > > > > > > >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> > > > > > > > > >> dependencies don't block probing, set fw_devlink=on by default.
> > > > > > > > > >>
> > > > > > > > > >> Setting fw_devlink=on by default brings a bunch of benefits
> > > > > > > > > >> (currently,
> > > > > > > > > >> only for systems with device tree firmware):
> > > > > > > > > >> * Significantly cuts down deferred probes.
> > > > > > > > > >> * Device probe is effectively attempted in graph order.
> > > > > > > > > >> * Makes it much easier to load drivers as modules without having to
> > > > > > > > > >>   worry about functional dependencies between modules (depmod is still
> > > > > > > > > >>   needed for symbol dependencies).
> > > > > > > > > >>
> > > > > > > > > >> If this patch prevents some devices from probing, it's very likely due
> > > > > > > > > >> to the system having one or more device drivers that "probe"/set up a
> > > > > > > > > >> device (DT node with compatible property) without creating a struct
> > > > > > > > > >> device for it.  If we hit such cases, the device drivers need to be
> > > > > > > > > >> fixed so that they populate struct devices and probe them like normal
> > > > > > > > > >> device drivers so that the driver core is aware of the devices and
> > > > > > > > > >> their
> > > > > > > > > >> status. See [1] for an example of such a case.
> > > > > > > > > >>
> > > > > > > > > >> [1] -
> > > > > > > > > >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> > > > > > > > > >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > > > > >
> > > > > > > > > > Shimoda-san reported that next-20210111 and later fail to boot
> > > > > > > > > > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
> > > > > > > > > > is enabled.
> > > > > > > > > >
> > > > > > > > > > I have bisected this to commit e590474768f1cc04 ("driver core: Set
> > > > > > > > > > fw_devlink=on by default").

> > > > You'll need to convert drivers/soc/renesas/rcar-sysc.c into a platform
> > > > driver. You already have a platform device created for it. So just go
> > > > ahead and probe it with a platform driver. See what Marek did here
> > > > [1].
> > > >
> > > > You probably had to implement it as an "initcall based driver"
> > > > because you had to play initcall chicken to make sure the PD hardware
> > > > was initialized before the consumers. With fw_devlink=on you won't
> > > > have to worry about that. As an added benefit of implementing a proper
> > > > platform driver, you can  actually implement runtime PM now, your
> > > > suspend/resume would be more robust, etc.
> > >
> > > On R-Car H1, the system controller driver needs to be active before
> > > secondary CPU setup, hence the early_initcall().
> > > platform_bus_init() is called after that, so this is gonna need a split
> > > initialization.  Or a dummy platform driver to make devlinks think
> > > everything is fine ;-)
>
> I was wondering if you could still probe the "not needed by CPU" power
> domains (if there are any) as devices. Using driver-core brings you
> good things :)

 1. That would mean splitting the driver in two parts, looping over the
    tables twice, while everything can just be done in the first pass?

 2. Which "good things" do you have in mind? Making the driver modular?
    Ignoring the dependency for secondary CPU setup on R-Car H1, this
    driver could indeed be modular on R-Car Gen2 and Gen3, as long as
    the boot loader would pass a ramdisk with the module to the kernel.
    The ramdisk could not be loaded in any other way, as all I/O
    devices are part of a PM Domain, and thus depend on the SYSC driver.
    Note that on some (non-R-Car) SoCs, the timers may be part of a PM
    Domain, too.

> > > So basically all producer DT drivers not using a platform (or e.g. i2c)
> > > driver are now broken?
> > > Including all clock drivers using CLK_OF_DECLARE()?
> >
> > Oh, of_link_to_phandle() ignores device nodes where OF_POPULATED
> > is set, and of_clk_init() sets that flag.  So rcar-sysc should do so, too.
> > Patch sent.
> > >     $ git grep -L "\<[a-z0-9]*_driver\>" -- $(git grep -l
> > > "\.compatible\>") | wc -l
> > >     249
> > >
> > > (includes false positives)
> > >
> > > I doubt they'll all get fixed for v5.12, as we're already at rc4...
> >
> > Still more than 100 drivers to fix?
>
> Not fully sure what the grep is trying to catch, but fw_devlink
> supports devices on any bus (i2c, platform, pci, etc). So that's not a
> problem. It'll be a problem when a struct device is never created for
> a real device. Or if it's created, but never probed.

The grep tries to catch drivers using DT matching (i.e. matching ".compatible")
and not using a driver model driver (i.e. not matching "*_driver").

> I'm also looking into a bunch of other options for fallback when
> fw_devlink=on doesn't work. Too much to explain here -- patches are
> easier :)

I gave it a try on all Renesas platforms I have local access to:

  - R-Car Gen2/Gen3:
    Setting OF_POPULATED in the rcar-sysc driver[1] made my standard
    config boot again.  Remaining issues:
      - CONFIG_IPMMU_VMSA=n hangs: supplier fe990000.iommu not ready
      - CONFIG_RCAR_DMAC=n hangs: supplier e7310000.dma-controller not ready
        Note that Ethernet does not use the R-Car DMAC, so DHCP works.
        Nevertheless, after that everything hangs, and the board does not
        respond to pings anymore
    Both IOMMU and DMAC dependencies are optional, hence should be dropped
    at late boot (late_initcall?).

  - SH-Mobile AG5 and R-Mobile APE6:
    The rmobile-sysc driver is similar to the rcar-sysc driver, and does
    not use a platform device.
    Still, it works, because all dependencies on the System Controller
    become unblocked when the rmobile-reset driver binds against the
    "renesas,sysc-rmobile" device.  Obviously it would fail if no
    support for that driver is included in your kernel...

  - R-Mobile A1:
    Also using the rmobile-sysc driver.
    However, this is a single core Cortex-A9, i.e. it does not have an
    ARM architectured timer (like R-Mobile APE6) or Cortex-A9 Global
    Timer (like SH-Mobile AG5).  The timer used (TMU) is located in a PM
    Domain controlled by the rmobile-sysc driver, and driver
    initialization is postponed beyond the point where something relies
    on a working timer, causing a hang.

    Setting OF_POPULATED (like in my fix for the rcar-sysc driver) fixes
    this, but prevents the rmobile-reset driver from binding against the
    same device node, so the reset handling will have to be incorporated
    into the rmobile-sysc driver (and will thus be registered very
    early).

  - RZ/A1 and RZ/A2:
    These are not affected, as the timer used (OSTM) is not a platform
    driver, but uses TIMER_OF_DECLARE().
    Note that the RZ/A2 clock driver uses split initialization:
      1. Early (timer) clocks are initialized from CLK_OF_DECLARE_DRIVER,
      2. Other clocks are initialized by platform_driver_probe() from a
         subsys_initcall.
    If the OSTM driver would be a platform_driver, it would block on the
    block dependency.  Setting the OF_POPULATED flag in the clock driver
    would not work: while that flag would unblock probing of the timer
    driver, it would also prevent the second part of the clock driver
    initialization.

Now, back to the things I was supposed to work on this week ;-)

[1] https://lore.kernel.org/linux-arm-kernel/20210120142323.2203705-1-geert+renesas@glider.be/


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
