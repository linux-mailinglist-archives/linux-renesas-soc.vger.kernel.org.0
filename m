Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABA64CD4B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Mar 2022 14:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbiCDNH4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Mar 2022 08:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiCDNH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 08:07:56 -0500
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0911F1B4024
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Mar 2022 05:07:08 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id w128so4354483vkd.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Mar 2022 05:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tIHfkMgtiFE9hswQYNJywb9axtt1hJZXDf5gsyqrIWc=;
        b=YwULX1Dm/VPynQgUhlVNWctFZ1T4Y1JM2AFti0GSq1LabPN4yvC1i1CcpUqXcX20ST
         kky9DeY2w2Lt+Hyt6ZZcH+Ek805qURFWiLkKUK1cXfDjcPkyhqh/y3guGzPsPbbdjqpk
         tHwm1LlbhASYssR2FlYilwq5VeC43PND85RK7ulVRz1Bz68F8j3ytdWwiW2WFGxSgg61
         9tBELQV8NAoD8idLzC+jwgkxGtMU7vKrRUWiJkUV6RTWS56Ph4kcje5I5YTfx/wCnyTF
         w/K2CkRMsVHXlwVcSlWdUPdWe9IO57acNIKMtn2C1+TBz7GnLSLdSIwUM6p/iTjBjFxc
         pM9w==
X-Gm-Message-State: AOAM5330Z8FwNeoGn8DK1TNcyRNJFA3qoS5ng+ClKTc8t7WDD2EEH9JW
        2j2A/rh6gh3fPs31Ae6xL+iQP7guk5mHHA==
X-Google-Smtp-Source: ABdhPJxwj/DC74jD7xk/oAR+qyiLc3LdD1fLyXIjLw+6jhcf9+ivCTpsX2XKjpZcga3ckhsMybVg4w==
X-Received: by 2002:a1f:3244:0:b0:332:2037:83b1 with SMTP id y65-20020a1f3244000000b00332203783b1mr17562503vky.24.1646399226946;
        Fri, 04 Mar 2022 05:07:06 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id o84-20020a1f2857000000b00336dfe5589csm491750vko.28.2022.03.04.05.07.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 05:07:06 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id g21so8968798vsp.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Mar 2022 05:07:06 -0800 (PST)
X-Received: by 2002:a05:6102:c1:b0:320:7de8:3bbb with SMTP id
 u1-20020a05610200c100b003207de83bbbmr1261877vsp.5.1646399226371; Fri, 04 Mar
 2022 05:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20220303162634.6572-1-biju.das.jz@bp.renesas.com> <20220303162634.6572-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303162634.6572-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Mar 2022 14:06:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX12L55NLABtTvE6b16a+9NvC6LcDG7npRhiHSWeMQ7Zw@mail.gmail.com>
Message-ID: <CAMuHMdX12L55NLABtTvE6b16a+9NvC6LcDG7npRhiHSWeMQ7Zw@mail.gmail.com>
Subject: Re: [PATCH V2 2/7] soc: renesas: Identify RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

On Thu, Mar 3, 2022 at 5:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for identifying the RZ/G2UL (R9A07G043U) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -296,6 +296,12 @@ config ARCH_R8A774B1
>         help
>           This enables support for the Renesas RZ/G2N SoC.
>
> +config ARCH_R9A07G043U

Likewise (cfr. my comments on 1/7), I think this should use
ARCH_R9A07G043 instead.

> +       bool "ARM64 Platform support for RZ/G2UL"
> +       select ARCH_RZG2L
> +       help
> +         This enables support for the Renesas RZ/G2UL SoC variants.
> +
>  config ARCH_R9A07G044
>         bool "ARM64 Platform support for RZ/G2L"
>         select ARCH_RZG2L
> diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
> index 92c7b42250ee..c667baf4fc59 100644
> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -64,6 +64,10 @@ static const struct renesas_family fam_rzg2l __initconst __maybe_unused = {
>         .name   = "RZ/G2L",
>  };
>
> +static const struct renesas_family fam_rzg2ul __initconst __maybe_unused = {
> +       .name   = "RZ/G2UL",
> +};
> +
>  static const struct renesas_family fam_rzv2l __initconst __maybe_unused = {
>         .name   = "RZ/V2L",
>  };
> @@ -148,6 +152,11 @@ static const struct renesas_soc soc_rz_g2l __initconst __maybe_unused = {
>         .id     = 0x841c447,
>  };
>
> +static const struct renesas_soc soc_rz_g2ul __initconst __maybe_unused = {
> +       .family = &fam_rzg2ul,
> +       .id     = 0x8450447,

Rev. 0.51 of the RZ/G2UL Hardware User's Manual still lists the same
ID as RZ/G2L, so I can't check this :-(

> +};
> +
>  static const struct renesas_soc soc_rz_v2l __initconst __maybe_unused = {
>         .family = &fam_rzv2l,
>         .id     = 0x8447447,
> @@ -340,6 +349,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
>  #ifdef CONFIG_ARCH_R8A779F0
>         { .compatible = "renesas,r8a779f0",     .data = &soc_rcar_s4 },
>  #endif
> +#if defined(CONFIG_ARCH_R9A07G043U)
> +       { .compatible = "renesas,r9a07g043u11", .data = &soc_rz_g2ul },

 "renesas,r9a07g043", so it catches both Type-1 and Type-2 SoCs?

> +#endif
>  #if defined(CONFIG_ARCH_R9A07G044)
>         { .compatible = "renesas,r9a07g044",    .data = &soc_rz_g2l },
>  #endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
