Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0C7519AF7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346850AbiEDI4V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347098AbiEDIzo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:55:44 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD7924F00;
        Wed,  4 May 2022 01:51:51 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id j6so484242qkp.9;
        Wed, 04 May 2022 01:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZoE4Zb/rntc4kQgqbm2zg9ovU3k2VkaU2LX8xAhC6hM=;
        b=CH6ztLU+qVxhdDTDqNVPoD4t0+dkT4QwK364ctQZb1W8fhhij9FqhF/H2SflDMkvND
         mFmfXggzHHF4/IKBwaZwl/ZNphIlrqXyfd7oxGz3KrbdfrQMZNa45k6hMxKhBzUH/UAP
         ecgPl5zXFIR4q4dwksFFuWFz/0F3c3zZ2r8uCiNEAvoVXuX1yPEPwkwnwWSc8ubFkCZU
         nwEU+T/bGVow7PctjIxY9SSUHXAr7ZkKrzHrIDikWFa36yFpKFHBTd4F/m/o3eh0yxBu
         hAYZpa7PYZr1Q5O3ivTUNY0lTBXltFYLxrCleCKs6hsuHyGh3bTDRbeuHZaSSJzLaiIf
         cubw==
X-Gm-Message-State: AOAM532p/UWADZ5rZix0WGwpalRVyPVdY2bKUq20rzFUJTdrJCqkO/Bs
        zio8OZqvvy9tnK0cP0indeId4y4xwxKQxw==
X-Google-Smtp-Source: ABdhPJxCnpxc3boP+gGJicnFpdz5DPJx6JBotMeSMy2zBueZcc9ApLhALv3t5YCx1UZfY7hBdUPKeA==
X-Received: by 2002:a37:66d8:0:b0:69f:be4d:208b with SMTP id a207-20020a3766d8000000b0069fbe4d208bmr14811372qkc.83.1651654310482;
        Wed, 04 May 2022 01:51:50 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id n68-20020a37a447000000b0069fc13ce1edsm7438373qke.30.2022.05.04.01.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:51:50 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id g28so1235969ybj.10;
        Wed, 04 May 2022 01:51:49 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr429566ybb.202.1651654309583; Wed, 04
 May 2022 01:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-13-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-13-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxak=uJuz72uCYVVD29RMm-66h1S1gnpu2=pnVFp8A_g@mail.gmail.com>
Message-ID: <CAMuHMdVxak=uJuz72uCYVVD29RMm-66h1S1gnpu2=pnVFp8A_g@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] arm64: dts: renesas: Add initial device tree for
 RZ/V2M EVK
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Tue, May 3, 2022 at 2:02 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add basic support for RZ/V2M EVK (based on R9A09G011):
> - memory
> - External input clock
> - UART
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Add comment about mem reserved for ISP Firmware
>  - Remove sys node

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/V2M (r9a09g011) Evaluation Kit Board
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a09g011.dtsi"
> +
> +/ {

> +       memory@58000000 {
> +               device_type = "memory";
> +               /*
> +                * first 2GiB is reserved for ISP Firmware,

"2GiB" (0x80000000) doesn't look right to me.
Perhaps 1.25 GIB?

If you confirm, I can fix up (and the previous patch), and queue in
renesas-devel for v5.19.

> +                * next 128MiB is reserved for secure area.
> +                */
> +               reg = <0x0 0x58000000 0x0 0x28000000>;
> +       };

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
