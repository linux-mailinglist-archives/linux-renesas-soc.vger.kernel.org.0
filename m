Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED893C92F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 23:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbhGNVYb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 17:24:31 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:46609 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhGNVYa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 17:24:30 -0400
Received: by mail-io1-f45.google.com with SMTP id p186so3879030iod.13;
        Wed, 14 Jul 2021 14:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IYBoANMWpQAMr1SyRjISViwatcbgyIVGjbgA84mOGkw=;
        b=atINtzluLE9Dv39aqNDqxYW4buYlutF7VK5S3f8XWC1quLFD2SNXhbJvM/t6ZAgvaT
         u2WYTjlMF0SB8L0AcZZm9wgescSvIMFfU19TWOSYSg1nLsloCTU9OAyrTk6c5cMjpeap
         DJDehhmezx0G3ot98qfDfeXV+jX7l1OWeW+VFXrwglkcv4KBIN2YFzjMoj9FNZgrh8P2
         t6Xvaq8Lbft6b7mF9BnHBpc2tzzhQacy0D0yU+2Dz6+ckL8+fLjvLY/SJL2331RQrelt
         Viect6jv7quYe88IXzaq9Ao17GRbr5dS0heoYQ4PIRmexVwhMFPHeD8DeUfITnNb5gCl
         av1A==
X-Gm-Message-State: AOAM532RdjJ1SzkhVbVqHxK++OZr1DgctIAUeNIyqhtfp3FCGolX1Hb4
        OtfL8o0fAet7ZlTaS4ifsEDGBKKBhzMc
X-Google-Smtp-Source: ABdhPJy7ujoAq+G//A7FprDLMJV/JzSGMndI9PwcKrHJE3kWbm3hBzZO4JBbPZiNosPBt8ld0TVJew==
X-Received: by 2002:a05:6638:270c:: with SMTP id m12mr235585jav.5.1626297698605;
        Wed, 14 Jul 2021 14:21:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y2sm1748395ilh.82.2021.07.14.14.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:21:37 -0700 (PDT)
Received: (nullmailer pid 3547394 invoked by uid 1000);
        Wed, 14 Jul 2021 21:21:35 -0000
Date:   Wed, 14 Jul 2021 15:21:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Message-ID: <20210714212135.GA3539572@robh.at.kernel.org>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdWbhY9i+WvV77LVNYhLBLQBVCojgEwM93A-pvFf9Eab1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWbhY9i+WvV77LVNYhLBLQBVCojgEwM93A-pvFf9Eab1g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 30, 2021 at 11:29:36AM +0200, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> Thanks for your patch!
> 
> On Wed, Jun 30, 2021 at 9:31 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Document USB phy bindings for RZ/G2L SoC.
> >
> > RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. Apart
> > from this it uses a different OTG-BC interrupt bit for device recognition.
> 
> Nothing about resets? But see below...
> 
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> >  * Created a new compatible for RZ/G2L as per Geert's suggestion.
> >  * Added resets required properties for RZ/G2L SoC.
> > ---
> >  .../bindings/phy/renesas,usb2-phy.yaml         | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > index d5dc5a3cdceb..a7e585ff28dc 100644
> > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > @@ -30,6 +30,9 @@ properties:
> >                - renesas,usb2-phy-r8a77995 # R-Car D3
> >            - const: renesas,rcar-gen3-usb2-phy
> >
> > +      - items:
> > +          - const: renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
> > +
> >    reg:
> >      maxItems: 1
> >
> > @@ -91,6 +94,21 @@ required:
> >    - clocks
> >    - '#phy-cells'
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,usb2-phy-r9a07g044
> > +    then:
> > +      properties:
> > +        resets:
> > +          items:
> > +            - description: USB phy reset
> > +            - description: reset of USB 2.0 host side
> 
> Do you need the second reset?
> Looking at your .dtsi patch, the second reset is shared with ehci/ohci,
> so perhaps it makes sense to drop it from the phy node?

The existing binding has the host reset (and peripheral, but no phy 
reset). Was that a mistake too? Smells like collecting resources the 
driver happens to want, not what the h/w connections are.

Rob
