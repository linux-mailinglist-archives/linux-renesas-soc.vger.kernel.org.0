Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5C17BAF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 09:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfGaH4r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 03:56:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50754 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfGaH4r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 03:56:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so59726332wml.0;
        Wed, 31 Jul 2019 00:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QU5L0vbXmLbZe0E3jBTU5NfJkkh9UqRqr6Mps/3EPOo=;
        b=iLzaU2LSDdI9jsv5/15m1mae9PZgBldsvsCrQ3CuB0T+NizxweSFnnOH/ey6IOLf6t
         7FqdVwr5zWx+ZfxctAwjxPkm6DdCObDAxjj3v4qUfxPOXHD4XcQ0i21kcWBlg3HUZfDp
         iaC7geB2CLCz2gO+JT3IQbLiNHeLANttoQclMvMhoi2ri9hQZNqYjKRGKeMTPavSJm0R
         YIuJziKDBxVcKxSJ+GCasjax1H8UzLpL4kzAGarMbzQJJQoibsYdjKT5MrX9no42+vqt
         G+3reXSYDkNDMoBsO2EqOL2MihCx8/2rv2OCZNhpkekVEfPZdkV8p1H9eC3tA90Lct70
         0I+g==
X-Gm-Message-State: APjAAAXf7g3FSESHtSwcWAsrFdm1H7jDsNhG6YdfRSqUILgXphirh9ns
        9RHxDCj6x6LGtsoYc+VUWc2QofEHd/W50tYi3rs=
X-Google-Smtp-Source: APXvYqxI3SDVuWcUSNpHB6iYKBKkhycQn1kNJ3nJf+4smL6dxeHCwc7CUToIujG+dw8npCkbHpL8diEb42e4A0p/Wmg=
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr106666180wmf.137.1564559804817;
 Wed, 31 Jul 2019 00:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190109140045.17449-1-marek.vasut@gmail.com> <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com>
 <20190109165822.tmj7qbho46f7clvg@verge.net.au> <1690279.yngTTxF0vm@avalon> <0d08d3c1-94ec-dcbe-ad3d-b079ab2ad17e@gmail.com>
In-Reply-To: <0d08d3c1-94ec-dcbe-ad3d-b079ab2ad17e@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Jul 2019 09:56:33 +0200
Message-ID: <CAMuHMdWajtaDGFFkd-GiyR_V8fnpRcn=Uuf8UQuJdcYSigivQQ@mail.gmail.com>
Subject: DTC check_duplicate_node_names (was: Re: [PATCH] arm64: dts: renesas:
 r8a77990: ebisu: Fix backlight regulator numbering)
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

Bringing this to the attention of the DTC people...

On Thu, Jan 10, 2019 at 3:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 1/10/19 1:59 PM, Laurent Pinchart wrote:
> > On Wednesday, 9 January 2019 18:58:23 EET Simon Horman wrote:
> >> On Wed, Jan 09, 2019 at 04:26:25PM +0100, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 9, 2019 at 3:01 PM <marek.vasut@gmail.com> wrote:
> >>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>
> >>>> There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
> >>>> the eMMC and one 12V for the backlight. This causes one to be
> >>>> overwritten
> >>>> by the other, ultimatelly resulting in inoperable eMMC, which depends on
> >>>> the former. Fix this by renumbering the backlight regulator to
> >>>> regulator2.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>>> Cc: Simon Horman <horms+renesas@verge.net.au>
> >>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>>> Cc: linux-renesas-soc@vger.kernel.org
> >>>> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> >>>> Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add
> >>>> backlight")
> >>>
> >>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>
> >>>> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> >>>> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> >>>> @@ -191,7 +191,7 @@
> >>>>
> >>>>                 clock-frequency = <24576000>;
> >>>>
> >>>>         };
> >>>>
> >>>> -       reg_12p0v: regulator1 {
> >>>> +       reg_12p0v: regulator2 {
> >>>>
> >>>>                 compatible = "regulator-fixed";
> >>>>                 regulator-name = "D12.0V";
> >>>>                 regulator-min-microvolt = <12000000>;
> >>>
> >>> Perhaps the node name should get a more descriptive suffix
> >>> (e.g. "regulator-12p0v"), like is already done for some of the other
> >>> regulators?
> >>
> >> I think I would prefer that addressed in a follow-up patch.
> >
> > Agreed, but it would still be a very good idea. I think we need to standardize
> > names for regulators, otherwise this is bound to happen again in the future.

And so it did (patch sent for the same bug in r8a77995-draak.dts).

> Isn't the YAML DT schema validator supposed to catch those problems ?
> I'd even expect DTC to be able to catch such duplicate nodes and warn
> about them.

DTC indeed has check_duplicate_node_names.
However, it only works for the base DTS, not for any later modifications in
the board DTS.

I.e. the original dup-nodename.dts in the DTC testsuite triggers an error,
but the modified version below doesn't.

--- a/tests/dup-nodename.dts
+++ b/tests/dup-nodename.dts
@@ -1,8 +1,11 @@
 /dts-v1/;

+/ {
+};
+
 / {
        node {
        };
        node {
        };
 };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
