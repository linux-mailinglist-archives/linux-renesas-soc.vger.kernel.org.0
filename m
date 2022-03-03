Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868804CB9D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 10:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbiCCJHi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 04:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCCJHh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 04:07:37 -0500
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9165A177765;
        Thu,  3 Mar 2022 01:06:52 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id g21so4766443vsp.6;
        Thu, 03 Mar 2022 01:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZE2HvdXlEudhNnuXyG1GhRphTYlvh5XG2tB5Xz5SOpY=;
        b=tQPe3ezzNOEPgRjS0//FQyy50aLkdQAcP3ZnbEU3UtbeAiluQejZR9k8N77HVtuwZl
         E7bXSVayqa/WnYolX2vPxdbavO7qmtnSo1XLEHNvK5VSc2f8dqwJCODglG5q7Oswm4zS
         E0Rz3B4yGxwl9nyMFAtE16LZetpBzMpq+0lzOnODG/jRIIY/065sW1WyNHbVe2L7lokJ
         IVLfoWBKyu1c5nCPLbO0yGjJN9uazvFOrkkXotVJxquNinyTy2daEmabMclX3BmUQJFR
         YPVlEEFFdmvXrI0ld7HWsgXxXbZXzDOJ1do3FXhQeiFUVUNOnt/3tOar0IIPbPwviq7s
         k6Kg==
X-Gm-Message-State: AOAM533D0r5BR0ABkK7o6hd+QrvOc9pMrsr/YLaxo5F89l6tYOmxm29h
        RcIOeJpk5/+IAJi6WD1tX8ZfLD7DP1EYSA==
X-Google-Smtp-Source: ABdhPJyQIIwG95KEe+tZk56HzdTmuRxpF5ZdR4EsdowLWpdQbDkYiV6QP0Cl92wvQ2F3OnP637DP6g==
X-Received: by 2002:a05:6102:160e:b0:31a:d674:d477 with SMTP id cu14-20020a056102160e00b0031ad674d477mr14787114vsb.67.1646298411642;
        Thu, 03 Mar 2022 01:06:51 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id q65-20020a1fa744000000b0032db512ac39sm234775vke.46.2022.03.03.01.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 01:06:51 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id j201so2301268vke.11;
        Thu, 03 Mar 2022 01:06:51 -0800 (PST)
X-Received: by 2002:a1f:9f82:0:b0:336:8f32:eb24 with SMTP id
 i124-20020a1f9f82000000b003368f32eb24mr3060323vke.0.1646298410920; Thu, 03
 Mar 2022 01:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Mar 2022 10:06:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSgjipMd_39+J=egH+yh=G-cb4jpD43FU7O77CZzDhNg@mail.gmail.com>
Message-ID: <CAMuHMdWSgjipMd_39+J=egH+yh=G-cb4jpD43FU7O77CZzDhNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: renesas,scif: Update compatible
 string for RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Thu, Mar 3, 2022 at 9:59 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Both RZ/G2UL and RZ/Five SoC's have SoC ID starting with R9A07G043.
> To distinguish between them update the compatible string to
> "renesas,scif-r9a07g043u" for RZ/G2UL SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -76,7 +76,7 @@ properties:
>
>        - items:
>            - enum:
> -              - renesas,scif-r9a07g043      # RZ/G2UL
> +              - renesas,scif-r9a07g043u     # RZ/G2UL

Is this really needed? As far as we know, RZ/Five and RZ/G2UL
do use the same I/O blocks?

>                - renesas,scif-r9a07g054      # RZ/V2L
>            - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
