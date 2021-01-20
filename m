Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73B42FCDE9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 11:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbhATKNC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 05:13:02 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:34572 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731583AbhATJlv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 04:41:51 -0500
Received: by mail-oi1-f179.google.com with SMTP id h192so6721730oib.1;
        Wed, 20 Jan 2021 01:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Q4yhklzvPHNt/gBHBl/8Jd3vmVQjKHllSr2BAo9LGo=;
        b=BoUN+/jg1Mi1kR+5ks88ZyRNCG/JQMIbbrdkusazS1u2oPHg2qt5h+xw9AXN5X7K4d
         6oKRuD1YO+r5Z3Bosqg8jfaHxDdM7V+SRPQg/lJ4z0ZrckaBTJWqusaqtZ89OybeIDsq
         p3BOI4DciHz8jnf+S7k0tpv/rA2eHqMilJeUfF8Z36qP6oewWtvd+kOlPBW0Mrjy5eLA
         sbuD/tg5E5t/aaCKeL76q3lXi5kooD9PkR4TygdTCyao4u2w45rtBri5DQYX/kHUtcf7
         m46LwaBAVrnBuxzYofwh5vfxWKXJw1PRWOyf8QM0m7oWSczdgopUEEBrl30IhW88NBWo
         JP5w==
X-Gm-Message-State: AOAM533yZLpSFxqSBNKxaxaoNkCts7rvkSjs3VYPmITc/UO6yIn/Dt8O
        EO3f441atptus0s/1Nu3thNCtXwXTH7zjMIhofI=
X-Google-Smtp-Source: ABdhPJy1aMPC1XqxI18+f9dsb0GQy8H6EjtQja+ox3+x+wM4Tg7pUIGbafYoZU0mUToRvcDVw6zLM7Ms2zUrdlghaOE=
X-Received: by 2002:aca:31d5:: with SMTP id x204mr2305075oix.153.1611135670126;
 Wed, 20 Jan 2021 01:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org> <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
 <CAGETcx_aroLLf_U50=KgfOBL-DW+VrgvgrSNEyHAyeSxWKZTgQ@mail.gmail.com>
 <CAMuHMdVTKEy3rbdYYUKS+L1pY0y0ctMWRXNf7o+hJWyGR7L-Dg@mail.gmail.com>
 <CAGETcx-ax00kGq=u_XCaQ0phgc_iCqtqD7k2aiQ1qSLFmrQG=g@mail.gmail.com> <CAGETcx_dVCsLObf_APFur6jNiS_7+ymXEjDx4Sy-tBoMCSx71w@mail.gmail.com>
In-Reply-To: <CAGETcx_dVCsLObf_APFur6jNiS_7+ymXEjDx4Sy-tBoMCSx71w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Jan 2021 10:40:58 +0100
Message-ID: <CAMuHMdUnxSW+a8Z2dRg4T61VPwJXFBeJ+myFY=xb+mQZmmF0Eg@mail.gmail.com>
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

