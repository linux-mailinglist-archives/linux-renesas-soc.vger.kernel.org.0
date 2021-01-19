Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12452FC1F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 22:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbhASSsy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 13:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392316AbhASSKg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 13:10:36 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71528C061573
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 10:09:34 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id i141so9368288yba.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 10:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcSMr/uMfcOCC62aD8IIH6qkyxnRuZ9mkMh9pHaPg30=;
        b=E1FVzZ7dDBALRDqcAzpufiiXCM2TDTRF0yRrMzrrgQi9hl1ivjppIzJuDjBojHPeY6
         wCsXg6pLeF/n5fpa89SR4PTfLGjasEN1hC1jK4c0yepNojzoU3i9qPjoW5ubzPaEaC7A
         NDqcDJzTq62MlHe+o6yHnY5Rv/otNUozWtM6NjzXvj5nsl46iVi6Xv29++Adpi6yfLpy
         mTxLrh9z99v7nPtvaEZ4W+GBFg0i1rYm3EdsbWCLck7/boiJ4ACCRZ0y3aJ5RDXdS2Nl
         EwnEl08CdL+WrdYDLJK8USQvAFzzidvLQLi7CVN3od6prEmP9eUKmYgqP9DmSeL2G3PZ
         JsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcSMr/uMfcOCC62aD8IIH6qkyxnRuZ9mkMh9pHaPg30=;
        b=KXFu0dI3jvZOIqef/jckDDJXzZE6LlElxLINJbzyJG6E6wbzUkXPP8/T+NjQ8487w/
         KYYseqbHKzpXCb1SCb6L8fvBxLvRN7iLAc+N+cUjfVMoigpYBB/PSBhXV1718i8vwndQ
         OcBXgt9C9ZNmmsXc3cFPRbfDcqKO26ylZEPUxowVSRwlnQwc2C1XCGAXQR6A3niu7YLC
         HkAkVliBl9kg+4zVQ/83obesrgOl8gapqHMIWk7kvv553bqF4NCQ7Lsoxvnii4W3iCtf
         wSpS6tNUrjZ0KHcETBL2791dbCH9spgP4dj1BVJZ3e86u+ZRqn3jJmZIoMrCzzdMml4D
         8e5w==
X-Gm-Message-State: AOAM531JcXOzL5tpK8CH3BBE6DZohSf9eGDS9O25OJaU2YzCeP3If4RR
        DGeO2HqaV/+UV8gkk0UNzij9W2OHb9uiBzRWn74o0A==
X-Google-Smtp-Source: ABdhPJy/aLPMYjuBHO/NhAK0RI4m/IihYEvLGONFdnzXiWvtRqjzT8vI1srKXxsejZgL4p3/iRs/36fbGZ0ZLuS1gE8=
X-Received: by 2002:a25:288:: with SMTP id 130mr7876802ybc.412.1611079773447;
 Tue, 19 Jan 2021 10:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org> <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
 <CAGETcx_aroLLf_U50=KgfOBL-DW+VrgvgrSNEyHAyeSxWKZTgQ@mail.gmail.com> <CAMuHMdVTKEy3rbdYYUKS+L1pY0y0ctMWRXNf7o+hJWyGR7L-Dg@mail.gmail.com>
