Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D1285DA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Aug 2019 11:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731122AbfHHJAd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Aug 2019 05:00:33 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40223 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731031AbfHHJAd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Aug 2019 05:00:33 -0400
Received: by mail-ot1-f66.google.com with SMTP id l15so58421876oth.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Aug 2019 02:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NQIzgC+Bm4Ug1AA7j10Dm7ByH7H90ws0/6j0w3ZAKqM=;
        b=GNdsNAU17hRrVSYuu2AA3f1KgV9yP160vMXqx85V5USabidCQ8Vq0tT2xjt2wVPmeG
         3/tPh9pbkhuWa2UPwGBFG2XHRX7O8eXSX1PrJkRobJ+mcujSLwmracXQt1zpuDAoI7zp
         Tp5nEM/DlnXyKUfi/QaxdxVGjhCE2uyYlIgKMtWVW8CP+BFTh880FNjkQmFffGbt9iiw
         L3huMkQbKhV4YwKmhj55yuSLwx9334V4yaJ5aSbb8qOHGc+VHXUlUKQN1owwvtXPJ7bF
         6Po++ZcWv42MbKczic7kxdsi5KdIoeTXf4XhzW7W0rUklYHiG5TSUWX0Tj26FtW5c0i/
         6o9w==
X-Gm-Message-State: APjAAAVoOgjvfa9IQHuiZbFUVMaqKDybNH/pxCYLXTmXlSKoa2clJP3B
        UVERIFikX1/T2IpbNUiCr2TBJ4R9PXs3GqZRbiZa6A==
X-Google-Smtp-Source: APXvYqyWzwl/0vZpshXoQeVkdZk1wEe/HMQo1zFeQ+F2oMZwLW4xcpVgFu0Pg/eGKiqA8JDcBRvtJVTjvIlijIrfUgc=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr11226786otk.107.1565254831079;
 Thu, 08 Aug 2019 02:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190731073744.13963-1-geert+renesas@glider.be>
In-Reply-To: <20190731073744.13963-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 11:00:20 +0200
Message-ID: <CAMuHMdUCb_7=yTb+E-CvbabdRgWRRg6DYzukWqzd_ZCexobnwg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
To:     Simon Horman <horms@verge.net.au>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Jul 31, 2019 at 9:37 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently there are two nodes named "regulator1" in the Draak DTS: a
> 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> for the backlight.  This causes the former to be overwritten by the
> latter.
>
> Fix this by renaming all regulators with numerical suffixes to use named
> suffixes, which are less likely to conflict.
>
> Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add backlight")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I guess this is a fix for v5.3?

Do you plan to queue this as a fix for v5.3?
Thanks!

>
> This fix takes a slightly different approach than commit
> 12105cec654cf906 ("arm64: dts: renesas: r8a77990: ebisu: Fix backlight
> regulator numbering"), which just fixed the conflicting numerical
> suffix.
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 0711170b26b1fe1c..3aa2564dfdc25fff 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -97,7 +97,7 @@
>                 reg = <0x0 0x48000000 0x0 0x18000000>;
>         };
>
> -       reg_1p8v: regulator0 {
> +       reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";
>                 regulator-min-microvolt = <1800000>;
> @@ -106,7 +106,7 @@
>                 regulator-always-on;
>         };
>
> -       reg_3p3v: regulator1 {
> +       reg_3p3v: regulator-3p3v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-3.3V";
>                 regulator-min-microvolt = <3300000>;
> @@ -115,7 +115,7 @@
>                 regulator-always-on;
>         };
>
> -       reg_12p0v: regulator1 {
> +       reg_12p0v: regulator-12p0v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "D12.0V";
>                 regulator-min-microvolt = <12000000>;
> --
> 2.17.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
