Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6F634D4F6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 17:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbiCJQgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 11:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiCJQgw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 11:36:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38746192E33;
        Thu, 10 Mar 2022 08:35:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4045491;
        Thu, 10 Mar 2022 17:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646930149;
        bh=H/rScwjhv6h4uAEVs0m6qTExsU33rCuexQYAnXBvt/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A0q2CNfvbL9OZM/GMoGCtTsu4c0wPkWgBXb7U0F4V7JhU+5WxJAE1X6LqEs2outIm
         9j3REsnvTfLYtC6N7P4xgW9XskNfG+WboemKYOY0FEaLwm4z3qPMU23uJ2aHC7RLzn
         hbBgY5PGYlTqt7dDar2Ru3kGT7V9Jnu6pA9myyGs=
Date:   Thu, 10 Mar 2022 18:35:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Message-ID: <Yioo1Wgo1eC6IIvf@pendragon.ideasonboard.com>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Mar 09, 2022 at 03:11:08PM +0000, Biju Das wrote:
> On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at
> lower frequencies causes display instability. On such platforms, it
> is better to avoid switching lanes from 4 to 3 as it needs different
> set of PLL parameter constraints to make the display stable with 3
> lanes.

Is this because the PLL calculation code doesn't work properly, or
because the hardware can't support this ?

> This patch introduces 'adi,disable-lanes-override' property to disable
> lane switching at lower frequencies.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/adi,adv7533.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> index f36209137c8a..2dc378039d21 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -84,6 +84,11 @@ properties:
>        timings for HDMI output.
>      type: boolean
>  
> +  adi,disable-lanes-override:
> +    description:
> +      Disables the overriding lanes at lower frequencies.
> +    type: boolean
> +
>    adi,dsi-lanes:
>      description: Number of DSI data lanes connected to the DSI host.
>      $ref: /schemas/types.yaml#/definitions/uint32

-- 
Regards,

Laurent Pinchart
