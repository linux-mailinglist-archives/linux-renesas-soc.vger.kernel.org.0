Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B601C2F5DF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 10:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbhANJmx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 04:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbhANJmw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 04:42:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B08C061575;
        Thu, 14 Jan 2021 01:42:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B746279;
        Thu, 14 Jan 2021 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610617337;
        bh=rtJMlh25QobvsiyGF+L/cjpV63tvMAdp3CNNW1bz2/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XZEDz1A2TsXxnrpD04KhJIJ3eWMC5Td+Loz+0LEnWabUJDnCsESO2k+iMgwt9QdgY
         Kqn9dbXpVYA549NEZbXy38KSx7aKj/p36MHTNY9ZsvOyq6s/RvRqUTseA73x7Fwydk
         gIEgdQXjf9TEoqcqUn569whnDtrc4SfYbcbUROc0=
Date:   Thu, 14 Jan 2021 11:42:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Yao <markyao0591@gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: display: imx: hdmi: Convert binding
 to YAML
Message-ID: <YAAR6H8L2MzVngJr@pendragon.ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210114064437.5793-5-laurent.pinchart+renesas@ideasonboard.com>
 <d7e9c3bed92d6fc6922e5f5ec30f27d7242c5624.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7e9c3bed92d6fc6922e5f5ec30f27d7242c5624.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Philipp,

On Thu, Jan 14, 2021 at 09:17:47AM +0100, Philipp Zabel wrote:
> On Thu, 2021-01-14 at 08:44 +0200, Laurent Pinchart wrote:
> > Convert the i.MX6 HDMI TX text binding to YAML.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes since v3:
> > 
> > - Use port instead of port-base
> > 
> > Changes since v1:
> > 
> > - Only specify maxItems for clocks
> > - Drop reg and interrupts as they're checked in the base schema
> > - Rebase on top of OF graph schema, dropped redundant properties
> > - Fix identation for enum entries
> > - Drop clock-names items, use maxItems only
> > ---
> >  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 126 ++++++++++++++++++
> >  .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
> >  2 files changed, 126 insertions(+), 65 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > new file mode 100644
> > index 000000000000..af7fe9c4d196
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX6 DWC HDMI TX Encoder
> > +
> > +maintainers:
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

Very appreciated, thank you.

-- 
Regards,

Laurent Pinchart
