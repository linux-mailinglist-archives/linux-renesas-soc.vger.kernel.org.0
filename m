Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6F128DED9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 12:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgJNKXs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 06:23:48 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41979 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgJNKXs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 06:23:48 -0400
X-Greylist: delayed 2577 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Oct 2020 06:23:47 EDT
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A2F05E0008;
        Wed, 14 Oct 2020 10:23:43 +0000 (UTC)
Date:   Wed, 14 Oct 2020 12:27:45 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: media: renesas,vin: Add V3U support
Message-ID: <20201014102745.ucicjxvsiohwefzb@uno.localdomain>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-6-jacopo+renesas@jmondi.org>
 <20201014101152.mqmv2klq2mwsjlpf@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201014101152.mqmv2klq2mwsjlpf@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Oct 14, 2020 at 12:11:52PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your patch.
>
> On 2020-10-14 11:44:42 +0200, Jacopo Mondi wrote:
> > Add compatible string definition for R-Car V3U.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > index ad2fe660364b..7b629a6ea035 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -51,6 +51,7 @@ properties:
> >                - renesas,vin-r8a77980 # R-Car V3H
> >                - renesas,vin-r8a77990 # R-Car E3
> >                - renesas,vin-r8a77995 # R-Car D3
> > +              - renesas,vin-r8a779a0 # R-Car V3U
>
> Documenting the compat string here might give the wrong impression the
> IP is supported. Which it's not as the V3U is quiet different then the
> it's siblings. Whit a new pipeline and small but important changes in in
> the register set. I'm primarily thinking about that the IFMD register is
> gone and dealing with that will be quiet significant work in the driver.
>
> I'm not yet 100% sure the best idea is to support V3U with this driver,
> maybe it's finally time to make it more modular, with more distinct
> support for Gen2, Gen3 and a new module for V3U?

I see.

The first concern I had that had me adding this compatible string is
that otherwise I cannot specify any compatible string in the DTS
device nodes...

>
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.28.0
> >
>
> --
> Regards,
> Niklas Söderlund
