Return-Path: <linux-renesas-soc+bounces-31926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEysK4VW+GnTtAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:19:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C65B4BA14F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6518F303DAC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 08:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A956315D58;
	Mon,  4 May 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkZFlQuM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32F314A84
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881734; cv=none; b=OCctVE7zfeq0PI5hlX8a8uu/svvpBj6OmwtKx35fLPZq6l5jSVheHIFOfCNvjDJyeJiht8pI4nH/AAEKjFsVMgGWK76QxaO07LU6s7/4dGqVPN27f+56IAR2Q1reGgMCbQeSPqM8WKOwX3iwFxHR5hxRx8u7Id2VdEVLkY+lh7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881734; c=relaxed/simple;
	bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBDNBaqFP19ShBCnQ/Xf/s2SV69pCYsR9V2VbYVA4mE6BjrHqGDXRSkbxuOXZ6xZ7Tz+FWEzMml/05g5Jz9vdkG/l55DXKdlqW89wH10xj64SOMznNeiwQy5KIR+ChhRHHQf9yTpwakcQF30Nl3gfOUz6kvMvXuYWRirk2Zqy+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkZFlQuM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so29672475e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777881731; x=1778486531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=LkZFlQuMQR5yYEVV6FdiYFsraFIDl/N62+hmTd6hS2UbW+LK9YENUtOqhnEHmNzIp6
         yg0sQwDFRJJJFDsPSxELpllMxl9bbxm5A8FdFYQKsH0sNC6K9KSrlIjPUl78Z3HDmNXA
         VuO9WIYY/Wp+2g8ZycNE/T93RzMAAK80HUZCE91RTDln2qKJxxdv+6/YLnpMKQd/4UgM
         FjaZz2cz/oB9mGdsXJXT8juAZexQHUlCz+swonu4zqVlBHkh7kfNTkQ3CTSiHclNLOkW
         oIGkjQFmWU7GobhVaz2FHuICWTkoXucBJPTLpbuU8478MauhMOlLwz8CuSgRtY6MDq+i
         PwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881731; x=1778486531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=PD2ATE1WZg2B1D7HAQGRQ0vl8V2BbOTQBMHZQ7I4K1PRZuJwe7SIxbmUq6LwA0OGWn
         eMPK1C3hvZYCkoa/3GwG3NN9nRbx2I1TKhEBkyzgHCSWdVH29GljG9IUXGMXgEkvCSBg
         ItCJEc5NsV+UCMYMsAgyuyBr1Bq8ae+1cuhGNlvOQmN6sUEwqcLEAysv2K5CURXwRT/5
         akMQRd/yvPiOqHAzvs/GRxUW//APJtY0PS35B4gaX2R/VDkTs9p96ZB+6gRsjWaGly2K
         AwL6ZwnzcvLKW63LT0PxFGdToGbvt0CQlhmzT8G7uPMVqKLiHywzVbDupfsID2vgQjZ4
         v2Ig==
X-Forwarded-Encrypted: i=1; AFNElJ+aKzi9vA+uMR4FqRKi38a/TBb7nifSpGRngMFrmbKQ9yk+0rCSxhWssVRCq8h8FB78dNYzNGbhKgz2t+EfkL6ghg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+6Ccx91iyQW4x8Eh5ayRDJJUIHCsXFllZegH+psUYW/USiiM
	DJhGknA6JVLpQZEmi5bl0pe6sGraV63OAalXDJhRQEXElkb6d/soqVTJxnkFnOAz1do=
X-Gm-Gg: AeBDievAWjj8HDPP27zjYpuUge9YvuLJj1w5olcjxvArUXqInjX4eXFEdkhXjeSIlcj
	CCatMK4G4xw1IyAqhlOp5rsAXsO51+nqVnwTFbqgfOMaWJ65skrfc25G9EIeCHDeSBJEqmn/pFK
	fuCf/fV3FFA721AtQN2+QH15fCCF1xTW1JqYs4vTZQ2AtXogCl3Zuz4+tNGOE5UMte3u7sJbeCW
	MnTSTkumIEpTNL5S4T5tsB0/2P9bvFa8HooudzcO1QkZfmMupwwb8ZHtI1YtlBHuK9EnSQbUsBe
	r2uAd3bDNngjDsTl8s0tGpbTg5XAa72bpWpCGNwD+TE3fx3Z+DuUoB699zRn0qBTlkwNNzLXA8I
	YjGQoQFqCyir8u8OFBEwnxLh72fu5UZHHS0E/yzsgmyE228PORdYr3E9uwY5b9d/MgaRu5Y8UpX
	RBUacRtWh+8M/HuU7FkSqSVsaaj15PyNzxHu0w5hAc7k/kFsCXDLyi+ps=
X-Received: by 2002:a05:600c:c058:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48a9866a998mr109269135e9.21.1777881731004;
        Mon, 04 May 2026 01:02:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defb3sm32255216f8f.20.2026.05.04.01.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:02:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 10:02:05 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-1-9f61cf24aebf@linaro.org>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+FKAAoSVmjc09UHBFWojXT53v4Wtjy9ZpMZCZPMZ
 czCRDFeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafhSgAAKCRB33NvayMhJ0VbwD/
 9vZSbesQ3rGFgA55pV4KHq7cDalHuTSxYIF2sknWBGKqZ5CAR6o2gNybDs6d6pcA9/4RBBi+USXznD
 NSEVMoxYTrBxwsBFA0Ys9qpjI0l2OBS3L05zW2d+UAKpunTHnKo9C096RI4os1ovkSc579xTqHKz0Q
 6pqySgbfz8u4QfVBKpMleglnda86hhMQGyxYOmvpir/R8qBv5NMB+LrQPjunE48eA0Z6hqHTMNkc4Q
 db5omBweQ9iP6K22lhGUtjXQxfwk314R3EY+cS3uBNEm6irtf9wKGOAUWal9ptfKD5rkh4LnGzMwV8
 KMR/fmaucvwgqa03WbxUi4Kg3JsKrNjct5GydGMPm7UDqgg1MJpR9MP5uT5NZvYZKe/tJXUGJzKvmR
 Pz+/5YomVkzPJfLBfT7rs5j1a32akdOCIZR4CtSUCaTtNe/ImjXveKFcWITj2OaG3r/jNIXAsL2Mmf
 IfgfxSPWpBS2ypa5P/xwTKr9HlMpk3YhbQ88/yc1kmpfo0CWhhTeJpT5+q/+gUNOuBwMsJn0G5dzL+
 nLoxDacqiBS/sxCq5KiZ/hmA7WjgDbavCbedlRO53v96tp82oMrJWBUxvLm41yoQTbnpnuvZFxIg4C
 B2ws1HuxKNOhktqYOk2qe+jzlBdN8MNyslUsJW/MYQZueQuD5MGjbZQElxpw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 0C65B4BA14F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31926-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.402];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,devicetree.org:url,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

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


