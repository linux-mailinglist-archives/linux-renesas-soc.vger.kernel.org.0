Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB722FAC7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 22:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394562AbhARVUV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 16:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394540AbhARVUH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 16:20:07 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4448C061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 13:19:26 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id y128so13949090ybf.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jan 2021 13:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COpFk8JVoGfb4E3tmL/piUQieYNkIMUogv9fM2rWfEQ=;
        b=dzMYdiMm/qt2fGRQnCVarFPn+P9JZKC8QVxYZEUP4jo3StRHoS2SJXltwbYZVoqn9V
         6WUQMsaka5XlT1trnLxHHGUfSp7HawAXe05IOId6xy/DMaYYsCV40Sm2yiRWJjzK5IJI
         6mhq28awJQOorY+0FGmleW+pOwhBkkhDJo/kSfNcYlM7yrFg/6CxYhu3C5KKXtJXWc43
         UxR3ofLCV+9Y3xlvZlWlRNhJGvqX15egcIkepBnCe6cqi2o+Q7v5e/LIprwTXkJYrbKe
         uCCS2dcJMQYdJil9bxvtOMmkZVdRoer1sHynRyr37MFGBnVJyIW3NyvEnLElKuTI7USh
         WwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COpFk8JVoGfb4E3tmL/piUQieYNkIMUogv9fM2rWfEQ=;
        b=ZR776qlBArOIV+2Yp7Yb99dgtEGfSUEKXSXzLvBAdUCVAldQbW1wrtdUqCTbgJmOsz
         xjDQkFRZIvH1W8JxpDf9niqn1J9OGhBRcfHh9ShdcBeVf7Xir0CAt7l8E2s0/1w/Eyfl
         BykMZ0ePMB8jijjdi43XQ0jAZUMQX0ZVww4Nw0kTzspK7m2+i16/sEtgqB4c1YuqPMyr
         3z+DB39S+OtyfqDQAg3L6tn2HIKxnRvZDJq0B4VrlDRuiCR4mu2GF4aa5DVMJu/9c4Pw
         nB8BZp4Ard/uz/eBczteLFKJN0RhnkfWnnRE/Kad2eMA6tEAj+KeZbCdGLuy1QCL+hkO
         mJMw==
X-Gm-Message-State: AOAM531GdBc+DWzVNYksllz8otzatPKmQsa0eksKeRGcXstpQ4bzib5V
        KC6FFYhzjp/WiKc+3S2rz2E8qj9fr9KVdc87GhzSkA==
X-Google-Smtp-Source: ABdhPJx8IeBF4yhe2K0BnEY45LvkWicIyHCSeaHwEKrUz3QJu3KbPh6X75QSTHYiynJ7NkkYd9feK5A5SvmJeecJI60=
X-Received: by 2002:a25:77d4:: with SMTP id s203mr1731889ybc.32.1611004765635;
 Mon, 18 Jan 2021 13:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org> <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
In-Reply-To: <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 18 Jan 2021 13:18:49 -0800
Message-ID: <CAGETcx_aroLLf_U50=KgfOBL-DW+VrgvgrSNEyHAyeSxWKZTgQ@mail.gmail.com>
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

On Mon, Jan 18, 2021 at 11:16 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Marc,
>
> On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
> > On 2021-01-18 17:39, Geert Uytterhoeven wrote:
> > > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
> > > wrote:
> > >> Cyclic dependencies in some firmware was one of the last remaining
> > >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> > >> dependencies don't block probing, set fw_devlink=on by default.
> > >>
> > >> Setting fw_devlink=on by default brings a bunch of benefits
> > >> (currently,
> > >> only for systems with device tree firmware):
> > >> * Significantly cuts down deferred probes.
> > >> * Device probe is effectively attempted in graph order.
> > >> * Makes it much easier to load drivers as modules without having to
> > >>   worry about functional dependencies between modules (depmod is still
> > >>   needed for symbol dependencies).
> > >>
> > >> If this patch prevents some devices from probing, it's very likely due
> > >> to the system having one or more device drivers that "probe"/set up a
> > >> device (DT node with compatible property) without creating a struct
> > >> device for it.  If we hit such cases, the device drivers need to be
> > >> fixed so that they populate struct devices and probe them like normal
> > >> device drivers so that the driver core is aware of the devices and
> > >> their
> > >> status. See [1] for an example of such a case.
> > >>
> > >> [1] -
> > >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> > >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > >
> > > Shimoda-san reported that next-20210111 and later fail to boot
> > > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
> > > is enabled.
> > >
> > > I have bisected this to commit e590474768f1cc04 ("driver core: Set
> > > fw_devlink=on by default").
> >
> > There is a tentative patch from Saravana here[1], which works around
> > some issues on my RK3399 platform, and it'd be interesting to find
> > out whether that helps on your system.
> >
> > Thanks,
> >
> >          M.
> >
> > [1]
> > https://lore.kernel.org/r/20210116011412.3211292-1-saravanak@google.com
>
> Thanks for the suggestion, but given no devices probe (incl. GPIO
> providers), I'm afraid it won't help. [testing] Indeed.
>
> With the debug prints in device_links_check_suppliers enabled, and
> some postprocessing, I get:
>
>     255 supplier e6180000.system-controller not ready
>       9 supplier fe990000.iommu not ready
>       9 supplier fe980000.iommu not ready
>       6 supplier febd0000.iommu not ready
>       6 supplier ec670000.iommu not ready
>       3 supplier febe0000.iommu not ready
>       3 supplier e7740000.iommu not ready
>       3 supplier e6740000.iommu not ready
>       3 supplier e65ee000.usb-phy not ready
>       3 supplier e6570000.iommu not ready
>       3 supplier e6054000.gpio not ready
>       3 supplier e6053000.gpio not ready
>
> As everything is part of a PM Domain, the (lack of the) system controller
> must be the culprit. What's wrong with it? It is registered very early in
> the boot:
>
> [    0.142096] rcar_sysc_pd_init:442: of_genpd_add_provider_onecell() returned 0

Hi Geert,

Thanks for reporting the issue.

Looks like you found the important logs. Can you please enable all
these logs and send the early con logs as an attachment (so I don't
need to deal with lines getting wrapped)?
1. The ones in device_links_check_suppliers()
2. The ones in device_link_add()
3. initcall_debug=1

That should help us figure out what's going on. Also, what's the DT
that corresponds to one of the boards that see this issue?

Lastly, can you please pick up these 3 patches (some need clean up
before they merge) to make sure it's not an issue being worked on from
other bug reports?
https://lore.kernel.org/lkml/20210116011412.3211292-1-saravanak@google.com/
https://lore.kernel.org/lkml/20210115210159.3090203-1-saravanak@google.com/
https://lore.kernel.org/lkml/20201218210750.3455872-1-saravanak@google.com/

I have a strong hunch the 2nd one will fix your issues. fw_devlink can
handle cyclic dependencies now (it basically reverts to
fw_devlink=permissive mode for devices in the cycle), but it needs to
"see" all the dependencies to know there's a cycle. So want to make
sure it "sees" the "gpios" binding used all over some of the Renesas
DT files.

Thanks,
Saravana
