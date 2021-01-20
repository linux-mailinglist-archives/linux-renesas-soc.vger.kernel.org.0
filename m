Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962D52FCDDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 11:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbhATKHh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 05:07:37 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:38465 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729520AbhATJM1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 04:12:27 -0500
Received: by mail-oi1-f176.google.com with SMTP id n186so16424648oia.5;
        Wed, 20 Jan 2021 01:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yo/48ruDH77ObKqel524FXQ0YODRZACkl5fGRtnXUUs=;
        b=tVd6g2k/IFF21tWPMYSv8qLPHkThdLEK8hr5J4rJI8lUnKbQ39NBjO8faItsR7MG2M
         kzrKWG0XdKDiRfKY2aF+pg4ZX9FDTMD+TOzcHrvtj2t9ittYdgtSsv8AgDEcvQ/f/gTL
         tU2jr7VWjqz09mVTQmwdhCVC1GkfOfL4iuxqjo60av5TcG54ebmZvhZuGSsfYkWgfaXW
         JFEqTNrk6PtsX3dynCuh97WFksRgA/wua5nzQpDKgp0wbfkkFLl1DkIXb0YDvM41pms5
         Q4Z9s/fyMXEDK15TdQ7PbhaVUs5m6CWJBKFaPGSVOsgXtLK1CIDWawWSMrf3JOsevgmc
         Iz6g==
X-Gm-Message-State: AOAM531VmNOr7vCGmxnxAPJQ7S8Qre37NwqJncarEifX4pMLL7obAo/D
        RzskxCV+8MiIqVHIBkJe0ZInNG02kAi/zgYbZ7o=
X-Google-Smtp-Source: ABdhPJzRJgdF4qi71TnSMaTn7Qe+KMxIgl/SG8Nhdbvw2IsGIji4/fwqAyZ2R5mDx0iNrYUL3eeQVmlDmOYHX4zsAt8=
X-Received: by 2002:aca:31d5:: with SMTP id x204mr2253713oix.153.1611133894341;
 Wed, 20 Jan 2021 01:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org> <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
 <CAGETcx_aroLLf_U50=KgfOBL-DW+VrgvgrSNEyHAyeSxWKZTgQ@mail.gmail.com>
 <CAMuHMdVTKEy3rbdYYUKS+L1pY0y0ctMWRXNf7o+hJWyGR7L-Dg@mail.gmail.com> <CAGETcx-ax00kGq=u_XCaQ0phgc_iCqtqD7k2aiQ1qSLFmrQG=g@mail.gmail.com>
In-Reply-To: <CAGETcx-ax00kGq=u_XCaQ0phgc_iCqtqD7k2aiQ1qSLFmrQG=g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Jan 2021 10:11:22 +0100
Message-ID: <CAMuHMdXGLqN4ZYjgCvK-yGDPtzcJTpAhXq7ffh9MWYwyAAnAfQ@mail.gmail.com>
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

On Tue, Jan 19, 2021 at 7:09 PM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Jan 19, 2021 at 1:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > BTW, you are aware IOMMUs and DMA controllers are optional?
> > I.e. device drivers with iommus and/or dmas DT properties where the
> > targets of these properties do not have a driver should still be probed,
> > eventually.  But if the IOMMU or DMA drivers are present, they should be
> > probed first, so the device drivers can make use of them.
>
> Yeah, this is going to be a problem then. How is this handled in
> static kernels today? Do we just try to make sure the iommus driver
> probes the iommu device before the consumers? And then the consumers
> simply don't defer probe on failure to get iommu?

Iommus are handled by the iommu framework, not by the driver.
So the framework decides if/when it's OK to probe a device tied to an
iommu.  Hence the consumers' drivers don't return -EPROBE_DEFER, the
framework takes care of that, before drivers' probe() functions are
called.

DMA is handled by consumer drivers, and driver-specific.  Many consumer
drivers consider DMA optional, and fall back to PIO if getting the DMA
channel failed.  Some drivers retry getting the DMA channel when the
device is used, and thus may start using DMA when the DMAC driver
appears and probes.

> I can make this work if modules are not enabled (needs some code
> changes), but it's not going to work when there are modules. There's
> no way to tell if an iommu module won't be loaded soon. Also, device
> links doing this behavior only for iommu/dma is probably not a good
> idea. So, whatever we do will have to be common behavior. :(

The iommu driver definitely needs to be built-in.
Modular DMAC drivers currently work with consumer drivers that
either consider DMA mandatory, or retry obtaining DMA channels.

> Also, can you try deleting "iommu" and "dma" parsing in
> of_supplier_bindings[] in driver/of/property.c and see if it helps?
> Then we'd know this is the reason for things not working in your case.

It also fails on another system without "iommus" properties:

    182 supplier e6180000.system-controller not ready
     18 supplier e6055400.gpio not ready
     15 supplier e6055800.gpio not ready
     15 supplier e6052000.gpio not ready
      6 supplier e6055000.gpio not ready

The system controller is the culprit, and is a dependency for all
devices due to power-domains.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
