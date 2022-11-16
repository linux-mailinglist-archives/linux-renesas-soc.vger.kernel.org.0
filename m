Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75B9F62B4EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 09:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbiKPIUc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 03:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233230AbiKPIUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 03:20:19 -0500
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42423266C;
        Wed, 16 Nov 2022 00:20:17 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id d7so8762547qkk.3;
        Wed, 16 Nov 2022 00:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpNV/keBaXqaNpZhY/+e1TqwmQLarEqHOjxiEedGqUQ=;
        b=7imilWnOB+g/pd1sqVFxYu/c93uUMY/5JA5HyAcB3FM8Kjmz/bEtF0A4h7gQklNG5M
         X5ca/WSiQ/8uzWXvd2yA2S1vNyqcT74eCL/JA28nnIiiHIdpmkPkKUJ5HVBNLbkOCCfV
         UteDvvEDjb+mfntWvpXO9LkKoQxkaRQb4cHoiwq3jTBRkNE/V1+ZO9d4Fr0LRQBDX/v3
         GcNMb+wvT/Q5+wOHD1Jj0rpfL2+XPxUqgMOe1Elv8oY5xGrWUyo69UTtUZbNMuEAezdM
         Xi9zap5W425VZvULQQvZ8fiKjSgDUtAZz34S9wCZu8P2lI5MofRSxnbDC5SiC2+Euhg9
         6FSw==
X-Gm-Message-State: ANoB5pl3W8Hb1/qz53di0GPCi6KqHHdLASdcd3MvzAQ1IxkNxSCG2HWj
        aXiBVlocMNLUrTh97dUUMyKtMsZjgxOY6w==
X-Google-Smtp-Source: AA0mqf4R1L4Z3YJp4b7RYt89GQNMLUIqGMHqcRMGjT1vsosimw2xSZ+JRV0TxNVU8wrpYJe87TsIig==
X-Received: by 2002:a37:5d8:0:b0:6fb:8036:25ea with SMTP id 207-20020a3705d8000000b006fb803625eamr10518889qkf.246.1668586816125;
        Wed, 16 Nov 2022 00:20:16 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id s4-20020ac87584000000b003a5092ed8cdsm8463911qtq.9.2022.11.16.00.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:20:15 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id e68so17249487ybh.2;
        Wed, 16 Nov 2022 00:20:15 -0800 (PST)
X-Received: by 2002:a25:cb4a:0:b0:6dd:b521:a8f2 with SMTP id
 b71-20020a25cb4a000000b006ddb521a8f2mr19781076ybg.380.1668586815236; Wed, 16
 Nov 2022 00:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com> <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org> <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org> <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org> <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
 <OS0PR01MB59220BB367224A4215365F0E86059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV3K9kSvp3_7L+v9Lw2rUPzXS-Ocd=9k4pQQYioCdGoyQ@mail.gmail.com> <OS0PR01MB59227B0B3BC90248373E062986079@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59227B0B3BC90248373E062986079@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Nov 2022 09:20:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0iH9KMOhT_jFk_ZmjTObOyzfw3ZnYP75X4JPLBoPc-g@mail.gmail.com>
Message-ID: <CAMuHMdX0iH9KMOhT_jFk_ZmjTObOyzfw3ZnYP75X4JPLBoPc-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Nov 16, 2022 at 9:14 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
> > RZ/V2M System Configuration
> > On Mon, Nov 14, 2022 at 8:22 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document
> > > > Renesas RZ/V2M System Configuration On Mon, Nov 14, 2022 at 6:05 PM
> > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> On
> > > > > > 14/11/2022 17:44, Biju Das wrote:
> > > > > > >>>>> If the hardware manual said this is called "foo-whatever-
> > name"
> > > > > > >>>>> or "rz85736dfnx2", you would use it as well?
> > > > > > >>>>>
> > > > > > >>>>> Node names should be generic.
> > > > > > >>>
> > > > > > >>> I got the following feedback from LSI team.
> > > > > > >>>
> > > > > > >>> *The reason why we use "configuration" and not "controller"
> > > > > > >>> is the possibility that users might take it to mean
> > > > > > >>> "control" of system operation (product operation). This unit
> > > > > > >>> determines how the whole LSI
> > > > > > >> configure to operate LSI, so we use "configuration" for this
> > IP name.
> > > > > > >>>
> > > > > > >>> As per this it is not a controller. It is a Configuration
> > IP.
> > > > > > >>>
> > > > > > >>> What should be generic node name for system configuration
> > IP?
> > > > > > >>
> > > > > > >> Then it's closer to chipid and should be in hwinfo?
> > > > > > >
> > > > > > > You mean, sys: hwinfo@a3f03000 instead of sys: system-
> > > > > > configuration@a3f03000 ??
> > > > > >
> > > > > > Rather be put in hwinfo directory. Typical name is "chipid", but
> > > > > > I don't know if your device is a chipid.
> > > > >
> > > > > This IP is for sure not a chipid. We can detect SoC version. That
> > > > > is one of the functions provided by this IP.
> > > > >
> > > > > > > Also the same IP block is present on rz/v2ma as well?
> > > > > > >
> > > > > > > Shall I use the same file renesas,rzv2m-sys.yaml for both
> > > > > > > r9a09g011-sys and
> > > > > > r9a09g055-sys?
> > > >
> > > > Are they sufficiently similar? E.g. we have renesas,rst.yaml for the
> > > > various R-Car reset controllers, which have different register
> > layouts.
> > >
> > > I have been told both RZ/V2M and RZ/V2MA are exactly same, but later
> > does not have ISP module.
> >
> > OK...
> >
> > > > If the SoC version register is located at the same offset, it might
> > > > be worthwhile to add a family-specific compatible value, too, so the
> > > > soc_device driver doesn't have to contain a big list to match
> > against.
> > >
> > > The SoC version registers are located at the same offset.
> > > But there is no way to distinguish both the SoCs.
> >
> > So they really are the same SoC, with the ISP disabled (by fuses?).
> >
> > Then I guess the most sensible thing to do is to just use
> >
> >     compatible = "renesas,r9a09g055", "renesas,r9a09g011"
> >
> > at the top level, and keep all other compatible values unchanged?
> > Cfr. what we did for R-Car Gen3e (r8a779mX).
>
> I started looking into PWM driver for V2M. For Linux we can use 7 channels
> Out of 16 as other 9 channels are reserved for ISP.  Where as V2MA we can use all the 16 channels.
>
> So for clk, we need to use separate compatible, as we don't want to register clocks
> assigned for ISP to Linux.
>
> That is ok right??

Yes, that's fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
