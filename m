Return-Path: <linux-renesas-soc+bounces-29853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AN3JvO4u2lHmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:50:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC722C8135
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0276430479F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2C13ACF07;
	Thu, 19 Mar 2026 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ssI5uC4x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283A2D29B7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910180; cv=none; b=m3QVe1+By7yHkytl4f4Z66YsrXCimlOJPRti6QemoQHfbuUp2sZFhxVYGeDjjfdbvhOqhC4NNZAnK0jOWhkcxJxf9lY4v1NXoZMU2kRTx1W4Hh26Dj5mkwUBieiTPRop94X2g5c+LtSmcXUMBxb6xhMjfnm9wLHTVlsQNWJBo4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910180; c=relaxed/simple;
	bh=PKfcAaytehaE12FwvKFXLQa+bPmlwbvvBAkR2zOUq9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cxowT+0eAEWxQ2x0i9MyauJkoYQSsbnChUjMz48HjXSeFdEJAeCsczO74aYg476sCBm7cLMcj5kqaTuveaNBfczXU7o1jIMGgkGH3Lvl4Yx+nB93FxUwGh92jkYptnM4hlE4sPIOnZE0Znvu9IrlhJICNWyJVBgJHs0WkAtLk8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ssI5uC4x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so4156625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910174; x=1774514974; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXSt9hgxZzuhW1cWmbZBCiyrQ/GNiAfgjBuW5QGInls=;
        b=ssI5uC4x+AtvDFVgPv220uq2QxXucZz8j+U1our6RDpTy/Qsnx+fQe0RMP/hPLHPgg
         Y9fp4oj9FKD86E9w+6lbZjYkHp5ZZFEfp8eDuTBzVJzewFy10OURCSKNk/PYWTZhjdBu
         EP+XxL5O5XkqJ3RwwiIY08yUlcjFYj4pJW4P5qnnMetOU2mJ6T6Vn+wRcC6ghLOMJ+6P
         bI79gb1m7bpWH7DbII3NMx8XOSWL8ebrmb4MeVcceCM2KVNxURnhUXk4GkHKh3dkMzmW
         wrrZZUmAsCwc0YpMDpfypAnFFZkWB122VRKRUVMuEmOoYqmsdn5TRiZypw37dVbnC7hF
         U2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910174; x=1774514974;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXSt9hgxZzuhW1cWmbZBCiyrQ/GNiAfgjBuW5QGInls=;
        b=RHth6LeRJhb6ghc8S+FxGIZs4hNlhU9g6/GaMfZ5tLlxEANegzhct0n1J0BUfnNAfC
         e9kdRvriByo8KMlXvD5PLTl3/Puo9K/pESjrLsaghjNWnrFZWN3PkVRP4bAhlCJsYJEi
         KhgLmx4EWw8A28zote+2YKWIzhJlds0cPdxtKR47DqNJqWoty5uzCqDIS1Tl4Y1iGWIz
         0a82JbQnEj5UKz9MoySEVJSpuXUGY16jKHD56/tUBjTvitf3kmMwvaLUr2VWHcsUNk4a
         Ija6kleMuejKRDnqBuzUOLpHfoOfpIDRDXrrEJp4ANZ+q1z2euqXEPegJ9UJQmmUUgLR
         MMPA==
X-Forwarded-Encrypted: i=1; AJvYcCWwLTUJ0q27BG6NiXtZJE9BY1zV53YbGsJQa63fg57Jz/ZvsLIvfemOR73dfvONG0KJtF6JLbS8YpFu3V21vTYSJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz82WGmcNkKGpyYQ2ForkfVlEjCMfhXsUWe68q7uRguaPjxgf1L
	zs141isT9hlITcFcLUMRPWLzgsiL3mapbcol87M3yphazABjkX+Exg0iDBwR+yhCKMBKZzo/GH7
	xqGEfxbXQHw==
X-Gm-Gg: ATEYQzwitdGaK76g1nvi6fJdhXCDEr8HDZuWifbRFvnWkvHZXE6INgJdUMzF/fNzGYO
	Fr57tlDnkWVsGvcFsJuOHlYjFhqXZ7ViXntSvsBbMhIgbOg02AmV7l2EUSJWaSVGgX42s7pbeHC
	qQ9wj8DiTC2W3GyiaVIupZhK15gz2alJHAwY88CiHo5F4f80yGO7qO4zncNwMpSPUdqwIwwjyj5
	eaB4yYF00dKGYab5BsvVNvC2zNJtiujbXqHRPVSJRjWzVQKBqTz2Hx6C3azwowa908jQkL/d+I8
	Uw7lLVod4uLghTyXQHtc746bLNjKPUEwKr3q1Xlzm+PGhXkXjfAbLRRuAnp2rvSaHCU46R4GW8s
	1c6c+MJntclnDFWJZ6Qzdl3il8g4Anb8vKcKTb+gj7KGo7/wv9BcAEweOCm6IMZn3eFNc7BlF20
	qzjECS+BDhioX5FHn7g4ETcooqY29Ex/TwiOKoq426XMWm
