Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA236F562B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 May 2023 12:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjECK2t convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 May 2023 06:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjECK2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2023 06:28:48 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B3446AB;
        Wed,  3 May 2023 03:28:39 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so2582941276.0;
        Wed, 03 May 2023 03:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683109719; x=1685701719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6mIyoG8owmj6PBUhfaWTHiSZaVdfwfoIHsOejx0Z00=;
        b=TOvRMatXwUIQ0GMAVNY8XY+SZBnvRFiv6iI8H8JAzOaEfNoX6RQGvalqPssJWCDcD+
         L1la2Tc21X6+rE/LorddSeTh5vS5vMt68MUI3P34NqOKpBVsWTCeqcHSNeNEcuJjvMZk
         tfrQEtVppgnvwN5ayuWYzeCuSv/nSB4FWw6NhsvJyvFgBAastX1IMzAPdgEegK45naEG
         FThNxX8a5wQMMJKFrAY+nLH4msuerubnkuMRHdgZxrWGPDDHL9eKlm/9iD4/j+sNh9cb
         YLLqiWXQxQnX19aVnfOEF2DHj5Knl2ipfUOWTncx78ObGX7gXzpDiGEVE0qRo824G8gh
         42hw==
X-Gm-Message-State: AC+VfDxBv7ie4lXmsLIpAK8Sm1WHCFWvh2MJtJrSPId57tmExT+AIvD5
        g07JVnhZ+UsAAHEqSvFoT06IvZH5N5yckg==
X-Google-Smtp-Source: ACHHUZ4lK68Ty3KziDB3kymXv5iCONHmQgqkheNFU2//8ASrIptEujm98cBoxPKufhIiBFREiTSGvg==
X-Received: by 2002:a25:fc18:0:b0:b9f:fcc6:b491 with SMTP id v24-20020a25fc18000000b00b9ffcc6b491mr1758683ybd.11.1683109718785;
        Wed, 03 May 2023 03:28:38 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id z12-20020a5b020c000000b00b7767ca7485sm7211225ybl.34.2023.05.03.03.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 03:28:38 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so2500522276.1;
        Wed, 03 May 2023 03:28:38 -0700 (PDT)
X-Received: by 2002:a81:6c8f:0:b0:54e:ac2b:8a8c with SMTP id
 h137-20020a816c8f000000b0054eac2b8a8cmr1410672ywc.24.1683109718110; Wed, 03
 May 2023 03:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230425155237.357592-1-biju.das.jz@bp.renesas.com> <20230425155237.357592-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230425155237.357592-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 12:28:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUs=F3ePP1P5OTbf9cut1wrbov=YEsyZEnKToBaFK0qNA@mail.gmail.com>
Message-ID: <CAMuHMdUs=F3ePP1P5OTbf9cut1wrbov=YEsyZEnKToBaFK0qNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add gpu cooling device
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
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

On Tue, Apr 25, 2023 at 5:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add gpu cooling device for passive control.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -970,6 +970,7 @@ gpu: gpu@11840000 {
>                                  <&cpg R9A07G044_GPU_ACE_RESETN>;
>                         reset-names = "rst", "axi_rst", "ace_rst";
>                         operating-points-v2 = <&gpu_opp_table>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 gic: interrupt-controller@11900000 {
> @@ -1245,6 +1246,11 @@ map0 {
>                                         cooling-device = <&cpu0 0 2>;
>                                         contribution = <1024>;
>                                 };
> +
> +                               map1 {
> +                                       trip = <&target>;
> +                                       cooling-device = <&gpu 0 2>;

Perhaps this needs a "contribution" property, as the CPU device in
the same zone has one?

> +                               };
>                         };
>
>                         trips {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
