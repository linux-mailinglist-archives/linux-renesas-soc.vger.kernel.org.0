Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14C81431E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 20:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgATTC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 14:02:57 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:41884 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgATTC4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 14:02:56 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 3032120023;
        Mon, 20 Jan 2020 20:02:50 +0100 (CET)
Date:   Mon, 20 Jan 2020 20:02:49 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     David Lechner <david@lechnology.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
Message-ID: <20200120190249.GA9619@ravnborg.org>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
 <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=WZHNqt2aAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=UoRE_DPNZI_mX2jt1NQA:9
        a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=PrHl9onO2p7xFKlKy1af:22
        a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi David.

> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
> 
> not all of these properties are applicable.
> 

> > +required:
> > +  - compatible
> > +  - reg
> > +  - dc-gpios
> > +  - reset-gpios
> 
> Missing optional rotation and backlight properties.

Thanks for catching this. I have written a little .yaml files
since I applied this - and learned a little more of the syntax.

See attached patch for my attempt to fix this.
Please review.

	Sam

From 6b54fb0a071c0732cd4bd5b88f456b5a85bcf4f2 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 20 Jan 2020 19:55:04 +0100
Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r

David Lechner noticed (paraphrased):
- not all properties from panel-common are applicable.
- missing optional rotation and backlight properties

Fix this by listing all allowed properties, and do not allow other properties.

Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
Reported-by: David Lechner <david@lechnology.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Lechner <david@lechnology.com>
Cc: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/sitronix,st7735r.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index 8892d79e6e10..0cebaaefda03 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -39,12 +39,19 @@ properties:
     maxItems: 1
     description: Display data/command selection (D/CX)
 
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
 required:
   - compatible
   - reg
   - dc-gpios
   - reset-gpios
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.20.1

