Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D1D2FAA0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 20:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405533AbhARTSO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 14:18:14 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:47004 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbhARTR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 14:17:26 -0500
Received: by mail-ot1-f53.google.com with SMTP id w3so17326872otp.13;
        Mon, 18 Jan 2021 11:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUA/mnyxjP9L2OMU61VbkHElNKlPdaS2S5oLVCMPH4M=;
        b=JJyPdFiq2MxA3rIgy0xhEjL+BbVpm4k2ShM4JXQiSblK/eut/lJqyK30AIUdumixMp
         pZ0RcX5lxE3dSjMd8USZMB+3bEhzx1xbfVuCPCSQByadhyKjDtWc2US50qMKzVVgLMg+
         twy2vMo1LvA8rKgpp+kOwaPrUP5ed47SUhwHlHys1Bp8sQj5bNp6KW4l0lPNuGdw6bTJ
         EhmBON/rzdh8wxkBOog+8J3kD1tuJqHrLalMHZfX39oEWMMIB+ZAYmo+roU6UnhVG4kj
         QN98Z3FhG5V4m7p9NpyYalNtSeoso6F7direAKDdZWIajUDqvRtQEIGXrgAqEVbilpiJ
         ePEg==
X-Gm-Message-State: AOAM532UoYohxklF9l6TTP6f2HCgh0VYu1xAeTd+kPliN44+SStP97OU
        EiKEP2vejRz23bMJTXNTrZAaYvpEtDg/X3Y/RQaHzM7QBWw=
X-Google-Smtp-Source: ABdhPJyqOR2pctdifM8EbDQyILRjd4opb2VaefbF60rTfQARhn66h7hOLmIj9Gtpn7p4uZOxhaFBhZhermdlgoVt9Zk=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr781163oth.250.1610997404922;
 Mon, 18 Jan 2021 11:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org>
In-Reply-To: <86db7747ea6d48eebbf40a5855240d14@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Jan 2021 20:16:33 +0100
Message-ID: <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Marc Zyngier <maz@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
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

Hi Marc,

On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
> On 2021-01-18 17:39, Geert Uytterhoeven wrote:
> > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
> > wrote:
> >> Cyclic dependencies in some firmware was one of the last remaining
> >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> >> dependencies don't block probing, set fw_devlink=on by default.
> >>
> >> Setting fw_devlink=on by default brings a bunch of benefits
> >> (currently,
> >> only for systems with device tree firmware):
> >> * Significantly cuts down deferred probes.
> >> * Device probe is effectively attempted in graph order.
> >> * Makes it much easier to load drivers as modules without having to
> >>   worry about functional dependencies between modules (depmod is still
> >>   needed for symbol dependencies).
> >>
> >> If this patch prevents some devices from probing, it's very likely due
> >> to the system having one or more device drivers that "probe"/set up a
> >> device (DT node with compatible property) without creating a struct
> >> device for it.  If we hit such cases, the device drivers need to be
> >> fixed so that they populate struct devices and probe them like normal
> >> device drivers so that the driver core is aware of the devices and
> >> their
> >> status. See [1] for an example of such a case.
> >>
> >> [1] -
> >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >
> > Shimoda-san reported that next-20210111 and later fail to boot
> > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
> > is enabled.
> >
> > I have bisected this to commit e590474768f1cc04 ("driver core: Set
> > fw_devlink=on by default").
>
> There is a tentative patch from Saravana here[1], which works around
> some issues on my RK3399 platform, and it'd be interesting to find
> out whether that helps on your system.
>
> Thanks,
>
>          M.
>
> [1]
> https://lore.kernel.org/r/20210116011412.3211292-1-saravanak@google.com

Thanks for the suggestion, but given no devices probe (incl. GPIO
providers), I'm afraid it won't help. [testing] Indeed.

With the debug prints in device_links_check_suppliers enabled, and
some postprocessing, I get:

    255 supplier e6180000.system-controller not ready
      9 supplier fe990000.iommu not ready
      9 supplier fe980000.iommu not ready
      6 supplier febd0000.iommu not ready
      6 supplier ec670000.iommu not ready
      3 supplier febe0000.iommu not ready
      3 supplier e7740000.iommu not ready
      3 supplier e6740000.iommu not ready
      3 supplier e65ee000.usb-phy not ready
      3 supplier e6570000.iommu not ready
      3 supplier e6054000.gpio not ready
      3 supplier e6053000.gpio not ready

As everything is part of a PM Domain, the (lack of the) system controller
must be the culprit. What's wrong with it? It is registered very early in
the boot:

[    0.142096] rcar_sysc_pd_init:442: of_genpd_add_provider_onecell() returned 0

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
