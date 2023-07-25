Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390AE760F5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jul 2023 11:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbjGYJfw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 05:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbjGYJf2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 05:35:28 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF93E7;
        Tue, 25 Jul 2023 02:34:09 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-57a551ce7e9so65765367b3.3;
        Tue, 25 Jul 2023 02:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690277648; x=1690882448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg4EyG3YuV1sOQVVfFzZXbTlPDHwFPQhatLbKXpKXzA=;
        b=NuHZZkX7dEPcjzaL7BQGAw3EX8jUczB2ux9lrvNQO3QmDNy+f3ohF2pWJa78ZH7l9D
         IJVn/Liws1EW1M2W9NNvMBPmMJD7e7t1Ys5ionng3U8BnO8EVNboMiz1qIM0dFP1poZC
         63nMd3Afxp4hxicnteEozDe4ZAuquF8RoymRFXHp9y8Z2hBpqlGYp/gVLhsx9OqJ3bul
         NTASUSTAViXF+SvuelEy/vLRJtzr2q+IN//4CbdAuGWMY3NTJ/vtNBwHHJjS66a54efK
         +Bnm26pV2KwnLdRf/sOfatpEPD9w5GvDLEa4401i+/JecSwz8CV+BgbCOFtrEJdcBwDQ
         FXpQ==
X-Gm-Message-State: ABy/qLZXYDc/gXlfojrtePLeZOhfEFDPJnYToATLOr6W24ZIoL42d0uj
        suHYzmqRUS7TSlrUEuLqFpOc8819NcfEAvMh
X-Google-Smtp-Source: APBJJlEqjC/i8n7mf/5YnSRoYHWpMkDZnxMOKi91+yFeZM+6RA5VlxeUt+JuIsT8fc1XZZzEZJsPGQ==
X-Received: by 2002:a81:88c6:0:b0:579:ed5f:5cd3 with SMTP id y189-20020a8188c6000000b00579ed5f5cd3mr10418047ywf.23.1690277648497;
        Tue, 25 Jul 2023 02:34:08 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id k184-20020a0dfac1000000b005838c619a08sm3131161ywf.111.2023.07.25.02.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 02:34:08 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-cb19b1b9a36so5912149276.0;
        Tue, 25 Jul 2023 02:34:08 -0700 (PDT)
X-Received: by 2002:a25:aba7:0:b0:d10:17c9:2f0d with SMTP id
 v36-20020a25aba7000000b00d1017c92f0dmr5042492ybi.2.1690277647868; Tue, 25 Jul
 2023 02:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230724091927.123847-1-biju.das.jz@bp.renesas.com>
 <20230724091927.123847-5-biju.das.jz@bp.renesas.com> <CAMuHMdUoPugUVtPwrPEvKXjOOU-Bq=-tDbCtFFT3Ryh6B8O+pg@mail.gmail.com>
 <OS0PR01MB5922DEEC8C64ECBD00F7605D8603A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922DEEC8C64ECBD00F7605D8603A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jul 2023 11:33:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf9H5yN0g-2OeH=m=S6VNiTJCLj77XAaHY-r-_tw_P=A@mail.gmail.com>
Message-ID: <CAMuHMdUf9H5yN0g-2OeH=m=S6VNiTJCLj77XAaHY-r-_tw_P=A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: renesas: r9a07g044: Update
 overfow/underflow IRQ names for MTU3 channels
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "stable@kernel.org" <stable@kernel.org>
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

On Tue, Jul 25, 2023 at 11:14 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > On Mon, Jul 24, 2023 at 11:19 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > As per R01UH0914EJ0130 Rev.1.30 HW manual the MTU3 overflow/underflow
> > > interrupt names starts with 'tci' instead of 'tgi'.
> > >
> > > Replace the below overflow/underflow interrupt names:
> > >  - tgiv0->tciv0
> > >  - tgiv1->tciv1
> > >  - tgiu1->tciu1
> > >  - tgiv2->tciv2
> > >  - tgiu2->tciu2
> > >  - tgiv3->tciv3
> > >  - tgiv4->tciv4
> > >  - tgiv6->tciv6
> > >  - tgiv7->tciv7
> > >  - tgiv8->tciv8
> > >  - tgiu8->tciu8
> > >
> > > Fixes: 26336d66d021 ("arm64: dts: renesas: r9a07g044: Add MTU3a node")
> > > Fixes: dd123dd01def ("arm64: dts: renesas: r9a07g054: Add MTU3a node")

> > While SPI 213 is documented to be used for TCIU8, the actual MTU3a
> > documentation does not mention this interrupt.
>
> Current change is fine.
> HW manual team is going to correct Table16.78 in Chapter 16 MTU3a.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue as a fix for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
