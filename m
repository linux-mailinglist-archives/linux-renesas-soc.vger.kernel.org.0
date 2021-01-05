Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041422EAA8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 13:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbhAEMUI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 07:20:08 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:38816 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbhAEMUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 07:20:08 -0500
Received: by mail-ot1-f42.google.com with SMTP id j20so29068320otq.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jan 2021 04:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbQ9N195JLIVLqKBqaRVei1gavIVpzUZAcIfWXqbYuw=;
        b=PhkcDVKWKmIreVHHY/aqdmGY70LeamXlNvA0v38b1Y0IrC5O0cALYnFiTsvpa1oIAL
         YJQD/5Ks0LhEmR9RqGI1ocvzbhlSiQV4rhANfjXyMgy9FDWAWyw10wMVXbtWbz2yWoPE
         vJq4AR5nn8WtuIj+21TqfOBUyax8IQK2QDnAuEFRxOmFQPbZj3GtteQJFe+DcIVFW+Pq
         5QaTwKTPgtW614byqncRpSwYJFy/xkR9e7vPJgxs2Y4z+rd31JzLkNk0nsBsk6GemuDe
         Ez2UhyfZuuXo2nOcNkZJ2jllAFDDEItDkxMzBzgYPLJ3mvcRwQeYoeFjYAnWNo326GzK
         gLEg==
X-Gm-Message-State: AOAM532N8QHrt6DpHWDbXNNPPe7RBGU74tJxByhnwWriANrC6jJnY3Ku
        +IZCSwykp/L+VqlA1wnMBAQfGMNdXxcN/D7tnkyW05HGg/Y=
X-Google-Smtp-Source: ABdhPJyFIu0O2BeAD1i0AGLtPOY+e66BQY6IrNKyKG4m4bCZekY+xL19hkBB2dl2jC3pqwcxVXzY8RMN4ZzaeWPb1jY=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr55925559otc.145.1609849167219;
 Tue, 05 Jan 2021 04:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20201227121925.8431-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227121925.8431-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 13:19:16 +0100
Message-ID: <CAMuHMdWVtACtyoQgxKTWpw_4xS-B1knkGOVU-7DpNzG3uoG-RQ@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: r8a779a0: correct reset values for GPIO
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Dec 27, 2020 at 1:19 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Because the datasheet is ambigious, copy over the reset values from the
> latest BSP.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> While looking for a problem when obtaining the reset GPIO for RAVB, I
> noticed this difference and so send this patch as a notification. It
> sadly did not fix my RAVB problem, so I'll report it with the RAVB
> patches there. I didn't find a map from "pfc-clocks" to "GPIO block"
> yet, so this is all very confusing without it.

AFAIUI, Table 6.2 ("Configuration of Registers in PFC") shows the
grouping of the PFC/GPIO blocks, revealing the mapping from 4 module
clocks to 4 groups of 2 or 4 GPIO blocks.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -110,7 +110,7 @@ gpio0: gpio@e6058180 {
>                         interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cpg CPG_MOD 916>;
>                         power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> -                       resets =  <&cpg 916>;
> +                       resets =  <&cpg 1331>;

I doubt the reset topology differs from the clock topology...
Let's hope this will be clarified in a datasheet update soon.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
