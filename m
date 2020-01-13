Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD0C138D53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2020 09:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgAMI6f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jan 2020 03:58:35 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34602 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgAMI6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jan 2020 03:58:35 -0500
Received: by mail-oi1-f195.google.com with SMTP id l136so7570898oig.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jan 2020 00:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yqNlNrOQ7aJ6S/nMKFawkP6Fc2v57+yYYE7QCHVa+YM=;
        b=NOPGJ7Sb8RR4k5SOiWekFUIRMhxHTMGHP8dactWOb8HSl+oXbQdCEpdDWobno7j3MZ
         LY2BnvYVDU/q/ZxnE1B525Syt2y1UBMzFHU17qf2VmufKygTNiX/yrxXhkRj/h6ntMgY
         fODpl/z8c2zQdREiDl76G01NogAfK7xAhoxpRpgyiCZOrWnQNbB/NV8j+xKoKz6sPNZJ
         9YWxfb0lGiLcN3vLtzFIuVXrv94DnIbV9n5R1Xkq61SDSSn0tIeJIV95KdICU+Arwwvk
         P0/04Qve0vLXvZ4LB7JnoJhQkdbM2fHbptf8i18Rgx2+1zANj4wg5CWz0/Xu59JlQLFj
         IFTQ==
X-Gm-Message-State: APjAAAUNoLYbsOEELXp5M4huMpG45zbcxhdOjCvSkqpbQlb4Hvwcx3Si
        P+g1YKyiMfp3LKVrhGQuEt4Obw6pdOogqu0x5/7EQ2rF
X-Google-Smtp-Source: APXvYqxxsg0TC2Iy7kijFuyONZGoBo0TdJRSrcVkcxlFUfMwFV5qcQg4MhgfNgAma26laSlNFdZZpnD9+zujy0m2PCA=
X-Received: by 2002:aca:5905:: with SMTP id n5mr12244176oib.54.1578905914472;
 Mon, 13 Jan 2020 00:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20200112191315.118831-1-marek.vasut@gmail.com>
In-Reply-To: <20200112191315.118831-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jan 2020 09:58:23 +0100
Message-ID: <CAMuHMdWc97=-9yBF0CJDZpWH9ZGX9uoDY_t6E6TQNc4MO93W_w@mail.gmail.com>
Subject: Re: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset
 GPIO on Gen2 reference boards
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sun, Jan 12, 2020 at 8:13 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The ethernet PHY reset GPIO was missing and the kernel was depending
> solely on the bootloader to bring the PHY out of reset. Fix this to
> get rid of the dependency on bootloader.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> NOTE: Thus far tested on R8A7791 Koelsch

>  arch/arm/boot/dts/r8a7790-lager.dts   | 1 +
>  arch/arm/boot/dts/r8a7790-stout.dts   | 1 +
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
>  arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
>  arch/arm/boot/dts/r8a7793-gose.dts    | 1 +
>  arch/arm/boot/dts/r8a7794-alt.dts     | 1 +
>  arch/arm/boot/dts/r8a7794-silk.dts    | 1 +

I believe all of the above (except for stout) are available in Magnus' farm...

r8a7743-sk-rzg1m.dts and r8a7745-sk-rzg1e.dts need similar changes as
r8a7791-porter.dts resp. r8a7794-silk.dts.

> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -671,6 +671,7 @@ &ether {
>
>         phy1: ethernet-phy@1 {
>                 reg = <1>;
> +               reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;

I would insert this line below micrel,led-mode, though.

>                 interrupt-parent = <&irqc0>;
>                 interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode = <1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
