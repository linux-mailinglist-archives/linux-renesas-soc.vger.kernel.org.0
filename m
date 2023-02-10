Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01542691FAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 14:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbjBJNVy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 08:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjBJNVx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 08:21:53 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CF6DBF1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 05:21:50 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id 5so5594419qtp.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 05:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFFJEiQDIOnf+8Kj5BQ0lTEEVAXMsM0o/xvMX+X51pY=;
        b=sxuOOYDQt6UIghGLajpx40XoVuOmKqcxiGL4bSV/GYhf6GDQD9T1KaU/lyaWt2I74W
         xEKz5BB8GPKGii5PsCN8MuUUUqlzLE7Uk9TuzRYlxL1BfsyePRhHqBQPo579qAgg4KYp
         EFcKJlK+4SollJ7NEjkXlW63zKWnDyUNHP/rlec7zbuG3H2raCbPtkK/tbc2zSUPwZGQ
         wEi4oPL6Jc90pgtNS9HnqCv68H6/hTfVEagKyjwiTuBV7xSWU5eTdrj3Mu7K6MR51WvM
         TNNd8c+q/mv7gdcdKW46ZlAMbqqHBJWgpreJjY9LOSXDRdH3eHRQFn6sjWKyolqdKEmN
         qL6Q==
X-Gm-Message-State: AO0yUKWfxp06tdk+ymsNhch/i3p1Opi871tBi6oV5nDdazL/fJiTEHMj
        nnDGV77kC71teqmTFD9g03i8NbktYyTxN5Or
X-Google-Smtp-Source: AK7set80thvNle+g7pkKX9Zov3qSvAA3cQRHbDB1g73PdmfX3KUZgz2fKgiS/p1xYd/GAmfk7FaxTg==
X-Received: by 2002:a05:622a:1008:b0:3b8:6cb0:8d28 with SMTP id d8-20020a05622a100800b003b86cb08d28mr22711224qte.6.1676035309317;
        Fri, 10 Feb 2023 05:21:49 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id x12-20020ac8700c000000b003b0766cd169sm3391396qtm.2.2023.02.10.05.21.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 05:21:49 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-52eb7a5275aso57079367b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 05:21:49 -0800 (PST)
X-Received: by 2002:a0d:e9c1:0:b0:514:a90f:10ea with SMTP id
 s184-20020a0de9c1000000b00514a90f10eamr1457502ywe.316.1676035308798; Fri, 10
 Feb 2023 05:21:48 -0800 (PST)
MIME-Version: 1.0
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com> <871qn8anc0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871qn8anc0.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 14:21:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVPQLtM7Z-H-gADurpbV5NKFrLfz7KJZWOuY24CP1ho1g@mail.gmail.com>
Message-ID: <CAMuHMdVPQLtM7Z-H-gADurpbV5NKFrLfz7KJZWOuY24CP1ho1g@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: r8a779g0-white-hawk-cpu.dtsi: add 5.0v regulator
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Feb 2, 2023 at 2:05 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This is prepare for White Hawk Audio Support.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

However, I think you do not need this patch, cfr. my comments
on [PATCH 7/9].

> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> @@ -136,6 +136,15 @@ reg_3p3v: regulator-3p3v {
>                 regulator-always-on;
>         };
>
> +       reg_5p0v: regulator-5p0v {
> +                       compatible = "regulator-fixed";
> +                       regulator-name = "fixed-5.0V";
> +                       regulator-min-microvolt = <5000000>;
> +                       regulator-max-microvolt = <5000000>;
> +                       regulator-boot-on;
> +                       regulator-always-on;
> +       };
> +
>         sn65dsi86_refclk: clk-x6 {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
