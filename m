Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C46C517526
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 18:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240470AbiEBQ4z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 12:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236543AbiEBQ4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 12:56:54 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3FB6245;
        Mon,  2 May 2022 09:53:25 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id kd11so10601469qvb.2;
        Mon, 02 May 2022 09:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZaiBLtcAlhidvtdNMc3W6SDQ30mbyneLJBcFUcG3GU=;
        b=7381Wkw4b/VcmzyYeRrik+Nl0u0XfkatPis9zgLbR0xksKkIenxcsA+EUtQIe3VJ3S
         oGkcp48nmWjz8dC5UsWDQ2B3RvjDDmvCckUi+4lAHFiO3DCeiZinLSLnub1inR4Nexls
         RReSGyxSCLQp9MrafYiN3Ng6jjzkkhaUzhnuuP0sdPNzCv/JIXvKgvWQWy2Z3ZXd42ub
         g2ndO3++dEKMa9ByOuiU4Vy5k/2OfhAMXFitpFgVaINPgBmyKFP77kuKxnCd06tUqIZd
         BwFR8t71Ur19UwlGH16n7fk+2wXmpSYjrHMid53agqqLRQ4G8Ycz0jg+C7MYwEEyX1zW
         Nq7w==
X-Gm-Message-State: AOAM530zMg540F4d/97WSIIaWV3/YQ1KGYKbKX9elL/whV/bISS5BdWg
        rLIVZtfI6WsBsRCAOk14RTlTU0VOf6HhBw==
X-Google-Smtp-Source: ABdhPJxomT1YE3iFVdjNkVgre0QnOhzuhpmW0uv3LWLBGMgq6lKyxX5XIx+zJUtkONbBHp4KHn2ceg==
X-Received: by 2002:a05:6214:5197:b0:458:32f4:d77d with SMTP id kl23-20020a056214519700b0045832f4d77dmr10489535qvb.76.1651510404600;
        Mon, 02 May 2022 09:53:24 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 18-20020a370a12000000b0069fc13ce1f7sm4660074qkk.40.2022.05.02.09.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:53:24 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2f7b815ac06so154465947b3.3;
        Mon, 02 May 2022 09:53:23 -0700 (PDT)
X-Received: by 2002:a05:690c:84:b0:2f1:9caa:e4f7 with SMTP id
 be4-20020a05690c008400b002f19caae4f7mr12588562ywb.384.1651510403709; Mon, 02
 May 2022 09:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
 <20220501112926.47024-2-biju.das.jz@bp.renesas.com> <CAMuHMdV1fO4EuV2n-iQ1jYmX9Fz5B6nX8oYMfduVHSEPAKG+dg@mail.gmail.com>
 <OS0PR01MB59221F1878FED409ACBE21B786C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221F1878FED409ACBE21B786C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 18:53:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-SzUUV=yT6SGQipvr8kT9_SGk=-3Dd+L+uQdZYab3Wg@mail.gmail.com>
Message-ID: <CAMuHMdW-SzUUV=yT6SGQipvr8kT9_SGk=-3Dd+L+uQdZYab3Wg@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus
 controller node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, May 2, 2022 at 6:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/6] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O
> > Bus controller node
> > On Sun, May 1, 2022 at 1:29 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add SPI Multi I/O Bus controller node to R9A07G043 (RZ/G2UL) SoC DTSI.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > > @@ -418,12 +418,20 @@ adc: adc@10059000 {
> > >                 };
> > >
> > >                 sbc: spi@10060000 {
> > > +                       compatible = "renesas,r9a07g043-rpc-if",
> > > +                                    "renesas,rzg2l-rpc-if";
> > >                         reg = <0 0x10060000 0 0x10000>,
> > >                               <0 0x20000000 0 0x10000000>,
> > >                               <0 0x10070000 0 0x10000>;
> > > +                       reg-names = "regs", "dirmap", "wbuf";
> > > +                       interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> >
> > LGTM, but this interrupt is not documented in the RZ/G2UL Hardware User's
> > Manual (Rev. 0.51 and 1.00)?
>
> You are correct. As per Table25.1 and Table 8.2, QSPI_INT# is not available on
> RZ/G2UL.
>
> Will Fix this in next version. Maybe we need to make interrupt as optional in bindings with driver changes?

It's already optional, and the driver doesn't seem to use it at all.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
