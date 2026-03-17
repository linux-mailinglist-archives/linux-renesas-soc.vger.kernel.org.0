Return-Path: <linux-renesas-soc+bounces-29663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHszIeiyuWnJMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:00:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E912B1EEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E718E3041DBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0E03806A4;
	Tue, 17 Mar 2026 19:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4QWuBan"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA1E37F74B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777426; cv=none; b=GbDHRi5uuILx4o1uIN8x5RxP7srv/vxxLEMqU2myomv3JePD+mepiByevWkvzr7t5OaHjieLy9TEIVz/cNWynsL45joA6Y1l20D5gHKJwvxNaSj0dfTE7CV+tOEV7l9eu4Lqycs6PauvG0bQKw4n+xKz2tUrltCt9Y96XKUzYok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777426; c=relaxed/simple;
	bh=bOx8LvuMlzZFlN3jtOGiRk4mt63TgbIiYOr6XlZ5EW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hzq0uWmILa97AZcQaoM55yTO0+rLyGqiCAjGDn/k/FTwkIh32f3YtQZt/yCCt7XCNNroUbNhV8BtarD0R6tgTYnmOIPPmM/w2MaDmz9nAzjy2/DaKdAxt1RS9NgY2TD6zJrHxN38TOnK7j0z45ERURJquq9XVH1YK5AZz9L8g+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4QWuBan; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486507134e4so12903195e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777423; x=1774382223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e08r2fjEh8MjYZol2ODgi7MnFPqoRBdIf2wu5qi7EAs=;
        b=j4QWuBanHDVu45Zdk7ZCpXFnKC42EwH5xXXFSt3TnJkimOncw5ctF7BT1DxdDmJdlc
         i+qgLumcWWs1zezINvT3MIf+qO+RAxEtDqqWloCygvDpDc/dPDuoyYOD9qx19WKckim7
         EWKgx/191Yj03/poUaKkyakQYoTKZwNcgIP6/nhTDrVfJqKsJq1ffqgua6eoY7D8OG1C
         Ak9nHsmu7wBXM8wL1xMbqwYDQTjNqg0jJFPSOAnNVI3N7hNHMzuvbTSA3G+eHp9i7c0q
         wKzG1vPguwGoftC6FQEVqUZ3tBS3c0BoO4oN08MnPO7Gy+bKU/Daa++5UmggdD7OtPUU
         2EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777423; x=1774382223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e08r2fjEh8MjYZol2ODgi7MnFPqoRBdIf2wu5qi7EAs=;
        b=WJS7W/FPb90PW0TbQGG9MV25qaAsQY9zQC3QugBaCzGIOEJEt/+W+J8zd7njJewhcq
         i3BdQ2S+D4biWiT6OqpDWLzuX2gBjjoRd8jDt9uz2Tp7doR2e4XrEyS4spuBRKudNcJ+
         FbWZz/7bPaCjQ6AazgurcrbL1rmT6/dQjscCOaRdEKtPFhg48EmPhMlI2dqrA9tAu06X
         k2kHR8NnbO/1/Yz8Xs9t3bY3xacjdNh/OfaB8AsI4seoFpruvUK1yoFrh6VoYeZfRV7B
         Qsad0Ifa1hO0e//aRi4aSiiOtOmRgwrgnhFhNr4KnePK9xfkegcAwMGZJeU2pycz1BYi
         kRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv1raGNkJv27d6Ju/2zoSnsaWn9bOKLVj6iThaAFoKLzvj3oApXCXhZWmO9Ndm/BK9VEvPo7G3S6mGarLrWn6JuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytponqZ5w1WduvjYASqxxeT4YJ5YJcw0l+jE7lGGV6K1hQgFBy
	PwiwU5txzmSCUpx/QJQ0Zn9vQEZma6vtAlqV+zou7W9LZ+2AM7yC5CTq
X-Gm-Gg: ATEYQzy0KEn0tI677U77lpDp/lHDk3fCntVNiIhRUmI/8ZsdZp6C8EqXYnhWwZnCpyJ
	+7vIVoVkrbDsc0ICxl0+2wQAJjifj4jAL0SWf3S6uOoTFNG1uvaZ5ITBUBVKHhMrOLq7x7lcAEK
	okiZqepfFNyPrSYWgWSdVjR0FI/BE63me0hTSruD3ot7hrn0bpZRKnit6rgNfCi0kuws+oGPEeX
	IQ1E2gjinDKFv8nEVjZK+4zd+IewBbF8IqegIexP3lBqgavv+SPOjUTrk6b/1wwmUuoLWzgtftR
	goVxrI68pXFrjOmaxd+WPjB1DkKADPiybAhSmeYG5vlAUu+aD4HgvQWtmTRHHBxHyoxxRYH69me
	I8yLXlFAyZDTrFxjONzOkaoc4oM4KQGZ2Occs1iQUVSAPF5JByXBIMosS9/e6j9qEZWNpyWDCxJ
	0B7nxzHYJ1YgG7npt/4LQNy5ugCvNmS7aCFMwAPdLF6VVTa6uBQmHr5owVN0Q=
X-Received: by 2002:a05:600c:450c:b0:486:c4f0:1a37 with SMTP id 5b1f17b1804b1-486f4457a6fmr15756195e9.24.1773777422828;
        Tue, 17 Mar 2026 12:57:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:57:02 -0700 (PDT)
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
Date: Tue, 17 Mar 2026 19:56:38 +0000
Message-ID: <20260317195650.468330-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29663-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 96E912B1EEC
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


