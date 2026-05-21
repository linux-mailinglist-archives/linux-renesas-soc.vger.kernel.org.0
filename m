Return-Path: <linux-renesas-soc+bounces-32898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GElBNR6/DmrXBwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:15:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F85A0DF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A4DA30475D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 08:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB693A5452;
	Thu, 21 May 2026 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oE74IVUP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C443A48C8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351266; cv=none; b=FUmC5bPgZ0gZSrz2Ly+UQl5EEU+Up1ie0QpvP672HQAkdE3Dibo2Thsw/GFcolYguz0UtNJUElUu1koKyMkJto/BCuDdo1NiAxIoyt0l/8AwEaYCpL8zdw5nK0tFHeOHCglWy/DhI8EgpI7Cebb9GtMLo/bCyt0xIs3+GZOnHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351266; c=relaxed/simple;
	bh=vFhP3FNbtu2wk3JAQk77ufguhpweIJKES0bOXeSkpV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YX0KvPeyXasr36OarAqvVtdDIyJsYl4Mrm48PXPHukMAC5t3eMMunJAV9b41QzH39g3vVU0HJUJyygvZsgLT+cd3lMoaZeODAZit9oCLUVr61TyvGX+yeLNXxX27FEVEm5Cyhfgbguthv2Aqm5+P24V8oxExg6he84BcWPARF6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oE74IVUP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48909558b3aso59370815e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 01:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779351263; x=1779956063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfn8fwroLe9/zD161wrcPghnqU9tQEqX2zqdv84MfM0=;
        b=oE74IVUP2r0hYW+W3u3jLmr25DHyZ9xDNHTOJLRbcU/xRegoDi2wO9rmMNNVXFY9W1
         0ItxEFkKJMbSAxVv+WTCzjNzmuorTjTUyF2L3kPXdlWmXjN8wD5ymxIxR+DIXJXHcKTq
         cmPtUwekvRmh0PDQ1W4Cr9r9eLh5XIPsLF84Ust75CHcwVzjU9gZ21d7hz6u7LDbHg8u
         cCzm2RLnhI6ic0YZqbIwdbIuugqWTIzoeqwvOBS9UyUvWVJ3rfSBPE3F1CtYOb9TBE7j
         3r/3ZAU8danz24YEPH0OBHC3l4Fbhy4OY2W3ADcWuVX9ymcAZG0+QkZsPgUf59BxpsuH
         WGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351263; x=1779956063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xfn8fwroLe9/zD161wrcPghnqU9tQEqX2zqdv84MfM0=;
        b=h0x1RctegrzXxgAIZ0HutpdXVMMgMY3ss9r/0Lm9/5H3NPs3OvZEcT7h4emGmqRJeI
         skKH+0WVZV98zRYoE99bEKKe3IpEPxUT/DaV0oxZ0B0t00hg9UMRq6vY17g+f72jYUg+
         ujKMPlpLGS0n5unzuRDDOkoKh/Y7DbPvzYaPZ/ipmvqwJlODkrgTJM73t4dne/YVLnaH
         2aqyKexv4ITMssUdrCc7CwsDcDZ/eiKy7auwP4APVQu7lKF5NjnZsrST8hwmVNMkz+re
         g1VIbeD+QZNnwjiF/e4EgMKQXnDleSW/M8L55Yw71A/oaJ72yjAGbiahoHihKkE0tOP2
         YuQA==
X-Forwarded-Encrypted: i=1; AFNElJ9TkO8kvMGk+0RhYWwWjlhlcAsvqWAFGuTrc21NLYZ2w3MbBymXKBOatOcVv2xymP7Gwz9cpANE0VLGSeRJhJXyFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm8wUnvSSHo3jvLgCfIS16X7sv+h/5B3QPUeeoLZUDBwHy5gNz
	BHq2OffFF2NEzOQzhFNOMUKJTO2jQJ0Qp64c8/8aW9J1+G1lDKJFEiurID9uf1agrgA=
