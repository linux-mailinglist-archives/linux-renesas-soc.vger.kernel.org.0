Return-Path: <linux-renesas-soc+bounces-15908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BCA880F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C02D61896EAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0586A8D2;
	Mon, 14 Apr 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbTNCT9+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD019A;
	Mon, 14 Apr 2025 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635629; cv=none; b=X7EwLaO+nUr53+I/Z7h/YykT8wPxJ219t+VlFVkLZ4Snoi4Cd6KpEX5XeV6PFjNyc6eH6Etkn73laDRrXQOR2dGgBFVzmi0Rx18+6PDpdGHNMnLPCuqfVDcAbac1c98H0oKXIcu8QkcCqdRfJSy6F3KGvnWjt1tF1YNuqB+Yx4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635629; c=relaxed/simple;
	bh=DPb4jzdxAMjcjV5wM7HRySNLR1rqs6le4rxdDv3XTTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMFs64sOyuxe0txKyLAe/WapFHhKC0LTTYRNJOCIkoKgC9WwdKEFrWCZEKjxGpr9kPrCrsS8CiwCC1u7qnn7gHNT5EPZusmWrT0BwoXryZ1qWMLMyct5VIzXb3IWAxz4u2T9+P1o5/sR714rseCckpvXCRdVc4nsw9URVDN9TK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbTNCT9+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c14016868so3942649f8f.1;
        Mon, 14 Apr 2025 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744635626; x=1745240426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuMrUsCWur1ZWPl1E2LSe7o6WHdw9/Jq4KxswMsH3Fg=;
        b=lbTNCT9+fdvJquma/EZZw8LFQqPoVG3OlxS9C2ksHh52VJLFMCOZaRuA4UtvUtZF8i
         DtKx4puILRlKIZdG/yd91FnBDpWpubJJ7DmZXiY1OVXEfGaSjznDPjv7KtJCTf0P25Bt
         Pehot4ygGiqj6ez9FvYIT/5inelILeA6jG6JiCE1pwf4LVT+usH66Vu2ngv+OnPJEOIp
         Oc/oL4mjGzBIqdKoH7uLCCRql3GltVzMFql6Q7uyK/v1Xe47Jq88qDiJPpYLcEXLZ67i
         dtGA8s9IzK7y2B593xt5w3ClAFKqYJ8GhCDtSFqHfrkGI8niDKMoH1BVYcVwNuXcTpvV
         hhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744635626; x=1745240426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuMrUsCWur1ZWPl1E2LSe7o6WHdw9/Jq4KxswMsH3Fg=;
        b=kxslfVPQnRpGjofLIwQlS86SIIvxxhXHcJgiSFwTHRLqunjzTlrSaRJqey2LpKWXE0
         71ZSJyZ18Jq2+sP22YkTd05Rv76gvl8zkTOvCfCH1S6l/+vj9yAMJiG6B1A1Y4LsB6tJ
         xuv8ReM2uivrFltf3+HsvaYyfEAykdOPhRttuKqaALhhm3+J+lA3Dl+uYJX2LjtsS6Vg
         jsldPrIJpIKk+pHs0cgeQTbFwW17VK4UZTjSiqDh9j36D/1qMvtrxlxdgBGe1+KMnkjN
         Uc6i8tTXuj1bxrH/FLbA27Hbaf6vyCm/Fuz7oo5wGvUMmxV+h/cyZpzuZ9Wbje+2uEyZ
         vhwA==
X-Forwarded-Encrypted: i=1; AJvYcCVz7Niv4RRJIG9w5+m1yLl77dNeM3/dI5ZJi2+4a7cDqD73UcMq87zwOfEJKjEteh3A2sRg+baNp+iI8QHB@vger.kernel.org, AJvYcCWDSIZ06JE6bJ0O6jdgs1JLiiFMbtSuSeNQJ5hbt3bJAB5ZJe36bVIzrIj1aJthZ6zvu6OEppRdKhTX@vger.kernel.org
X-Gm-Message-State: AOJu0YwHpAkV0KC+M3Wz/FsF37ACSUcKSTBvdw9iowlle4WRYJyvWnKt
	uQeiwSnsr3E0jv/cVwJYJHRJaVuGQygNXOcd4QkcG/bhPqXwM6hR64CiCEOM
X-Gm-Gg: ASbGncu6556O8AxDemz2+l4MDfRfJDPLbFNxksBkx87sqQRyuIE6ovuA3QFTqg032L1
	IxGwM40J0DaGS0I/dTxk7c/2Sq/Pzxv5PjgDw6Rrmeguvn3yzTSQwUdnMeNkVXe1yTzu75jFK6G
	ZrhVfth8DI9e8d1yx1mPtaHR7TOhYyaZMrG76mHw18szYAZ87NLg14oNuQYfLrb+sRsB9gqZhEt
	+Qo0b4lgmt7v0aUUtRS3VebWD1F5FI+f/LpJrPnEdc1F2AL1EAFz/AS5Ht7ShqgA2jeMH5iCg5e
	VL8h9yHNlEcA5aRXs72iAqRg+MXNju/ic3Ct+1oHYSdJdfUzK/tguUhmJDgF96rd
X-Google-Smtp-Source: AGHT+IHsVCKQuwpC4i/5POCuSG43hDK7jwcHhzo/wULwRbVQcILZ60LfPor1aRjolAyQ6yN/IN55Uw==
X-Received: by 2002:a5d:5f42:0:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-39eaaed20d3mr9735614f8f.44.1744635625100;
        Mon, 14 Apr 2025 06:00:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979663sm11214681f8f.51.2025.04.14.06.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 06:00:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
Date: Mon, 14 Apr 2025 14:00:18 +0100
Message-ID: <20250414130020.248374-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a device tree binding document for the Renesas RZ/V2H(P) USB2PHY reset
controller. This block manages the reset and power-down of the USB 2.0 PHY,
which is used in both host and function modes.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
new file mode 100644
index 000000000000..c79f61c2373b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) USB2PHY Port reset Control
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  The RZ/V2H(P) USB2PHY Control mainly controls Port reset and power down of the
+  USB2.0 PHY.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-usb2phy-reset     # RZ/V2H(P)
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+
+    reset-controller@15830000 {
+        compatible = "renesas,r9a09g057-usb2phy-reset";
+        reg = <0x15830000 0x10000>;
+        clocks = <&cpg CPG_MOD 0xb6>;
+        resets = <&cpg 0xaf>;
+        power-domains = <&cpg>;
+        #reset-cells = <0>;
+    };
-- 
2.49.0


