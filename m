Return-Path: <linux-renesas-soc+bounces-34417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZBkfB7H1PGobvAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 11:32:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7E6C4402
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 11:32:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=hVxOgXTt;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C203025D09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 09:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A96386C36;
	Thu, 25 Jun 2026 09:29:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420A31F9BA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 09:29:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379755; cv=none; b=Uu9rEQ4gGSTGc8vsxFXrtNAtRseeLEKXklw4teOrulZloYyLpUe3slD8VDGDjqbSpOMks3LQajCAMK+X9psGKnhxan+MJoRFeHh5ietGJ3WSzSxId5dtE7p1yB/S3RfirsYdc2Iv+cwYelWw9qGXhNDAj3JxmYjfFUFYXjE3Ac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379755; c=relaxed/simple;
	bh=Zq5948yoVNWLdfl4Pn1AIZbbP3FPXFuxs6toZA6iUAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLJUMOb6X3GwbXa6IBchWRr6tjqA1PSrU569T3gV/aBCPUSI5VRFVkiJe7+5BtninIoHffFts+jX7FiqiU6r3DVKzXTkpGx2gQlf/23wXW6i8JvE6YgueKNY1XnQwZcAFVX7J69ireWw1Cy4baGn4yJK5dszSd0xohLR6I3Khn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVxOgXTt; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso20168085e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782379752; x=1782984552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=hVxOgXTtXhd12xIaYg4oFrgunB8h2L6zn4wTLVmqDgl12jFZGG8GAAwOI9TfJmP4fY
         QiZGQccsxqp2JBO2lsgx8g7qdxWpG7tYbzguIBLT9f4owGIHESdg47y8qLVDoMexV7UP
         a99Y05x1lLWYFGn+b8qLrTUElR9aSSvprNoRK+H/2cYj8tlhxTB7bjfqJVOCHq7CJvxB
         Nmi0R3e/V+0RJXr8gqgMnP5bDw1vdNToxgVT1Z3cesDfeI8iWoBPawHIxYs/b+9Dkv3K
         dXBK2CLHAN36CcNyoPNxyE8JNj3fyPFI3b7j7M/KhJEWFX4DhEHx8QoeMbm5Czc4U9FT
         ftKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379752; x=1782984552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=B2yQzJEbdAHF49BGFUvu0QBnkrJgI1JAIWKXpbJaX1OtmJVZ1HLBzewVd/FxTYcsfp
         0Yg4iUmGCNy3Q7c5VyrcFAaYzg6kVjXNw0ehgyersVy2CYrKvYbv2SBG829PusahUEeV
         wc6N7THZCU5C8xUDrUwg6UhELVx31V9Hv0H4aAoYV6zcWMeFiDFARyefQh3KAB6O0NKW
         OYKjRxgaJqZjlU8whc9RRgBqpHdrntbiTWjJHBN4WvLYTFzLDHd4zi82fJFgvXaoGrd0
         ZYKsn63lDDDyc8ALMGwyzboLPT/sAsViP44eV1PCcia/DaCaQBqlysGuUf3dzQCFZuTN
         3oMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dLsddY/TBaehOvi8y+gKrRA7Voq/WU9ljMGUeoNOh8L5JAOjAM9YhaUxnL/5TZSTnKEjSfkquWIhE0wsRrlSkCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPUxc2ke/mw2HAm3GPNpuumZhBXZ9akmhyrQh07zvWjoPU9n3J
	fPuYc9xhm8MlZfoT0y9qxo2965cpHOfY3w72j7JjUe8+jrGe5CmPkVXSa/eOyPyFO+0=
