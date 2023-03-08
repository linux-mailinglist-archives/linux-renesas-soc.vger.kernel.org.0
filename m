Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9622B6B0BDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 15:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjCHOvi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 09:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjCHOvH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 09:51:07 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20291FED;
        Wed,  8 Mar 2023 06:51:03 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id y10so18311434qtj.2;
        Wed, 08 Mar 2023 06:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678287063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NC4sXPFEIb8o+5ZtP/SeLE/mr+OOoJLvEPXDHrHk6k=;
        b=d+86pRkJK1zLStQeJBvJB8N/2dhQWNawVXz+wqk4akoV8Yhc/N4EG8djR8jJoo+1EH
         6EReCg07F5uOvGHZRx28/CqFkXQzMJvJ6HzhmB9/i4NFvftMNI4/WunXGue3e+VrUPD8
         8N2jVSSsN5pqCFA30YPXkjLNf0s+jxtjQzDctUB0DcKQSSuvoh3+lTLMT9qc3UOFkz/7
         GM+uVWu+zFS2y3QlFzYMPOGG47k2OqQ30/qYwmi9EhNTogAJndBgZfm1OZcHLJpsnl0V
         7XqLeUdW+63Ufsu6YRyc22srjHHImPIcDQGe2YjHv15/Xyj9V5nTJLU+n/YA9Na3ErqM
         Tkmg==
X-Gm-Message-State: AO0yUKUEF81bYTHNkGRqFJsZsyvQibOF+1aawYhboP6dDr53d1BJPNHf
        Ex04mvTlIWzbay5J0AkVLAS6AtpwhIgvxS77
X-Google-Smtp-Source: AK7set88XghNomA2BJ3Pc3dGvPA43DcOoCBJ6dk48IqisEoqmztovmy7KnkFnsNesNIwRnke03rYEg==
X-Received: by 2002:ac8:5e0e:0:b0:3bf:a8cf:3096 with SMTP id h14-20020ac85e0e000000b003bfa8cf3096mr33596515qtx.33.1678287062913;
        Wed, 08 Mar 2023 06:51:02 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id z24-20020ac84318000000b003c03b33e6f5sm3021604qtm.90.2023.03.08.06.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 06:51:02 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id t39so14866121ybi.3;
        Wed, 08 Mar 2023 06:51:01 -0800 (PST)
X-Received: by 2002:a5b:2cc:0:b0:a02:a3a6:78fa with SMTP id
 h12-20020a5b02cc000000b00a02a3a678famr8794564ybp.12.1678287061631; Wed, 08
 Mar 2023 06:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com> <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Mar 2023 15:50:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRym-ROY73KYJmt7RhmZC0a+Cb5HTdrhdDy4=huSuOzw@mail.gmail.com>
Message-ID: <CAMuHMdXRym-ROY73KYJmt7RhmZC0a+Cb5HTdrhdDy4=huSuOzw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Mar 8, 2023 at 3:39 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > On 20/02/2023 14:13, Biju Das wrote:
> > > Document Renesas versa3 clock generator(5P35023) bindings.
> > >
> > > The 5P35023 is a VersaClock programmable clock generator and is
> > > designed for low-power, consumer, and high-performance PCI Express
> > > applications. The 5P35023 device is a three PLL architecture design,
> > > and each PLL is individually programmable and allowing for up to 6
> > > unique frequency outputs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml

> > > +  clock-names:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: x1
> > > +      - items:
> > > +          - const: clkin
> >
> > This should be specific, not one or another. Why do you have two entirely
> > different clock inputs?
>
> Reference input can be Crystal oscillator interface input(x1) or differential
> clock input pin(clkin)

I believe that's purely a hardware feature, which does not need any
software configuration?
I.e. logically, there's just a single clock input, i.e. no need for clock-names.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
