Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E659E90BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 21:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfJ2UUF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Oct 2019 16:20:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:60510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfJ2UUF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 16:20:05 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E3DF2086A;
        Tue, 29 Oct 2019 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572380404;
        bh=Clnomsacv7T6a/ubml3afB3fbMamN9cVGn6ssr4l9qY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S/8rYQezY07m5/GuMp+eUDHBLwmHpdOZheShfDHSS0hS/0TCprkl6ldKq5gKVDIyW
         P1t9wBcIP2MPDRDtsHKYMWNwZe8Nblj6cSyyGnQpVgsTCSR/+lYKFuFbfcjLqXdhMP
         lCrKFEYbyLKtfKqPEYsSY+I+THwku5JITalxHVS4=
Received: by mail-qt1-f174.google.com with SMTP id l3so896qtp.2;
        Tue, 29 Oct 2019 13:20:04 -0700 (PDT)
X-Gm-Message-State: APjAAAXaYPfVSYvJiP4EUh8kgUy5mjz288IKjy8VleAyYt/qLUnmZvs/
        bTKdSfsfAWCoLTvy4xnW+5w1pGtLYBrTE1xWKA==
X-Google-Smtp-Source: APXvYqxabGX/POiNRA0N56A14M3a7t/UWULx2rYZa74WIi4+N6DZNC2UX/jDPYkIQG5TuAM8HOsEpCdBSi3MN/Svr1k=
X-Received: by 2002:ac8:70c4:: with SMTP id g4mr1134179qtp.136.1572380403327;
 Tue, 29 Oct 2019 13:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <1571387933-23397-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20191029015708.GA29561@bogus> <TYAPR01MB4544FD4F09FAA09F7AF79EF0D8610@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544FD4F09FAA09F7AF79EF0D8610@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 29 Oct 2019 15:19:52 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+H-4V=v0GTUgTXAiwOtn_BoMtcMpinb1v51V_Jy9mBXA@mail.gmail.com>
Message-ID: <CAL_Jsq+H-4V=v0GTUgTXAiwOtn_BoMtcMpinb1v51V_Jy9mBXA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "kishon@ti.com" <kishon@ti.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 28, 2019 at 11:14 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi Rob,
>
> Thank you for your review!
>
> > From: Rob Herring, Sent: Tuesday, October 29, 2019 10:57 AM
> >
> > On Fri, Oct 18, 2019 at 05:38:53PM +0900, Yoshihiro Shimoda wrote:
> > > Convert Renesas R-Car generation 3 USB 2.0 PHY bindings documentation
> > > to json-schema.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 --------------
> > >  .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 106 +++++++++++++++++++++
> > >  2 files changed, 106 insertions(+), 70 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > >  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> >
> >
> > > diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > new file mode 100644
> > > index 00000000..0f109c2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > @@ -0,0 +1,106 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas R-Car generation 3 USB 2.0 PHY
> > > +
> > > +maintainers:
> > > +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> >
> > This:
>
> What does the "This:" mean?

I was referring to the 3 lines below. I was trying to be clear which
lines to replace with just 'const'.

> If I replaced the "oneOf:" with "This:",
> the following error happens when "make dt_binding_check":
>
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> warning: no schema found in file: Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> [snip]/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml: ignoring, error in schema 'compatible'
> Documentation/devicetree/bindings/Makefile:33: recipe for target 'Documentation/devicetree/bindings/processed-schema.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Error 255
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,usb2-phy-r8a77470 # RZ/G1C
> >
> > You can simplify to just:
> >
> >          - const: renesas,usb2-phy-r8a77470 # RZ/G1C
>
> I'll fix it.
