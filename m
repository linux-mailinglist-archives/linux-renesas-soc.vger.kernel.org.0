Return-Path: <linux-renesas-soc+bounces-31822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kwjJHYlL82kTzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:31:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA84A2C4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 833763005AA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4149402B9A;
	Thu, 30 Apr 2026 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TEQb72Zr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8B40245F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551746; cv=none; b=iyf+fcQz6FkTBJeQR+taMNosy6V9Qb0X1gQdLG3vre18dGduDTk12ea7cNwvq2gE/Jy+9hLElbnQs2+K9QWFfQp3kOoLn5y0A3c5FlmJoYim6AVZ7KFWlLBAZRlIWchbLRXiskSJbDWhAhkrGwrAYPYj0kwEpzg+drOPdQzcaEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551746; c=relaxed/simple;
	bh=+V9qQskvFnz+tQNPmsOKTsUJcit54OEmV1aigZgDvfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ksy+ATuHEZnamVDA5kCG+0B/Ots6o1S8EdF/X9T5cdQtP+1nHO6RoxJKC1SdCD695xvhapQwmRRK9cL6EPRf91Hh1mcdJ7KpU08LZhk7QMRa/OXeYuw814v5/n9VkXxyWVGnkPI7YLnwQvQk7ICnwl8K+SKcE95q1IoBzdtk1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TEQb72Zr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-448528f4e69so552638f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777551743; x=1778156543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqSPEVNWdzhGnvF/jE5y61/ywNE5WHuXEKLUJIFyprQ=;
        b=TEQb72Zruc//naSEEt00mcBFQCF/P3NR9aCtfycPfMcIbV2AlKJ3SZ92T1Yu6jvJcl
         LxkbLhcpeAg3FDW0xYeHYbTxr6v85f7RGMgIag/NZnLi1ILkLWNVvKA8o7qNFh6rLYoi
         zL+68Ua3n5nfv0KHYtJM2qnc2fRd+p0v6TfV2q7U2/xxqEEQnfA8AdWMBes53whGfg3L
         bc9y88ZioqrBf7T4kBdiBMExmtEpZfQobrrE51qOoBaCgm8yJ8G2aOlZQPVzWHzNOhxz
         wpoTf7jOCG7yFaVOhMbc3UD7eDc3ED9z/Agbj1PCkF5SuCUeHC7v1+nBBNCuipOTAjJb
         hj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551743; x=1778156543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqSPEVNWdzhGnvF/jE5y61/ywNE5WHuXEKLUJIFyprQ=;
        b=rMs3Fl8NxJxoPksLQQb99SmuwOIsLOLjhKTFeuT7CCjjACmpy5z3ZFbpDr/E9hXxH9
         Xf5cwG+DSQtinnvVwuvpmUkOGQ0baI/hUSEvf1wNrDj7auEgo2NS1QHrEz/Quvu21g23
         IbiAb3piwqCHcBNTFgD/GxyDvGkAdseCMv0pr2+2PgrRQXBJIK3FQIeqmWDM3abGmJkR
         RPClzWwJs3lrp/DKgw3Wqa6h50XKnHuWYbrJ9TJrZbzzIhKdwBAOPnSqaK/tbCUeclCW
         HulD9DmXoBJB7Pad+WzH6FTNJLxXAtRxtTCFbwrlUHc96rYGr24RiLcNwVHLEUXFEZVQ
         hGhA==
X-Forwarded-Encrypted: i=1; AFNElJ/0M3KHYtHdMY0v+daEteTP3SHhByDRDic7NScg81/haTTr7tuzFGsLmdor8fGIVsbcz3/mkFlq2tZL+v2etYciGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQyHrYuPjtKBezHWQqmMhlmwZbDZgUriPiR7zq8xqOiLrxpR5
	7x+XLA789E4Xzy8iL21qqKq5DEtrR29S2lqN349svmAXp+Z5khvfRuTSvG/dhRb2NZA=
