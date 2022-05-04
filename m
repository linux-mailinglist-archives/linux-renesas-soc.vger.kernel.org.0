Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B03519943
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346043AbiEDIKo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346067AbiEDIKm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:10:42 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D7622530;
        Wed,  4 May 2022 01:07:04 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id kj8so395663qvb.6;
        Wed, 04 May 2022 01:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qr8Gita3qZhZBTod6oSOJkjQHSZMAcLB8WWXhsphx9A=;
        b=c86yVxfiA5ro1aLiRQPya71bWL7ryBvX//lLNWWr6EjOINJgUWJ5Du9Oop7aNVJArq
         Z/dcKMmNTrwDIA7WKdWG4Fqk1jzAYonVcbu/MK6d+wTCcVHPDXpe00G+AA9dRY+2Fpoa
         PDLB87K650eUo/2UoceGAuJp6gjxpSv82RjU1x8MDriaHw33Gtv+9EfB6+07G96a2sDz
         J/5jGNeqkfgyLiykKumomNCTm8jeWV0CMw5fdWruGDpFATyM+7z+us52rRztHfyvXGMU
         UaYA5PCAdlr26YK9Nda3BLObwy+mh4qKB8LCSKxo6OUoldP1NHu14YlPf2PzLvJodvDu
         tZYw==
X-Gm-Message-State: AOAM532d2R8De8IM4furCqLtC1sU13UZ8muUqguThB2uh3/6AN4SX/I5
        q7orgy+SpE9kcrN4GDHXB+s15woWUpcMTg==
X-Google-Smtp-Source: ABdhPJwfVjQnZcOeF6u1QOjb+7FIYWHHTBz23ex5y71Pa5KCDVVez83onjp2s3vu+kkDH8sPEraRYA==
X-Received: by 2002:a05:6214:c44:b0:446:7a14:c301 with SMTP id r4-20020a0562140c4400b004467a14c301mr16347339qvj.35.1651651623651;
        Wed, 04 May 2022 01:07:03 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 3-20020a05620a040300b0069fd232296fsm5788544qkp.135.2022.05.04.01.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:07:03 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id j2so1156358ybu.0;
        Wed, 04 May 2022 01:07:02 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr17155385ybu.604.1651651622524; Wed, 04
 May 2022 01:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-2-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:06:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjdoY3qrQhHxCdc=W7-MrX7FVeWqZ8Vma2-1Sc5_=hEQ@mail.gmail.com>
Message-ID: <CAMuHMdXjdoY3qrQhHxCdc=W7-MrX7FVeWqZ8Vma2-1Sc5_=hEQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: serial: renesas,em-uart: Add RZ/V2M
 clock to access the registers
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

On Tue, May 3, 2022 at 2:01 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The RZ/V2M SoC has an additional clock to access the registers. The HW
> manual says this clock should not be touched as it is used by the
> "ISP Firmware".
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> @@ -9,9 +9,6 @@ title: Renesas EMMA Mobile UART Interface
>  maintainers:
>    - Magnus Damm <magnus.damm@gmail.com>
>
> -allOf:
> -  - $ref: serial.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -29,11 +26,32 @@ properties:
>    interrupts:
>      maxItems: 1
>
> -  clocks:
> -    maxItems: 1
> +allOf:
> +  - $ref: serial.yaml#
>
> -  clock-names:
> -    const: sclk
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g011-uart
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: UART functional clock
> +            - description: Optional internal clock to access the registers

It's not optional on r9a09g011, right?

> +        clock-names:
> +          items:
> +            - const: sclk
> +            - const: pclk
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: UART functional clock
> +        clock-names:
> +          items:
> +            - const: sclk
>
>  required:
>    - compatible

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