X-Received: by 2002:a05:600c:1e8c:b0:485:3f58:d84 with SMTP id 5b1f17b1804b1-486f456f7fcmr104144125e9.32.1773910173992;
        Thu, 19 Mar 2026 01:49:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892244sm15931330f8f.22.2026.03.19.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:49:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:49:32 +0100
Subject: [PATCH] dt-bindings: usb: document the Renesas UPD720201/UPD720202
 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJu4u2kC/x3NywrCMBBA0V8ps3YgDw3qr0gXeUzqICYhU0Up/
 XeDy7O5dwOhziRwnTbo9GbhWgb0YYJ492Uh5DQMRhmnrL7gWhtHlOfZnRT6ry9UsdX4oBXF4Ks
 lDFwSl0XQWh2MS8ccsoMRbJ0yf/6z27zvPwRwNpV8AAAA
X-Change-ID: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PKfcAaytehaE12FwvKFXLQa+bPmlwbvvBAkR2zOUq9w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7icBDJklxQpxU0BfUg1yJDWrUGd9owemrVySPNR
 yhF9ViqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu4nAAKCRB33NvayMhJ0Ry1D/
 0aXbCi1/dBA60Sd2YQSthrjqhpzp+v5onr1vloCB0eqn2NUowfJjnGcEhutdu4qmjkCUx2sYHMWyx+
 9Io1fpWVG2v7nld+I+hqAg86AQFd89A2YZ5XJOKGaGJ4WFSDxMSn3xg7BlJBb2vQZxbF10noD2lu2r
 Udb7jQJpXWoDHKUZx1beozyl3iWLELG5TeSDelzFV4R3yOK7bCVYFSx+othevu8Am8ioWE1c8ZFsE5
 LPZNO2Jnv3xE5SiULMp6CXSdGo/ujuBOL4caIp8WRY6HPNW4ACKtWRlbMJNaxSLxMGxoK5VEheY3in
 E9bZNoygqCE7a3XLqCuFgPWpebzY1ddl6fB8zmXqF+k0evPIuR/nhVGbIhdpuqmgL4bnoY35xKaEDP
 4uFQ8lpCzij+2j0WoPnldGpu3o4fWYwdR+gg03bNkHggTJUuQCSzkVje44/sR7nV3jTi6R1oK3k26N
 HklDzzVr6IKMTdkM/O8h7YT+ZDrV7VpdIltQewvjF0nyuAIwxXnabS7YcVKjhsW52xipRlp+LhR+L+
 E+s8TCZtrDBQwM2clvif+TqXUO6cisVihDU9q7uiMEAUrtIYb1uWPqWSNCIwnLN2Sv5csYaswVn27n
 7j/S59T7khMH9E9Ql8A9IUD0MpwF/lq3ebFj7xNdFofG9izJVLIGr4KK1F0g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-29853-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: DFC722C8135
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
which connects over PCIe and requires specific power supplies to
start up.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
- [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
---
 .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
new file mode 100644
index 000000000000..8b8be572c930
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
+  The UPD720202 supports up to two downstream ports, while UPD720201
+  supports up to four downstream USB 3.0 rev1.0 ports.
+
+properties:
+  compatible:
+    const: pci1912,0014
+
+  reg:
+    maxItems: 1
+
+  avdd33-supply:
+    description: +3.3 V power supply for analog circuit
+
+  vdd10-supply:
+    description: +1.05 V power supply
+
+  vdd33-supply:
+    description: +3.3 V power supply
+
+required:
+  - compatible
+  - reg
+  - avdd33-supply
+  - vdd10-supply
+  - vdd33-supply
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: true
+
+examples:
+  - |
+    pcie@0 {
+        reg = <0x0 0x1000>;
+        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+
+        usb-controller@0 {
+            compatible = "pci1912,0014";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            avdd33-supply = <&avdd33_reg>;
+            vdd10-supply = <&vdd10_reg>;
+            vdd33-supply = <&vdd33_reg>;
+        };
+    };

---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


