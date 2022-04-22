Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89AC450BB9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 17:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449001AbiDVPZ4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 11:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449396AbiDVPZz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 11:25:55 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F9356208;
        Fri, 22 Apr 2022 08:23:01 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id hh4so5698324qtb.10;
        Fri, 22 Apr 2022 08:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eoS/W5UvalYkcGjGH1/+VEhC1v58PNAr8XIYRC+qU1s=;
        b=RkVs9cW9bIXu2Pq3qrrp+7ny8+AZPidUr26N68sAQShLMt86x11d6vW+rA0p9g3Zjj
         kNZ53AQ3c4fHUPfajIX86z45TeDtLT9sMTalOWHgQd/6Lo7oCpYUwvFs7oeBQkEtu7Kn
         H+lNPItMKeZWUVLydyMHreq5NzFo9szgrGWVHi89nG6oSNqJatYajzHZ/1Y2jLAqKKZH
         ojYts3ruhJYYW6GDhR21cYu4ADRB5QgpAELn0Q1S3UQejYd9LQsfeV4oHSSpbgPw6uQ+
         RIi0iot+iaDHiZjXUZ4pHqiu16ejKxM8NsqKilD/ZfM2pO2Mcwi0+uT+z5O5FWc6cF/B
         YXuQ==
X-Gm-Message-State: AOAM530GBlXqx5pz3oSE2WHhsWeN0aqExII9KYfywM9MBbiOeZQiFSdI
        GQhFpIXAqYO56grIoQFHz97IEqTVw51egQ==
X-Google-Smtp-Source: ABdhPJw/jsypCSUgzB2UmpZCn2EkVm87IGCAgjVMuF8vjC65s8jQ4vl+reMlkDBSYNcwdg7xGioNXw==
X-Received: by 2002:ac8:5509:0:b0:2f1:ea6f:55b8 with SMTP id j9-20020ac85509000000b002f1ea6f55b8mr3652781qtq.379.1650640980043;
        Fri, 22 Apr 2022 08:23:00 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id j12-20020ae9c20c000000b0067ec380b320sm1037875qkg.64.2022.04.22.08.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 08:22:59 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2f7b90e8b37so11326257b3.6;
        Fri, 22 Apr 2022 08:22:59 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr4962418ywa.479.1650640979112; Fri, 22
 Apr 2022 08:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-3-phil.edworthy@renesas.com> <CAMuHMdWaiAZNWmU5itJWJy3fEMmR1hQc7QRWpe6mi3AYkSewgw@mail.gmail.com>
 <TYYPR01MB7086BD705F91E855F0D3FD45F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdWtLxdXztfLxSvb57WOO46qTW6c+fD=P0O5qicop=b+3g@mail.gmail.com> <TYYPR01MB708615E7E58B7833184B5CDFF5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB708615E7E58B7833184B5CDFF5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 17:22:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeK91MVmYhxa8m7PbO_6E_CtaDVV+=QgyAns_=oCUYvA@mail.gmail.com>
Message-ID: <CAMuHMdWeK91MVmYhxa8m7PbO_6E_CtaDVV+=QgyAns_=oCUYvA@mail.gmail.com>
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
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Fri, Apr 22, 2022 at 11:31 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> On 22 April 2022 09:45 Geert Uytterhoeven wrote:
> > On Fri, Apr 22, 2022 at 10:28 AM Phil Edworthy wrote:
> > > On 20 April 2022 22:26 Geert Uytterhoeven wrote:
> > > > On Wed, Mar 30, 2022 at 5:41 PM Phil Edworthy wrote:
> > > > > The Renesas RZ/V2M (r9a09g011) SoC uses a uart that is compatible
> > with
> > > > the
> > > > > EMMA Mobile SoC.
> > > > >
> > > > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > > v2: Fix dtbs_check by adding missing alternative binding
> > > >
> > > > Thanks for your patch, which is now commit 7bb301812b628099
> > > > ("dt-bindings: serial: renesas,em-uart: Document r9a09g011
> > > > bindings") in tty/tty-next.
> > > >
> > > > > --- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> > > > > +++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> > > > However, unlike EMEV2, RZ/V2M defines two clocks: pclk and sclk.
> > > > Hence please update the clocks section to reflect that.
> > > You are right that the uart has two clocks.
> > >
> > > Note though that pclk is shared by both uarts. The HW manual says:
> > > "ch. 1 is for use with the ISP support package, so do not
> > > use registers related to this channel.". Due to this, section
> > > 48.5.2.50 Clock ON/OFF Control Register 15 (CPG_CLK_ON15) says
> > > that bit 20, CLK4_ONWEN (enable for URT_PCLK) should be written
> > > as 0.
> > >
> > > I took this to mean that the URT_PCLK is enabled by the ISP firmware
> > > and software must not touch it. I am not sure if the DT bindings
> > > should document a clock that is specified as do not touch in the
> > > HW manual. This is a bit of a grey area.
> >
> > "DT describes hardware, not software policy".
> >
> > But I agree this is a grey area.
> I wish the HW manual either didn’t mention this clock that you should
> not touch, or didn’t specify anything as "used by the ISP firmware" :)

Yeah, hardware manuals making too many assumptions about the software
that will run on it will lead to headaches...

> > One option would be to mark URT_PCLK critical, so it won't be disabled.
> > But that would still mean it's enabled by Linux, i.e. Linux would set
> > CLK4_ONWEN to 1 while enabling the clock.
> >
> > Another option would be to create URT_PCLK as a non-gateable clock,
> > so Linux won't ever touch the register bits.
> >
> > Or just ignore URT_PCLK and do nothing, like you did ;-)
> > Would it be possible for a user to not use the ISP firmware at all,
> > and go full Linux, hence using both UART channels and URT_PCLK?
> It is possible to not use the ISP firmware, but them what do we do?
> Ignore everything in the HW manual that says "ISP firmware"?
>
> Ideally, we want to only enable a clock if it's not already enabled,
> but not turn it off if it is enabled. Isn't that a critical clk?

__clk_core_init() explicitly enables clocks marked with
CLK_IS_CRITICAL.  I think it does so without checking the hardware
if the clock is already enabled or not, so probably it will access
the reserved hardware bits regardless.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
