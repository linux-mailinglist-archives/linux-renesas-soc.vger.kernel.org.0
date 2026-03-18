Return-Path: <linux-renesas-soc+bounces-29738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDxlOe9lumklWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:44:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6702B84FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F551307F360
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF93B393DDA;
	Wed, 18 Mar 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZOnrQu/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121738F920
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823332; cv=none; b=pDyJf/a50sSJEcGEJ3nr4pyYggqi7WPdD5ujW3s+3ra3qUe6zOwmxfCd92Rj1uvF6GF4X+YWaH/7V6bxeC2jbQ6zbemq1p281jZ43DwLmxrSBzc58BxGOnqadHm+lz2OncUgC+Epft535WUD/bnB0irEtjZpZ6HusSFSXukBFI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823332; c=relaxed/simple;
	bh=kObZunttpc/zmqnVYUukjrdXtv6NKxesO5ALdHzFlY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsiOlu/uKyPRPxxBVSpZLnE9UkccJEzDpvZG6PJ6WAc3dA+aiFLigkeQekM9qJh1zIwn4XCHfCG5yJD/x2HlPiWseC2B+zO2dhCjuDZHYY/3SCpQbbAbu+8U8f1PhoGYX8FtZqrmL2FStEzJ+lQWMinVD2kfjPTt19857W7lQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZOnrQu/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b7c2788dso4103608f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823323; x=1774428123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afMNS1Lswk/xfSbxkMGffbIoqT+0zoayMghwWgebI8U=;
        b=GZOnrQu/rYdoYFph0X/IgRuvHNFpINANuyR+NY99eEA3RQ6FjqT+iGdQLMw9WY/frj
         veN+0NX2TF+p/00hOujXY3nFeX1J500w/KehGpGt5gSG7NXYlTMGKwCJBSvB2uQ89AGq
         KffFfNdUzD/vXXtC/yCNNodhPx81OJyI1jznTrwNme1uHcOtRp86sx8FOn7RFnt0hXHz
         AJ3R85hzGYmrrDLVl9nkBKsYXimdM7Tqv6VmgbYxtujFVyAmUN6ndfENGeTqBOk94/6v
         ymkaPKh4+RUlHpglqHJ43G8QgArDm/aJrQt7JDCnBDmWHdiyAlwoQdlomrg3f1UVNSzO
         Ntpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823323; x=1774428123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=afMNS1Lswk/xfSbxkMGffbIoqT+0zoayMghwWgebI8U=;
        b=YICEuBrKHDNpH3eYd6uAzign7APiRiwF/IlzcV/blu6cN7J5GikgAUnZUnn7b6wdmm
         N0DT72wWHlwDegoPExHM7kAOcir7QZwwOrQuGKMVs8obd+fx+62BdezrxOqLzVx5paGX
         Rx1wZ8Mc3AoqHzF9jsRRF3dcYNFp4aLQQ4zL/ha9oY5hfy6lfMh6PY+hjUux2EW+5r5u
         80JtQ/V2rmXgBlmrF91Oz9qYAfwxKDjyFF7IU/dMzTqbDc7lNVBRL7He8tMYalBXiB8j
         w7xhmfFHiHyBQPn1iS+B1m7M7wjKTWnDCHDjcmzoKQkIjBUjGLTm7MT71XDwJzjlJAQs
         zYAw==
X-Forwarded-Encrypted: i=1; AJvYcCUWhsS5R4cC86eZXkr7uoQ6aEDeJ+85RsxuaRTsREgl+VcM6ovoA63uIVi7iBhG8C//ce9szoIpFT8TWV1Eltm8kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPPkHjyu1yuxbj9UCEIIuTobCcItVE/z04wfC4ZTzXfpzGcDy
	Z3KolFCQpRBx9E/SpbVWZsTz1euQWhqJVq3VtrIM9cr1zsaQul7S1oVf
X-Gm-Gg: ATEYQzyKAf28bIWPkHFHZruNkffllhg7LznRulsNJOyc8FnhQrb9Sn2lY1gbEEuYAsn
	y4SsRHS/HYDTPRx1oiRjyNbGY/ZEYWRTs0Xw5zSUfjxISLD/PQuOqpFiW5mjeV7aN2zbUdSX0yB
	JciO9JgYOU0kIr7qp/aLVfrKBmnKC/3sorHu0YBs3JIRTpZxcxo+6pMtdjlM8fNNeghPy0GfXTi
	eaZTRaj+8Aj9x4UoIY/OSSzvL7hoFRqwr9e4blAIhTPclX8MtJa6WF34gXqg6p1paHZngX/2m06
	k/YhrODDEflop1GgHe3hUdI3n0Y4euvVaueQt/8PPcjyP0ARYL0iVRIGqYEOGdfLvhtCZ2tlmJj
	hk0HCYgykuWn9KHv0x2nJJ89tSgBLpTD/SRS3Qrd3eHGA1HcMivx9sSTMG3IotV7wDEcFxLNvcW
	fDNmwsZsSp7oNgU37nb62t3VJEpjx2BqJsgC24CvMCxY0gVg04
X-Received: by 2002:a5d:5d03:0:b0:43b:3e40:2223 with SMTP id ffacd0b85a97d-43b527aa424mr3611882f8f.19.1773823323108;
        Wed, 18 Mar 2026 01:42:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:42:02 -0700 (PDT)
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
Subject: [PATCH v5 9/9] arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board
Date: Wed, 18 Mar 2026 08:41:44 +0000
Message-ID: <20260318084151.122674-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29738-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6F6702B84FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.

Added placeholders to avoid compilation error with the common code in
renesas-smarc2.dtsi.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change
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


