Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35CCA4CBB28
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 11:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbiCCKVl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 05:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiCCKVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 05:21:39 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E2C488BD;
        Thu,  3 Mar 2022 02:20:54 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id f7so2133238vkm.12;
        Thu, 03 Mar 2022 02:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+hxqZGD0lbWUmCA2pDIvELHq0CqweVyoPcUZOE+aG4=;
        b=KFGSnqpdvHKvqI3BpIBtZD6PZAR8BGa8tfMlG55UcvMV55M9p8tE03yQJmviuR++y6
         1sajTgg7AHwKRuS6dkotg0xmyzMeKpKPre9oSuQtoe3ZqlHgvYAH7hoWrKpLQrIdvIBP
         1ymsBar7uiOVPg+4s2QJmUsIwgzkv7AQwvnjIWMpHR/wq9I1nlKIRbRnF2xhsfV9nc6R
         AGhvVkDbt5rYVX+0ZLccYVALd9HlQW0VAeKP2HNkaOYVo/7ypLlmzQf+aj2xq+NSwZVk
         5slZcyVvZ8aPfpvXskj/5o/Izg787u7H6qbqPmdz3TtqrrprhKXwC9uvvoBqXZS9+B6O
         +7xQ==
X-Gm-Message-State: AOAM530R7UC/6yF1DgYlcgShzgNlm6YDyalfAd4eP43HNSfxuQIEhCfw
        yN/6uToSK16HrNmP4i33G0w6G6qmewbIyg==
X-Google-Smtp-Source: ABdhPJwbdeHvpzr+C69Qr2Xi09zeobkErT3s4JoFURUhopRFWp7v5dtl7YnN3KIU8sAo8V0Zk5fMcg==
X-Received: by 2002:ac5:c983:0:b0:327:12cc:8087 with SMTP id e3-20020ac5c983000000b0032712cc8087mr14672917vkm.17.1646302853299;
        Thu, 03 Mar 2022 02:20:53 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id e23-20020ab03577000000b0034a4433fe75sm272388uaa.23.2022.03.03.02.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 02:20:53 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id m195so2392216vka.5;
        Thu, 03 Mar 2022 02:20:53 -0800 (PST)
X-Received: by 2002:a05:6122:8ca:b0:332:64b4:8109 with SMTP id
 10-20020a05612208ca00b0033264b48109mr14849815vkg.7.1646302852923; Thu, 03 Mar
 2022 02:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
 <20220303085934.29792-2-biju.das.jz@bp.renesas.com> <CAMuHMdUD_jsZCh95O290y1OTz7Y9gHAcVZ6=Nm=k=1fAqPQJVw@mail.gmail.com>
 <OS0PR01MB5922D605643E8F52D15B069586049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922D605643E8F52D15B069586049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Mar 2022 11:20:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZw5bxUgEif=pT-2Gm1ha-Z01r+AJ6ieC62SwkfMYD5Q@mail.gmail.com>
Message-ID: <CAMuHMdUZw5bxUgEif=pT-2Gm1ha-Z01r+AJ6ieC62SwkfMYD5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update compatible
 string for RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Thu, Mar 3, 2022 at 10:53 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update
> > compatible string for RZ/G2UL SoC
> > On Thu, Mar 3, 2022 at 9:59 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Both RZ/G2UL and RZ/Five SoC's have SoC ID starting with R9A07G043.
> > > To distinguish between them update the compatible string to
> > > "renesas,r9a07g043u-sci" for RZ/G2UL SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > > @@ -17,7 +17,7 @@ properties:
> > >      oneOf:
> > >        - items:
> > >            - enum:
> > > -              - renesas,r9a07g043-sci     # RZ/G2UL
> > > +              - renesas,r9a07g043u-sci    # RZ/G2UL
> >
> > Is this really needed? As far as we know, RZ/Five and RZ/G2UL do use the
> > same I/O blocks?
>
> OK, Just thought their DEVID is different and they use RISC-V instead of ARM64.
> I agree it uses identical IP blocks.
>
> May be I can drop this patch, if it is not really needed. Please let me know.

I think it is not needed. We used the same compatible values
("r8a7778") for R-Car M1A (R8A77781, SH-4A + CA9) and M1S (R8A77780,
SH-4A only), too, (probably not by design, as we never supported the
latter under arch/sh/ ;-)

We do need a different top-level compatible value for the RZ/Five SoC,
like we already have for the RZ/G2UL variants:

      - description: RZ/G2UL (R9A07G043)
        items:
          - enum:
              - renesas,r9a07g043u11 # RZ/G2UL Type-1
              - renesas,r9a07g043u12 # RZ/G2UL Type-2
          - const: renesas,r9a07g043

So if we ever have an issue due to a difference, we can handle that
through soc_device_match(), just like for RZ/V2L vs. RZ/G2L.

BTW, I guess RZ/G2UL Type-1 and Type-2 do have the same DEVID, and
only differ in PRR?

Any other opinions?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
