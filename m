Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A0D2FA7CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 18:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436611AbhARRoq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 12:44:46 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:41105 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436662AbhARRoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 12:44:37 -0500
Received: by mail-ot1-f49.google.com with SMTP id x13so17040518oto.8;
        Mon, 18 Jan 2021 09:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WshXhzkH2XfopRbzIV2UWEt8m4y4wNSaw59qJ5tNr3s=;
        b=WbGcpXN8RaF1eQdmWJM8Snw6piKSTLoArDTOSKWe1bS7HzMOjxJAx8yKlLPKDG3HBt
         ScE0eRTdEdU7/8OSoIXJ7dK4eKLGauMOIcQqvqk0W4+P3WvY/iVAHDIFBwNzc/Tuu3zO
         XBweaNkatyPpGetiH2S6iX8YPNjTWqql7yA4IRGjlwcEwVXdOqVu4okPKkhvqdUS1Rpr
         tCRvY44SG+DW/48O6lZNHMleczJBqxD2x8vb9mQYYOS8zjzlSEaxK+lGHI50yGZNqXKi
         urJ0XhSNhZeAlKbxoI3zc8runt9kNWjo2rUHA+7cNWIEAWg2Yt4rqiItGeJRqgprrwLt
         b1lA==
X-Gm-Message-State: AOAM530fgFAOxGSZw56PgUFKbUJU0xVQcwu+1MdXc+dJZZFTB/iVTpUh
        Tv6noJ65+LaZptDiOWjaxtyReakH0DXgLKJT+cA=
X-Google-Smtp-Source: ABdhPJw0LIEAGkysll8noaB/WB7jpQwACbfeXdYGkzXxJDZ+grPUIPJqWdg7nE5TVyJy9M1rdgL6SSu1lwZ184oBLsE=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr465551otr.107.1610991835791;
 Mon, 18 Jan 2021 09:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
 <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com> <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
 <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com>
 <fde65185-fd00-1f79-0f80-245eaa6c95cb@samsung.com> <CAGETcx_QY3h83q1fSr=h_vMQdH-TMhVYPozPuSr=q4uv2Lr48w@mail.gmail.com>
In-Reply-To: <CAGETcx_QY3h83q1fSr=h_vMQdH-TMhVYPozPuSr=q4uv2Lr48w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Jan 2021 18:43:44 +0100
Message-ID: <CAMuHMdV6v52RxCqkk8AjMiED5WGWAu4DvBcW3_oM638f29V4Pg@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

On Wed, Jan 13, 2021 at 3:34 AM Saravana Kannan <saravanak@google.com> wrote:
> On Mon, Jan 11, 2021 at 11:11 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > On 11.01.2021 22:47, Saravana Kannan wrote:
> > > On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
> > > <m.szyprowski@samsung.com> wrote:
> > >> On 11.01.2021 12:12, Marek Szyprowski wrote:
> > >>> On 18.12.2020 04:17, Saravana Kannan wrote:
> > >>>> Cyclic dependencies in some firmware was one of the last remaining
> > >>>> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> > >>>> dependencies don't block probing, set fw_devlink=on by default.
> > >>>>
> > >>>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> > >>>> only for systems with device tree firmware):
> > >>>> * Significantly cuts down deferred probes.
> > >>>> * Device probe is effectively attempted in graph order.
> > >>>> * Makes it much easier to load drivers as modules without having to
> > >>>>     worry about functional dependencies between modules (depmod is still
> > >>>>     needed for symbol dependencies).
> > >>>>
> > >>>> If this patch prevents some devices from probing, it's very likely due
> > >>>> to the system having one or more device drivers that "probe"/set up a
> > >>>> device (DT node with compatible property) without creating a struct
> > >>>> device for it.  If we hit such cases, the device drivers need to be
> > >>>> fixed so that they populate struct devices and probe them like normal
> > >>>> device drivers so that the driver core is aware of the devices and their
> > >>>> status. See [1] for an example of such a case.
> > >>>>
> > >>>> [1] -
> > >>>> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> > >>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > >>> This patch landed recently in linux next-20210111 as commit
> > >>> e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it
> > >>> breaks Exynos IOMMU operation, what causes lots of devices being
> > >>> deferred and not probed at all. I've briefly checked and noticed that
> > >>> exynos_sysmmu_probe() is never called after this patch. This is really
> > >>> strange for me, as the SYSMMU controllers on Exynos platform are
> > >>> regular platform devices registered by the OF code. The driver code is
> > >>> here: drivers/iommu/exynos-iommu.c, example dts:
> > >>> arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").
> > >> Okay, I found the source of this problem. It is caused by Exynos power
> > >> domain driver, which is not platform driver yet. I will post a patch,
> > >> which converts it to the platform driver.
> > > Thanks Marek! Hopefully the debug logs I added were sufficient to
> > > figure out the reason.
> >
> > Frankly, it took me a while to figure out that device core waits for the
> > power domain devices. Maybe it would be possible to add some more debug
> > messages or hints? Like the reason of the deferred probe in
> > /sys/kernel/debug/devices_deferred ?
>
> There's already a /sys/devices/.../<device>/waiting_for_supplier file
> that tells you if the device is waiting for a supplier device to be
> added. That file goes away once the device probes. If the file has 1,
> then it's waiting for the supplier device to be added (like your
> case). If it's 0, then the device is just waiting on one of the
> existing suppliers to probe. You can find the existing suppliers
> through /sys/devices/.../<device>/supplier:*/supplier. Also, flip
> these dev_dbg() to dev_info() if you need more details about deferred
> probing.

How are we supposed to check the contents of that file, if the system
doesn't even boot into userspace with a ramdisk? All hardware drivers
fail to probe. The only thing that works is "earlycon keep_bootcon",
and kernel output just stops after a while.

Thanks for your suggestions!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