X-Gm-Gg: Acq92OHWc2LmAUfpKZw+40NdrFL+XJMdqfZVx4ZEQ6/3LB++TQEmLV0eV3sophFlIBH
	G/84w+KTLUx2ktCeU/G0NoSMM8HQmhvBlFSLTN6pMWCdARjh4wQ4234rMda2/1X73DKbbpQcm+n
	MMkn+9g50Jb0k4mNx2TuJkw3Mk54q+LjbJX9Cqp8BfsgQW4sjufaFotnzGQO8EzqRfVtDjfPgag
	qqnJS0KX38xQPvpC3vMLgm8BKBFuMwa0OGPNoJo57PIwjD1zJ/fHQUbEd58ACdMXXilUiOC/MFV
	FU127cX6EwhcG8NnvBgQwzvO+lsFRFzHrPN0dyk+9QMgJNZ0wgYRue8+6d47kYz5IdLeNMn5D1c
	M/PXiichoojYu6EGtciuo00V8KSlOlW2iSgBrhDoBogFSQ1dlfdY01v4Rj9WkkYSkFxmkrMyf5S
	DdA6arDvlOOBcnRCM0Yvn/S3gsjpbN4Q26Nzw00wefaurU
X-Received: by 2002:a05:600c:1f89:b0:48a:5501:7995 with SMTP id 5b1f17b1804b1-4903606b594mr21078725e9.18.1779351263093;
        Thu, 21 May 2026 01:14:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dab28sm1056384f8f.12.2026.05.21.01.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:14:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 10:14:19 +0200
Subject: [PATCH v5 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-1-dd5700299390@linaro.org>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org>
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vFhP3FNbtu2wk3JAQk77ufguhpweIJKES0bOXeSkpV0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDr7cxr1fRhPMxGRAc7BowL2W/SIwenTGbKS75sYb
 a8XBmMiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag6+3AAKCRB33NvayMhJ0ctoD/
 9cEh6BQJAMyFBbTUgaPFbzSw2ucaMOPuNgLinSPz9d+441wqtqlF4qXc35jaWlBrPx5f1ie6quYPZ6
 YKCIIQfWFzak8SIKcw37kjMJ2dK5Q90KnlrYJ49m2Jlhbh/ZLuS7hjjNzA0k+vB1wT6vsvV0tfq7w4
 g2E+X/ESqRB9QI2bjH6WQHMUrGe6Mr5CV4YGAiRCwvM/U6OgpzeAlGx7R3C9bN6VTOV7YWz88IUEpq
 RiEFpHxVaJzLQX2irLBKPq4aJ/jO0WIDfHKp1A6aiTFSiv8TEb647cCORkdZe+3opUZr4QeGxUDfvA
 9nXv/S6SVgJMaqUN8JLLi1oVMRbBQ1Md7ko5ZLl9Q7fbPQKLJgWgTAZJfjNp/lHpFyByunZpc8dsYg
 ge0ALs95TFF2mGA56XdHcQz0gDFogVhYPEW6+Fk0mo7wG/EUm7n6p1G4RE+6SOk4CCoAgSAsLvEMqE
 2axBoh3cnFP50WsxH0M8HazYB4J3JhEz5m1m7wZ3PA0mpPjY4UreXVPSvOujnQrXseWH2l/er0gu5G
 lfqzEr5ShL/snCXfcMT0F8OPP1wzMww4Zon71jO4yzBO4ttfJyJ3cbqgaVhluvGoKIIYcXkDBF7VdJ
 0E+ZhHKUUg7Zfkm6wXrZu/aTw1Ksj/EvA/mI18SA0Yn9iXOpsfvfOcCcVEVQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32898-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,0.0.0.1:email,0.0.0.0:email,devicetree.org:url]
X-Rspamd-Queue-Id: 4E1F85A0DF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

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


