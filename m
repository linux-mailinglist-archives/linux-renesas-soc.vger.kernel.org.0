Return-Path: <linux-renesas-soc+bounces-31709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKUOEznB8GloYQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 16:16:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C310486BEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 16:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE0AE301D1B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 14:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BD743DA22;
	Tue, 28 Apr 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hg8IG0xG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506743DA5E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385155; cv=none; b=ARX2ECowslsb3pIwyiljzx+TE5pOToybS/6NJDmtKcSbQ4S510hQLFdVcaMRes6e+wJdi/km1Q8LlOTpAaf+Zzhfn4L//Rfzo6Xk/7jw2zzNepftHtmqbNhN1S81kNUdZ6iJqmEEAR3EtJ86eZFU9vqlXg66Urt+iMchAtkEzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385155; c=relaxed/simple;
	bh=8AhOD+DA7zhgZsiv1DYImW1qYoVVKswrctJNPegNwkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnwf1fzjkulpA9owAK9RhDPbyEzFBM8kUXwp70LnLTf3pYE5JBzSaFzlWAGkP5F0YUVzQMgvU3gswIZ/NjHAkG2CuMZvx/e3o+D93ViQJoRb1LPwJRZW0ubSfBqY7C7U+vuHQRN8oZS7PkIFtbk+VE0eqDPk/7dwf+tUYybkWGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hg8IG0xG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d77f6092eso8023834f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777385151; x=1777989951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnRMYZk9AoTLKpYfdj4qSypPzAu9CBcixbEqmVErBwg=;
        b=Hg8IG0xGqFOUvkjxhPYiBMMGLAraSykqYgJmeGr3B3qY4PXKy5enGSQy8Tp+EbQ/3n
         jEDhIFWr8TrK/WMltdnLoBfR5+M6c8sBiL3KxmJ51VSNEadsie0o/WjGTFMQTTFhTX4q
         shclyDhgK8UnoXCCzoYR/OGaapbI9XfsXj/aFFPTtb1qkaVlisXiqIHTqO3XK5bvuumx
         DcOaDmL0Aaa5lFz58QYsxsT72Tq+RZge5RJQibAV2ctGKy3ZCLVIraga8seJ+z3hCQYM
         Vu5HoK6Nb+eXGXJkEVhebxsbU/kn2OtR9R7/en7CdpwAEYzYMM+iSffyAQswYeI8Vdpc
         IFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777385151; x=1777989951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FnRMYZk9AoTLKpYfdj4qSypPzAu9CBcixbEqmVErBwg=;
        b=lebyEbfzrkYMcvdWaorBi0QiXg75zxcYSHUzrdSFlxAafl9ChL9mruOIo6GpUHoY0H
         NcCnpg0BOZyM6dgW0vky3nJer3uZcm1ZSJXiiQEpZB4bqudJDirmdwYQfYfYOul7lPlN
         Sae85DfsRY2DCQhTigiN1D/NGDdo7myaUulpkdnxpke8O4FZtUkgC+Gi1O7UEV5KCgBR
         /irjqP31sBnOZGAhAz19vyr1NAL69AtmJ/o4Sl3KJpUH6Nz7vY+mvcJTpIvTCjXsIsVB
         wY9IW+0OMhZRDeSxWwN1zMq5J42o7zdOkujTRWFNvJHR24pVRx3YQGiLUSvsbBrPlnTq
         3vhw==
X-Forwarded-Encrypted: i=1; AFNElJ8mP0VTsJTZzk4yYfy0EZw8G/O0qTn744gc23arCdms7gkp4kk/+KAt+5wrjoDXb5x4X2luKuMtkVYPfv1bRu6EWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYUzULVgKn/2bZJWz+N+utQXFEugmYDxRZWr10R3bND//Z6km
	GdvcjPrVS855hesMaqCk1xRtUrws9hNic+c7VDFrhtg+IIbTS2y+6vDQoWbmjj4n0nU=
