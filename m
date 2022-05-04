Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D73D519A55
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346625AbiEDIvq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346632AbiEDIvp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:51:45 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB78724BD1;
        Wed,  4 May 2022 01:48:06 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id h3so382278qtn.4;
        Wed, 04 May 2022 01:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pnk/NzLb1WkjXkXDa+pcRqnKBS6CUN+O48VQsmQLxoc=;
        b=ed025kGYq96niKKv/DiUyT2Y5zANS4xYJqRAunXbuNEjM95DhnMm7H/U7aHOTfLrkJ
         0XKUXKC0gzTVDPcUHFZOYWglTDfAmPfKcWOl03bkbGqipSgWrjro4esgaSH4DS9a00al
         uA4bj6XdaFw3AZ9rtS3oxTWSy2ExBaoop5w38gO/OAKHaHhW3f1mFJWQt12zwQDb0z6Q
         7Ei9gNtZYb+lk77Sep6830VXU6xNQEsYKCINVjScsqetXVMbrxd2Ga55sHvDc1qlIkSJ
         S8YimzwQXivNpa4LurLsNvyXpAba/y8ANZ5tsqSAhVnvNrQimB9zDggIawoJDWVTBEFX
         0zxw==
X-Gm-Message-State: AOAM532OuTdX0L85DfOaAuKSGYgguvZm5y7xm4xiKTmteLTAQPVzAPIb
        1FMR6/3Da4jCdX740fVORM5O4i/HmjmMZw==
X-Google-Smtp-Source: ABdhPJyIO3Dys4tI8iT5t2fPWKIcOLlDy7ltzuQuOFRIpKznz1DpEHfjQxdaet7vdLjqHw2GhoALWQ==
X-Received: by 2002:ac8:7d55:0:b0:2f3:b8e2:b627 with SMTP id h21-20020ac87d55000000b002f3b8e2b627mr430199qtb.490.1651654085566;
        Wed, 04 May 2022 01:48:05 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 141-20020a370693000000b0069ff862c84esm3340016qkg.3.2022.05.04.01.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:48:05 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id y2so1235865ybi.7;
        Wed, 04 May 2022 01:48:05 -0700 (PDT)
X-Received: by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr17831691ybb.36.1651654084846; Wed, 04
 May 2022 01:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-12-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-12-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:47:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1TXp2g+sHyWvAHdNWdASr_PAYy=aQRhP30gjuMP6TyQ@mail.gmail.com>
Message-ID: <CAMuHMdV1TXp2g+sHyWvAHdNWdASr_PAYy=aQRhP30gjuMP6TyQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: renesas: Add initial DTSI for RZ/V2M SoC
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Tue, May 3, 2022 at 2:02 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Details of the SoC can be found here:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Replace CPG_CORE with CPG_MOD
>  - Add UART pclk
>  - Add gic clk
>  - Fix cpg and uart0 register region
>  - Remove sys as we are currently not using it and binding not accepted

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi

> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +               clocks = <&cpg CPG_MOD R9A09G011_SYC_CNT_CLK>;
> +               resets = <&cpg R9A09G011_SYC_RST_N>;

As per the discussion about [PATCH v3 04/12], these two properties
should be dropped.

> +       };
> +};

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
