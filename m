Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474992CFAE2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Dec 2020 10:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgLEJp7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 5 Dec 2020 04:45:59 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42199 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728872AbgLEJor (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Dec 2020 04:44:47 -0500
Received: by mail-oi1-f193.google.com with SMTP id l200so9233478oig.9;
        Sat, 05 Dec 2020 01:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGdaUmtB30TVsj7alwm/cJhVAoMWhBl+L16TLVJy0GU=;
        b=OtRdZuRrRGqDSxza1pS8St7U/cLN2HB5k7GnUYU3RifXD84LXc6NCVRBvi4A+axxRe
         nlnjcMgTneeeVGFKpl599qAG5ov0a9CnCE1l1ZDO0DzdxYzxqYUlIe4Yww9KOVrCXRPJ
         RWwjaOX61C0M+FWx2xuphpM1XR4/J1KPZgJ2XVMA+wnmaYTLT7Z/AlccVi05gDD4IDQI
         +HZpgKJ6OIxxnN2LupuN3CgfH29JWoSv3Y5hFqwhCAt/W1CZ3kTuBqDiK9PSF+pFZl61
         O3lgFEE8W93choXbaPIE3VqEP9OXJydVwegG/caf2LpwBk4OrJtWsLmYboc6MNq+Peex
         N7ow==
X-Gm-Message-State: AOAM533Hv+Eccli9X2CMhL1ox4dUOJfYc36up5u+9UaXDrFUdbwWHGJx
        x1tWfko8BocruSLQpyHaNR4az1Ld5ZdaQxzAfoAOtKpvufQ=
X-Google-Smtp-Source: ABdhPJwLYvltQQGfaxz5Cw2w/zv1Y+C9MgjWhLpZYxRx4VvMLhZqNWb3xLk+V7UCvmYR02UJOryygCbm26eslneYzJA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr5872940oih.153.1607159141323;
 Sat, 05 Dec 2020 01:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20201130085743.1656317-1-geert+renesas@glider.be> <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
In-Reply-To: <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 5 Dec 2020 10:05:29 +0100
Message-ID: <CAMuHMdWJhiO5A7b3B8CH2YpURe_G0dEPEmES6R8n_8D-Z+Q65A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Mackerras <paulus@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Sat, Dec 5, 2020 at 7:24 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-11-30 00:57:43)
> > The R9A06G032 clock driver uses an array of packed structures to reduce
> > kernel size.  However, this array contains pointers, which are no longer
> > aligned naturally, and cannot be relocated on PPC64.  Hence when
> > compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=y (e.g.
> > PowerPC allyesconfig), the following warnings are produced:
> >
> >     WARNING: 136 bad relocations
> >     c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
> >     c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
> >     ...
> >
> > Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
> > definition, trading a small size increase for portability.
> >
> > This increases the 156-entry clock table by 1 byte per entry, but due to
> > the compiler generating more efficient code for unpacked accesses, the
> > net size increase is only 76 bytes (gcc 9.3.0 on arm32).
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> Unless you want me to pick this up for clk-fixes?

Yes please. Forgot to retain this comment for v2:

   "Please take directly (ppc or clk), as this is a build fix.
    https://lore.kernel.org/linux-clk/20201128122819.32187696@canb.auug.org.au/"

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
