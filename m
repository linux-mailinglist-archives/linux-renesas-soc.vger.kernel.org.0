Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40C81ABD94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504388AbgDPKGh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:06:37 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:45395 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2504378AbgDPKGe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:06:34 -0400
Received: by mail-oo1-f66.google.com with SMTP id 190so530720ooa.12;
        Thu, 16 Apr 2020 03:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KwXb3b2d+oSOAkRZRE7aGCXWKVWlnHU5Xmb0ZMFtkXQ=;
        b=mQAp5kRP7nCrTbkWcQZq/MlBTL45DsanOwN0TcWhv7IAU4wDu9mdR74kpjhCD9iNFc
         HjBv/tJi0uCTADwB3YsXzq1/lOECID9KGP2hdKIUAcj+43HSAFrX4UxGEba192ALW7as
         G12R13uZn0oLxVjI+8VeRgACQ48/Wk22ZfdE3SvWWABGyplf+4z+Rj1a591rhwJB8Z0o
         cKcQAFqV++1OllcEMfoTUtjeYf2TSnCHESO9r7E1YCeVattuoQD0wfIXMb5LYLBYfawj
         GF4HgqEneCojmRydRyPYWwfMuDiQhD/b4AFzKhVXpYQ4w+lGJ/ESnrUIiIYjnZBpEuv5
         jR+A==
X-Gm-Message-State: AGi0PuaoFeT43+66CjzZgQhwSzcSEkvYDXW8QpwE4jrfG23Ye2icjoxc
        pQHxSLiWelcMkN2H9Yd231Vc4MGmx0toUPizA6DnkwQw
X-Google-Smtp-Source: APiQypIECoyArWol5p8FJU78Zz2jMDBD8aMqqoEHgACR4iaBZONUmm/3S4d4RiyMOQM81Rrvcr8Uem1CfMGfk9wwqZg=
X-Received: by 2002:a4a:e1af:: with SMTP id 15mr4669777ooy.40.1587031593670;
 Thu, 16 Apr 2020 03:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXvZp5GFY5-SjXP0PLE8MiwYencVMti93wU4E3N2c0QVg@mail.gmail.com> <TYAPR01MB45440F928F3DDBFCDC0A25CED8D80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB45440F928F3DDBFCDC0A25CED8D80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Apr 2020 12:06:22 +0200
Message-ID: <CAMuHMdUvSka3F=3mU0qpjcOxQVftyxjHFhXbx7b+Pun9226L9g@mail.gmail.com>
Subject: Re: [PATCH] dt-bndings: iommu: renesas,ipmmu-vmsa: convert to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Apr 16, 2020 at 11:56 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, April 15, 2020 11:21 PM
> > On Tue, Apr 14, 2020 at 2:26 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Convert Renesas VMSA-Compatible IOMMU bindings documentation
> > > to json-schema.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml

> > > +  renesas,ipmmu-main:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description:
> > > +      Reference to the main IPMMU instance in two cells. The first cell is
> > > +      a phandle to the main IPMMU and the second cell is the interrupt bit
> > > +      number associated with the particular cache IPMMU device. The interrupt
> > > +      bit number needs to match the main IPMMU IMSSTR register. Only used by
> > > +      cache IPMMU instances.
> >
> > This property is not valid only on R-Car Gen2 and R-Mobile APE6.
>
> That sounds good. But, since ipmmu_mm on R-Car Gen3 also is not valid,
> we cannot use compatible property for detecting it.

What do you mean by "ipmmu_mm is not valid"?

> However, I realized renesas,ipmmu-main is only used by "cache IPMMU"
> and "cache IPMMU" doesn't have interrupts property. So,
> I described the following schema and then it seems success.
> --
> if:
>   properties:
>     interrupts: false
> then:
>   required:
>     - renesas,ipmmu-main

But all other nodes should have interrupts properties, right?
So they are mutually exclusive:

  oneOf:
     - required:
         - interrupts
    - required:
        - renesas,ipmmu-main

> Especially, I could find missing renesas,ipmmu-main property on r8a77980.dtsi
> like below :)  So, I'll make and submit a fixing r8a77980.dtsi patch later (maybe tomorrow).

Good! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
