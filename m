Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32F633EF2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Mar 2021 12:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhCQLG6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Mar 2021 07:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhCQLGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Mar 2021 07:06:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302C5C06174A;
        Wed, 17 Mar 2021 04:06:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A547645D;
        Wed, 17 Mar 2021 12:06:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615979206;
        bh=tBP7VD5WThau02RaxGa18EeBpUVvfVzB0cm8HgluGnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rJd8g6JAfQwACfhdLUnfpYlDJ3rFKKrQWfbsjyX1Ss+SD06jL9EluSkgrmrVjYZnL
         Baq9j7ZiGv5xMvJNKZFlyCu/AcoB7WEwMiN/MB1HdjXscgd07UlW4XwTVOhBea64ET
         LJFGb8BedaibMrLMb/i3Ipr3vLz2/yh5RZaM51gg=
Date:   Wed, 17 Mar 2021 13:06:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: max9286: Describe gpio-hog
Message-ID: <YFHio3hpaE3ugoLF@pendragon.ideasonboard.com>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
 <20210315163028.173148-2-jacopo+renesas@jmondi.org>
 <YE/cdBtSx3cDIqCY@pendragon.ideasonboard.com>
 <20210317101412.srdzao52nxsvtq3r@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210317101412.srdzao52nxsvtq3r@uno.localdomain>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, Mar 17, 2021 at 11:14:12AM +0100, Jacopo Mondi wrote:
> On Tue, Mar 16, 2021 at 12:15:16AM +0200, Laurent Pinchart wrote:
> > On Mon, Mar 15, 2021 at 05:30:25PM +0100, Jacopo Mondi wrote:
> > > The MAX9286 GMSL deserializer features gpio controller capabilities,
> > > as it provides 2 GPIO lines.
> > >
> > > As establishing a regulator that uses one of the GPIO lines and
> > > enabling/disabling it at run-time in the max9286 won't work due to
> > > a circular dependency on the gpio-controller/regulator creation, allow
> > > the usage of a gpio-hog for that purpose.
> > >
> > > The usage of the gpio-hog is required in designs where the MAX9286
> > > GPIO lines control the remote cameras power.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > That's really a workaround until we can find a good solution, do we have
> > to officially support it in the DT bindings ?
> >
> 
> That's an interesting question. The 'good' solution implies resolving
> the circular dependency on the regulator/gpio-controller creation and
> I feel like it might take a while to find a proper solution.

How about not using a regulator in that case ? If a MAX9286 GPIO is used
to controlled the camera power, we could describe that specifically in
DT, and handle everything within the MAX9286 driver in that case. It
could be considered as a bit of a hack, but it would be very localized,
and I think that trying to fix it in a way that would involve the
regulator framework would actually be worse as the complexity would be
bigger, for little gain.

> In the meantime, all designs like Eagle that control the camera power
> through a MAX9286 gpio have to rely on this. I'll go with the majority
> here: either we add this and upstream the gmsl .dtsi for eagle, or we
> keep out-of-tree patches :/

I don't mind having it upstream in the driver as a workaround, but I'd
like to keep it out of the DT bindings as it shouldn't be considered as
an officially supported option. Would that work for you ?

> > > ---
> > >  .../bindings/media/i2c/maxim,max9286.yaml        | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > index ee16102fdfe7..9038300e373c 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > @@ -177,6 +177,22 @@ properties:
> > >
> > >      additionalProperties: false
> > >
> > > +patternProperties:
> > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > > +    type: object
> > > +    properties:
> > > +      gpio-hog: true
> > > +      gpios: true
> > > +      output-low: true
> > > +      line-name: true
> > > +
> > > +    required:
> > > +      - gpio-hog
> > > +      - gpios
> > > +      - output-low
> > > +
> > > +    additionalProperties: false
> > > +
> > >  required:
> > >    - compatible
> > >    - reg

-- 
Regards,

Laurent Pinchart
