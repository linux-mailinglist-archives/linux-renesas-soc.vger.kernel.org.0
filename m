Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481AE50920E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 23:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355041AbiDTV31 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 17:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345541AbiDTV31 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 17:29:27 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BF54091F;
        Wed, 20 Apr 2022 14:26:39 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id d19so2261481qko.3;
        Wed, 20 Apr 2022 14:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=67nV4gYgeYp7zHEQCPKbVLqOBEjZ5hlguO4lzvnVvxk=;
        b=00E6DmLYkUVqer3UxAKtwNNJZE/p+azhWuZx3oO92KHY+DdbNKK5xvKsee5CUoKW4z
         zs7MrXIjPPRpF6FnhD0sMN2D0yBlQ8L5FXyH6ty7HkaILSSR3jPKrXQCtJQ0Jh86QL4H
         9lwDqc9PySA0X3R4i0xSJ0L5oGYSI2lsHV+lmkTxp+ZqAkMZ6LLwyyrQda5NDYPZdKLi
         bum4CiPYZQRV9a5UYEMnHtpOFCcRtw7RmQ+26/ceWzDnNLs/5A1uuZdPUq7v4uinMWEu
         BwG7eimM/owP69IK19ZrA79VC6j+289+UAaOCfjzASgXTtBtWODqHIFYRiBtshCFSCRr
         Dyog==
X-Gm-Message-State: AOAM530jVqsbz1Z7kBtolvrQ7JogUAojVDYaPKUikt2+cJv1IWofmh9F
        8syDO5ZyL/UqgrzLwlqOqmZpOkUBhb9qnAvN
X-Google-Smtp-Source: ABdhPJyFLYC9SL2qTm+vkq2sxvNCaPUeNiDvnzIF1KHE1cT/RMma1DFX3Wz7apceWWGHgZGMhyDY8g==
X-Received: by 2002:a37:de03:0:b0:67e:4c75:9a07 with SMTP id h3-20020a37de03000000b0067e4c759a07mr14270680qkj.121.1650489998639;
        Wed, 20 Apr 2022 14:26:38 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id y85-20020a376458000000b0069e64801b7dsm2044393qkb.62.2022.04.20.14.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 14:26:38 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2eba37104a2so32987507b3.0;
        Wed, 20 Apr 2022 14:26:37 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr22892623ywi.449.1650489997556; Wed, 20
 Apr 2022 14:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-3-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Apr 2022 23:26:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaiAZNWmU5itJWJy3fEMmR1hQc7QRWpe6mi3AYkSewgw@mail.gmail.com>
Message-ID: <CAMuHMdWaiAZNWmU5itJWJy3fEMmR1hQc7QRWpe6mi3AYkSewgw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: serial: renesas,em-uart: Document
 r9a09g011 bindings
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Wed, Mar 30, 2022 at 5:41 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The Renesas RZ/V2M (r9a09g011) SoC uses a uart that is compatible with the
> EMMA Mobile SoC.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2: Fix dtbs_check by adding missing alternative binding

Thanks for your patch, which is now commit 7bb301812b628099
("dt-bindings: serial: renesas,em-uart: Document r9a09g011
bindings") in tty/tty-next.

> --- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> @@ -14,7 +14,14 @@ allOf:
>
>  properties:
>    compatible:
> -    const: renesas,em-uart
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-uart    # RZ/V2M
> +          - const: renesas,em-uart        # generic EMMA Mobile compatible UART
> +
> +      - items:
> +          - const: renesas,em-uart        # generic EMMA Mobile compatible UART

The above looks good to me.

>
>    reg:
>      maxItems: 1

However, unlike EMEV2, RZ/V2M defines two clocks: pclk and sclk.
Hence please update the clocks section to reflect that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
