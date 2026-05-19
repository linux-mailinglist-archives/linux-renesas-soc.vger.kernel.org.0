Return-Path: <linux-renesas-soc+bounces-32788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIq+NuAaDGpJWQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:10:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E7579B4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A811730362ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 08:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768813E0226;
	Tue, 19 May 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gt5T5Uva"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5F3E008F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178154; cv=none; b=qeXwLqpJjuG9VEZlRdk9RgEFFg3Hf6/MGUc4E9GWEyiOr7r3ZsLQtawT2y1rTLIQmdpnIPz0c1IFRn+l7ZxSgNwJ70iXTCGZQJxKWLF3VJvqW81HYpJjRodxSr9Cy+QSMGJ5M5dqJaUZCbnpdKiG1nNUAOdkhI4t+2mnhhxGki0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178154; c=relaxed/simple;
	bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBKD/2wB4vR3mLJUcQihK+0VGAmghx3zpYR25hgBJRfd73C4pJzIFIPSZd8AQE6p8/T3LVrUqKBSJcCthVc6E5q9Qi3QNT3fPhVTQnCPMtMm1YEWgFxcHQdA/Xmfm/LvO1ISS33ALXQOpgpb+J8+XvC+ISsbKzOhYlSd3igB0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gt5T5Uva; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48896199cbaso25280345e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779178151; x=1779782951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=Gt5T5UvaYKR59oQw6VIVSGo6dvg0w6Cy7arO0EOIod4kVaDb00A7IhuOpZc2uIq2dJ
         1PPZHRkVB4HiSp/EcEmRzwbZ1Y2VXuOQATD/QZHLBC0EESpkv3CGHZfPaRm/NNzue6hP
         MRG29rsa5ex9LkSVC61z3JZlt36S3Ixplc2JpL2/qzq42b8WSYGDdFvY2KJQfjPWH0IS
         5+UWCOsBpdAD8WTWN7iuanFzLFJ8JS+w1fdUtEutEPleD4aLhZr0b8Z5wwfsQ77/tA56
         AjK2YUx55L88lZoGlgceToDj6G3AHFXOTSuU0OCp6Oq8V9tw8FPMSargZiMzzrOIoBuA
         VDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178151; x=1779782951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=HV22c3OZEdX0Cyx9Y839Ojy4II3StmqQ5uQwZhx1g1kQ1nCeNBvHp/AKQhw4x+bQ43
         wCIDOug+6TiJFUXKfMewjId2qx9S+uSGw3fZbroWFZtSCKeEIeOCRjpbgQ5Ipcup7eAK
         kcrWYpEtw61NbwoLNxOk14r9IyKMKOsh8STMFaqyDeug+Sab2gm47IMSjAxHCKzeCdCF
         M4sX1xraIWwsvJdVnddVO6FhRn14FPamhqlQ4h+l31O0S33+lgHYeOflMQhiVT+dbBsd
         LLJfNlcJTgWWLrEWx3Uw7wXfE76itNCjqE8j5ZwVSOOj78xePBPR8FZwwNODbhTzzvOb
         MBEA==
X-Forwarded-Encrypted: i=1; AFNElJ9EZVfIYbNdUPVCl7hchXsMd2qdfqqN+Xa6C12dNaXvlVGDZ45qz4Hvwc8+w7ZUiTKx5HRmkrt+wm5EgvaySHZflg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJHLgcCOI2HSkk8J8titCOidIRmzcaW0YqgmiLR2ryF6ihdS7
	j4NvfM0w9DUhFWo/cxRofpsVepjbOit19IribajCBWX6ZNwV3WX1uDiIYnEBGjEMAYE=
X-Gm-Gg: Acq92OGU1FHVRIxDYcRWxkE/6O8KN5wDruH1z7KTcoiCAhiHzfBVJPS0j2b6Iu8ZyCm
	4JcFtg7cAPqzdR6Uf9b3nV8nBRKYG//vsKRvgY4EkRltFarjO4Jq1f/Rghp7wX/U2McUMNHvePV
	5Av/igIoTPeFszf0XmrM9O0kGn7EBiR4lCEw2pGYT6/vlAjhJWVnVDoIGpip4ZtG/tCChRRXuOD
	ZaZGDvnhDSY29FoYU1DL6wJ2gP4p7XyG80Wj9d8aklukh0+A55lCB2FsQoAhS29NEBZeyHG75Py
	Fksxnb63n0hTrRX0wFDJaR9dPv1q+193QZKB1CBbyeOF3VexLVT4zlsEYQc0WmvNjaD6xvsZ4Xj
	vZFzUEqww2vrkVx7Mgoa5M9Cly+sAde2prZSnp1LsTE3Zo9WeS5cXZ8+SETMhodndsc/Etbskb5
	uH+QPar9E/mjDngNhfW/e/DkLpBtiLYc4TB2ICKIP600cU
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a24 with SMTP id 5b1f17b1804b1-48fe66204e8mr265626475e9.31.1779178150834;
        Tue, 19 May 2026 01:09:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm42856373f8f.19.2026.05.19.01.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:09:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 May 2026 10:09:03 +0200
Subject: [PATCH v4 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-1-b8929af5e951@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org>
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDBqk73LPPYI327526USPaCyHJw20Vj/4ghKvO5P/
 Jr/lFtaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagwapAAKCRB33NvayMhJ0RKFD/
 9Jfwj40U0BJVK1K6/jNsfgqHv2oeaPgZ4Gq91/o8rZDwuIKknD5e+MVYdb25pkr8xm92c66LqRSBcB
 NDMLfrfbOfQkdtUZi2ZQq9ktebe/N05dlEF6DBwCRxpTv9CGCWmtcyVrCfWWjcGrMA8rJtnU6GoTWa
 K935miaPSGwpx64Ag1Zg4vqMRN4lYrLQKW9d/Jkoo06532/kAqGcXpfmDAMqab20zWJNDq2ALEGZf1
 dbxypjJFbZgBsGfJXfva42ExqdR3OCmxbkl1PwFOYeuMrI5yeBUk2vQHfVcFgVXLIPSEn2/7wXCryb
 MzmBNvCrsP0BPcLGYLoHFkp5URrQjQAh8M4XsFjkfVMVwiAl7lfm1DG3nex501ZE1PRKFynTHv6OQy
 +Ta227jlmeWNeC1Qbwot1qyVKiHb6I8JURqDABOq9+NfQ4+sy9jaPvxfNsrZi8w/bJWDGkIS+1yNuj
 zsCeSLkv4pvGel6wBZPDYyc7DFWtV9Kwr3U+583dLSESPSXIZsXVgmZo6uDm9E4nMZjs8TavTpjAHA
 eB1Tusgbg9GIpQIGbyAZ0Nb05vU+RVR9bh2F7xFxdgvGuUnCHUHqFUgYfFcbAZdvtWyxAJBClza+GN
 rmeZV9oKdetkGPsGcj8GjTCqmJ8FR7UooXQLxTYzU0PD6fFzsz2Rocjs2OAg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32788-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,devicetree.org:url,0.0.0.0:email,0.0.0.1:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7E7E7579B4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..e4db01f88302
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,97 @@
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
+            vsn-supply = <&vdd_5v0_pos>;
+            vsp-supply = <&vdd_5v0_neg>;
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


