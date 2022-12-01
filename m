Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803E663EC8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 10:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiLAJbW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 04:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiLAJbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:31:00 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3015AE34;
        Thu,  1 Dec 2022 01:30:34 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id fz10so611376qtb.3;
        Thu, 01 Dec 2022 01:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRkzbc31tdDK9zVTeT0OUXHL/8tO8QE6rgpKYPNbR3Y=;
        b=6ECF71QlVP+f4MS0pCmH256jT46xtOL37ySpAV52037F8X8t3Qz1rrMRqSFNBp4I8e
         L6sVoEBPx8qXE6LYZAGWvmQCXD+xPZOphicL6r17dKqiq+/RWRLy1Qf56DikA24XTvhw
         VbmnQpMHtoGpPiW5BITDFuYboOHHloD91/YaJVgWJSWhy45IiDkl6EuhcX5EoUltMG3D
         S1x0CBkAHCCtdIoDCxI0M6w9trJ3wxElnPtQQFJ2wBVWIikE5xzXupjGrdfcJbAjCAZq
         yMkWj2znqRkWZcAWvm4MlzcH6BD44t3bemQbU3RlBqA/VellUaMWwbUB9fk9XnKmlwIP
         HL7Q==
X-Gm-Message-State: ANoB5pnGsKl0D1rg4uA2ht5bh7t/Pw8AENXYp4sjda8VP3rDBG5DvN6m
        ODryRo5s0S03vu5T+VQb8iu1lZXu3RC+Hg==
X-Google-Smtp-Source: AA0mqf6nq0zggLdmdEIfDLQ5cgPs4r7QU81u3qhmKCgYKr3HC+/fAF17JacONEgRPGUCd8BGfpXCOQ==
X-Received: by 2002:a05:622a:4d0f:b0:3a5:25d4:2f2c with SMTP id fd15-20020a05622a4d0f00b003a525d42f2cmr44107059qtb.112.1669887033444;
        Thu, 01 Dec 2022 01:30:33 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id y8-20020ac81288000000b0039c37a7914csm2236328qti.23.2022.12.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 01:30:32 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3c090251d59so11261867b3.4;
        Thu, 01 Dec 2022 01:30:32 -0800 (PST)
X-Received: by 2002:a05:690c:b81:b0:37e:6806:a5f9 with SMTP id
 ck1-20020a05690c0b8100b0037e6806a5f9mr45762738ywb.47.1669887031924; Thu, 01
 Dec 2022 01:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com> <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y30pHOylptuMxFgX@pendragon.ideasonboard.com> <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
 <OS0PR01MB59227AF03E84568B443C053286149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59227AF03E84568B443C053286149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Dec 2022 10:30:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXL1pN6mhpYctsS+Kc8HUe=HCTn3yTxgmujOMNyxGBm8w@mail.gmail.com>
Message-ID: <CAMuHMdXL1pN6mhpYctsS+Kc8HUe=HCTn3yTxgmujOMNyxGBm8w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Dec 1, 2022 at 10:20 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
> > carrier board
> > On Tue, Nov 22, 2022 at 8:55 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > On Tue, Nov 22, 2022 at 07:41:13PM +0000, Biju Das wrote:
> > > > > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable
> > > > > ADV7535 on carrier board On Tue, Nov 22, 2022 at 06:58:02PM +0000,
> > > > > Biju Das wrote:
> > > > > > Enable ADV7535 (MIPI DSI Receiver with HDMI Transmitter) on
> > > > > > RZ/G2L SMARC EVK.
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > > > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi

> > > > > > +
> > > > > > +         ports {
> > > > > > +                 #address-cells = <1>;
> > > > > > +                 #size-cells = <0>;
> > > > > > +
> > > > >
> > > > > How about port@0 ? That's the DSI input, I expect it should be
> > > > > connected to the DSI encoder output.
> > > >
> > > > Yes, I will enable DSI node and link with port@0.  Since both RZ/G2L
> > > > and RZ/V2L uses same Carrier board, I need to send binding patch for
> > RZ/V2L.
> > > >
> > > > dts Patches for enabling DSI for RZ/G2L ready. But V2L there is
> > dependency on bindings.
> >
> > That's just a matter of days, right?
>
> Yes, I have already posted the patch [1]
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122195413.1882486-1-biju.das.jz@bp.renesas.com/
>
> >
> > > > If you prefer both ports together, then I can defer this later.
> > >
> > > It could be easier to review (not to mention testing). I'll let Geert
> > > decide.
> >
> > Is there any advantage in applying this patch now, i.e. does it enable
> > any working functionality?
>
> Currently all display/graphics functionality tested with [3]
>
> The advantage is,
>
> 1) I would like to backport graphics and display functionality to cip kernel [2]
>    as most of our customers are using this kernel.
>
> 2) we can test ADV driver using i2c read/write command
>
> 3) We can test ADV interrupts
>
> 4) This will reduce integration effort as we can test full display and graphics
>   functionality with [3]
>
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/log/?h=linux-5.10.y-cip
> [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=698606
>
> Please share your views.

And all of that is working without port@0?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
