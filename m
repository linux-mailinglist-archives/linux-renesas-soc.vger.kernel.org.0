Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6094562F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 19:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhKRS4O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 13:56:14 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:44640 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbhKRS4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 13:56:14 -0500
Received: by mail-ua1-f54.google.com with SMTP id p2so15837780uad.11;
        Thu, 18 Nov 2021 10:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Szmk9HdK7eBU3AtBt/+5NFQj3z/RrMU0PidWqSsRpRI=;
        b=YBZAZW6VpF08/CJRdfODUsYis1WufJLcr81DB0+dgFx283G6mORu/tNEOZznb79EK5
         gP+8XYSgsDfVFF3Lmt7cf3C3QBfpchEeI9hf6IJE7Jim+wDxhyjXEBDls0QWcIgxCEi/
         HnnfM6nZcpRzbRXDGLvd6aSWUNlDImU/LV8RHIBUF6TRWr8ne//T8gZu8+b5TaWcNeiY
         6bqKifbAu5enkhKafBLaAuiY2O/J0enVJbgmKS8gx6RbiPAHTIla4YrKhT+CkGMAylKv
         WV+CnuXO4mq774ivD9h6NATlCGatk0eSHsx90sUHKbkU4KTZAIBie6Rpo/LWpHtfWLnO
         qTEg==
X-Gm-Message-State: AOAM531ofBjDuUnm8+0elJ1oscIAmIElnV1yKfMP2cPqARdHV5MkStUJ
        rslW+r7yFv29OrfcnA0qNSWZKiTpQtnFsw==
X-Google-Smtp-Source: ABdhPJzk8NDepL6ZhtOx5kH7qZe/vp5sQuGiGRuUMrrR12ASyOftZiKgjdtetsc3/i7nAkoc43+jPg==
X-Received: by 2002:a67:f794:: with SMTP id j20mr84615108vso.54.1637261593307;
        Thu, 18 Nov 2021 10:53:13 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id bi35sm382559vkb.3.2021.11.18.10.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:53:13 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id m19so4391987vko.12;
        Thu, 18 Nov 2021 10:53:12 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr106926823vkd.19.1637261592846;
 Thu, 18 Nov 2021 10:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-8-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-8-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 19:53:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyfRj6XnYYGRQ5g3dM4W7=o13WwmU5xn2WS+SdJY6Knw@mail.gmail.com>
Message-ID: <CAMuHMdWyfRj6XnYYGRQ5g3dM4W7=o13WwmU5xn2WS+SdJY6Knw@mail.gmail.com>
Subject: Re: [PATCH 07/16] dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a779f0-cpg-mssr.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
> +/*
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a779f0 CPG Core Clocks */
> +
> +#define R8A779F0_CLK_ZX                        0
> +#define R8A779F0_CLK_ZS                        1
> +#define R8A779F0_CLK_ZT                        2
> +#define R8A779F0_CLK_ZTR               3
> +#define R8A779F0_CLK_S0D2              4
> +#define R8A779F0_CLK_S0D3              5
> +#define R8A779F0_CLK_S0D4              6
> +#define R8A779F0_CLK_S0D2_MM           7
> +#define R8A779F0_CLK_S0D3_MM           8
> +#define R8A779F0_CLK_S0D4_MM           9
> +#define R8A779F0_CLK_S0D2_RT           10
> +#define R8A779F0_CLK_S0D3_RT           11
> +#define R8A779F0_CLK_S0D4_RT           12
> +#define R8A779F0_CLK_S0D6_RT           13
> +#define R8A779F0_CLK_S0D3_PER          14
> +#define R8A779F0_CLK_S0D6_PER          15
> +#define R8A779F0_CLK_S0D12_PER         16
> +#define R8A779F0_CLK_S0D24_PER         17
> +#define R8A779F0_CLK_S0D2_HSC          18
> +#define R8A779F0_CLK_S0D3_HSC          19
> +#define R8A779F0_CLK_S0D4_HSC          20
> +#define R8A779F0_CLK_S0D6_HSC          21
> +#define R8A779F0_CLK_S0D12_HSC         22
> +#define R8A779F0_CLK_S0D2_CC           23
> +#define R8A779F0_CLK_CL                        24
> +#define R8A779F0_CLK_CL16M             25
> +#define R8A779F0_CLK_CL16M_MM          26
> +#define R8A779F0_CLK_CL16M_RT          27
> +#define R8A779F0_CLK_CL16M_PER         28
> +#define R8A779F0_CLK_CL16M_HSC         29
> +#define R8A779F0_CLK_Z0                        30
> +#define R8A779F0_CLK_Z1                        31
> +#define R8A779F0_CLK_ZB3               32
> +#define R8A779F0_CLK_ZB3D2             33
> +#define R8A779F0_CLK_ZB3D4             34
> +#define R8A779F0_CLK_SDSRC             35

I think we can leave out SDSRC, like on the other SoCs, as it's an
internal clock.

> +#define R8A779F0_CLK_SD0H              36
> +#define R8A779F0_CLK_SD0               37
> +#define R8A779F0_CLK_RPC               38
> +#define R8A779F0_CLK_RPCD2             39
> +#define R8A779F0_CLK_MSO               40
> +#define R8A779F0_CLK_SASYNCRT          41
> +#define R8A779F0_CLK_SASYNCPERD1       42
> +#define R8A779F0_CLK_SASYNCPERD2       43
> +#define R8A779F0_CLK_SASYNCPERD4       44
> +#define R8A779F0_CLK_DBGSOC_HSC                45
> +#define R8A779F0_CLK_RSW2              46
> +#define R8A779F0_CLK_OSC               47
> +#define R8A779F0_CLK_ZR                        48
> +#define R8A779F0_CLK_CPEX              49
> +#define R8A779F0_CLK_CBFUSA            50
> +#define R8A779F0_CLK_R                 51

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
