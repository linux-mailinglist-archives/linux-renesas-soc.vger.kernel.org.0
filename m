Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2352509D6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 12:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387249AbiDUKWO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 06:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388318AbiDUKWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 06:22:01 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035012E9D4;
        Thu, 21 Apr 2022 03:19:05 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id x24so2878252qtq.11;
        Thu, 21 Apr 2022 03:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IG3fgmM/VMoT7o6u2GHK+iHe3wI3I4YzluD8rX0me+Y=;
        b=QFa99HG+EiNYJdMF30JM9r2OFzd3dgBvvsgLeA7+gLZGzscXSj/N2oeFamre+aX6hJ
         ZQhPNoyXHXscN32xsXImk7D5Uf+Ab5bBbYCK4t0rOLilJf+KA2qdyKrPnj9RkXMu879l
         CfNASGeuJ1SjKCQP3sQem6s69EebrDmnjDnBWtL5Hp+nScrzBlnSwDkeqiu7UF0VGPo/
         sZTF4MxhK5pacTzNToF0XDssXpHWO2HnQ7SLQHL9aj8VPYKlD72E95qX8XG+CsrNv2yh
         VkG+gbSx9kHXcFOnpZ/fjbL7Ic70eDWTxToIygO9AH8rHUZc/VPpnlk4TbEM51LlOyzv
         JMiA==
X-Gm-Message-State: AOAM530s/G6P5vJ1Dp24q3Tqxs4HkTWAPvyO+Eh790Ok9bhsSnWdQb8W
        HodiFjOkTIpvw9awEOybI1EYpdwhddkc8qB3
X-Google-Smtp-Source: ABdhPJx81BpuNTWNKM7QQ6xP7INo7piCiPQlk50/YsjUhWoxV4EjyIgOaLz7WlRy3j4UEqHeU3maEw==
X-Received: by 2002:ac8:7f52:0:b0:2f3:3815:83e6 with SMTP id g18-20020ac87f52000000b002f3381583e6mr7885395qtk.15.1650536343874;
        Thu, 21 Apr 2022 03:19:03 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id c17-20020ac85a91000000b002e1dd8ae44bsm3307639qtc.29.2022.04.21.03.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 03:19:03 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id j2so7949111ybu.0;
        Thu, 21 Apr 2022 03:19:03 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr23540651ybp.613.1650536343099; Thu, 21
 Apr 2022 03:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 12:18:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkcG-edq=v_onOc66y3UpJgr74R1c9t7kfYhnOnqZdZQ@mail.gmail.com>
Message-ID: <CAMuHMdVkcG-edq=v_onOc66y3UpJgr74R1c9t7kfYhnOnqZdZQ@mail.gmail.com>
Subject: Re: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas
> R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
> +/*
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a779g0 CPG Core Clocks */
> +
> +#define R8A779G0_CLK_ZX                        0
> +#define R8A779G0_CLK_ZS                        1
> +#define R8A779G0_CLK_ZT                        2
> +#define R8A779G0_CLK_ZTR               3
> +#define R8A779G0_CLK_S0D2              4
> +#define R8A779G0_CLK_S0D3              5
> +#define R8A779G0_CLK_S0D4              6
> +#define R8A779G0_CLK_S0D1_VIO          7
> +#define R8A779G0_CLK_S0D2_VIO          8
> +#define R8A779G0_CLK_S0D4_VIO          9
> +#define R8A779G0_CLK_S0D8_VIO          10
> +#define R8A779G0_CLK_S0D1_VC           11
> +#define R8A779G0_CLK_S0D2_VC           12
> +#define R8A779G0_CLK_S0D4_VC           13
> +#define R8A779G0_CLK_S0D2_MM           14
> +#define R8A779G0_CLK_S0D4_MM           15
> +#define R8A779G0_CLK_S0D2_U3DG         16
> +#define R8A779G0_CLK_S0D4_U3DG         17
> +#define R8A779G0_CLK_S0D2_RT           18
> +#define R8A779G0_CLK_S0D3_RT           19
> +#define R8A779G0_CLK_S0D4_RT           20
> +#define R8A779G0_CLK_S0D6_RT           21
> +#define R8A779G0_CLK_S0D24_RT          22
> +#define R8A779G0_CLK_S0D2_PER          23
> +#define R8A779G0_CLK_S0D3_PER          24

Missing S0D4_PER?

> +#define R8A779G0_CLK_S0D6_PER          25
> +#define R8A779G0_CLK_S0D12_PER         26
> +#define R8A779G0_CLK_S0D24_PER         27
> +#define R8A779G0_CLK_S0D1_HSC          28
> +#define R8A779G0_CLK_S0D2_HSC          29
> +#define R8A779G0_CLK_S0D4_HSC          30
> +#define R8A779G0_CLK_S0D2_CC           31
> +#define R8A779G0_CLK_SVD1_IR           32
> +#define R8A779G0_CLK_SVD2_IR           33

Missing IMPA0?
Or is it internal-only? Perhaps the same for IMPA1 below?

> +#define R8A779G0_CLK_SVD1_VIP          34
> +#define R8A779G0_CLK_SVD2_VIP          35
> +#define R8A779G0_CLK_CL                        36
> +#define R8A779G0_CLK_CL16M             37
> +#define R8A779G0_CLK_CL16M_MM          38
> +#define R8A779G0_CLK_CL16M_RT          39
> +#define R8A779G0_CLK_CL16M_PER         40
> +#define R8A779G0_CLK_CL16M_HSC         41
> +#define R8A779G0_CLK_Z0                        42
> +#define R8A779G0_CLK_ZB3               43
> +#define R8A779G0_CLK_ZB3D2             44
> +#define R8A779G0_CLK_ZB3D4             45
> +#define R8A779G0_CLK_ZG                        46
> +#define R8A779G0_CLK_SD0H              47
> +#define R8A779G0_CLK_SD0               48
> +#define R8A779G0_CLK_RPC               49
> +#define R8A779G0_CLK_RPCD2             50
> +#define R8A779G0_CLK_MSO               51
> +#define R8A779G0_CLK_CANFD             52
> +#define R8A779G0_CLK_CSI               53
> +#define R8A779G0_CLK_FRAY              54
> +#define R8A779G0_CLK_IPC               55
> +#define R8A779G0_CLK_SASYNCRT          56
> +#define R8A779G0_CLK_SASYNCPERD1       57
> +#define R8A779G0_CLK_SASYNCPERD2       58
> +#define R8A779G0_CLK_SASYNCPERD4       59

Missing VIOBUS? You do have it as an internal core clock.

> +#define R8A779G0_CLK_VIOBUSD2          60

Missing VCBUS? You do have it as an internal core clock.

> +#define R8A779G0_CLK_VCBUSD2           61
> +#define R8A779G0_CLK_IMPA1             62
> +#define R8A779G0_CLK_DSIEXT            63
> +#define R8A779G0_CLK_DSIREF            64
> +#define R8A779G0_CLK_ADGH              65
> +#define R8A779G0_CLK_OSC               66
> +#define R8A779G0_CLK_ZR0               67
> +#define R8A779G0_CLK_ZR1               68
> +#define R8A779G0_CLK_ZR2               69

Missing IMPA?
Figure 8.1.1 (Block Diagram of CPG) indicates it's a direct
input to the IMP block, hence not an internal core clock.

> +#define R8A779G0_CLK_IMPAD4            70
> +#define R8A779G0_CLK_CPEX              71
> +#define R8A779G0_CLK_CBFUSA            72
> +#define R8A779G0_CLK_R                 73
> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
