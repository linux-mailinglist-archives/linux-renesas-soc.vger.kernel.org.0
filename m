Return-Path: <linux-renesas-soc+bounces-23409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56884BFA936
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 01BC9357E73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F732F999F;
	Wed, 22 Oct 2025 07:32:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3062F7AC5;
	Wed, 22 Oct 2025 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118337; cv=none; b=TtncAdUXxtttR2YRd+ErpLZ2iYqn9Yz3qJZsp1G6ZnygPdknHLtPpd3TwXRruNMKrhAkbG0Fr0SHIjFvwSLyeHTZrH8IqfmHCNYFE4xcaOZzaK1PO/1HCDvVnOlpGTOoyRC5vVFwKIwzXORGHZ19lW1PBAOJT1j9mV/01UTiPTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118337; c=relaxed/simple;
	bh=fbmpowwIGOGjX7sxBebaPxaQBBqiVGOj37KOsM1rbQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHOESAmnzKepcmEsb1E4WZnPqxXJouEFD6v/2JBY7+GIQZRRBBHpkaAVJEckOx9+zUIoX9kBgTK4Zm/kiA9CjUjsYdWGLWovod5qCVP8OFkAjQM0LIbgkt793SAtErK8nwYLe2wNmbz2chvv/HCz+Imsi2DDgs6xP8sG+irpNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: AAatNDd/SY2pcXBaQXukfA==
X-CSE-MsgGUID: 3CGR4ZVXSYWYgIwTHi/CtA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Oct 2025 16:32:12 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.88])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 938914012B1A;
	Wed, 22 Oct 2025 16:32:09 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: 
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzt2h/rzn2h-evk: add note about SD1 1.8V modes
Date: Wed, 22 Oct 2025 10:31:40 +0300
Message-ID: <20251022073141.1989762-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.8V operation of SD1 requires the jumper to be placed on the correct
pins of a connector on these Evaluation Kits. 1.8V is needed to achieve
the higher rated speeds like SDR104. Add a note about it to make sure no
one else spends too much time figuring this out.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts | 3 +++
 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index e94b84393bd9..7269bca8c8cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -26,6 +26,9 @@
  * P17_4 = SD1_CD; SW2[3] = ON
  * P08_5 = SD1_PWEN; SW2[3] = ON
  * P08_6 = SD1_IOVS; SW2[3] = ON; SW5[3] = OFF; SW5[4] = ON
+ * To enable proper operation in 1.8V modes, CN77 must have pins 2 and 3
+ * connected by the jumper. This connects SD1 power-supply control IC output
+ * back to VCC1833_7.
  */
 #define SD1_MICRO_SD	1
 
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index d27da157c6d6..c87cb6510edc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -30,6 +30,9 @@
 /*
  * P17_4 = SD1_CD; DSW5[3] = ON; DSW19[1] = OFF; DSW19[2] = ON
  * P08_6 = SD1_IOVS; DSW5[3] = ON
+ * To enable proper operation in 1.8V modes, JP21 must have pins 2 and 3
+ * connected by the jumper. This connects SD1 power-supply control IC output
+ * back to VCC1833_7.
  */
 #define SD1_MICRO_SD	1
 
-- 
2.51.1.dirty


