Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8B21F7891
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 15:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgFLNL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 09:11:29 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:42815 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgFLNL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 09:11:28 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id AE28424000A;
        Fri, 12 Jun 2020 13:11:24 +0000 (UTC)
Date:   Fri, 12 Jun 2020 15:14:48 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran@ksquared.org.uk>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v9.2 6/9] fixes! [max9286-dt]: Add GPIO controller support
Message-ID: <20200612131448.mby3g3bn435jjo73@uno.localdomain>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-7-kieran@bingham.xyz>
 <20200610151645.mh75ago5z5bdsnwf@uno.localdomain>
 <f786b689-a9fa-ed08-d1ba-f912af2b90fb@bingham.xyz>
 <784395db-f779-f34e-96cc-4284431d4d96@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <784395db-f779-f34e-96cc-4284431d4d96@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Jun 12, 2020 at 01:47:58PM +0100, Kieran Bingham wrote:
> On 12/06/2020 13:35, Kieran Bingham wrote:
> > On 10/06/2020 16:16, Jacopo Mondi wrote:
> >> Hi Kieran
> >>
> >> On Wed, Jun 10, 2020 at 01:46:20PM +0100, Kieran Bingham wrote:
> >>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>
> >>> The MAX9286 exposes a GPIO controller to control the two GPIO out pins
> >>> of the chip.
> >>>
> >>> These can in some configurations be used to control the power of the
> >>> cameras, and in the case of the V3M, it is used to enable power up
> >>> of the GMSL PoC regulator.
> >>>
> >>> The regulator can not (currently) be moddelled as a regulator due to
> >>> probe time issues, and instead are controlled through the use of a
> >>> gpio-hog.
> >>>
> >>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >> I have missed if this should be a required property or not..
> >
> > Hrm... I'm not sure. It isn't 'required' ... but the device does expose
> > gpio pins, which the driver provides access to (and is needed to be able
> > to expose a gpio-hog).
> >
> > If the device isn't marked as a gpio-controller, then the gpio-hog
> > framework doesn't work.
> >
> > But the gpio pins will ...
> >
> > Do you think I should add gpio-controller to the required section as well?:
> >
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > @@ -220,6 +220,7 @@ required:
> >    - reg
> >    - ports
> >    - i2c-mux
> > +  - gpio-controller
> >
> >  additionalProperties: false
> >
> >
> > As it's only required for making gpio-hogs, I guess it's optional, and
> > doesn't need to be listed...

As you off-line explained me, this mean that if cameras power is
controlled by the gpio pins exposed by the max9286, without this
property we would not be able to control it.

I would then make it mandatory

> >
> > But the *hardware* has gpios... which are controllable...
>
> And of course adding to the requried properties, means the example needs
> ot be updated too, so it's actually:

oh yes :)

>
> Which I'll also add to v10, if you don't object.
>
>
>
> Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Date:   Fri Jun 12 13:36:28 2020 +0100
>
>     make gpio-controller non-optional
>
>     Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> diff --git
> a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 8307c41f2cae..c632a10a753a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -220,6 +220,7 @@ required:
>    - reg
>    - ports
>    - i2c-mux
> +  - gpio-controller
>
>  additionalProperties: false
>
> @@ -239,6 +240,9 @@ examples:
>          poc-supply = <&camera_poc_12v>;
>          enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
>
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +

Looks good to me!

Thanks
  j

>          ports {
>            #address-cells = <1>;
>            #size-cells = <0>;
>
>
>
> >
> > --
> > Kieran
> >
> >
> >>
> >>
> >>> ---
> >>>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml         | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> >>> index f9d3e5712c59..7d75c3b63c0b 100644
> >>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> >>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> >>> @@ -46,6 +46,11 @@ properties:
> >>>      description: GPIO connected to the \#PWDN pin with inverted polarity
> >>>      maxItems: 1
> >>>
> >>> +  gpio-controller: true
> >>> +
> >>> +  '#gpio-cells':
> >>> +      const: 2
> >>> +
> >>>    ports:
> >>>      type: object
> >>>      description: |
> >>> --
> >>> 2.25.1
> >>>
> >
>
