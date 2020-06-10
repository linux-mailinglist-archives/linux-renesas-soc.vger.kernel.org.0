Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98701F5763
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 17:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730039AbgFJPNZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 11:13:25 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:45989 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730037AbgFJPNZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 11:13:25 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B9B02200012;
        Wed, 10 Jun 2020 15:13:22 +0000 (UTC)
Date:   Wed, 10 Jun 2020 17:16:45 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v9.2 6/9] fixes! [max9286-dt]: Add GPIO controller support
Message-ID: <20200610151645.mh75ago5z5bdsnwf@uno.localdomain>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-7-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610124623.51085-7-kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran

On Wed, Jun 10, 2020 at 01:46:20PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The MAX9286 exposes a GPIO controller to control the two GPIO out pins
> of the chip.
>
> These can in some configurations be used to control the power of the
> cameras, and in the case of the V3M, it is used to enable power up
> of the GMSL PoC regulator.
>
> The regulator can not (currently) be moddelled as a regulator due to
> probe time issues, and instead are controlled through the use of a
> gpio-hog.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I have missed if this should be a required property or not..


> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index f9d3e5712c59..7d75c3b63c0b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -46,6 +46,11 @@ properties:
>      description: GPIO connected to the \#PWDN pin with inverted polarity
>      maxItems: 1
>
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +      const: 2
> +
>    ports:
>      type: object
>      description: |
> --
> 2.25.1
>
