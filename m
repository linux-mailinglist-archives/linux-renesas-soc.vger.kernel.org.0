Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4210B50B32A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 10:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445588AbiDVIsS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 04:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445586AbiDVIsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 04:48:17 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A4D532E3;
        Fri, 22 Apr 2022 01:45:25 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id ay11so5051298qtb.4;
        Fri, 22 Apr 2022 01:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HS3rglQn5IUB1o9Kb2rduCxfFmwJ/BkBcO6WgXZcAzk=;
        b=zIYOT2c0GJt9q1O5ZvwioeL1FNlxaCbrwjLcB44k3CqB2hx8w5MBD9r51ZtPS7X7WG
         rsIwfeIPA10GfLNIvc/F5FtD4JSQ3bju8I47Y3a3r6b0dxt8NE+2Y0F/qpS1rtvCMrg9
         vrk7qm0stF3hxUNRLOajBkysjZN+HwUh72fPQuc0keL3z9xdNKEJJVRqOHoqtqu9WAsy
         RFEMgtPy5+JTTEKf7L0mcr4ntiTJkivCkgwwm8zeYot+ExGacUziNKH2txutCEocstoQ
         oybAxvoQx2p7Aqmgq89qhYPx5g+n086T2KLD7W1BPG4CJyIhGcxk4ITMoMm7PVJbkztJ
         +SRw==
X-Gm-Message-State: AOAM531KKiA57Rm68fDjz+wirmwyaHSZ+Fk+kqee0cv5Kc8zVaF8yv6f
        uGUi+6C6mJVuDhEdUdlzHWmOMnLEs5Qt/Q==
X-Google-Smtp-Source: ABdhPJwY8Yt49jW7ACtLx5t+9GX7exeQM4X0n67Sy5EAKjQHu8RDAreH32I01LmJIhQMkNz3X85T/A==
X-Received: by 2002:ac8:5e54:0:b0:2f1:f60d:2b3c with SMTP id i20-20020ac85e54000000b002f1f60d2b3cmr2318002qtx.667.1650617123746;
        Fri, 22 Apr 2022 01:45:23 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id q27-20020a05620a039b00b0069c8307d9c4sm643172qkm.18.2022.04.22.01.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 01:45:23 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id r189so13263597ybr.6;
        Fri, 22 Apr 2022 01:45:23 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr3290291ybk.207.1650617123088; Fri, 22
 Apr 2022 01:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-3-phil.edworthy@renesas.com> <CAMuHMdWaiAZNWmU5itJWJy3fEMmR1hQc7QRWpe6mi3AYkSewgw@mail.gmail.com>
 <TYYPR01MB7086BD705F91E855F0D3FD45F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086BD705F91E855F0D3FD45F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 10:45:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtLxdXztfLxSvb57WOO46qTW6c+fD=P0O5qicop=b+3g@mail.gmail.com>
Message-ID: <CAMuHMdWtLxdXztfLxSvb57WOO46qTW6c+fD=P0O5qicop=b+3g@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: serial: renesas,em-uart: Document
 r9a09g011 bindings
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Fri, Apr 22, 2022 at 10:28 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> On 20 April 2022 22:26 Geert Uytterhoeven wrote:
> > On Wed, Mar 30, 2022 at 5:41 PM Phil Edworthy <phil.edworthy@renesas.com>
> > wrote:
> > > The Renesas RZ/V2M (r9a09g011) SoC uses a uart that is compatible with
> > the
> > > EMMA Mobile SoC.
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2: Fix dtbs_check by adding missing alternative binding
> >
> > Thanks for your patch, which is now commit 7bb301812b628099
> > ("dt-bindings: serial: renesas,em-uart: Document r9a09g011
> > bindings") in tty/tty-next.
> >
> > > --- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> > > @@ -14,7 +14,14 @@ allOf:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: renesas,em-uart
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,r9a09g011-uart    # RZ/V2M
> > > +          - const: renesas,em-uart        # generic EMMA Mobile
> > compatible UART
> > > +
> > > +      - items:
> > > +          - const: renesas,em-uart        # generic EMMA Mobile
> > compatible UART
> >
> > The above looks good to me.
> >
> > >
> > >    reg:
> > >      maxItems: 1
> >
> > However, unlike EMEV2, RZ/V2M defines two clocks: pclk and sclk.
> > Hence please update the clocks section to reflect that.
> You are right that the uart has two clocks.
>
> Note though that pclk is shared by both uarts. The HW manual says:
> "ch. 1 is for use with the ISP support package, so do not
> use registers related to this channel.". Due to this, section
> 48.5.2.50 Clock ON/OFF Control Register 15 (CPG_CLK_ON15) says
> that bit 20, CLK4_ONWEN (enable for URT_PCLK) should be written
> as 0.
>
> I took this to mean that the URT_PCLK is enabled by the ISP firmware
> and software must not touch it. I am not sure if the DT bindings
> should document a clock that is specified as do not touch in the
> HW manual. This is a bit of a grey area.

"DT describes hardware, not software policy".

But I agree this is a grey area.

One option would be to mark URT_PCLK critical, so it won't be disabled.
But that would still mean it's enabled by Linux, i.e. Linux would set
CLK4_ONWEN to 1 while enabling the clock.

Another option would be to create URT_PCLK as a non-gateable clock,
so Linux won't ever touch the register bits.

Or just ignore URT_PCLK and do nothing, like you did ;-)
Would it be possible for a user to not use the ISP firmware at all,
and go full Linux, hence using both UART channels and URT_PCLK?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
