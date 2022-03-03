Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1055D4CBB45
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 11:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbiCCK0N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 05:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbiCCK0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 05:26:12 -0500
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130E8179A11;
        Thu,  3 Mar 2022 02:25:28 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id i16so4951330vsb.10;
        Thu, 03 Mar 2022 02:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+5ZeZUWLd3GM/keM7my5lGc+n2WZ148lAyhrGASB0I=;
        b=FKTjoiElSx8HRC599wfx1aY1ttPHpjRl1GIBNoDzOuoh0nfgm2e568GFR4QXbSlsaT
         8aqtc+uyWwNXcdRmxuyUnvn74OOV3z/15893V7ErjOhyufPYR8TOiF6/hmHQw+J7uDJM
         45H6QqXLYTAyke0cBLvwYlnihc5Lj5DSBJ8XgiE/nK/y0CorukfuxkAX0VjelRvSuItI
         8Rw7qGI+QUfmssBJ9QXsZ8bOVbKo/s+S/I+phXD6D054WBacO3GNu5R+YseAw5UCEJyA
         51mSZQxFPRc+TQ2llFnpEfty4OKIuCDg4Zs5w7iAA5NkMG2YethCoxh5i+fIpBb1fOQA
         XUgw==
X-Gm-Message-State: AOAM5339cGTYN2xn+dswOFD4AkmaHXXqUxbiIkOn/deatv7kfc4K8dhE
        0PgL8HL+o13JjAI/luCXdcqxXcS2JWFtWQ==
X-Google-Smtp-Source: ABdhPJxgaV8cMTpphP/ydBJt9LZy5E31t7ZE2vu1tGxlLjrTHEC+UEQx3JQqKDB5REkZ/Y+QKpLGuA==
X-Received: by 2002:a05:6102:351:b0:31c:3444:aaf6 with SMTP id e17-20020a056102035100b0031c3444aaf6mr8912256vsa.72.1646303127095;
        Thu, 03 Mar 2022 02:25:27 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id h79-20020a1f2152000000b0033176aaacb1sm257668vkh.35.2022.03.03.02.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 02:25:26 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id f12so2388273vkl.2;
        Thu, 03 Mar 2022 02:25:26 -0800 (PST)
X-Received: by 2002:a05:6122:8ca:b0:332:64b4:8109 with SMTP id
 10-20020a05612208ca00b0033264b48109mr14855968vkg.7.1646303126625; Thu, 03 Mar
 2022 02:25:26 -0800 (PST)
MIME-Version: 1.0
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWSgjipMd_39+J=egH+yh=G-cb4jpD43FU7O77CZzDhNg@mail.gmail.com> <OS0PR01MB59226DC72B72B75EBBC4E07A86049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59226DC72B72B75EBBC4E07A86049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Mar 2022 11:25:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVS6+KjQ5Tp6C+-dw7gVM6CwLrFX25SoaX5fU5VN5C+tA@mail.gmail.com>
Message-ID: <CAMuHMdVS6+KjQ5Tp6C+-dw7gVM6CwLrFX25SoaX5fU5VN5C+tA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: renesas,scif: Update compatible
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

On Thu, Mar 3, 2022 at 10:55 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/2] dt-bindings: serial: renesas,scif: Update
> > compatible string for RZ/G2UL SoC
> > On Thu, Mar 3, 2022 at 9:59 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Both RZ/G2UL and RZ/Five SoC's have SoC ID starting with R9A07G043.
> > > To distinguish between them update the compatible string to
> > > "renesas,scif-r9a07g043u" for RZ/G2UL SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > > @@ -76,7 +76,7 @@ properties:
> > >
> > >        - items:
> > >            - enum:
> > > -              - renesas,scif-r9a07g043      # RZ/G2UL
> > > +              - renesas,scif-r9a07g043u     # RZ/G2UL
> >
> > Is this really needed? As far as we know, RZ/Five and RZ/G2UL do use the
> > same I/O blocks?
>
> OK, Just thought their DEVID is different and they use RISC-V instead of ARM64.
> I agree it uses identical IP blocks.
>
> May be I can drop this patch, if it is not really needed. Please let me know.

Please see my response in
https://lore.kernel.org/r/CAMuHMdUZw5bxUgEif=pT-2Gm1ha-Z01r+AJ6ieC62SwkfMYD5Q@mail.gmail.com/
Let's continue the discussion there...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
