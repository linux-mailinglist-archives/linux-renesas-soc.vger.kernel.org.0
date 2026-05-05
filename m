Return-Path: <linux-renesas-soc+bounces-32010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mISNHjKY+Wmo+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:11:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FA4C796D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DF43307DDAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08754421EF6;
	Tue,  5 May 2026 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXcgu04d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B49C3DFC88
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964536; cv=none; b=FpWccNuXTS1FPPFUWF4d73aKFEGzN0xnk31PmgrgjBwr+r97O1gyWqOiELQ2JiLoIMEMgpzBGzqHDztRZ6Z2vhdzklE63LLcrEUvXZ+BUS4AXhzDgy/9tlP2E7WCLdh2wX5Yl981LYfxpcVtsNwiEtoKPuoGFWbK/pM4gpQrLMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964536; c=relaxed/simple;
	bh=sNeI2WXXCuoDnabXe0ZXxdXrXlRlvInCmuj8W1BS1ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utmIe6cAh3X5kqp0pr4muUFT9Gpy+llLP+Vu/bzm8MeJ8Z8jwicbS3OzXZiwX+ZRdp3BzfvIE9Qt4wYSSj8FsUdfDK1M4COjvSoQRu1qs7y2huy4Wad7GgAGi36f0OzBU1dY+ksBa7vu08degedRkvIeY8WN3O/Lr4wgbFAKFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXcgu04d; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44a786a9a35so2455856f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964533; x=1778569333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbiykoutv7sMDvciNVdkkNJcv0tDbOSmpY+rqrZ8mvM=;
        b=kXcgu04d+eyI2rTrf/j3rWedUKM1DmwoTK6tqdyLNxPOOs4egoyqYyRlkw1On9EaBG
         zQhjReHukWvuU4RErpBhLwMjxyc/HGkBsYKVmsJ4oN/5Ops91gS95TwQ3UX9PeysksFd
         DayKRHXn2bkVI7nTZ+SMEygGHMp5TUicRpj825uRCJxc0cjWMBnxrHi2NQn4I0j2gXFy
         RXJGrj5AoFXt7q8ijvkGvPIO3anU9HvS7a/e3tyKtuRU+T4ImcNZVyUse/xx9sAoLfsk
         P5Pdeb6f/AYh8UdtCvRAgzjhdh0ZoypbetM0mPoqx63xru1GFQ4HZ9oilKn4EIp54HRL
         bc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964533; x=1778569333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbiykoutv7sMDvciNVdkkNJcv0tDbOSmpY+rqrZ8mvM=;
        b=NwIHruT+8v7feroITMJc7sWnMyZYsK2+QobOjF7N/LEUg2hYNxMfMXaY7N5omwGJ2f
         WFBmztlLOlx/TuzQN3VKxmo+eLyDeo+Tu7yHvhHndGA46PcH9+ukfKRgYvkMGzEm9Qkb
         uZfOcmNqrVxrVpba8on7OsFpnRhMKjU9eeB41jVVHLESqO3SxG7ZfCvZBoqXCTqpCmCD
         UTdWixaf1iNKcTS0xUBo4L8+EwZ0luCE9TQMZ2qxXlrd5U/FMGIMckY78WKFZsZEiNJl
         wqQj196sAkCzJueIrs4ig+FhrOX8eIOB1h+vun0THpHgNr7RE5qEsaCy31hei9Q+Tem+
         YJSA==
X-Forwarded-Encrypted: i=1; AFNElJ9eFNrPxeg4r4Z1RLTaA78/y5F7rTlL8eHFpAgqD492F5V4sb2YV25C1PA6JbA5icdoTlpynd07Yg6lB49fjGDgoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyR2/JEynQ6P7wtIhth/wXEV2zz4tnvyWEbqzg1nj/NPrkrBQO
	+xSBIqcICLqiGDzrgTn5eC6et81jPsTfRayi0fBu8Q8ryUNXV+TpVSQk