X-Gm-Gg: AeBDietzLfOoPqza6kbZt395iHxDGpFBgy3KWUyMFQu8TjjjVNnnM2CQFbUVlupgvtp
	r1qTWLQgy1A7o8AnXFBm0CocaHO+5WioKLWE6/DV9vujdX+BPFAHtWup2IdObwMSLvov10qfjdZ
	4Us6D1Brrye8ugsiOjS/xiA/zalblstCI22lAMdo1W8YVUJCrht28FzqTCajFCE6BXfVYOF2RHD
	raQ6WUPn+wa1//TSqrC9ad6Cs48jQb1WcC/T0JVbPT+GHG7l/JPzClpL/ls4LLJl6Sz+CbU+0K4
	Q/VjqzmRrm70RymJSlmn83lZcFMIYNJ9TMzYEquDqbTniPBRMZAmGATY+ARQQnrJKkxwll0wMMM
	xn8/CyZUCqNmzbPZxEnjO2xXNBT9GGgQBS3dn12D1fMV6FN98uZFCE5/eFz++zicMWWRfB88UKl
	lkS+3a/IVF0wwVXc+EC5ufrvq8+jHMlcI9YWHC3KAyCXVpPW3gOrart7k=
X-Received: by 2002:a05:6000:2c11:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-4493cc3f4e1mr4471272f8f.10.1777551742666;
        Thu, 30 Apr 2026 05:22:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5afesm11163639f8f.30.2026.04.30.05.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:22:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Apr 2026 14:22:17 +0200
Subject: [PATCH v2 1/2] dt-bindings: regulator: document the Renesas R63419
 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-1-91ac10453d0c@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+V9qQskvFnz+tQNPmsOKTsUJcit54OEmV1aigZgDvfc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp80l62HKL9K4J8hvdijJJZG2PHZDyEsO6Po4qCx5N
 qYlggpaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafNJegAKCRB33NvayMhJ0VJpEA
 DJz3x/HNbPOOaSDgi5ma3eRfbo34RgGYD2BONqYCSL937K4MZUoE+Qtu37N4o8LMRJFit9LCBvUmMZ
 bQrYz1slpPxDrB5JiF6TGRJbEwMfT12naqh9PFIcltOXA7Si120DWsUlkscR5QV54SXCOpe7BJdgYc
 pkNounhKOyYPEwxKBJo4mT6nUvp4JsQe1bO8BCuJDqj9xko+biYTbHmUJXfHTg3qhWSmPkrby+GtH/
 YB8RgKXTwx/YL/m9AcPlNNT0bOfFUvtufyPdVvXm32YZZg2B4J2QOlMCl7sMdFLrswEThE1kQ+y8Cm
 MviQow9MWZpguavEO43ZwJuOz1GxdIMCKtmQ634eMDljyrfF6UcEr+VtndWP8F4eiuZqViFXjhugxT
 5viWPg6BDNAQ1XzeUKHQ2UK95U5ID7qP6jEdtZFztD5yydyKN6NXi7HQhlEyMN4svunIwCqrFBjs9Y
 Nt8T8wPyFC/MtRDqzGa08O3bBeyYc42Gpc4JYWwHDULSzryGRF/Bh2IhLW4pPOhUbgrCuwgtEpP2d7
 gPhrxKf/n0pkPmgHds331IEKc8pkHN9GkipVpC+5nloeiVbFUrv+HKYq6Z/t4/FEVCHZSwbAJobvMa
 YbfIxfi1Mm3mOpxFPnkBW5v6sfmKLla8oRxwGmDXvPzsQ8C3Du3B6eocPiDw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: B6FA84A2C4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31822-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.563];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,linaro.org:email,linaro.org:dkim,linaro.org:mid,0.0.0.1:email,0.0.0.0:email]

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..17f166db3ca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,93 @@
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
+  rotation: true
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


