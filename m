Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2376B78257D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 10:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbjHUIdF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 04:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234003AbjHUIdE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 04:33:04 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDAFB5;
        Mon, 21 Aug 2023 01:33:02 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-79a46f02d45so815862241.0;
        Mon, 21 Aug 2023 01:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692606782; x=1693211582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8DR2b7Nt+1F2KZPVYK0O6RgtMx3Ou+9WJvksXud4JY=;
        b=I8WlgyvShn2pKbHytu6kQM///R+wegFvbhDYqNtpNPEKxgUEqxKuhp7qADeDSp/A5G
         3QycxAhCNDp59afFHFpcbfaBfUhZx4gcxCpf0Hxb1YheUpVbU2dOtRRg+fGdAI2wiuAY
         FTHM2+FBns+6J6t6WTwYH4J6lzh1uRkoBoRnKrebRUDRVfrm5jCPxu7z169NTF5av5JL
         PO0m9ORBg3C+jjnK4d4/LvzSaihcALsv0z0dxXWgk2TsTxW7aaCV+9AGoEHF0A/uqlFt
         raLaqX/fqFe43kYCb6XOnN3W17YeX9W/XGjVUjbAYANkKD3oz61guHHvLh2BxnBEiGz9
         QXjA==
X-Gm-Message-State: AOJu0YxkDm/nBVz+qCDD02FENJ/y21sDub/iI+/l6WYGBtKQrtbr6GuF
        vwE76RhhC3OEn7ze2VvMpUZUIh3pjaRysQ==
X-Google-Smtp-Source: AGHT+IGY34agOk/LIlvB11/AHsKM+WXO4A/fX0bfCXw9jAsG52Z39n+UvKNcPuroYTvKLEl8p5+ldA==
X-Received: by 2002:a67:fb4f:0:b0:443:70ec:d28b with SMTP id e15-20020a67fb4f000000b0044370ecd28bmr4913416vsr.19.1692606781725;
        Mon, 21 Aug 2023 01:33:01 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id h185-20020a0dc5c2000000b0058427045833sm2156001ywd.133.2023.08.21.01.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 01:33:01 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d749f57cb22so1113588276.3;
        Mon, 21 Aug 2023 01:33:01 -0700 (PDT)
X-Received: by 2002:a25:bc8a:0:b0:d1c:77de:cf7a with SMTP id
 e10-20020a25bc8a000000b00d1c77decf7amr6760391ybk.64.1692606780809; Mon, 21
 Aug 2023 01:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230817090810.203900-1-biju.das.jz@bp.renesas.com>
 <20230817090810.203900-2-biju.das.jz@bp.renesas.com> <CAMuHMdUoOu2sGeWO0tQ89iU6rT=kWtpJ0qfhYvxnhQAfPwA7dg@mail.gmail.com>
 <OS0PR01MB5922A41D6D8A3164EECE7C05861EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922A41D6D8A3164EECE7C05861EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Aug 2023 10:32:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_WMdwj5dXGHi48F9wQY9WVyuA-L9zbnshP4SCvvAAiA@mail.gmail.com>
Message-ID: <CAMuHMdV_WMdwj5dXGHi48F9wQY9WVyuA-L9zbnshP4SCvvAAiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: versaclock3: Document clock-output-names
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Aug 21, 2023 at 10:11 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 1/3] dt-bindings: clock: versaclock3: Document
> > clock-output-names
> > On Thu, Aug 17, 2023 at 11:08 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Document clock-output-names property and fix the "assigned-clock-rates"
> > > for each clock output in the example based on Table 3. ("Output
> > > Source") in the 5P35023 datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).
> > >
> > > While at it, replace clocks phandle in the example from x1_x2->x1 as
> > > X2 is a different 32768 kHz crystal.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Closes:
> > > Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock
> > > generator bindings")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v1->v2:
> > >  * Updated commit description to make it clear it fixes
> > >    "assigned-clock-rates" in the example based on 5P35023 datasheet.
> >
> > Thanks for your patch!
> > > ---
> > >  .../devicetree/bindings/clock/renesas,5p35023.yaml | 14
> > > ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > > b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > > index 839648e753d4..db8d01b291dd 100644
> > > --- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > > @@ -49,6 +49,9 @@ properties:
> > >      $ref: /schemas/types.yaml#/definitions/uint8-array
> > >      maxItems: 37
> > >
> > > +  clock-output-names:
> > > +    maxItems: 6
> > > +
> >
> > Why do you need clock-output-names?
>
> I thought it will be useful information for a user, by looking at the example the name of clock-output-name and corresponding assigned-clocks and assigned-clock-rates.
>
> See below, from this one can understand the relation between index and actual clock output.
>
>   clock-output-names = "ref", "se1", "se2", "se3",
>                        "diff1", "diff2";
>
>   assigned-clocks = <&versa3 0>, <&versa3 1>,
>                     <&versa3 2>, <&versa3 3>,
>                     <&versa3 4>, <&versa3 5>;
>   assigned-clock-rates = <24000000>, <11289600>,
>                          <11289600>, <12000000>,
>                          <25000000>, <12288000>;
>
> > The clock output names should be created by the driver (taking into account
> > the instance number, so it works with multiple instances).
>
> OK, so shall I remove it from bindings then?

I think so, as it is not needed.

What is still missing (contrary to the Closes tag) is the mapping from
clock IDs to actual clock outputs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
