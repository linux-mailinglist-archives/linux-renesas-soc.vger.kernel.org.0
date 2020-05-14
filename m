Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6381D2895
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 09:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgENHPW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 03:15:22 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40063 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgENHPW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 03:15:22 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A40FC2000F;
        Thu, 14 May 2020 07:15:18 +0000 (UTC)
Date:   Thu, 14 May 2020 09:18:35 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 5/4] dt-bindings: display: bridge: thc63lvd1024: Document
 dual-output mode
Message-ID: <20200514071835.ap4pusz3i52jhosc@uno.localdomain>
References: <20200406111543.GC4757@pendragon.ideasonboard.com>
 <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, May 14, 2020 at 02:21:27AM +0300, Laurent Pinchart wrote:
> The DT binding support both dual-input and dual-output mode, but only
> dual-input is documented. Document dual-output mode.
>
> Suggested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks
Acked-by: Jacopo Mondi <jacopo@jmondi.org>


> ---
>  .../display/bridge/thine,thc63lvd1024.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> index 469ac4a34273..fedd3460d6f6 100644
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> @@ -30,11 +30,17 @@ properties:
>        This device has four video ports. Their connections are modeled using the
>        OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>
> -      The device can operate in single-link mode or dual-link mode. In
> -      single-link mode, all pixels are received on port@0, and port@1 shall not
> -      contain any endpoint. In dual-link mode, even-numbered pixels are
> -      received on port@0 and odd-numbered pixels on port@1, and both port@0 and
> -      port@1 shall contain endpoints.
> +      The device can operate in single or dual input and output modes.
> +
> +      When operating in single input mode, all pixels are received on port@0,
> +      and port@1 shall not contain any endpoint. In dual input mode,
> +      even-numbered pixels are received on port@0 and odd-numbered pixels on
> +      port@1, and both port@0 and port@1 shall contain endpoints.
> +
> +      When operating in single output mode all pixels are output from the first
> +      CMOS/TTL port and port@3 shall not contain any endpoint. In dual output
> +      mode pixels are output from both CMOS/TTL ports and both port@2 and
> +      port@3 shall contain endpoints.
>
>      properties:
>        '#address-cells':
> --
> Regards,
>
> Laurent Pinchart
>
