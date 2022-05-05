Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146C351BC7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 11:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiEEJxd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 05:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbiEEJxc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 05:53:32 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFCC4F478;
        Thu,  5 May 2022 02:49:52 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id y6so2759467qke.10;
        Thu, 05 May 2022 02:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFqOXoyJhFpGiMXq2WG9dzp6lvFfSIJKN8/+jdUWR3o=;
        b=LmkwdV2sWRnvd1AlAoDW86TvM0OhhmXHSZfN6GAbizqT0HdQdOyjy6LF42s3seJPNC
         L3xCkDVLcgoNATB2XMJa3alCePYJtkD1DiVMP2RE65N3IpqXfIgiwUD5cmSzrl0TZFXg
         iFfBla/LloaCjGJbvQUXtnI59l+WWucIpPXbCfypda+/xEU4ZteIpvKV8aFPLIw8T93A
         NWUMnx6bQ7hO8qVD5veSq/YjzR7uOPhwnRiAbyyS/Pyae06RJKs0d76Mlw/dHbtv7dnZ
         9KNgxhf5mbZMxnD1IS2kx3H45U7pSq+JwwTzabKHoUWNlOtFT3fPEjgMLWdSlTymuEsA
         Afcw==
X-Gm-Message-State: AOAM532bqZLJlz1IW/3Ujcy/j90JzrYs0iTGydT1ufvxtuBsP9JTe8Mx
        kta5baQllb35yiTsPBFC5w1HrO4vBqbw/g==
X-Google-Smtp-Source: ABdhPJwUGbdntzAP5kDrIvyGjqRxYA7xkShLOLGDAQAeTo6rMw4e6/Th1UkaCYwOf7dSbSjOj35XdA==
X-Received: by 2002:a05:620a:424c:b0:67d:2bad:4450 with SMTP id w12-20020a05620a424c00b0067d2bad4450mr18959132qko.171.1651744191755;
        Thu, 05 May 2022 02:49:51 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 191-20020a3705c8000000b0069fc13ce204sm557035qkf.53.2022.05.05.02.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:49:51 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2f7b815ac06so42496277b3.3;
        Thu, 05 May 2022 02:49:51 -0700 (PDT)
X-Received: by 2002:a81:547:0:b0:2f8:6e8:19d7 with SMTP id 68-20020a810547000000b002f806e819d7mr23467070ywf.383.1651744190793;
 Thu, 05 May 2022 02:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <73cea9d5e1a6639422c67e4df4285042e31c9fd5.1651497071.git.geert+renesas@glider.be>
In-Reply-To: <73cea9d5e1a6639422c67e4df4285042e31c9fd5.1651497071.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 May 2022 11:49:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEKj1+jgnHtqkd3hiNfpqD8nUa3APo7jYikLVxv0=XdA@mail.gmail.com>
Message-ID: <CAMuHMdWEKj1+jgnHtqkd3hiNfpqD8nUa3APo7jYikLVxv0=XdA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4
 compatible values
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
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

On Mon, May 2, 2022 at 3:35 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence update the compatible properties in various device nodes
> to include family-specific compatible values for R-Car Gen4 instead of
> R-Car Gen3:
>   - DMAC,
>   - (H)SCIF,
>   - I2C,
>   - IPMMU,
>   - WDT.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi

> @@ -2092,7 +2094,8 @@ rpc: spi@ee200000 {
>                 };
>
>                 ipmmu_rt0: iommu@ee480000 {
> -                       compatible = "renesas,ipmmu-r8a779a0";
> +                       compatible = "renesas,ipmmu-r8a779a0",
> +                                    "renesas,rcar-gen4-ipmmu";

renesas,rcar-gen4-ipmmu-vmsa

Will fix while applying.

>                         reg = <0 0xee480000 0 0x20000>;
>                         renesas,ipmmu-main = <&ipmmu_mm 10>;
>                         power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
