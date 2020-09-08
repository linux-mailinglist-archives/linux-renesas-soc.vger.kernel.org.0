Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B23260E97
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 11:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgIHJYM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 05:24:12 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41496 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728632AbgIHJYK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 05:24:10 -0400
Received: by mail-oi1-f193.google.com with SMTP id x69so12864627oia.8;
        Tue, 08 Sep 2020 02:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6lCtUDrDxLyw6+l4XPj0F179fsrfw+e6aLnT+ForSIg=;
        b=VIpnzvRgS/RuipRcyNQxQokdEiG2aBktq8zq4S07JcZUnVR20ddjOFb6JMkbyNn9O0
         XHwoaBsiras1uaDcnW+Gpb3gEuMyEU4or1Ncbpo7mOgNxUE0s3Ghvdw6yq+HcJzDfqjW
         gyEufAdP9KuuSt5Kh1AqjFCj7JInj+aOht+PJx57z7e9n4n2PCikGsIJO4XMfDxKUA/D
         Z6ftaFd1TcYxRsYTqOQa00kmr8sc1YouNdmUN1QEaVHg3/uhUo8kXH72glFn8lyw15YI
         xo0vagyTomijkJ/3V5kFBysvVg6ERaERqyiIfUXtvm1joW7V2CGAuU9170AgGh4+RWl3
         e19A==
X-Gm-Message-State: AOAM530wMDqNm9f7FDg3czLhvVXYJCAMms8o/6cxEHBUaf/etXICF/7n
        owyI5fUwwqqZNqkOnVdcqWPjiHWUsqvKqNtAg00=
X-Google-Smtp-Source: ABdhPJzNrg7tL4hiG+uszJMsxzgJhuELSAYapNKff/xSuWbh1tjpBPav25HkkWT3OIWBXgCDoI0eWC091/wI9fWzmcI=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1959884oif.148.1599557048922;
 Tue, 08 Sep 2020 02:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 11:23:57 +0200
Message-ID: <CAMuHMdVeHMXD-kwV4jqiv=pjU5Q==MJYKoY9C9ULc6re-dW+YQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
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
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas R-Car
> V3U (R8A779A0) SoC.

So obviously s/61/a0/ in the patch subject ;-)

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only?

> +/*
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a779A0 CPG Core Clocks */
> +#define R8A779A0_CLK_Z0                        0
> +#define R8A779A0_CLK_ZX                        1
> +#define R8A779A0_CLK_Z1                        2
> +#define R8A779A0_CLK_ZR                        3
> +#define R8A779A0_CLK_ZS                        4
> +#define R8A779A0_CLK_ZT                        5
> +#define R8A779A0_CLK_ZTR               6
> +#define R8A779A0_CLK_S1                        7
> +#define R8A779A0_CLK_S3                        8

On other SoCs, we didn't include S1 and S3, as they are internal clocks.

> +#define R8A779A0_CLK_S1D1              9
> +#define R8A779A0_CLK_S1D2              10
> +#define R8A779A0_CLK_S1D4              11
> +#define R8A779A0_CLK_S1D8              12
> +#define R8A779A0_CLK_S1D12             13

No S1D8 nor S1D12 in the table in Section 8.1.4 ("List of Clock Out")?

> +#define R8A779A0_CLK_S2D1              14
> +#define R8A779A0_CLK_S2D2              15
> +#define R8A779A0_CLK_S2D4              16

Given the table has no S2 parent clock, and there are no other
references to any of the S2D* clocks, I wonder if they exist at all?

As this file will become stable DT ABI, it would be good to have a
definitive answer.

> +#define R8A779A0_CLK_S3D1              17
> +#define R8A779A0_CLK_S3D2              18
> +#define R8A779A0_CLK_S3D4              19
> +#define R8A779A0_CLK_LB                        20
> +#define R8A779A0_CLK_CP                        21
> +#define R8A779A0_CLK_CL                        22
> +#define R8A779A0_CLK_CL16MCK           23
> +#define R8A779A0_CLK_ZB30              24
> +#define R8A779A0_CLK_ZB30D2            25
> +#define R8A779A0_CLK_ZB30D4            26
> +#define R8A779A0_CLK_ZB31              27
> +#define R8A779A0_CLK_ZB31D2            28
> +#define R8A779A0_CLK_ZB31D4            29
> +#define R8A779A0_CLK_SD0H              30
> +#define R8A779A0_CLK_SD0               31
> +#define R8A779A0_CLK_RPC               32
> +#define R8A779A0_CLK_RPCD2             33
> +#define R8A779A0_CLK_MSO               34
> +#define R8A779A0_CLK_CANFD             35
> +#define R8A779A0_CLK_CSI0              36
> +#define R8A779A0_CLK_FRAY              37
> +#define R8A779A0_CLK_POST              38
> +#define R8A779A0_CLK_POST2             39
> +#define R8A779A0_CLK_POST3             40

Do we need the POST clocks (BTW, POST4 is missing)?
On other SoCs, we didn't include them.

> +#define R8A779A0_CLK_DSI               41
> +#define R8A779A0_CLK_VIP               42
> +#define R8A779A0_CLK_ADGH              43
> +#define R8A779A0_CLK_CNNDSP            44
> +#define R8A779A0_CLK_ICU               45
> +#define R8A779A0_CLK_ICUD2             46
> +#define R8A779A0_CLK_VCBUS             47
> +#define R8A779A0_CLK_CBFUSA            48
> +#define R8A779A0_CLK_RCLK              49
> +#define R8A779A0_CLK_OSCCLK            50

On other SoCs, we called them <SOC>_CLK_R and <SOC>_CLK_OSC.

> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
