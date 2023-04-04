Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9EAB6D5A16
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 09:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbjDDH4c convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 03:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbjDDH4b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 03:56:31 -0400
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163D71BC7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 00:56:30 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id d3so9747031ybu.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 00:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680594989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oAvQYTMCobKXZ71QiZx6ptLuXV9tsLlTXZV8VKgE9M=;
        b=NG7IlWPK89ENNscg3jHI5m9GHkkiyqJ3VfKlpY07WCfM1Q48h7P4vprNgTw/VuMvKz
         YlpITiY3iXOG6NxbXV0SFduURtJSxHm7XB0maaBsdfxZhB2p5ECzvFYlLYj4a1yzCO8z
         c8NvZzdsPdiI1vgo3m5gpMtYVeYdwRlxtSS3JmKPZRhKLMVU+DUX+ccwgZfbcUSxbzmp
         N2XiALMrHlXlqrhLgohRriNm/+XwLuGlx49wWItRTwcd6wMZ8+qWc2Dm2XwX5mhQ6mKt
         pTOUKrOr+/0F52bQx1xtV2eiQSc15oV8fQGKWYlnyuWOQofkgCVg8ju2pZccAuDGC8cm
         8qNg==
X-Gm-Message-State: AAQBX9ek78ghNtCA3ijoQuFvuUAt0XciCAUMQmNhFZb0nC1N7pzU1jLn
        D0uNEn/n3HYucJdUaaahDqEUY+4C2GoU9g==
X-Google-Smtp-Source: AKy350araO+toqsT9A5Uow8FEnRb2ru/cX8n44uzQXmM3kVbd2gs7dlBnFqe9Gr/MWlv2WiIHbY2Fg==
X-Received: by 2002:a25:ad8b:0:b0:b76:2ba:e2ad with SMTP id z11-20020a25ad8b000000b00b7602bae2admr2197790ybi.5.1680594988811;
        Tue, 04 Apr 2023 00:56:28 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id g7-20020a25a487000000b00b7767ca748esm3129089ybi.43.2023.04.04.00.56.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:56:28 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-54606036bb3so433183337b3.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 00:56:28 -0700 (PDT)
X-Received: by 2002:a81:4054:0:b0:52f:184a:da09 with SMTP id
 m20-20020a814054000000b0052f184ada09mr1073974ywn.2.1680594988205; Tue, 04 Apr
 2023 00:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
 <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com>
 <TYBPR01MB5341A3746DE45EE185E546E2D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdWDjVr3udYAkV=FigSVd1JYN4JR=CmhUUPHPp-PbqFpqQ@mail.gmail.com> <TYBPR01MB5341EAD6E8FD50D88DED9420D8939@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341EAD6E8FD50D88DED9420D8939@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Apr 2023 09:56:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkWUPyVhmvq1zfXPN0dqU3kkRuKAuNX_c+BZBp1H1Y6g@mail.gmail.com>
Message-ID: <CAMuHMdXkWUPyVhmvq1zfXPN0dqU3kkRuKAuNX_c+BZBp1H1Y6g@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Apr 4, 2023 at 9:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, April 4, 2023 4:21 PM
> > On Wed, Jan 25, 2023 at 1:52 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Yoshihiro Shimoda, Sent: Monday, January 23, 2023 10:35 AM
> > > >
> > > > Add IPMMU nodes for r8a779g0.
> > > >
> > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > > > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> >
> > > > +             ipmmu_ir: iommu@eed80000 {
> > > > +                     compatible = "renesas,ipmmu-r8a779g0",
> > > > +                                  "renesas,rcar-gen4-ipmmu-vmsa";
> > > > +                     reg = <0 0xeed80000 0 0x20000>;
> > > > +                     renesas,ipmmu-main = <&ipmmu_mm 3>;
> > > > +                     power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > >
> > > The power-domains should be R8A779G0_PD_A3IR.
> > > So, I'll send v2 patch after we discussed updating dt-bindings of "renesas,ipmmu-main".
> >
> > The binding update is commit b67ab6fb63bbbe6d ("dt-bindings: iommu:
> > renesas, ipmmu-vmsa: Update for R-Car Gen4") in iommu/next.
> >
> > Do you still plan to send a v2, or shall I fix this (+ removal of
> > renesas,ipmmu-main indices) while applying?
>
> I said I will send a v2, but I'm happy if you will fix this while applying.

Thanks, queuing all remaining iommu patches in renesas-devel
for v6.4...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
