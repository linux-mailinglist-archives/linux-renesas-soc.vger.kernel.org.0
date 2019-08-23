Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6809ABDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 11:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389227AbfHWJtb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 05:49:31 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38723 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729716AbfHWJtb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 05:49:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id q8so6293987oij.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2019 02:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QEz2KNBRbJdVKJsLwz2U8eclaE22pDEiXXNXT10MZeA=;
        b=tviqzbGZg82f7U2yGptj8c4R/bZ0FxmshfWAD8VRX6Ls05B5Ny4B7Mk9vuqQPejAz2
         1T0PBeaMgvCcv1yztxb+u7V9DUt/JeRTMpkeyVtn+nR8dXwHN/CviVD1Ee7VUw07IUJQ
         sXTWB8Gx3L9TXcHUppTXIIf2Mu4yU8TWKTpQQonhm+dhvr2XsdhSog2dqGfv6DKedwTH
         YzxGxirWiOOJJjY6NrVx79xn/zmlcQNKmPeA4QUFpoYtxwXDs4JDwGAZJPkAfVHGVJna
         Huc7GGkWk5YwP6gcSjFjseAcAljhXlcKlDbni5Y+OVbbD8UdLB7l/lo6SUTfrWfm8888
         keKg==
X-Gm-Message-State: APjAAAV7hN4LYFLHjzfVxLANNT+rCp5U5TtSChL/pqa7/PCKX3cnAp+k
        eViAcGn9splzfSIEqfnRvh6smU3cUugNHW7ggoQ=
X-Google-Smtp-Source: APXvYqyl8kW3q/ROn//i0BWNXz/LZnGiepjK3GZraKqMRygGdqNdEn3jxmCxFwoKmWCfA1BGNXmXTwcXH36XXle2to4=
X-Received: by 2002:aca:b154:: with SMTP id a81mr2381867oif.148.1566553770898;
 Fri, 23 Aug 2019 02:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190821124602.29317-1-geert+renesas@glider.be>
 <20190821124602.29317-4-geert+renesas@glider.be> <20190822085804.rgyjxisnznmnura5@verge.net.au>
In-Reply-To: <20190822085804.rgyjxisnznmnura5@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Aug 2019 11:49:19 +0200
Message-ID: <CAMuHMdX1uryY5wbbJ7n1w2_XHdCMwLst4w-nbQw-iAxORTJyuw@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] ARM: shmobile: defconfig: Disable PL310_ERRATA_588369
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Thu, Aug 22, 2019 at 10:58 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Aug 21, 2019 at 02:46:02PM +0200, Geert Uytterhoeven wrote:
> > PL310 Erratum 588369 affects PL310 cache controller revisions older than
> > r2p0.
> >
> > As Renesas ARM SoCs contain the following revisions:
> >   - SH-Mobile AG5: r3p1,
> >   - R-Mobile A1: r3p1-50rel0,
> >   - R-Car H1: r3p2,
> >   - RZ/A1: r3p2,
> >   - RZ/A2: r3p3,
> > none of them are affected, and support for the errata can be disabled
> > safely.
> >
> > The EMMA Mobile EV2 documentation doesn't mention the revision of its
> > PL310 cache controller, so this SoC might be affected.  However, the L2
> > cache controller is not enabled by Linux.
>
> If the controller is not enabled by Linux then I would think that the
> Errata is not needed. If that is true then I agree with this patch.
>
> Regarding making assumptions about the version of the PL310 cache
> controller, I suggest that we cannot assume that it is not affected
> without further information.

I agree, so this needs more investigation.

It seems this was included in shmobile_defconfig based on the old
armadillo800eav_defconfig, which enabled several errata options since
commit e0ef0984ae346c54 ("ARM: shmobile: armadillo800eva: enable all
errata for cache on defconfig").
Based on my current knowledge, PL310_ERRATA_769419 is the only one that
affects Renesas SoCs (ignoring EMEV2 for now) with a PL310, and thus
should be enabled, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
