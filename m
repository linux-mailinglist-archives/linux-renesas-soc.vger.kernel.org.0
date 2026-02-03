Return-Path: <linux-renesas-soc+bounces-27805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNxQHxfRgWl1JwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:42:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41BD7E2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 176E930D8C06
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 10:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6AB33FE0F;
	Tue,  3 Feb 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAykJWpn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206DD33B6E3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114646; cv=none; b=HZGyGfFeYF4NdgXWOpoOG+9mhxqf6ttnukcwkkt3FlLY8j5h91vmrMyuBTUE65D3cp9/WkAs/Ki75giFFv+wI5FM+lK7ZtueeIfVFAk0gAu4vo5GJrTqWdRSd7Bbcx24d4BK4rU0DsxVhANNakxj/B9g+r/L7zLJhrt59Ch8ysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114646; c=relaxed/simple;
	bh=0MTzIy7crs4kNh+ZUPCYfGcLKbcJen+bM0bYCrJj2VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unnMuyN6psQ+IVZyb1OgHT1Hw/Caa/ufdO927On33n4QwRy22oB2AyJLILzKJh1v/btfUfYZPcq24C7NQq51aBxn4k/6OlMlp2eYFeFyekA4dijBuP3NWdiTgdlmQaoDU+JHWh0At1hDtX2zb3UhoHjAM/EqUgAShOLdkfsNQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAykJWpn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48069a48629so56393935e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 02:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114640; x=1770719440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ0Cr8rQrm1tlnQhk5AGGEpo9oul+BbRV6O9Yi61KeY=;
        b=SAykJWpnoC3rAK4hfJag/i3pZsGpmpKhQzi5oNA4aR7tPRy7BmDp9WRdHXwXu3uDSW
         NyX3ainK7RQi69qz9uM1GyPjUd05nJuHgXBpv1YDAxxSHGEdS3Nh8uFs9BrYGrJuh7Y/
         87o5VLBnJ2M1gwf+94MkycxvvjokwOzV0DJDPGLGE48FfZJ66JFNek4DGJZz01sWNX8T
         qCnOJJUTzHQxwqd6LKyridYFbIkt96q6yucxkNGF1Fb6f/91enkeyvNXwcr7HQ8BF5Ss
         o4ZN1itTQcQTcG5/rWDjT+BeIT1sCBCnmfErH1t6bSfVA+oRGOomIg0XG88ufEjLSbfB
         fzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114640; x=1770719440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJ0Cr8rQrm1tlnQhk5AGGEpo9oul+BbRV6O9Yi61KeY=;
        b=eNSZYxw5OInSXoSV4zCdoiOi4JJH0K38m4KNmt1PbGh3VZfz0M9H2+6Oh0dV8Moses
         hn0TKhNQ8Qhm5j2l/Qq2jBOuKAKZRqjeTrBtLOi0yoFj9oydE57aF1vrl8S0CEcVQX67
         tp+VcWGaVQq8n4oOvUiMTdyLJOMGQbn6cCy1PVmlFTAzizZnZwJ9S8y3kQCWEoazXm0u
         0p3NLp+BiehfBH/+5T6lFn6LR60j6naVlcFOGxA4XO9db30QBKojFAi8xShgM70Iwrsi
         xND77ChsBiwMCKgHHjR4gpA5lfAVCv5tp9Xnv0UmBUV+DaGnj9l+yeH3LynG3Jfs7eBf
         wXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAGCDboeg8ENmCPCMs+5w9e/5gyNwO94iA5tR8jJuFI7dJ8GnPsNS2VG0iYptvNlaVKEqISkcevmrEVxkXQLSp9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0P83oGfxA9oOVqcTSdFPXBQv9PGIVneTxu4zXH1XS67duHdcU
	pIapm5cHpP2QTH7X6b7y1eNZZV687tNsoLX7csP75970RdI+AKUuozcM
X-Gm-Gg: AZuq6aIRX4JT8WJ/L5wnzwrEVd8vgzrXjPHxe54XHjKRFNQ4I+L+omfB+KAFfCUze+A
	r49sdziy3TAGqkJ8v4E4wxgTUolOTdhOsR7YEGffoHPVgxIeJUEsPwYGtwfUwQS7sOVFR/zSdRZ
	S2xcBwNWmaArl4sNjXWyYteRhsTpMu0mgpxE7P7WITfX1xD82cEAxqahvz6g/agMcJ1pTsPFeVW
	NjXPDn+V5AMxLIn5tqJhSPYfFFRJG8PEKa187jyCbi2DzcupYL+WlOlPLNqPjS5gEQKhd2nESE8
	xze3uQvl9WjuPj18AP2EjKPKzltZhtvP8X2Oy2Aqo19eYuXYySnK8aGOIXDIBpfFlVBaXpJVFqz
	P1jEd6bzauFzeZHkVfrEJHhgqGZg17hztLNwgHIWHuorWHQwGRlSPZqvQxFWOLb/483/drYWXxE
	Tqo6gGM7Ch3UBK0kuA+A==
X-Received: by 2002:a05:600c:310f:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-482db49243dmr208264455e9.30.1770114639755;
        Tue, 03 Feb 2026 02:30:39 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm53160961f8f.35.2026.02.03.02.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:30:39 -0800 (PST)
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
Subject: [PATCH v3 10/10] arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board
Date: Tue,  3 Feb 2026 10:30:18 +0000
Message-ID: <20260203103031.247435-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27805-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: BE41BD7E2A
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.

Added placeholders to avoid compilation error with the common code in
renesas-smarc2.dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index 1fab1b50f20e..0153e772c231 100644
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


