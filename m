Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEDF260DBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 10:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgIHIjX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 04:39:23 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46709 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729564AbgIHIjX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 04:39:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id u126so15719631oif.13;
        Tue, 08 Sep 2020 01:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=POiqaYaoAUFlSP8Jlp+klBMHqA1bPeB4kquw+mOG5lg=;
        b=GvylSf1jW8PtKzdVyEaz1VYLIvSIGLDziWUgDb8AqbmR/Fhqgj65J/OvxZei2hdorg
         D4QJ2gdMIg0HfJrZbZsm2hAnFG9+ep/bEahALPYRenk0xMW23omWNrOjdkCImAsXFQBu
         mKczQi735a4Jtqc1kN7aH2X/2zKc6sf0Qz66qoqlMp9ThledHncLF4MHWj70I1UikVns
         NWso9anOiQZhBiE6fJpXb+37jHRCZU8/xh/XwgpzkwEiJK9tIR3n5oauQil45quiSWDW
         ACmd0SeXWPnO5L54PkZO3WPSTXeXDccbitbMt+n1aSzpS26Pa6E+5w2DISoRjLBhF2MM
         aSrQ==
X-Gm-Message-State: AOAM5310x4P/H7RbPSgwHaAD5oyTI2Rk1ru1l2TMRrGn65wiQFpdwSQe
        QoPLUfOg3osdShx2ow3S+7qAHBakX6fdwGp4wbw=
X-Google-Smtp-Source: ABdhPJwmIl+Skq4+GefAkl/Mk2+C6KwxolqGFtMCVsCCTBW6EIsC9P3UC2VVRLJjrcLc+EtXCGlS7JFdST15Xw5bn7A=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr1983953oib.54.1599554362262;
 Tue, 08 Sep 2020 01:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 10:39:11 +0200
Message-ID: <CAMuHMdW39X_N577GnuiJgnmc32y4bW-jCO0hhQtTWZeoTDvgeA@mail.gmail.com>
Subject: Re: [PATCH 04/14] dt-bindings: power: Add r8a779a0 SYSC power domain definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Adds power domain indices fpr R-Car V3U (r8a779a0).

Add ... for

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- /dev/null
> +++ b/include/dt-bindings/power/r8a779a0-sysc.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A779A0_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A779A0_SYSC_H__
> +
> +/*
> + * These power domain indices match the numbers of the interrupt bits
> + * representing the power areas in the various Interrupt Registers
> + * (e.g. SYSCISCR0, Interrupt Status/Clear Register 0)

... match the Power Domain Register Numbers (PDR)?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in for v5.10, in a branch shared by driver and DT.

If you agree, I can fix the above while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
