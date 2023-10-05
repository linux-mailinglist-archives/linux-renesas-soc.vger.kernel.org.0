Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900757B9E69
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 16:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjJEOFw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 10:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjJEOEK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 10:04:10 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829262572F;
        Thu,  5 Oct 2023 04:55:43 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a1d0fee86aso9792567b3.2;
        Thu, 05 Oct 2023 04:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696506940; x=1697111740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfh44W/W9192NRXUjtg9r/H6uVn53dQXRsrSz8XlQCQ=;
        b=ec/QTW0ftKxQMoypqlbN5hJQzUbrxr6JMqAztg5YN4ARZUaRDOUFaaG5OboFCaA5+v
         lVQfsa5vQzeL3XNbLhs2i+D6VukUKplsEeJIcvh1YMBXZGg8X8L20JHUTi83GRV94mCq
         I0rOQJb8VZPRabT/liVPFvp3dsuf5UFzV3bFtpr3xD47PglFj0k4Ii/ladmbqTbC73++
         Bio24XQwuemw2B/oIyISSRIEhxs23h2/y40LtBTc6y/nHzaAtQsILTorXwcavFWkysAc
         5Aao1eJUxF+u6XViokw5Mhq2S9aYlllkwuwoxEeGA+OAEn/GKTz9vkvNMyCSnM8UDkIW
         FG+A==
X-Gm-Message-State: AOJu0YzvoWpoM+jedWnRpxIP8mDsibNYay1xAlTBAW33KrwQKMeZaVFh
        RCvhvK7QXep/hbV8Z8P3rprMLAcTrr5dJg==
X-Google-Smtp-Source: AGHT+IEGm4x31KdTdpLX23XLA/l+elkcLcUPInSV3IW/nYogW0bhqLyG3r0od3qkBH9xkyODwsZL3Q==
X-Received: by 2002:a81:778b:0:b0:59b:ca2f:6eff with SMTP id s133-20020a81778b000000b0059bca2f6effmr5165133ywc.40.1696506940351;
        Thu, 05 Oct 2023 04:55:40 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id v12-20020a81a54c000000b0059a34cfa2a8sm448652ywg.62.2023.10.05.04.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 04:55:40 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59bebd5bdadso9966737b3.0;
        Thu, 05 Oct 2023 04:55:40 -0700 (PDT)
X-Received: by 2002:a0d:e3c6:0:b0:5a1:635e:e68 with SMTP id
 m189-20020a0de3c6000000b005a1635e0e68mr5446457ywe.46.1696506939824; Thu, 05
 Oct 2023 04:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230825090518.87394-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVEBREj_Y-wQ=fRQu9mnYyCF6Ut7ZhvRkM0N6eWFXp0Qw@mail.gmail.com> <OS0PR01MB592246E77539C513C1A7FCD686E5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592246E77539C513C1A7FCD686E5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 Oct 2023 13:55:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEEshPhaJCsmkTCagTcwv813CdaY1h0ORdoYe5RCTUNw@mail.gmail.com>
Message-ID: <CAMuHMdXEEshPhaJCsmkTCagTcwv813CdaY1h0ORdoYe5RCTUNw@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: renesas: rz-smarc-common: Use versa3 clk
 for audio mclk
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 31, 2023 at 7:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v4] arm64: dts: renesas: rz-smarc-common: Use versa3
> > clk for audio mclk
> > On Fri, Aug 25, 2023 at 11:05 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Currently audio mclk uses a fixed clk of 11.2896MHz (multiple of
> > 44.1kHz).
> > > Replace this fixed clk with the programmable versa3 clk that can
> > > provide the clocking to support both 44.1kHz (with a clock of
> > > 11.2896MHz) and 48kHz (with a clock of 12.2880MHz), based on audio
> > > sampling rate for playback and record.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v3->v4:
> > >  * Dropped clock-output-names from dtsi files.
> > >  * Updated example with dropping clock-output-names.
> >
> > Thanks for the update!
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > @@ -105,6 +105,26 @@ &i2c3 {
> > >
> > >         status = "okay";
> > >
> > > +       versa3: versa3@68 {
> >
> > clock-generator@ (everywhere)
> OK.
>
> >
> > > +               compatible = "renesas,5p35023";
> > > +               reg = <0x68>;
> > > +               #clock-cells = <1>;
> > > +               clocks = <&x1>;
> > > +
> > > +               renesas,settings = [
> > > +                       80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
> > > +                       00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
> > > +                       80 b0 45 c4 95
> > > +               ];
> > > +
> > > +               assigned-clocks = <&versa3 0>, <&versa3 1>,
> > > +                                 <&versa3 2>, <&versa3 3>,
> > > +                                 <&versa3 4>, <&versa3 5>;
> > > +               assigned-clock-rates = <24000000>, <11289600>,
> > > +                                      <11289600>, <12000000>,
> > > +                                      <25000000>, <12288000>;
> > > +       };
> >
> > Please move this node down, to preserve sort order (by unit-address).
> >
> > Same comments arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> >
> > Unless we're gonna need a new iteration for some other reason (the
> > corresponding fixes for the clock index order are not yet in linux-next), I
> > can fix the above while applying...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7, now the driver dependency
is in v6.6-rc4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
