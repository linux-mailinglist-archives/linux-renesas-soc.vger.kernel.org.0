Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67AC21463FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 09:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgAWI5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 03:57:13 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40251 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgAWI5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 03:57:12 -0500
Received: by mail-oi1-f196.google.com with SMTP id c77so2212907oib.7;
        Thu, 23 Jan 2020 00:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FOcU+zqIj0p8y5XagUPuXt5O53Xv6iFTqJ28oqGaybI=;
        b=E/eoxx0dMwXMAJQ9ORnjvKIjkD1Q6/ZsNCSBY0gC0CAxzQ38KexGurcJeueSYqHczM
         kW8mNvcRS35jnQkWttueVlWgsTPFm1/p0W+N7xgLlF/zBSam5e+KOjbfkMJq3mXguXZP
         l6G+SPpm5alSXQ5TaT9mtbxJZF/Z4SGb/yCwiqGjxjHW9uvvLSttxviBBc1Gx92MIFmv
         GtjhdBeuThG2/fNuwVe9rvL1kEBs3fEO4OhUZP67OHgfmCNn/pSLJAHI+dYf2WkM2f/7
         xeBq6XOCCdP+8oixluTNssP3rASXEr402WQ2F5L2KWzpRc5ZYKODqvX5si37gqx1XJ95
         9dug==
X-Gm-Message-State: APjAAAUgPsn82YgNEMedkAbj0aFxTeFPAlBWdLgo71Mi/ajQtjgGABBq
        ol9o7O9bBjXUI7EsquhU0bBiy2V2gsFW2i/799c=
X-Google-Smtp-Source: APXvYqxU4h1Hy9pdmgwCUc/udQj6duwROInvBWOHO0tGLntJf9S8IeHFQPb/0iuHnI57fa5N+GOsn7vyiUcibjVZckg=
X-Received: by 2002:aca:5905:: with SMTP id n5mr10070165oib.54.1579769831776;
 Thu, 23 Jan 2020 00:57:11 -0800 (PST)
MIME-Version: 1.0
References: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1579258447-28135-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU3SyOTSt2E1JkZsTbqfRgCOSOWrugd4uhmJ05p+azwYw@mail.gmail.com>
 <TYAPR01MB4544EF1219B2670289410772D8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <TYAPR01MB4544596E4415FBD3101934D8D80F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544596E4415FBD3101934D8D80F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Jan 2020 09:57:00 +0100
Message-ID: <CAMuHMdU8yepTTE6FmBToeOXGWK9SQOQ-hjJBjPX-z3NAPYr7EA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: generic-ehci: add a quirk property
 to avoid stuck
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Jan 23, 2020 at 9:17 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Yoshihiro Shimoda, Sent: Monday, January 20, 2020 5:05 PM
> > > > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > > @@ -63,6 +63,11 @@ properties:
> > > >      description:
> > > >        Set this flag to force EHCI reset after resume.
> > > >
> > > > +  needs-polling-to-avoid-stuck:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +    description:
> > > > +      Set this flag to avoid getting EHCI stuck.
> > > > +
> > > >    companion:
> > > >      $ref: /schemas/types.yaml#/definitions/phandle
> > > >      description:
> > >
> > > If this issue is specific to the EHCI/OHCI implementation on R-Car Gen3,
> > > I don't think this is the best solution to handle it.
> > > It might be better to add family/SoC-specific compatible values for the
> > > EHCI/OHCI controllers in R-Car Gen3 SoCs, cfr. the (undocumented)
> > > "ibm,usb-ehci-440epx" and "allwinner,sun4i-a10-ehci" compatible values
> > > in the example in the DT bindings file (probably we should have done so
> > > from the start, like for all other devices).
> > > Then the driver can handle the issue based on the compatible value.
> >
> > I understood it. And I'm also think adding family/SoC-specific compatible
> > values are better.
>
> I'm trying to add some undocumented compatible values, but it seems hard
> to add because:
> - Some dts[i] files have undocumented compatible strings.
>  # We can find it by using the following command:
>  # $ grep "generic-ehci" `find -name "*.dts*"` | grep ","
>
> - I tried to use "oneOf:" and "contains:" combination, but it failed.
>
> - This generic-ehci.yaml uses "contains:" for the compatible now.
>   So, even if compatible property has undocumented compatible string,
>   make dtbs_check command succeeded (except node names).

Probably you'll have to write a separate DT binding doc file for R-Car Gen3,
referring to generic-ehci.yaml using $ref.

> - In my opinion, almost all user (excect R-Car SoCs) doesn't needs
>   specific compatible values, so that adding such compatible values
>   causes less usability in the future.
>
> So, I suspended adding specific compatible values and I'll use
> soc_device_match() for this workaround for now...

Which has the advantage that it will enable the quirk with old DTBs, too ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