On Tue, Jan 19, 2021 at 10:51 PM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Jan 19, 2021 at 10:08 AM Saravana Kannan <saravanak@google.com> wrote:
> > On Tue, Jan 19, 2021 at 1:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Mon, Jan 18, 2021 at 10:19 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > On Mon, Jan 18, 2021 at 11:16 AM Geert Uytterhoeven
> > > > <geert@linux-m68k.org> wrote:
> > > > > On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > On 2021-01-18 17:39, Geert Uytterhoeven wrote:
> > > > > > > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
> > > > > > > wrote:
> > > > > > >> Cyclic dependencies in some firmware was one of the last remaining
> > > > > > >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> > > > > > >> dependencies don't block probing, set fw_devlink=on by default.
> > > > > > >>
> > > > > > >> Setting fw_devlink=on by default brings a bunch of benefits
> > > > > > >> (currently,
> > > > > > >> only for systems with device tree firmware):
> > > > > > >> * Significantly cuts down deferred probes.
> > > > > > >> * Device probe is effectively attempted in graph order.
> > > > > > >> * Makes it much easier to load drivers as modules without having to
> > > > > > >>   worry about functional dependencies between modules (depmod is still
> > > > > > >>   needed for symbol dependencies).
> > > > > > >>
> > > > > > >> If this patch prevents some devices from probing, it's very likely due
> > > > > > >> to the system having one or more device drivers that "probe"/set up a
> > > > > > >> device (DT node with compatible property) without creating a struct
> > > > > > >> device for it.  If we hit such cases, the device drivers need to be
> > > > > > >> fixed so that they populate struct devices and probe them like normal
> > > > > > >> device drivers so that the driver core is aware of the devices and
> > > > > > >> their
> > > > > > >> status. See [1] for an example of such a case.
> > > > > > >>
> > > > > > >> [1] -
> > > > > > >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> > > > > > >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > >
> > > > > > > Shimoda-san reported that next-20210111 and later fail to boot
> > > > > > > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
> > > > > > > is enabled.
> > > > > > >
> > > > > > > I have bisected this to commit e590474768f1cc04 ("driver core: Set
> > > > > > > fw_devlink=on by default").
> > > > > >
> > > > > > There is a tentative patch from Saravana here[1], which works around
> > > > > > some issues on my RK3399 platform, and it'd be interesting to find
> > > > > > out whether that helps on your system.
> > > > > >
> > > > > > Thanks,
> > > > > >
> > > > > >          M.
> > > > > >
> > > > > > [1]
> > > > > > https://lore.kernel.org/r/20210116011412.3211292-1-saravanak@google.com
> > > > >
> > > > > Thanks for the suggestion, but given no devices probe (incl. GPIO
> > > > > providers), I'm afraid it won't help. [testing] Indeed.
> > > > >
> > > > > With the debug prints in device_links_check_suppliers enabled, and
> > > > > some postprocessing, I get:
> > > > >
> > > > >     255 supplier e6180000.system-controller not ready
> > > > >       9 supplier fe990000.iommu not ready
> > > > >       9 supplier fe980000.iommu not ready
> > > > >       6 supplier febd0000.iommu not ready
> > > > >       6 supplier ec670000.iommu not ready
> > > > >       3 supplier febe0000.iommu not ready
> > > > >       3 supplier e7740000.iommu not ready
> > > > >       3 supplier e6740000.iommu not ready
> > > > >       3 supplier e65ee000.usb-phy not ready
> > > > >       3 supplier e6570000.iommu not ready
> > > > >       3 supplier e6054000.gpio not ready
> > > > >       3 supplier e6053000.gpio not ready
> > > > >
> > > > > As everything is part of a PM Domain, the (lack of the) system controller
> > > > > must be the culprit. What's wrong with it? It is registered very early in
> > > > > the boot:
> > > > >
> > > > > [    0.142096] rcar_sysc_pd_init:442: of_genpd_add_provider_onecell() returned 0
> > >
> > > > Looks like you found the important logs. Can you please enable all
> > > > these logs and send the early con logs as an attachment (so I don't
> > > > need to deal with lines getting wrapped)?
> > > > 1. The ones in device_links_check_suppliers()
> > > > 2. The ones in device_link_add()
> > > > 3. initcall_debug=1
> > >
> > > I have attached[*] the requested log.
> > >
> > > > That should help us figure out what's going on. Also, what's the DT
> > > > that corresponds to one of the boards that see this issue?
> > >
> > > arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
> > >
> > > > Lastly, can you please pick up these 3 patches (some need clean up
> > > > before they merge) to make sure it's not an issue being worked on from
> > > > other bug reports?
> > > > https://lore.kernel.org/lkml/20210116011412.3211292-1-saravanak@google.com/
> > > > https://lore.kernel.org/lkml/20210115210159.3090203-1-saravanak@google.com/
> > > > https://lore.kernel.org/lkml/20201218210750.3455872-1-saravanak@google.com/
> > > >
> > > > I have a strong hunch the 2nd one will fix your issues. fw_devlink can
> > > > handle cyclic dependencies now (it basically reverts to
> > > > fw_devlink=permissive mode for devices in the cycle), but it needs to
> > > > "see" all the dependencies to know there's a cycle. So want to make
> > > > sure it "sees" the "gpios" binding used all over some of the Renesas
> > > > DT files.
> > >
> > > These patches don't help.
> > > The 2nd one actually introduces a new failure:
> > >
> > >      OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
> > > #gpio-cells for /cpus/cpu@102
> > >
> > > Note that my issues don't seem to be GPIO-related at all.

> I took a look at your logs. It looks like your guess is right. It's at
> least one of the issues.
>
> You'll need to convert drivers/soc/renesas/rcar-sysc.c into a platform
> driver. You already have a platform device created for it. So just go
> ahead and probe it with a platform driver. See what Marek did here
> [1].
>
> You probably had to implement it as an "initcall based driver"
> because you had to play initcall chicken to make sure the PD hardware
> was initialized before the consumers. With fw_devlink=on you won't
> have to worry about that. As an added benefit of implementing a proper
> platform driver, you can  actually implement runtime PM now, your
> suspend/resume would be more robust, etc.

On R-Car H1, the system controller driver needs to be active before
secondary CPU setup, hence the early_initcall().
platform_bus_init() is called after that, so this is gonna need a split
initialization.  Or a dummy platform driver to make devlinks think
everything is fine ;-)

So basically all producer DT drivers not using a platform (or e.g. i2c)
driver are now broken?
Including all clock drivers using CLK_OF_DECLARE()?

    $ git grep -L "\<[a-z0-9]*_driver\>" -- $(git grep -l
"\.compatible\>") | wc -l
    249

(includes false positives)

I doubt they'll all get fixed for v5.12, as we're already at rc4...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
