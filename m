Return-Path: <linux-renesas-soc+bounces-13936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C00A4CC81
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 21:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F04BB3AD401
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 20:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6202356DF;
	Mon,  3 Mar 2025 20:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/A3vQY6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40FE23496F;
	Mon,  3 Mar 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032778; cv=none; b=PoqWx33crTkJJdYA4LcEfMR+ur4JIXl0cf5RiXFi0v5Py0gjY3nyqBMOKs8QPNDDIz2KucrT7CHncv6W3JRyqlrFcCeXtWg6zk6yzCRg9Xdzb/PNtTKcSplo5uGTEaWSPdjzN46GUKP9owJHXgxIWc4LtJWxnHIQ83jzcVWb6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032778; c=relaxed/simple;
	bh=dWuDucdAeV/mFM1ndqJ+oLirURB02bcafgwTsUQP6b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WE9+T9jetUj+jsCnHKiE7rWeBbWi2OBuv4PSH/ulyyJUls3BApDpvWV3bCgKtlDE1XJwE6UgcBEx2IenUmGFCTFol7s8S6LIVxpkUn7rxd+tRlcftPZ5p2nF05QH+ow6W+N8g8AVQ1LoAI/O+MRwxy95cuB0EZb3dcbJsLu40T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/A3vQY6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so46345055e9.3;
        Mon, 03 Mar 2025 12:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032775; x=1741637575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTrTXdeQJ8Vh0YWOZVmijJZ9QCN7itcgg4Zz4eKg6Dc=;
        b=Z/A3vQY6oMqmMK6JPp6GuYOAoyMHiOnne2VM1X2d9Jd8KcIOSwwREQI22y33uSKd1B
         cOdg4tECWyG/fBeK0AmCs9N4lM463+eFs95TvK8bpAdl7BiPFjzVxMt0W39aVIzyUhr6
         R1BXBWo5s48hQdtSN7tCk7O7ThSHoMUn1IifIi49emerT/D85KxtFu2/OpXGE5WeZ27U
         7gOw8aK9PbIQN1r49ufIyGgRqrI2pv/IxikKm01fIJt3Rl9KHORPupjSnlXclkUvShOL
         DMJGzwRcT05PutaAIKYuSuEdX88O3qXU4sABUP7ZePVrO0TkLQA38tgmOJr6JERU66T1
         j5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032775; x=1741637575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTrTXdeQJ8Vh0YWOZVmijJZ9QCN7itcgg4Zz4eKg6Dc=;
        b=VNvdovkAXXVTSucU+YiZEtxquyt0UvWX5zKRNb+zCAhp/g822fF7Sjmc2f2DBz0S9Y
         +eK4Ck833CdoYF2MLdoZ91EYSxfp2U4/2chQbBP3Jpy++SOiq5+it4CbDPyreUALh5KH
         tHs32e6UlRv578x+XNcxpXGFKzk4ixgycCn7UMDQVDH84xMn+cDqblWLS5FYQOSiJ4+r
         TNTqDKZfxwX5GAjoGgAxEGrWQRlqDmN9Qg0f8GEad74A/daploJeZ7TrjoqlN0nhv5mu
         QglB9+7AQ8syzTlYfke8zslVLk2BSUg7oAwKhbPTnUxyZggNNb66DY820xIT4DmHvJtU
         ttdg==
X-Forwarded-Encrypted: i=1; AJvYcCV5YBrjqpaFz2YobbU8EZ9ICevYeTlXtBY/H0eyEfkKGj1qF8SlYdq2UaKRJ/qNMPUKUysx4nhuwym9t46/saACBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlA/qIcjuu6tcB0YpIeHv193oKh4J4SgyNCJ3sffZOm2On/+25
	GZE44ORMa1jFYAz2Z07+vnkzKqMGWEBmlcTc3fykYN+AN+quWTWH
X-Gm-Gg: ASbGnct7cQud8Aa9u6PECKH435cpr2swFpA1yo0Bts6J94toTpvb9uJYn8neA9THmVo
	ha0/JbBe5ZImF3YMutoEkrP6+nnCFT7+IlhVZFUEuou933+PWZsFVnNlW2IiehQW0tOMeDmMlCE
	/Ch16a7A5dFSToQHxCknFm1LCiP2y9v9NPLLY7c6pDvOarzU/8fJDD17S2IaXizyktFor7V3Ki5
	a0FoWbQdFMq8PBFjy9IdJ0fO0RLT+Sx3VMuXdHMpKZJmsr12f7AQWOkcWJ7Av4aqEEGrY9Jb8sL
	MBn20jxqrK42jAq6xLySC7F2ohzVkLILiyGtttE2v2Ol/tud6TwFVHBnaN8QWBe2ed4SsF6s
X-Google-Smtp-Source: AGHT+IF63gctwZ+ULy6tl82XWv4JF8K/mXmsMV95nov1Re61c/y6S88j7nwELxu3ii7+grbbaqGjtw==
X-Received: by 2002:a5d:6da3:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-390eca27431mr15108650f8f.35.1741032775135;
        Mon, 03 Mar 2025 12:12:55 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:5c8:2ec7:65d8:a3a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a16sm15447752f8f.79.2025.03.03.12.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:12:53 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control bindings
Date: Mon,  3 Mar 2025 20:12:29 +0000
Message-ID: <20250303201230.186227-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303201230.186227-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250303201230.186227-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding document for the Renesas RZ/V2H(P) USB2PHY Control
Device. It mainly controls reset and power down of the USB2.0 PHY (for
both host and function).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml
new file mode 100644
index 000000000000..ed156a1d3eb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) USB2PHY Control
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  The RZ/V2H(P) USB2PHY Control mainly controls reset and power down of the
+  USB2.0 PHY.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-usb2phy-ctrl  # RZ/V2H(P)
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
+    usbphy-ctrl@15830000 {
+        compatible = "renesas,r9a09g057-usb2phy-ctrl";
+        reg = <0x15830000 0x10000>;
+        clocks = <&cpg CPG_MOD 0xb6>;
+        resets = <&cpg 0xaf>;
+        power-domains = <&cpg>;
+        #reset-cells = <0>;
+    };
-- 
2.43.0


