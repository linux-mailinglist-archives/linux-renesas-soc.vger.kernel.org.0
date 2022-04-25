Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0B950E151
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 15:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiDYNRs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 09:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiDYNRr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 09:17:47 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACDC36306;
        Mon, 25 Apr 2022 06:14:43 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id ay11so10215418qtb.4;
        Mon, 25 Apr 2022 06:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BGzwlbV/2S8PGs3DIk0Tpv11ogLQNMqAj7H7LWARkds=;
        b=d9v+SWCMjX9os+80r0UkB2m7dXrWG4IsMPhbCuUN8o2kz+bivxO9MV33YRjGa03LSX
         YavELYC+zw7Z6fCaQJI/QV9/47w4isQ35Oo3crrpngzZTe3PMfgYOa9oPe4jiHizQHlF
         GlURguzdE0cMCKX8W0HZ8HlfLzuWKPQKva6C7Xkg+licd3kfJAAjWMQcQDonvVO2It7X
         VWwvHYgAvpwxIMaC8HUdJF0LOSxjdJLXsk32A+HTKxAow1WbgesvGF8lY4AhZDo7oMyK
         8ADYKJj10dc7Xl7YZGmxsOSAM3hTyJTvZsQwUdOTZT5LQTAZH0lVDcCBsnxj3xiHkMIk
         6/Gw==
X-Gm-Message-State: AOAM532LHMvhs0rZVFRF/V/oFaURkmUujD89S051bTjwuQ/AIZCxDPsS
        cT63AIfJJNpGRVs3AUvF0412T1YjFo8JpQ==
X-Google-Smtp-Source: ABdhPJw/j7XtIejTjfsjML0vad9CC5jYGaFGAcelhi9fjhgDf/D2ycYxCM6oSQwJymbIpFV1AmWOTg==
X-Received: by 2002:a05:622a:454:b0:2f3:642e:6be2 with SMTP id o20-20020a05622a045400b002f3642e6be2mr5624669qtx.563.1650892482407;
        Mon, 25 Apr 2022 06:14:42 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id c13-20020a37e10d000000b0069c268c37f1sm4918969qkm.23.2022.04.25.06.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:14:42 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id r189so26961076ybr.6;
        Mon, 25 Apr 2022 06:14:41 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr15502127ybp.613.1650892481553; Mon, 25
 Apr 2022 06:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220423134601.141975-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423134601.141975-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 15:14:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzOgSZcw7Lnv=CS+KSa6n58ufM+cdAgDJdNq2+kg-RGg@mail.gmail.com>
Message-ID: <CAMuHMdUzOgSZcw7Lnv=CS+KSa6n58ufM+cdAgDJdNq2+kg-RGg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document
 RZ/G2UL USBPHY Control bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Sat, Apr 23, 2022 at 3:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add device tree binding document for RZ/G2UL USBPHY Control Device.
> RZ/G2UL USBPHY Control Device is identical to one found on the RZ/G2L SoC.
> No driver changes are required as generic compatible string
> "renesas,rzg2l-usbphy-ctrl" will be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
