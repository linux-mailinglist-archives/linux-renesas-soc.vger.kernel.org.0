Return-Path: <linux-renesas-soc+bounces-29650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE+jD7yvuWkkMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:47:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AF2B1B30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 985FE309A3FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36179378D8B;
	Tue, 17 Mar 2026 19:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdzFGf43"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7221634AAE2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776700; cv=none; b=TtD3pC4KNz/5nFgDXlTxcKYFBx6N0T9ADifvsVy68RUInBG+t/Lq/oSojuxIeX2VRNtnqQHyABdpTcuiZPcwErrMohxu8Gz5PgIg2NH/2Fcg/qXzJdwlgRJntLYgQF6UtrAcIUiQFy7O5fGF6DD1Y7GFzdz9bevph8t4u67XCJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776700; c=relaxed/simple;
	bh=bOx8LvuMlzZFlN3jtOGiRk4mt63TgbIiYOr6XlZ5EW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeA7+qcjR6tqEEV5Tuupe3r9NicVpPArAg3/dvz1x2FLresPNBqyfM6+S7k6SqoP0fFMvUIj+dsTsE+7lNykdoqIHlSlZNVBnfBSZ6w3tNptpUZ4aoGKHiwlcXGVSW5UAr+CT7laTCBm6l5miW5hTWkiKvakrG2ygG9EAxXNang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdzFGf43; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso173453f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776696; x=1774381496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e08r2fjEh8MjYZol2ODgi7MnFPqoRBdIf2wu5qi7EAs=;
        b=XdzFGf43VrSxNX53F8K29xdsjU22M7ayq7Muzbd+izqgBGgvUJezP6bkMTp0LRieoA
         +8Fvh2YoiljHXJwU5VXcnCnkmj/CA2oEDUXaNJ9vJGjgdpdNtU2K8RNxbzr5p84eg6bA
         1iISoPM/233C0nJayjS806HDp4YsI1uk4OWWnLMjEWs4r1IaqnN+2K8JC5hE4jUlj8Kp
         ofs/U3y3ZfNUXmHNpE916a/sMPDajTdzEXJSDQALKkGh6t2J8N0biswMy5ktvto7pJ1s
         +yA502fQemA0sfkEHuo1eiMWF/s9czLkEjNUWfd+QvcyZLe5xAdnOXjMX2qZa3BT5YCF
         OQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776696; x=1774381496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e08r2fjEh8MjYZol2ODgi7MnFPqoRBdIf2wu5qi7EAs=;
        b=nAAQgkzgmS2VlU7xR+VkPleAxXnxQWk+dZwSJXWT5/PiCpDx2RVjLHLttDOLs+vQql
         TuDc3YqqAIEvUuOuPy9Rgf8kpOU7mQ8+KU4QXOdcwhsiT7YNDzwC2OsPW5u76Isu/7aP
         xyCYCTNPFnznO2qk3dDLpC49BryMvQmMXcnvgEf/QjLegx/CF5JCeAhUoHI6svQZghXk
         40aOmmdn6estIjFFZ9Arb0bxIDaaEBzF8Om5earzrvs9sMJFnZeAtDtIMvcpnreB3Lfy
         aozF/fc2keAVp2etWJk1oxUOHeue7waEuFs8kfZpJyWsDYToX2BUllNGhjLCYIk/criE
         nV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDxksPMUuIk+Q4LoJsSMrOXq2c4f0UMub+T1RL8QaYxJSxafprz/LwQtylI7ZP4shoHn2S7XyoWJe8XmVDckogAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Ds+fxauTB5BeRqs8Iw9Z3zAkfZL37984OpWFPq2lObsMSXqp
	6aF8c/1u8LUz9ffQcpxSGsASOHp8k8/y59uNIaajtwbvGNquUP70j06q
X-Gm-Gg: ATEYQzycnDkUdPG0ZbXToPr2t/reI2qFfNH7ZwR5jFosh43YE5dNIdM14Ms1SFHGUXm
	VI2+shdG4BBD7gPp1zQJCCowNv5xRAhIkqyofG37wH8OfDhoi51W3OE011WeSidOj7EPNlpIkmr
	EwoqMTdGET+JnNjB8M/SfeoaAc8jf0sMak0ROtlYSlfKQTpTCvSHHKnuy5pwqERogNKgLYiRGDQ
	8M6mIfgXi2th/sPIftEbfGRnvE9YO9oloJQ0RdiOR/XplIV232KqqtZUySxRHyrsi7oAcsAasAc
	3ZYyj2Td/U+uqgFeUxLKwZLQ6fh8HhiMgfn/nU5Nh6iqJ72/Xm6zXRTkR/DrJtK2J3fPM7hhn66
	hPViPTo+RO1BOf02QlhB2sE9iHA+f0//swBDZYIqLYXWt5GPeYyPJEEMEF36XacDfie1YFcFXTH
	io28hw9rTgvE6j+cxrifgZGjxyl6oBkPgPp4cF7po5dnqcIeY7
X-Received: by 2002:a05:6000:184e:b0:43b:3dcc:8b02 with SMTP id ffacd0b85a97d-43b5191ff23mr1684448f8f.1.1773776695527;
        Tue, 17 Mar 2026 12:44:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm1788235f8f.21.2026.03.17.12.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:44:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 9/9] arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board
Date: Tue, 17 Mar 2026 19:44:36 +0000
Message-ID: <20260317194442.468147-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29650-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: DD9AF2B1B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.

Added placeholders to avoid compilation error with the common code in
renesas-smarc2.dtsi.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected the tag
v2->v3:
 * No change.
v1->v2:
 * Dropped scif node as it is already included in common platform
   file.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 37 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d4dfb7fd973b..76df20d2fd29 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -179,6 +179,8 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtbo
 r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-smarc-pmod1-type-3a.dtbo
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
new file mode 100644
index 000000000000..86db86335d5e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3L SMARC EVK board
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+/* Add place holder to avoid compilation error with renesas-smarc2.dtsi */
+#define KEY_1_GPIO		1
+#define KEY_2_GPIO		2
+#define KEY_3_GPIO		3
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "r9a08g046l48.dtsi"
+#include "rzg3l-smarc-som.dtsi"
+#include "renesas-smarc2.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK version 2 based on r9a08g046l48";
+	compatible = "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
+		     "renesas,r9a08g046l48", "renesas,r9a08g046";
+
+	aliases {
+		serial3 = &scif0;
+	};
+};
+
+&keys {
+	status = "disabled";
+
+	/delete-node/ key-1;
+	/delete-node/ key-2;
+	/delete-node/ key-3;
+};
-- 
2.43.0


