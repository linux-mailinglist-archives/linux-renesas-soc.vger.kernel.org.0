Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD7A2F5C49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 09:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbhANISe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 03:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbhANISd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 03:18:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80713C061794
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 00:17:53 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzxpG-00029h-HZ; Thu, 14 Jan 2021 09:17:50 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzxpD-0004YJ-M3; Thu, 14 Jan 2021 09:17:47 +0100
Message-ID: <d7e9c3bed92d6fc6922e5f5ec30f27d7242c5624.camel@pengutronix.de>
Subject: Re: [PATCH v4 4/7] dt-bindings: display: imx: hdmi: Convert binding
 to YAML
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Yao <markyao0591@gmail.com>
Date:   Thu, 14 Jan 2021 09:17:47 +0100
In-Reply-To: <20210114064437.5793-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
         <20210114064437.5793-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 2021-01-14 at 08:44 +0200, Laurent Pinchart wrote:
> Convert the i.MX6 HDMI TX text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v3:
> 
> - Use port instead of port-base
> 
> Changes since v1:
> 
> - Only specify maxItems for clocks
> - Drop reg and interrupts as they're checked in the base schema
> - Rebase on top of OF graph schema, dropped redundant properties
> - Fix identation for enum entries
> - Drop clock-names items, use maxItems only
> ---
>  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 126 ++++++++++++++++++
>  .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
>  2 files changed, 126 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> new file mode 100644
> index 000000000000..af7fe9c4d196
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX6 DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
