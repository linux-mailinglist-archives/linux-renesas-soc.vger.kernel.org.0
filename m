Return-Path: <linux-renesas-soc+bounces-33244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDMKEKfoF2osVQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:03:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D365ED7A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A06AA307A7D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC7134B1A5;
	Thu, 28 May 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYla9j6e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23310348C6A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951768; cv=none; b=g0IC8Ar2aFqjhho3TVQ/dmkuxL6RkM8uz6+8w/9RS23bm32TgbqUaSjYuJkr57Dx2ZNA8dM9CzCEPvgxk4+eC1An6j8gDt8NNrI17lDvMRgbAxNMAN/4FWvCMc5xrSb73ZKGoVkp8T4xM358Ytva8LOymzD49A1s52eployKSjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951768; c=relaxed/simple;
	bh=OSwO8Quw0mGn2zzjnQSe8oDeaDN8sCW2Vk3k8tor4cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGKp5eJ1QmWZ3i/OznTS8KLJ7EJLypL/VlthKbF0JibrLvmW5BmDLTPtU9UDkGqDVqcgvLtNMu/fs2htmLTZC62H1dnOL8V0BjxLTFJoCfsoZseyl7404r1eydbPU8L7oMotV31pt/58HTSoMmeXdMe27awDFzn/Qmis5IGMukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYla9j6e; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so188782f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951763; x=1780556563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHVNKCcJfHbhCv4abTmlnrVl7h7/qI/6wywlKQ29e1M=;
        b=EYla9j6e9jITKe4HCQ6MQ0/9VXGR+ucnfZzWertqbc4q3tn2gIFZSuue+OMWWu/1uC
         O81+tK2V0T1TV+Wswm0NfTxygX/UXpYM4OJYNzugXSHNPdYY9XymafOaGk0WSenkpHzO
         IwLyc/x2NJa5JIMz4Xo+9vlsT9+PZmMX/MDgVfDbhQXDhWYSq5Qhtyq5MdEoe1nOjD7b
         AaFB9pJOFh7J9Qgj8WfpJSz/pyGjoRAOkpRCUXs1mdmdSG2pMQBpxT9h/T9pHPAp3Ln1
         Q8Y8eP1ihnGf43h/VbOpemmOlhEj/Uavapz34jjgBTviMClV0RmaGWCj69ZiRrtdbskf
         xhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951763; x=1780556563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHVNKCcJfHbhCv4abTmlnrVl7h7/qI/6wywlKQ29e1M=;
        b=Mqo2rF6l1CnMEaJXaPyIROLcm2Wxm3Wb/Rx1+omor2Zu8Xisc3iy1DPvHZBS/k7uQt
         PNJMs7FkQYJJzaOcw/PnXiiwGNASYsLLel4WN/T0L9ghqXBsmKDTKQkXaddZmOjdShAC
         fyVqGykn9JOL5GMRvmd6gFF8w1+CLQ8NmDYgBo8r7+vb//4bIgaQabAXyl1grkl8L8qr
         zEJoIgMp3GaZ7SyROXjGM3n4y4/X5dDQpVpn+lGanYG1qu7+Y2p5S08ikDqdPi/+AyYR
         kP4hQ2xHRFiaiY44mCJlBbvY78UyrOzTVyDKtYMmb5A6tkKvg9dmM9wdlj2SHSuZ1JfY
         Y1cg==
X-Forwarded-Encrypted: i=1; AFNElJ/hk5s56ld2QeSQfTw9nS5ASYkIyc0PnIV/UR8ZDVKDqudWWlRDtkZ4uKt/xK76Ea0gxRKb8eDGwk/4S3jEFarRyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4goqb4BR8NeIozgZRiHrVcPbYB607fJnT60gffdKp3lXocfY
	1ZPWnW9Uqggv5FsbsBfp7yft+vFpbdVEo7sLnOFuwJsHXPq88cSIMuPc
X-Gm-Gg: Acq92OGJKYbZ50uQatX+tGHRj/09bh+8F0HPxMejbIzJI4AERZdDkOYdKfzOT+MPblQ
	vQX6BPO9X2FEDnzuW0z9OQ6lZd1r4gqxwVC9MosKvYXULJH6I1gT1Z2sLw4AgzPPGq5GDYwi1Jb
	4a0MrHxBuYA8tgkrQH9Z4V07EvVaE0FW5soA88DsgFcs3CEQdsly9QJ/HyjTG1QEybN2MLgy3Yx
	QX/JOi0OGCp6a1I/vbNIOePNs0uZYyJq14lFce+IrWcHVYAWtraqmVNKzv+flWiAcco65SetFQF
	49SSpF5Qe6I6atWgSjzroqlX+1LUiBmscTAxRf9i3Caxt+lqg20f2yipOGQRlLB0i/TixMOf0nu
	/pbOpMHwLN/IE4N2dqbeUvMEqk7Ruotpz5zAcZMSS+RFNYGcuk3fj/6V9UOFqarYAFLGKvZcRVU
	zm6cFxQPZO1z9MYAuD6k5c+H1RAUkP12tKf56I+1hFrurGm8z3CnqDACtU4xE=
X-Received: by 2002:a05:600c:3f18:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-4909478ed20mr5399365e9.4.1779951763248;
        Thu, 28 May 2026 00:02:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm28528385e9.2.2026.05.28.00.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:02:43 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices
Date: Thu, 28 May 2026 08:02:35 +0100
Message-ID: <20260528070239.33352-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
References: <20260528070239.33352-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33244-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B7D365ED7A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
setting SW SYS.2 to OFF position.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 29 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  4 +++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index ef00e316fbde..1512b7df39bd 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -11,6 +11,7 @@
 #define RZ_BOOT_MODE3		1
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
+#define SW_I3C_EN		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -33,10 +34,28 @@ / {
 		     "renesas,r9a08g046l48", "renesas,r9a08g046";
 
 	aliases {
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 		serial3 = &scif0;
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+#if !SW_I3C_EN
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &keys {
 #if !RZ_BOOT_MODE3 || !SW_GPIO4 || PMOD_GPIO4
 	/delete-node/ key-1;
@@ -52,6 +71,16 @@ &keys {
 };
 
 &pinctrl {
+	i2c2_pins: i2c2 {
+		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
+			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG3L_PORT_PINMUX(2, 0, 4)>, /* RIIC3_SCL */
+			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 06c6ccac5ad2..17bf44778398 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.2, Macro SW_I3C_EN:
+ *      0 - SMARC_I2C_GP is enabled
+ *      1 - I3C is enabled
+ *
  * Switch position SYS.5, Macro SW_DPI_EN:
  *      0 - Select multiple SMARC signals active
  *      1 - Select LCD
-- 
2.43.0


