Return-Path: <linux-renesas-soc+bounces-27520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD+YJgP1eWnT1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:37:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D1DA0934
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 903043066240
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9B0352C31;
	Wed, 28 Jan 2026 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj/RJneN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FBF34575A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599848; cv=none; b=id0uIK3kRlyiSubIvD5GHP9VdvlPAxn8VT8zz45X6wgNMW1efNu0Nbbt83anw3lMv0OkosN+8rShJWwPOtkUZIAU20oasS8OcK5lKLoa8oBBT2mdPXNHVMl7mRod9Mwkda6KgDuy0ForVJMaVEJhXb/sxp5IAPeLKjSvcAFTM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599848; c=relaxed/simple;
	bh=wYGYHHecgZ3f8TInHssT/2zr5i37lvwq1yFMVyVZT9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfHLNS0WmBH7/0JVaQY1zauEgwNTGs1XUTk1UTqUzIiw3legRdpv447idcg2RlY50ti9XdSsNrHAbzccTdAIJF+xpluQCp5qcrw5S86c7QsNLnfrZfXNtDMuGKHyMVvBgadDw1uczNn6rrXXl9wp3wn3q9l9UBft6FNtFnB4SIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xj/RJneN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so12231690a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599843; x=1770204643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6lNXhVo6rabsx9uuwYfPMUxIX+5+vIBC2iOr84Rj6M=;
        b=Xj/RJneNvJV5wFyIcB5S6VLA84W3857QVlI/bJCTwfWlS62iMBXKk2XEkaEC3V+RKt
         sveZmJGQErIbcO2rqK07ZSYGNusfQtLHAsv4cbHjDYBgegRvXtqyn2LObJcQt69wW6kr
         /Q/kDnCExwbRfrvzAW3WYOr4x0V2UQnOrgl1UGts/sTye4ynk1SGFST/GCfpBuUjFXiF
         FPc+6IZsN6TSoI4Z0PnikV9QtbszyvJ2AOS0QCiZK0402J/BuXo59HrgeRc7urB/GTbc
         R809TBZAu3UkSzO5jL2HXicr6duYgZLxbo8F50Tgrvp7qulbLHhVbBOuJ57wSPLZlmaj
         N1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599843; x=1770204643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6lNXhVo6rabsx9uuwYfPMUxIX+5+vIBC2iOr84Rj6M=;
        b=dHQXFpTRhnWJoP+s/cjxhh2PRvkqb7JYI/Gr6mUwOFKEUVojc++IfWa8IrBaRiB4Sy
         7uO/TR8ypAFU/fkeu/ZQj1oIBvNA+bLWHjTKviSOYC179etSjICrqZe10dnvoMxeiSQ7
         +659M+rgWi/PVaaamp89B9jZ5wIesKux1tn/1PMT0+c4lgZnQoF4Waa8YFLzdPvsc54K
         GebVLjGkvda86L34IC8ekQ6/p8nrJHz687yc7EezCwH6LF8giH8htEbx+LanzzQsRtsE
         O7aqyXodiLPBR/N6dM7ndK8kkUh9EtSBpJ4AReXAzskBPNM+sqsteT7xQ/6zipj8tw1C
         jqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrS4vIQDcp7RSSETUX7K+CJMMXPgv8yCITYWhxzPblcWCdaKl46UqZtY6YL/7Y1M2KL3DFhDoBX4W82FD2VFtd+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3SqXlYqotyHq4Kp0+lwl+mzXth2hsVhIh7/2HsEayoKA8cH8
	2Mxcf9tyeQ6DJlkZ8i8Gn55QzY3XM4LLMoBS/t2F4lUFIxLs262N8i+w
X-Gm-Gg: AZuq6aK0HuE/rVAu7wV4p5v3xuV2fQoujHQbXpDBucIi8RaHFW7UBpFsfXwE8edw7F+
	Ibt10q3iluvIz+9FaFSOd1KTr5KnUmlzKlc2z/tX04tjJ9nvtfC+fXcso7itxWsBymSQ1zgBo4T
	8cxY9GoZJEaci2gNqE2qAbM5RbwHQhXMBja8WjE2KjsPF63PRRPVRQJmA2ykhvv7bpUG+yWa56E
	afTuM5Jy+1qLxpKS8cfI2+z5Z8TDGUPXOrpLkE/+UzXdnfpOv5UDG56ezlT/2URfr2WMWSNWDvQ
	ZwLhPcRL/NEvni/SmDATiWxzhG9WronJl9lwSvFSZAPqxXYko1T5Z3gP0UuoiZ1DltIVooxAUI2
	h1XPxeuxiIe7qnSURivD0mljsTIPjm4RLVYdW24HBrsZbRJ2Ln2JQqfq69n3pL7gQUYm+rVszJw
	mFYT2efYhvd0xMliplfmDxnE723g79Mi0MJYA=
X-Received: by 2002:a17:907:8689:b0:b79:f984:1557 with SMTP id a640c23a62f3a-b8dab37d05cmr365383666b.46.1769599843232;
        Wed, 28 Jan 2026 03:30:43 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:43 -0800 (PST)
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
Subject: [PATCH v2 10/10] arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board
Date: Wed, 28 Jan 2026 11:30:29 +0000
Message-ID: <20260128113032.337231-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27520-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43D1DA0934
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.

Added placeholders to avoid compilation error with the common code in
renesas-smarc2.dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