X-Gm-Gg: AeBDiev3UogNiNXWurIwqYEyCzh8be/wrN/eFXjU+PSvDobTTc39Fod48qu7w4ws349
	dI3lFwz62b6iu98oBwIkVKQHZNGG4lykTzR917khf4DLBjRhh6O3xHyhW41WXwk6qzmNFuYUWtG
	yn4D5cEVtyu6nPjrviEpQH5v0sriFbKoiV+Z/2jhARb4E7dcbCfAocHEmBfRCDNO/Vd1suJmWSy
	qiEYr2JT3s0mQ8dBSwYXZ25vqhIUkABZGEWop5yQky7nwgjSOedMaV/nLPwNTFRWH1DEeVqQnFV
	suiF6EeeGnmrPa0pflmbXoDl98Ap0YF44vcNEWmw1fXcaptFnXk5aY+LhJ8thU7oLIjqAnj9IRl
	cUoGl5vwXNFUuueuelSTAu4rqIVdiO6wk4gZ/Z+/XdREdIY9qie3bCNCW01iJZA87hd+dSr1K3b
	iQIeIj2ZTKxDIzSaCbS1x/zn3ZEm80lWfCdYbjdvR/KBqw4DehS4lFm/c=
X-Received: by 2002:a05:6000:2f88:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-4464b1b8620mr6133552f8f.32.1777385151303;
        Tue, 28 Apr 2026 07:05:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4464004ed80sm7143264f8f.34.2026.04.28.07.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:05:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Apr 2026 16:05:46 +0200
Subject: [PATCH 1/2] dt-bindings: regulator: document the R63419 based
 dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-1-981eb5ab5a51@linaro.org>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8AhOD+DA7zhgZsiv1DYImW1qYoVVKswrctJNPegNwkA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8L68gmergD/mdWEyvIOSW4ZX2Dqq0B1E4+WS5gXQ
 pNG2cpGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC+vAAKCRB33NvayMhJ0YTFEA
 CEo0fnwHQ6I5nJ6bxVfKUkU5SWUTJ0biC77jpSou3g4o0ec8qrm969D9GoXh7zh86DfcfhI0X1FMIA
 W791j5j+DlQdLQbLnJ2M/hTHmsC0iNv6ojbU/ZT4kRIyOJzduyv2Cp/pa6O9grXzWtinU64vGuajCc
 yF9x6xXbZ64z/7cRI1Av6dXVlT7MbrypH6JOTV0W3ne8I7PgwX2y/yBeEZySE0KhApLahfsNt1cjXB
 AZG7c4qM7aqotSuvu8H9pbgmsqNJvdCixUTPDcud1US/6Z1jp3nickwrvwxzAT4kpQ4kWRH27nL+y2
 V9K2rLjUVUGCUFbdkOwdPxw8KJvhKv44yN+OMCpF+3voiW3AeyQmEq7EOF3NjN4FEi5oUntHQR+A9Y
 BNAF8kPfvuvXl7LosB/nhSm9Za1dAPh7F26m6yVgky8nIvJ3mpv/SaIOwqC9CLMWXAg8xC5sKzWXin
 YnrqmA8leQBeGp6p0U8Y4olBs2dgS47bX2c3RZYdTs1pEDD8f/RDlnNZLR0QUsqc28ZgVGJdJfcjCB
 TeDLLmpjlyeQ+7WHJIiKwuKM4WCem2b+45VLaGqkAgEPRPqa+xpthYh0VhNwyztQbJ2Uh2IuGUfwRK
 g5FgwTWgpT2qxEyq9kb62e6Dg9JL2kuY6e9wCdyMZF8yfbni+qkb3S8y4OIQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 2C310486BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31709-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.921];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,devicetree.org:url,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Document the Reneasa 63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..5777930aac78
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r63419.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R63419 based dual-DSI video mode Display Panel
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ayaneo,wt0600-2k
+      - ayaneo,wt0630-2k
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vddio-supply: true
+  vsp-supply: true
+  vsn-supply: true
+  vci-supply: true
+
+  backlight: true
+  reset-gpios: true
+  ports: true
+
+required:
+  - compatible
+  - vdd-supply
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - vci-supply
+  - backlight
+  - reset-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "ayaneo,wt0600-2k";
+            reg = <0>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
+            vsn-supply = <&vdd_5v0_pos>;
+            vsp-supply = <&vdd_5v0_neg>;
+            vci-supply = <&vdd_3v0_vci>;
+
+            backlight = <&backlight>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


