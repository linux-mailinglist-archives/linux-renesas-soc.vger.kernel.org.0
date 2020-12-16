Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC432DC1A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 14:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgLPNwu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 08:52:50 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57003 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPNwu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 08:52:50 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2B3EF20007;
        Wed, 16 Dec 2020 13:52:06 +0000 (UTC)
Date:   Wed, 16 Dec 2020 14:52:17 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,lvds: RZ/G2E needs
 renesas,companion too
Message-ID: <20201216135217.gzhb7cllyr745jhc@uno.localdomain>
References: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent, Fabrizio

On Wed, Dec 16, 2020 at 12:59:27AM +0200, Laurent Pinchart wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Document RZ/G2E support for property renesas,companion.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
> Changes since v1:
>
> - Slight reword of SoC list in description
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> index e5b163951b91..7eddcdb666dc 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -83,9 +83,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        phandle to the companion LVDS encoder. This property is mandatory
> -      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> -      the second encoder to be used as a companion in dual-link mode. It
> -      shall not be set for any other LVDS encoder.
> +      for the first LVDS encoder on R-Car D3 and E3, and RZ/G2E SoCs, and shall
> +      point to the second encoder to be used as a companion in dual-link mode.
> +      It shall not be set for any other LVDS encoder.
>
>  required:
>    - compatible
> --
> Regards,
>
> Laurent Pinchart
>
