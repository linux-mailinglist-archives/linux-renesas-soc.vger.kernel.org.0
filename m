Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B4E3EBD20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 22:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbhHMUMp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 16:12:45 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:44613 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234313AbhHMUMp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 16:12:45 -0400
Received: by mail-oi1-f177.google.com with SMTP id w6so17529733oiv.11;
        Fri, 13 Aug 2021 13:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=brjSAKvcG3w//6u1qpeaPj8Sen2eVcNEcaY+HnZUn+Q=;
        b=h2AeIqOK5E+5VKn0bTaR0fJoNZ91hJRFmWJf7amBLAW7AAoqNv+hEhJBIeWq2cnP/p
         oiYBg7oaehrVqkGPCkPKuxktF4oRXTMJQlu+/A1XLJXNnbFYhbnXfVnEIk4SaVdJUagV
         WzVEnN3ildSEFxZYpGUqGBBgR0rwDFxdWiphvjRt+BT7tGylrfOdLPnR7mPdGb4F2JSN
         Uz8MfK+YLBiwbn8lG8AWUl4ptTPCN0+/XVrGTlJWAzkbi27blgubJ6dX9dYgjFb7U9bZ
         IrrNEUv58O4E1Yg4MBvuynkCKYCA9YGA8HdbfXA2Tu9S2RqbbqnwSqPjO0SQf02jL8w3
         bxbg==
X-Gm-Message-State: AOAM531NCiDPhBFhevqXUF4/yeEFL33W1m//4KW+/MiGjFAfEtte79EZ
        lAMZlvbedK7wABstgl1E6i3+ktJD6A==
X-Google-Smtp-Source: ABdhPJwGTSMtK+9NYP9pDRzcZrjvm0ClM2a1UqumCqT/+n4os3icmryyREvNZp/z5ivhq9qWazn64A==
X-Received: by 2002:a05:6808:1906:: with SMTP id bf6mr3371811oib.52.1628885537689;
        Fri, 13 Aug 2021 13:12:17 -0700 (PDT)
Received: from robh.at.kernel.org (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com. [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
        by smtp.gmail.com with ESMTPSA id t13sm453083oor.37.2021.08.13.13.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 13:12:17 -0700 (PDT)
Received: (nullmailer pid 3944256 invoked by uid 1000);
        Fri, 13 Aug 2021 20:12:15 -0000
Date:   Fri, 13 Aug 2021 15:12:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
Message-ID: <YRbSHw9X51Nif/Sd@robh.at.kernel.org>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 09, 2021 at 02:57:33PM +0200, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Fri, Aug 6, 2021 at 12:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > The DMAC driver on RZ/G2L expects the slave channel configuration
> > to be passed in dmas property.
> > This patch updates the example node to include the encoded slave
> > channel configuration.
> >
> > Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> > v3->v4:
> >  * Updated bindings as the DMAC driver on RZ/G2L expects the
> >    slave channel configuration to be passed in dmas property.
> 
> Thanks for the update!
> 
> > --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > @@ -93,8 +93,8 @@ examples:
> >              clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> >              power-domains = <&cpg>;
> >              resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
> > -            dmas = <&dmac 0x255>,
> > -                   <&dmac 0x256>;
> > +            dmas = <&dmac 0x2655>,
> > +                   <&dmac 0x2656>;
> >              dma-names = "tx", "rx";
> >              #sound-dai-cells = <0>;
> >      };
> 
> I think it would be good to describe the expected format in the description
> for the dmas property, so the DTS writer knows what the numerical
> values in the example really mean.

Yes, but that's a property of the DMA controller binding, not this one. 
It could vary from chip to chip.

Rob