X-Gm-Gg: AfdE7cmINajMB3LXxHfXPiO9p5yEenp4L/kR3TqhKXByFrwpFg6sNM38uODCWueTK4j
	Mort9DX0/QneNwCEwIlobJduttfVvMx7fTeAw+vZEWYJZ4Meud8edbTr6kHieIwZUI6+sP6m8gr
	xPHAtQAisyx82p5Ut6M8PajqdDUY5pNLoOaOCpvj898EpXJD2Zwbsx6Qijjwd6jK931ijxcpvhV
	tLbIiHO9Rg59yW28++qHceuWVFX5Q3pWINMg6rRlx+mnjs9Ew/YUNRuhTwVO7bnaKX672GXOxPK
	mjpn0BZ7BPXPQ/wN172sPufFzhdO8C+M5roB1XBrmioMtJ/rrukw06f5MfzPUgGmGTesR+HA5aB
	rdCLI0yfepFWVjQyLg1efW6SJVCtLRFapKt88c3rKFc1KXN519CFpP53yBLNGcNcIRhO2CxFfEN
	fGT8lwyvhRbVtskyh4pYMjhUHjsANNbuc7d1AK8pn9TUsZ
X-Received: by 2002:a05:600c:3e19:b0:492:4c5d:4db3 with SMTP id 5b1f17b1804b1-492668322camr22201945e9.5.1782379752224;
        Thu, 25 Jun 2026 02:29:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926544dfaesm33846195e9.2.2026.06.25.02.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:29:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Jun 2026 11:29:07 +0200
Subject: [PATCH v8 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-1-8570e692143e@linaro.org>
References: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
In-Reply-To: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2928;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Zq5948yoVNWLdfl4Pn1AIZbbP3FPXFuxs6toZA6iUAM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqPPTkTeZqdgZmxqYH3uVuo1O4jxHMWl2Fsf2K52mL
 XcPjZkCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajz05AAKCRB33NvayMhJ0QZfEA
 DFwB+HpIp6G4Bo8rIlaXtFhEUrw2RIvmGm1WEliAXEYdOR6GgqRM/qhUGTUv91gUYufnqxOY+rV7TH
 VyiF0WTPqIAmZtkif6FpcWibzJpPNXDgTfkzONXv7L+qGrieHM3b/6tCDdVftMGj7Tn+VK1spfoPu5
 3dEGHeCQYoS0vss1uqyAAEVWGjKO4gpZXk/YFLmDguZD1aTIFPfcikuGpSmYPpp2a8bQv4FcjeCp1R
 i9zgixfJn4DJ0OEzA/gQZCSPhpWyFr5V3/SDdzfQJQvcz4rpAHlNJ69/7X3eL85WtuUXHuXF6uT1Y2
 1yKKC9X7v8ayyYkAOVpomABJ3ppZ55wbVlt/ExODC/n2gFLiKLuI8CXXU8K5LVurIqSCnmW7946IS0
 FwwinWnDJE2h4Q9Rq/FQF+Lw9egomlnrCGsUHGsO4icQTaJsAIn/XM27c06MK4xp/wT5FrkowV4ahu
 3TXlGQNHqo77Gsow+a0od3GfwYtyQeujXv4cEi3AgBeokDEV8WE3P+uODPLgUy/ULNxhu1TMdYXivP
 oQ5/e4bmv3ljFwB0HJw8p4XaSBRFo6Ce8plzbBMWL4WYMIdYmRyPqvbfdNPurJRQ/joLd7ygkXwqmQ
 kYDgNbQ+c3+Rg01Dv2oMlJiLh+tKlNQLzKCmE3NQ02cyXatj2vAkSNp5sTrw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34417-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:neil.armstrong@linaro.org,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41C7E6C4402

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..adfdd2c300a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,98 @@
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
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ayaneo,wt0600-2k
+          - ayaneo,wt0630-2k
+      - const: renesas,r63419
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
+  rotation: true
+  ports: true
+
+required:
+  - compatible
+  - reg
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
+            compatible = "ayaneo,wt0600-2k", "renesas,r63419";
+            reg = <0>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
+            vsn-supply = <&vdd_5v0_neg>;
+            vsp-supply = <&vdd_5v0_pos>;
+            vci-supply = <&vdd_3v0_vci>;
+
+            backlight = <&backlight>;
+
+            rotation = <90>;
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


