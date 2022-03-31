Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 161244EDAE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 15:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237064AbiCaNvm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 09:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237043AbiCaNvf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 09:51:35 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2281275DA;
        Thu, 31 Mar 2022 06:49:47 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id t19so21431493qtc.4;
        Thu, 31 Mar 2022 06:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HZyiCBkkM2Ze6R2JjxEo9dQJhfbwUCcXHcL4NICnY2s=;
        b=h54BgAjLuXaQldmwAOVO1UyXjidE0LzcJyD1l08btAiOF5+Gq1A0/Wiec2nsFSXvmx
         5ToNtXJtNPuhnHVNBfey7rWiVxZep7rSXw+SgeUpBp/On+dasA9mHRFJgVSag/KEvra7
         ZTjWsCFYg8D9VugBs2TEjg2FwKdbEjoxChsTrOYGEYpXkIIIJD9LvE7aHQUK7e13FZvN
         3ozgPSrQcjA7sCcuEC9sJCeMq0kDQtyF2pCx1jDZ37IIPogNUeS46aoHNhLs4gVFwn5N
         kLM6qXSd8BIdCtBkzelwPiZRvWhTyiH72CGwkmw9QREv1eTiXCo/+84q2fHbyuRDgXT+
         oPtg==
X-Gm-Message-State: AOAM5302Dq35HxjQOmzNFB4LWduLDHfMTKUZy++20B9Xbdp76PC4AOur
        rQKFmPovv1bmFoLAB3umTGfWdm1cNYgFHQ==
X-Google-Smtp-Source: ABdhPJxAk+dvmxDULvhw/cjadsKF+Q6mUHivDebFsAh/gNsJfjWfA0ui4fGOlDPsh03VboXxrHY8uA==
X-Received: by 2002:a05:622a:1aaa:b0:2e1:a40d:8253 with SMTP id s42-20020a05622a1aaa00b002e1a40d8253mr4288120qtc.135.1648734586289;
        Thu, 31 Mar 2022 06:49:46 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 11-20020ac8590b000000b002e1e5c5c866sm20591458qty.42.2022.03.31.06.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 06:49:46 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id m67so42401445ybm.4;
        Thu, 31 Mar 2022 06:49:45 -0700 (PDT)
X-Received: by 2002:a05:6902:1146:b0:634:6b3f:4908 with SMTP id
 p6-20020a056902114600b006346b3f4908mr4102824ybu.613.1648734584828; Thu, 31
 Mar 2022 06:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com>
 <20220315155919.23451-6-biju.das.jz@bp.renesas.com> <CAMuHMdUPfMMK2Mv0ffQcYVitpOLv5Y4iB-eVPa1u=nYXF5o7mw@mail.gmail.com>
 <OS0PR01MB5922002E2AABB44A6A679F2286E19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922002E2AABB44A6A679F2286E19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 15:49:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjrvoCe-11GRz68+a-n=Knw6qnsJUSqEwv0Uxt2WZ_7A@mail.gmail.com>
Message-ID: <CAMuHMdXjrvoCe-11GRz68+a-n=Knw6qnsJUSqEwv0Uxt2WZ_7A@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD on
 SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Mar 31, 2022 at 3:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD
> > on SMARC platform
> > On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Enable the microSD card slot connected to SDHI1 on the RZ/G2UL SMARC
> > > platform by removing the sdhi1 override which disabled it, and by
> > > adding the necessary pinmux required for SDHI1.
> > >
> > > This patch also overrides vqmmc-supply for SDHI1.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> > > @@ -0,0 +1,27 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Device Tree Source for the RZ/G2UL Type-1 SMARC EVK parts
> > > + *
> > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > + */
> > > +
> > > +#include "rzg2ul-smarc-som.dtsi"
> > > +#include "rzg2ul-smarc-pinfunction.dtsi"
> > > +#include "rz-smarc-common.dtsi"
> > > +
> > > +/ {
> > > +       vccq_sdhi1: regulator-vccq-sdhi1 {
> > > +               compatible = "regulator-gpio";
> > > +               regulator-name = "SDHI1 VccQ";
> > > +               regulator-min-microvolt = <1800000>;
> > > +               regulator-max-microvolt = <3300000>;
> > > +               gpios = <&pinctrl RZG2L_GPIO(6, 1) GPIO_ACTIVE_HIGH>;
> > > +               gpios-states = <1>;
> > > +               states = <3300000 1>, <1800000 0>;
> > > +       };
> >
> > This regulator is already defined in rz-smarc-common.dtsi, which is
> > included above?  That definition does use a different gpios property,
> > though.
>
> Yes, Only for this RZ/G2UL and RZ/Five SMARC EVK it is different compared to
> RZ/{G2L,V2L,G2LC} SMARC EVK.
>
> Shall I move regulator from rz-smarc-common.dtsi to RZ/{G2L,V2L} and RZ/G2LC SMARC dtsi?

Either move the regulator to the individual SMARC dtsi files, or
keep it in rz-smarc-common.dtsi without gpios property, and add the
gpios property in the individual SMARC dtsi files.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