X-Gm-Gg: AeBDieu9wkRt3M5XhtkMFAtxIc6jpbgh4/OL9mz5PAB2yQnMXulo0+3P1kItdiXj7Vq
	I4WMRQ7YGv4k3nP/M6HvJjocF9uXcD9fhxcFpdXiFy7DGIV0MgcfAl6jMmEYtEJPehMXY1w/EzX
	B101z4OKjQhYJIXZTH90rV4bwgU/WY/2OjY3MT+TlUn0fM3NnKxu4oYWqBI5LY2/oH+GECidpKQ
	/U73Y6h+bYLHluYfd/1U5oK4uGHBNZvXpiUBJkT29QneJtxT/k0ptEagAoPS2z6SxFSrhhI5vUe
	EJItdY3D8GWPrquAfAYa3DRjOVLcyJpGrGcPUQG3U6bK/VKzOJXEVxGsmq8U3ARSJjynczahcxs
	qNuLt7GTxws157vqf/c2n+qfvaDgh7fjxISIHwyboqd/SMzMWR4sXe/nlL7WvOchyy0GR3Zh7LT
	2U7PaJ3xMt0xc4i9oJGR112GILloluLYivmWArEPuOZnDE2Bey1XwnENPISaE=
X-Received: by 2002:a05:600c:444c:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48a9866aa1amr216762495e9.21.1777964533359;
        Tue, 05 May 2026 00:02:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:12 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
Date: Tue,  5 May 2026 08:01:56 +0100
Message-ID: <20260505070206.7932-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E76FA4C796D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32010-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
USER_SW3. Instantiate the gpio-keys driver for these buttons by
removing place holders and replacing proper pins for the buttons.

The USER_SW{1,2,3} configured as wakeup-source, so it can wakeup the
system during s2idle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 26 ++++++++++++++-----
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 17 ++++++++++++
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 0ae052238b3b..8384cec7f056 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -7,10 +7,18 @@
 
 /dts-v1/;
 
-/* Add place holder to avoid compilation error with renesas-smarc2.dtsi */
-#define KEY_1_GPIO		1
-#define KEY_2_GPIO		2
-#define KEY_3_GPIO		3
+/* Switch selection settings */
+#define RZ_BOOT_MODE3		0
+#define SW_DPI_EN		0
+#define SW_GPIO4		0
+
+#define PMOD_GPIO4		0
+#define PMOD_GPIO6		0
+#define PMOD_GPIO7		0
+
+#define KEY_1_GPIO		RZG3L_GPIO(J, 3)
+#define KEY_2_GPIO		RZG3L_GPIO(6, 4)
+#define KEY_3_GPIO		RZG3L_GPIO(6, 5)
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -30,11 +38,17 @@ aliases {
 };
 
 &keys {
-	status = "disabled";
-
+#if RZ_BOOT_MODE3 || SW_GPIO4 || PMOD_GPIO4
 	/delete-node/ key-1;
+#endif
+
+#if SW_DPI_EN || PMOD_GPIO6
 	/delete-node/ key-2;
+#endif
+
+#if SW_DPI_EN || PMOD_GPIO7
 	/delete-node/ key-3;
+#endif
 };
 
 &pinctrl {
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 6d86b88ce104..bc1178c7484a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -5,6 +5,23 @@
  * Copyright (C) 2026 Renesas Electronics Corp.
  */
 
+/*
+ * Please set the below switch position on the SoM and the corresponding macro
+ * on the board DTS:
+ *
+ * Switch position SYS.5, Macro SW_DPI_EN:
+ *      0 - Select multiple SMARC signals active
+ *      1 - Select LCD
+ *
+ * Switch position BOOT.1, Macro RZ_BOOT_MODE3:
+ *      0 - Select SDIO {CD,IOVS,PWEN} and GPIO4 Active
+ *      1 - Select JTAG enabled
+ *
+ * Switch position SW_GPIO4, Macro SW_GPIO4:
+ *      0 - Select GPIO4
+ *      1 - Select RZ_VBAT_TAMPER
+ */
+
 / {
 	compatible = "renesas,rzg3l-smarcm", "renesas,r9a08g046l48", "renesas,r9a08g046";
 
-- 
2.43.0


