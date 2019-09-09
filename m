Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3D8ADDFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 19:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391314AbfIIRZx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 13:25:53 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40650 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfIIRZx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 13:25:53 -0400
Received: by mail-oi1-f193.google.com with SMTP id b80so11081247oii.7;
        Mon, 09 Sep 2019 10:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e52SKLW/Sl4f1MnEIC+MlR9Sb/TPtpS7uSq2+ORx3Dc=;
        b=CNMNIxk+IYza7l9Bujx2tIr7dyMfq6XbUEzRVgUkrX6TG2Q2CK/UqWeFjSwqlT2iH8
         P8GJHLjI8HnM6xFyUbX82fXh1wXiCCZZdDFbpGLfwIW/2zuRjTRaKv39NZOYG8vjCThm
         U8UXkxc7CFfBQFh9JFKFGumd/ynNjOaS+qJlmlIg9VqFgFHGYd0Wq7oNSTk29wjbinZY
         xoguBSTRlNrVXYz9L9w2oS8e9f8rEtoFOBA7NBB9WwhDoEf7IH61jQylAxsGvkmA3EjX
         q9jB239KMCaLDVBsR/46vNxuSD1eZuhryjNTSOZb4ZhkqU9d+6ftCn6C4oebzCeqHiyY
         Bw5A==
X-Gm-Message-State: APjAAAVkfIhj7w33m0rsqyhhhbm8ah97kMExfuPoTHF1PgoiRD4eO/l4
        3VeFJ/qwrxxRDYODThRs2VGrFTujCo/H3kOV8Fg=
X-Google-Smtp-Source: APXvYqx1x4kSfhfO7UiR45Bhzr81Bp0gEDKbZbkXEAat2E1VjTNsrCCfY7wAAtLqId6KUAvYFvffKgv5mTgml5+ewxI=
X-Received: by 2002:a05:6808:98a:: with SMTP id a10mr201030oic.54.1568049951163;
 Mon, 09 Sep 2019 10:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <1567666360-28035-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567666360-28035-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 19:25:40 +0200
Message-ID: <CAMuHMdU=-CGPw4FF3o7YwEZzd7EA07RNKLSP0gmty8bTQzm6DA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Add r8a774b1 CPG Core Clock Definitions
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Sep 5, 2019 at 9:00 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add all RZ/G2N Clock Pulse Generator Core Clock Outputs, as listed in
> Table 8.2d ("List of Clocks [RZ/G2N]") of the RZ/G2N Hardware User's
> Manual.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One comment below...

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774b1-cpg-mssr.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a774b1 CPG Core Clocks */
> +#define R8A774B1_CLK_Z                 0
> +#define R8A774B1_CLK_ZG                        1
> +#define R8A774B1_CLK_ZTR               2
> +#define R8A774B1_CLK_ZTRD2             3
> +#define R8A774B1_CLK_ZT                        4
> +#define R8A774B1_CLK_ZX                        5
> +#define R8A774B1_CLK_S0D1              6
> +#define R8A774B1_CLK_S0D2              7
> +#define R8A774B1_CLK_S0D3              8
> +#define R8A774B1_CLK_S0D4              9
> +#define R8A774B1_CLK_S0D6              10
> +#define R8A774B1_CLK_S0D8              11
> +#define R8A774B1_CLK_S0D12             12
> +#define R8A774B1_CLK_S1D2              13
> +#define R8A774B1_CLK_S1D4              14
> +#define R8A774B1_CLK_S2D1              15
> +#define R8A774B1_CLK_S2D2              16
> +#define R8A774B1_CLK_S2D4              17
> +#define R8A774B1_CLK_S3D1              18
> +#define R8A774B1_CLK_S3D2              19
> +#define R8A774B1_CLK_S3D4              20
> +#define R8A774B1_CLK_LB                        21
> +#define R8A774B1_CLK_CL                        22
> +#define R8A774B1_CLK_ZB3               23
> +#define R8A774B1_CLK_ZB3D2             24
> +#define R8A774B1_CLK_CR                        25
> +#define R8A774B1_CLK_DDR               26
> +#define R8A774B1_CLK_SD0H              27
> +#define R8A774B1_CLK_SD0               28
> +#define R8A774B1_CLK_SD1H              29
> +#define R8A774B1_CLK_SD1               30
> +#define R8A774B1_CLK_SD2H              31
> +#define R8A774B1_CLK_SD2               32
> +#define R8A774B1_CLK_SD3H              33
> +#define R8A774B1_CLK_SD3               34
> +#define R8A774B1_CLK_RPC               35
> +#define R8A774B1_CLK_RPCD2             36
> +#define R8A774B1_CLK_MSO               37
> +#define R8A774B1_CLK_HDMI              38
> +#define R8A774B1_CLK_CSI0              39
> +#define R8A774B1_CLK_CP                        40
> +#define R8A774B1_CLK_CPEX              41
> +#define R8A774B1_CLK_R                 42
> +#define R8A774B1_CLK_OSC               43
> +#define R8A774B1_CLK_CANFD             44

The only thing I can comment on is the location of the CANFD clock.
For RZ/G2M and RZ/G2E, the clock was added to the end of the list,
as it wasn't listed in the Hardware User's Manual.
In the mean time, Rev. 0.80 of the Hardware User's Manual was released,
which does include the CANFD clock.

If no one objects against this location, for consistency with other
RZ/G2 SoCs, i.e. will queue it in renesas-devel for v5.5, on a branch to
be shared by the clock driver and the DTS user.

> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
