Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACA84CB9CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 10:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbiCCJHI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 04:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCCJHI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 04:07:08 -0500
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65683177740;
        Thu,  3 Mar 2022 01:06:23 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id j9so2311939vkj.1;
        Thu, 03 Mar 2022 01:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+NJDbVREqdyCxGBPumFhSuwq1h7B0CoOOwlNMfb2FXU=;
        b=d0QQZk+yxbzZdSjqCH8umnZlXsQNGQ/1ZA6kpid0bVAkmdpushrzPlrwuy1sQVh2G+
         f+Yhlp9urh1fSfongsRe4vlm0eANeWKgxQvsRinqiTxe2MJu47BaaFQrY3jzoXX5bWYf
         z8Z4zszhOCoKuLTYInJCrzG4QcGaWshBluzgB1gbh61P1JJvswIdFx538LJW6YnNe8se
         jvTKIH9zkA4TzcrgD1AvuM4uKorzJu1VdxYszs+ie6q/w/9oCxZElkyzIJbKT1g3h7AK
         5K5N6jKmiXD2PCI6n6o78dgWOh0yokmh3VhD145zLo+4ZI1Z3AKy6W7WeJjLzGtYdyTL
         gqyA==
X-Gm-Message-State: AOAM533/BfzHLFGL/HQ6NWDttsAJWYdb5QkwucASjYe3XsNndtMBKk6R
        hrTjaKeSi/SWjru2+zF2KjCbONaYd3caaQ==
X-Google-Smtp-Source: ABdhPJzut7n8yprHXvd8vy6MDr3CCn06bb8iEwVfQhriklEeCUjYwUb/RTFICh8wC4sJZRPx21WUQQ==
X-Received: by 2002:ac5:c748:0:b0:32c:c22d:35e8 with SMTP id b8-20020ac5c748000000b0032cc22d35e8mr13698811vkn.24.1646298382410;
        Thu, 03 Mar 2022 01:06:22 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id g27-20020ab04e1b000000b0034a4433fe70sm243628uah.18.2022.03.03.01.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 01:06:22 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id y26so4766657vsq.8;
        Thu, 03 Mar 2022 01:06:21 -0800 (PST)
X-Received: by 2002:a67:c499:0:b0:320:2cd8:9e1a with SMTP id
 d25-20020a67c499000000b003202cd89e1amr2343689vsk.38.1646298381688; Thu, 03
 Mar 2022 01:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com> <20220303085934.29792-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303085934.29792-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Mar 2022 10:06:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUD_jsZCh95O290y1OTz7Y9gHAcVZ6=Nm=k=1fAqPQJVw@mail.gmail.com>
Message-ID: <CAMuHMdUD_jsZCh95O290y1OTz7Y9gHAcVZ6=Nm=k=1fAqPQJVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update compatible
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
> "renesas,r9a07g043u-sci" for RZ/G2UL SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> @@ -17,7 +17,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - renesas,r9a07g043-sci     # RZ/G2UL
> +              - renesas,r9a07g043u-sci    # RZ/G2UL

Is this really needed? As far as we know, RZ/Five and RZ/G2UL
do use the same I/O blocks?

>                - renesas,r9a07g044-sci     # RZ/G2{L,LC}
>                - renesas,r9a07g054-sci     # RZ/V2L
>            - const: renesas,sci            # generic SCI compatible UART

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
