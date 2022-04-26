Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3272551069C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 20:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350991AbiDZSVR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 14:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353681AbiDZSVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 14:21:14 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA743112DBE;
        Tue, 26 Apr 2022 11:18:03 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id b17so14697713qvf.12;
        Tue, 26 Apr 2022 11:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrDtpTWYEh6BgxA1tNfogOLR/qVKjTGoMsxRjOgUmis=;
        b=YUjIg2wPYj4XTTY5cTHqGyexjoHpKmhxqRW5auuum75ajFTIz/y9nsvwiCcFgXHnlS
         uFQZ7HHMJnXosYWNev3dw5bHF9EQJa6z/aoyiK7egR5hXz4Q1frTmZdAfZl74W/R0t6a
         Q/wRXUkyMmxN5PbGgDTYhri3C5YkCKKJdHu/xyfe6eh2mN/vS7JVaVXAD/PiK7CrlbbE
         AIlJ4w5GEmyF3JfmK9HDSW71+P+pOJG13bsswP4UNgX8oxH5Pegge5QLXSv07E9Ysynu
         XUyzSOjurQD/n/L1B8gXHnjPuRwf31B1j0X4OU9bfaUlvEnZNgD7ANU/uz1JaTy2Qm5o
         6RXw==
X-Gm-Message-State: AOAM530MQY3tZjStu9Az40mvC45UXGHrBDA7d9xuRk4q09aDtoxOY9YO
        HLS7aoNQISN/gE0Z2puq8zTcoqu6BTs2qQ==
X-Google-Smtp-Source: ABdhPJymR6pNRl+f81UPvSdMCryQeUMgIsylSFl2HkNmYRLAg9IuEZTc1P0JFaFDd/dcRWctKayn2g==
X-Received: by 2002:a05:6214:27c9:b0:446:5771:397b with SMTP id ge9-20020a05621427c900b004465771397bmr17032066qvb.75.1650997082706;
        Tue, 26 Apr 2022 11:18:02 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id j128-20020a37a086000000b0069f7c7d6517sm1028240qke.13.2022.04.26.11.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 11:18:02 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id s30so6489306ybi.8;
        Tue, 26 Apr 2022 11:18:02 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr23087982yba.546.1650997081694; Tue, 26
 Apr 2022 11:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-14-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-14-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 20:17:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0GRBDk9Kv_ezkczwq4EhZUh5PhaYM0DVOXTzvVrGQYQ@mail.gmail.com>
Message-ID: <CAMuHMdV0GRBDk9Kv_ezkczwq4EhZUh5PhaYM0DVOXTzvVrGQYQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arm64: dts: renesas: Add initial device tree for
 RZ/V2M EVK
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Wed, Mar 30, 2022 at 5:43 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add basic support for RZ/V2M EVK (based on R9A09G011):
> - memory
> - External input clock
> - UART
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
> @@ -0,0 +1,45 @@
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
> +       model = "RZ/V2M Evaluation Kit 2.0";
> +       compatible = "renesas,rzv2mevk2", "renesas,r9a09g011";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       memory@58000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */

I guess there's much more reserved for the ISP firmware (1408 MiB?).

> +               reg = <0x0 0x58000000 0x0 0x28000000>;
> +       };
> +
> +       memory@180000000 {
> +               device_type = "memory";
> +               reg = <0x1 0x80000000 0x0 0x80000000>;
> +       };
> +};
> +
> +&extal_clk {
> +       clock-frequency = <48000000>;
> +};
> +
> +&sys {
> +       status = "okay";
> +};

No need to enable sys if it would be enabled by default.

> +
> +&uart0 {
> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
