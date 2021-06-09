Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EE93A0D8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236298AbhFIHT6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:19:58 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:36737 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhFIHT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:19:58 -0400
Received: by mail-vs1-f42.google.com with SMTP id z7so8511879vso.3;
        Wed, 09 Jun 2021 00:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EfNbacrs3w2B5B/kFXC7saL7Nlfy6ekUiY3D2a1iDVc=;
        b=iEhV9oJ9ChhNW4FJyQQsUDBFg+GewAJLIR1Q2fVLduE1kLqjTNOWHDSqKCG/dEnxZy
         TLT8mBoJn3C+gZGAQvLjZfCIwyndl6NAUdB75H/ssw3NiqHx6b0inys6eSlTuY1lbXPN
         mY0q4RbKuNnGc2HLzYeAUajfvwtIWKs/5oGVDAg2BVoxXlPvzSm0uArxTGbzV6FFSfBf
         jAe/qOYzhjSw3cDiJB+YJCHYdjk00EyVa87+RqghJ3VoSMnNyDmnYO7GwAcPF48G2pwO
         fCQkdUS0Tmko3WHFA3AznfVyvA5lVxdgRJFlZrLVAESWRXl+SGQHLYLko8u31tPX2xY5
         4vOA==
X-Gm-Message-State: AOAM533EhuURZdO9bzEMF2GvEXsKmFuSnMJK8giA4ghFu2r6kNhaZl42
        t8imSipLVxUJKdhf8KI2L5jnYPwoBcEplXu8Pic=
X-Google-Smtp-Source: ABdhPJwDkk1TPy2vkyw0dHczfWKzIKQ2BrAf1laTWS+DGt8CCNuVIm2hq/F2g+gkSQWG+3KsIbE+37DzXIjQXutlMu0=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr3879717vss.18.1623223083719;
 Wed, 09 Jun 2021 00:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 09:17:52 +0200
Message-ID: <CAMuHMdXO1RyF9ZuXR2CGHqvPOh6jnf07_EEreTOmiwUzoEg5hQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/G2L SMARC EVK
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Jun 4, 2021 at 12:19 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add basic support for RZ/G2L SMARC EVK (based on R9A07G044L2):
> - memory
> - External input clock
> - SCIF
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2L SMARC EVK board
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g044.dtsi"

So this should include r9a07g044l2.dtsi.

The rest looks fine, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