In-Reply-To: <CAMuHMdVTKEy3rbdYYUKS+L1pY0y0ctMWRXNf7o+hJWyGR7L-Dg@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 19 Jan 2021 10:08:57 -0800
Message-ID: <CAGETcx-ax00kGq=u_XCaQ0phgc_iCqtqD7k2aiQ1qSLFmrQG=g@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Jan 19, 2021 at 1:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Mon, Jan 18, 2021 at 10:19 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Mon, Jan 18, 2021 at 11:16 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > On 2021-01-18 17:39, Geert Uytterhoeven wrote:
> > > > > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
> > > > > wrote:
> > > > >> Cyclic dependencies in some firmware was one of the last remaining
> > > > >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> > > > >> dependencies don't block probing, set fw_devlink=on by default.
> > > > >>
> > > > >> Setting fw_devlink=on by default brings a bunch of benefits
> > > > >> (currently,
> > > > >> only for systems with device tree firmware):
> > > > >> * Significantly cuts down deferred probes.
> > > > >> * Device probe is effectively attempted in graph order.
> > > > >> * Makes it much easier to load drivers as modules without having to
> > > > >>   worry about functional dependencies between modules (depmod is still
> > > > >>   needed for symbol dependencies).
> > > > >>
> > > > >> If this patch prevents some devices from probing, it's very likely due
> > > > >> to the system having one or more device drivers that "probe"/set up a
> > > > >> device (DT node with compatible property) without creating a struct
> > > > >> device for it.  If we hit such cases, the device drivers need to be
> > > > >> fixed so that they populate struct devices and probe them like normal
> > > > >> device drivers so that the driver core is aware of the devices and
> > > > >> their
> > > > >> status. See [1] for an example of such a case.
> > > > >>
> > > > >> [1] -
> > > > >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> > > > >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > >
> > > > > Shimoda-san reported that next-20210111 and later fail to boot
> > > > > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
> > > > > is enabled.
> > > > >
> > > > > I have bisected this to commit e590474768f1cc04 ("driver core: Set
> > > > > fw_devlink=on by default").
> > > >
> > > > There is a tentative patch from Saravana here[1], which works around
> > > > some issues on my RK3399 platform, and it'd be interesting to find
> > > > out whether that helps on your system.
> > > >
> > > > Thanks,
> > > >
> > > >          M.
> > > >
> > > > [1]
> > > > https://lore.kernel.org/r/20210116011412.3211292-1-saravanak@google.com
> > >
> > > Thanks for the suggestion, but given no devices probe (incl. GPIO
> > > providers), I'm afraid it won't help. [testing] Indeed.
> > >
> > > With the debug prints in device_links_check_suppliers enabled, and
> > > some postprocessing, I get:
> > >
> > >     255 supplier e6180000.system-controller not ready
> > >       9 supplier fe990000.iommu not ready
> > >       9 supplier fe980000.iommu not ready
> > >       6 supplier febd0000.iommu not ready
> > >       6 supplier ec670000.iommu not ready
> > >       3 supplier febe0000.iommu not ready
> > >       3 supplier e7740000.iommu not ready
> > >       3 supplier e6740000.iommu not ready
> > >       3 supplier e65ee000.usb-phy not ready
> > >       3 supplier e6570000.iommu not ready
> > >       3 supplier e6054000.gpio not ready
> > >       3 supplier e6053000.gpio not ready
> > >
> > > As everything is part of a PM Domain, the (lack of the) system controller
> > > must be the culprit. What's wrong with it? It is registered very early in
> > > the boot:
> > >
> > > [    0.142096] rcar_sysc_pd_init:442: of_genpd_add_provider_onecell() returned 0
>
> > Looks like you found the important logs. Can you please enable all
> > these logs and send the early con logs as an attachment (so I don't
> > need to deal with lines getting wrapped)?
> > 1. The ones in device_links_check_suppliers()
> > 2. The ones in device_link_add()
> > 3. initcall_debug=1
>
> I have attached[*] the requested log.
>
> > That should help us figure out what's going on. Also, what's the DT
> > that corresponds to one of the boards that see this issue?
>
> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
>
> > Lastly, can you please pick up these 3 patches (some need clean up
> > before they merge) to make sure it's not an issue being worked on from
> > other bug reports?
> > https://lore.kernel.org/lkml/20210116011412.3211292-1-saravanak@google.com/
> > https://lore.kernel.org/lkml/20210115210159.3090203-1-saravanak@google.com/
> > https://lore.kernel.org/lkml/20201218210750.3455872-1-saravanak@google.com/
> >
> > I have a strong hunch the 2nd one will fix your issues. fw_devlink can
> > handle cyclic dependencies now (it basically reverts to
> > fw_devlink=permissive mode for devices in the cycle), but it needs to
> > "see" all the dependencies to know there's a cycle. So want to make
> > sure it "sees" the "gpios" binding used all over some of the Renesas
> > DT files.
>
> These patches don't help.
> The 2nd one actually introduces a new failure:
>
>      OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
> #gpio-cells for /cpus/cpu@102
>
> Note that my issues don't seem to be GPIO-related at all.
>
> BTW, you are aware IOMMUs and DMA controllers are optional?
> I.e. device drivers with iommus and/or dmas DT properties where the
> targets of these properties do not have a driver should still be probed,
> eventually.  But if the IOMMU or DMA drivers are present, they should be
> probed first, so the device drivers can make use of them.

Thanks for the logs and details.

Yeah, this is going to be a problem then. How is this handled in
static kernels today? Do we just try to make sure the iommus driver
probes the iommu device before the consumers? And then the consumers
simply don't defer probe on failure to get iommu?

I can make this work if modules are not enabled (needs some code
changes), but it's not going to work when there are modules. There's
no way to tell if an iommu module won't be loaded soon. Also, device
links doing this behavior only for iommu/dma is probably not a good
idea. So, whatever we do will have to be common behavior. :(

Another intermediate option I was thinking was having a
CONFIG_FW_DEVLINK_OFF/PERMISSIVE/ON and defaulting it to ON for ARM64
and turning it off in the defconfig for boards for which this doesn't
work. That way, we can incrementally enable fw_devlink.

This week is a very hectic week for me. So, please bear with slow
responses from me for rest of this week. Let me think about this a bit
to see if I can come up with a better solution than what I have in
mind.

Also, can you try deleting "iommu" and "dma" parsing in
of_supplier_bindings[] in driver/of/property.c and see if it helps?
Then we'd know this is the reason for things not working in your case.

> Thanks!
>
> [*] Although attaching means people like myself cannot read and comment
>     on the log easily, without saving the attachment first.
>     That's also the reason why patches should be submitted inline...

Yeah, I see your concern. If you want to add comments to logs when
sending them, yeah, please go ahead and put it inline. Or if someone
wants to add comments to what you attached, they could copy paste the
relevant sections and add comments.

Thanks,
Saravana
