Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CF333EE27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Mar 2021 11:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbhCQKOK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Mar 2021 06:14:10 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52705 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhCQKNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Mar 2021 06:13:45 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.localdomain (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 54E8BC0006;
        Wed, 17 Mar 2021 10:13:41 +0000 (UTC)
Date:   Wed, 17 Mar 2021 11:14:12 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: max9286: Describe gpio-hog
Message-ID: <20210317101412.srdzao52nxsvtq3r@uno.localdomain>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
 <20210315163028.173148-2-jacopo+renesas@jmondi.org>
 <YE/cdBtSx3cDIqCY@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YE/cdBtSx3cDIqCY@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Mar 16, 2021 at 12:15:16AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Mar 15, 2021 at 05:30:25PM +0100, Jacopo Mondi wrote:
> > The MAX9286 GMSL deserializer features gpio controller capabilities,
> > as it provides 2 GPIO lines.
> >
> > As establishing a regulator that uses one of the GPIO lines and
> > enabling/disabling it at run-time in the max9286 won't work due to
> > a circular dependency on the gpio-controller/regulator creation, allow
> > the usage of a gpio-hog for that purpose.
> >
> > The usage of the gpio-hog is required in designs where the MAX9286
> > GPIO lines control the remote cameras power.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> That's really a workaround until we can find a good solution, do we have
> to officially support it in the DT bindings ?
>

That's an interesting question. The 'good' solution implies resolving
the circular dependency on the regulator/gpio-controller creation and
I feel like it might take a while to find a proper solution.

In the meantime, all designs like Eagle that control the camera power
through a MAX9286 gpio have to rely on this. I'll go with the majority
here: either we add this and upstream the gmsl .dtsi for eagle, or we
keep out-of-tree patches :/

> > ---
> >  .../bindings/media/i2c/maxim,max9286.yaml        | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > index ee16102fdfe7..9038300e373c 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > @@ -177,6 +177,22 @@ properties:
> >
> >      additionalProperties: false
> >
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > +    type: object
> > +    properties:
> > +      gpio-hog: true
> > +      gpios: true
> > +      output-low: true
> > +      line-name: true
> > +
> > +    required:
> > +      - gpio-hog
> > +      - gpios
> > +      - output-low
> > +
> > +    additionalProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
>
> --
> Regards,
>
> Laurent Pinchart
