Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D026748203
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 12:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbjGEKWR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 06:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbjGEKWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 06:22:12 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9C3E4B;
        Wed,  5 Jul 2023 03:22:10 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-57688a146ecso76339227b3.2;
        Wed, 05 Jul 2023 03:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688552530; x=1691144530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVqNo9NfD1BhNNHR2l1XSvA0LBsrjzlbrFggZjhXXwI=;
        b=kFcipCUGmnXWxtT677Sn4UqFXZqDWKykhXF0rS2eqhw9fGuNpEr7mYHyCh2x/Aqqv1
         fmoPwYCy9Gd6VfyVwyxFitDuOkakVSqc+HEhmhk/mAv01W1xFjpnjTFuO3cldh0NCGjm
         Gtrv6/hJkwCe3Zsp2nd8rBn+5ahr1v4fBDGDEh1+GAl1yR/0oaEVNUSn/mPzJJFmUBQI
         /2RlR5edmqmJtsglBsi1v6j+rT0KAW85P8cXp9ZoR8lqojtmvmbIG7U7u4lEr21ksVz/
         ctduPn0yMm86RKFW54GPb3cTrnISZKG8UBIm7hK2Bi0wrmanHGvM1xN5eR3k2No83iOz
         gJEQ==
X-Gm-Message-State: ABy/qLbb/ZgJAwRFvUM7d+FiSUKs50gUIq2FYDEztt9CKdsQUceSlZ7z
        DjBgUL5mqHccOLf+j25Bobx4prO3EVYF/Q==
X-Google-Smtp-Source: APBJJlEogiROXLlbBgCSr3kd1R+iNClQbD3ZxyRmt7SA6OsmXk3FInMu05ObBtxMG1wZBjLmfGhcOA==
X-Received: by 2002:a0d:df51:0:b0:578:1937:868b with SMTP id i78-20020a0ddf51000000b005781937868bmr12418489ywe.11.1688552529946;
        Wed, 05 Jul 2023 03:22:09 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id g72-20020a81524b000000b005772f3fc0acsm3382092ywb.44.2023.07.05.03.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 03:22:09 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-c5ce57836b8so1901076276.1;
        Wed, 05 Jul 2023 03:22:09 -0700 (PDT)
X-Received: by 2002:a25:4605:0:b0:bab:d9b1:ad63 with SMTP id
 t5-20020a254605000000b00babd9b1ad63mr13755928yba.38.1688552529475; Wed, 05
 Jul 2023 03:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230623140948.384762-1-biju.das.jz@bp.renesas.com> <20230623140948.384762-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230623140948.384762-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 12:21:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-LU_rafAU8TJggBNC4UYbrn3HTg9iKmHDJYmB3EEpcg@mail.gmail.com>
Message-ID: <CAMuHMdX-LU_rafAU8TJggBNC4UYbrn3HTg9iKmHDJYmB3EEpcg@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] arm64: dts: renesas: rzg2l-smarc-som: Enable
 PMIC and built-in RTC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 23, 2023 at 4:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable PMIC RAA215300 and the built-in RTC on the RZ/{G2L,V2L} SMARC
> EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:
>  * No change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
