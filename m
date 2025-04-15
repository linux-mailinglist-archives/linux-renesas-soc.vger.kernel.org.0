Return-Path: <linux-renesas-soc+bounces-16034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D472A8A87A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0404E7A4F48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FCB255E4C;
	Tue, 15 Apr 2025 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od+8tPPm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF823BD13;
	Tue, 15 Apr 2025 19:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746701; cv=none; b=QLPoqLFONdE/6PnnmSAt1j/v9aSfVYG9/tnhUmBaP5CGyfTxTqSmvfI90nA+xorYpOTf2kDkHgbqVs0e4sTi9mCMwVHQSRsNVSAD0XlUnYOgN8LsWPOGmUkZ/1iLTQOLWkXMABGHRv7UUSnk+m5s4a6gSj8ybHvJWGkNoVPThoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746701; c=relaxed/simple;
	bh=DPb4jzdxAMjcjV5wM7HRySNLR1rqs6le4rxdDv3XTTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDKx4+R6AJoAVtXRw6gHdVwDLNp3BODJWsplV2UWX0VCP5lJcB3Yx2iFhEY9ACF5a2pt/jneaTndBWrnedSQ0tx8VvU3WTjeSffVLtPwVbr/qz5OuqxukXp9sNC7vmNz+g9qEWmToIUNG8DT0AJ9r5PBIHzec/V1EqnfeBOtjr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od+8tPPm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so60381135e9.3;
        Tue, 15 Apr 2025 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744746698; x=1745351498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuMrUsCWur1ZWPl1E2LSe7o6WHdw9/Jq4KxswMsH3Fg=;
        b=Od+8tPPmQoaciMvdCz+TYi/HQIOuZvePEKe6Kti4qHuRf1igs2WMkQlUWYRF48Y059
         96PagOJkQZjEwLUNTh4jPf5XczenfNew3FJXWlTCW22dJNmrHv6T6o8+ujc7EAUWLvyZ
         15qUgEzCMszisxlGXN4jGeYM6hWHguMNCgYuApEBlABGJi0yp8YS2abAQX5aU55W01+x
         jMHeANyRQdAzJ/nLsoetKCbpkClyNL2nhqM3SzotbSC0I3jf63ZWQQrasRcWsC4ZmhWR
         C7VSpjiAFXe4juakOzaoJd2juxbFRCqYq/WjZYskp+oCv0ZvRhxbHh8qbH40Ah2hmLCb
         tKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744746698; x=1745351498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuMrUsCWur1ZWPl1E2LSe7o6WHdw9/Jq4KxswMsH3Fg=;
        b=PEGvFVyUCXPuMjlb45i4fDe3mSQ6V9nq1Wf2g90tsGfxdPSb6LVRQv4YTSQabjk3Zm
         byD9ZJAztF16nqiDJ5OFs51jssnSozbTcZEvazMHX9tNdFAIaxiaXIaE9TB4+W5BuWIH
         TdUVHCvloPwA1uxz64cDybV5AfWNwFz2qqFSlftW4kp/U3cWKl61VwdZIFGXkPm93IF6
         sSkVBCWPDV07GoZo4B9Z37anv1++ebGtVQKKGbiO6hJVk7ykfK9VS9MVpmP3cD9bRmeF
         T0TWhCY24UlVPrhYyi/MyKYkNHn5nYGAdXUtWEnoaOxXA1ZJchk/bZKqDMUDSx5m/ATx
         yD7A==
X-Forwarded-Encrypted: i=1; AJvYcCVCenrFJ1wNNcOPiamxfjufTA8dSa3qv2eoturuVzHKW+oOiEpjmsOVA8aQijFpeRIY9F6eQxqrd+Q5@vger.kernel.org, AJvYcCWA9YakHcwQzMl5tbdAw8ZYgwzMaNNbywneOOUtW/TeRb7i2m0vfbXdYIlN0zf4CoqA6u0pZ6VCdjPsxh2W@vger.kernel.org
X-Gm-Message-State: AOJu0YwaKylhrR6BoJfTEdKP19C8qYYNn9yl9KOERMESrb+QhmeWs7KN
	MYi2JFYtBIj7Wbjf9l9hqGznqagN2pTSaAsKJ9UA+9uC2nMg6w3I
X-Gm-Gg: ASbGncvWNdnVmKquGQfhYu3Sx7Ex2VTt3fA/bC4CVMxPVc56dEi41CwWaz5gl2LX794
	QCgh3dU6kwkXlMCqqd6ur+GoH4ucU9ZVqf+mTdsS3KDxVZ2aS0py3kRPzAJB/yTzXr9cbzrYLmi
	9yQ0aNWpmKfjeqfPD5aP4IK3tzWMc7qXfkKwBaaaRC+MdCmp7oALDss5rrfGSjoAWHfDWt6kj8f
	W3sPmnOYApXkjdqpGwAeZX0BVu6SwsfYvv5UFVJmrFa+Cs9wrk8egEbunA1TM32zMuOMmuXJnN3
	1+whzEhRkV9kcWkoNw6ChUBKMaMgzYxaNZgu0G0HAp5vFm7+Hn60eZPuKhPSpwDC
X-Google-Smtp-Source: AGHT+IGTi/CZFzbQnYOhXnzcc9zZFSFRIIdAeOspdHxEXUz9C/NASYI9UsjGwUmyShuusC7Cg5z6hw==
X-Received: by 2002:a05:600c:5494:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-4405a0d6659mr3383785e9.31.1744746697600;
        Tue, 15 Apr 2025 12:51:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404451c67dsm14169335e9.3.2025.04.15.12.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:51:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
Date: Tue, 15 Apr 2025 20:51:29 +0100
Message-ID: <20250415195131.281060-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


