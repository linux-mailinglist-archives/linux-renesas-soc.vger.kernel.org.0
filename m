Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE16D50E12E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 15:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiDYNMp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 09:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237381AbiDYNMi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 09:12:38 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EC0286FC;
        Mon, 25 Apr 2022 06:09:35 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id q75so10674387qke.6;
        Mon, 25 Apr 2022 06:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sxCUF2M6b0hEeHOTQpU343kUGZScZ3hHNFrtcrdrsGo=;
        b=U5VpiO19l/ho3m7fo77wFRCQtm9hqtzqndDins7tpUIzd3W8gIEjjiKjVF9g0ZLmBN
         LV6M51+/7t9PsUj0F1g7o5iDpFDkirHPrmIXTsXlERKLqUgqMmwExmqbz8TvFJoD/8N3
         dcbrbVKtf/ymvvqQAfgXCroxGfj8l6/LSwbo2w8I70Nd99TqlBSexCnNWiNdpMw9JY04
         llWzNrTOyoCq1In4uWYY1hbof0V4F6sF5WORinDHZFnf8YqIkZaBR/qvN7tu3FmN8G5d
         Btpnni9GPtJBupK/7iPVnmtteNC/McFfubWHxSsOE+FHRiGiE2xLYxx7tAGju2kq7P+y
         07ZQ==
X-Gm-Message-State: AOAM532DRO6vjXcE7E8QCEzwUe0Au3LCjdoNIXv08mkJznI2bwggEQVy
        2/eeZ9gkU+Cu/mkfgTg12CDHCAFKIYPOcA==
X-Google-Smtp-Source: ABdhPJyqfCNJ+baaq8VvHLxDgoMC0xH/4qNs2F93CbBo/MG/0VAWSzfZ2ZzdH6HPijXBtEVlaZHpcA==
X-Received: by 2002:a05:620a:31a8:b0:69e:abdf:80cd with SMTP id bi40-20020a05620a31a800b0069eabdf80cdmr9953780qkb.685.1650892174153;
        Mon, 25 Apr 2022 06:09:34 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id s136-20020a37a98e000000b0069f0c30c0d3sm4982405qke.21.2022.04.25.06.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:09:33 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f7ca2ce255so47993757b3.7;
        Mon, 25 Apr 2022 06:09:33 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr16564534ywb.438.1650892173446; Mon, 25
 Apr 2022 06:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220423134920.144068-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423134920.144068-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 15:09:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNeVFn-z5TVqaBiBP=qvKQZRQgZV_Qwjg=0Dd33ZZ9eA@mail.gmail.com>
Message-ID: <CAMuHMdXNeVFn-z5TVqaBiBP=qvKQZRQgZV_Qwjg=0Dd33ZZ9eA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usbhs: Document RZ/G2UL bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Biju,

On Sat, Apr 23, 2022 at 3:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2ULSoC bindings. USBHS block is identical to one
> found on RZ/A2 SoC. No driver changes are required as generic compatible
> string "renesas,rza2-usbhs" will be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - renesas,usbhs-r7s9210   # RZ/A2
> +              - renesas,usbhs-r9a07g043 # RZ/G2UL
>                - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
>                - renesas,usbhs-r9a07g054 # RZ/V2L
>            - const: renesas,rza2-usbhs

Please also make the resets property required on RZ/G2UL.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
