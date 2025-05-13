Return-Path: <linux-renesas-soc+bounces-17060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C1AB5ABE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 19:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 539EE466005
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C324D2BF3CD;
	Tue, 13 May 2025 17:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="Kwycc4Hv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857781DFD96;
	Tue, 13 May 2025 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156024; cv=none; b=sZNLGdjUpxiCtPANkJSaBPVBgisH8CJM8aWYukt0KkDf6Pc/K4yrvkm4RIGx4Q/ZwhQcXCAwlfXfRaqfR4x+YGA+BDI3L2e/p/M8PvPB8UR9Y3+0fGdXSI9GtMTVdW4VPgXKPiNMB0oqbONeB6nUua3ociVdM0gUpSxz4Yh3bQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156024; c=relaxed/simple;
	bh=/wx5j8F6+tuBTmZMB/pfI/6kvL1TBAhK4iTOk5f+lKA=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=EBao2Lw9xoGpK3e2i4HcDzvF1Kod4szv15P85uc7/bSRXBZGRT8gV0xMy7YPnssMMA1Y8I224NaWGiA8bB+9/3gSlHoCR+zrfNy4uwSyC+DIAYDmkwcznLJVRU2cu6isyDxzUdYLxUk1/aXbdOrdcuhi9LkZ3Sg/nX8WoKGojUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=Kwycc4Hv; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=2LurGoPkc6Eg3ZIhwGtbJARXq0QoaSbCX/2p8hC7Mh4=; b=Kwycc4HvYwfW25ZlZaLRjNIj07
	MrX5/qkDmTwo0FTrnj1sgOu/+s8mhaKH/33RMER9ZSw/wgkBoRr2J01wfylJZt79Fg7F4m3QeA9Do
	LQX7C+c+OtUvlMLTZO6kHDyFqAd0yxHAiA3ZaT0DBW/hiFIg7x3sVs+vZu6NB9EB6tMw=;
Received: from [70.80.174.168] (port=43212 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uEsPH-000211-BD; Tue, 13 May 2025 12:23:04 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Date: Tue, 13 May 2025 12:23:00 -0400
Message-Id: <20250513162300.532693-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] dt-bindings: display: bridge: renesas,dsi: allow properties from dsi-controller
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Allow to inherit valid properties from the dsi-controller. This fixes the
following warning when adding a panel property:

rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do not
    match any of the regexes: 'pinctrl-[0-9]+'
    from schema $id:
        http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#

Also add a panel property to the example.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index e08c24633926b..e0906a46fb118 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -128,14 +128,17 @@ required:
   - power-domains
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/clock/r9a07g044-cpg.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     dsi0: dsi@10850000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
         compatible = "renesas,r9a07g044-mipi-dsi", "renesas,rzg2l-mipi-dsi";
         reg = <0x10850000 0x20000>;
         interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
@@ -160,6 +163,20 @@ examples:
         reset-names = "rst", "arst", "prst";
         power-domains = <&cpg>;
 
+        panel@0 {
+            compatible = "rocktech,jh057n00900";
+            reg = <0>;
+            vcc-supply = <&reg_2v8_p>;
+            iovcc-supply = <&reg_1v8_p>;
+            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
@@ -175,7 +192,7 @@ examples:
                 reg = <1>;
                 dsi0_out: endpoint {
                     data-lanes = <1 2 3 4>;
-                    remote-endpoint = <&adv7535_in>;
+                    remote-endpoint = <&panel_in>;
                 };
             };
         };

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
-- 
2.39.5


