Return-Path: <linux-renesas-soc+bounces-21542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D8B4811E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 00:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B20E77A1A6A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 22:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B02222689C;
	Sun,  7 Sep 2025 22:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sUXEcb5l";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="exHdnhb8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238FB315D46;
	Sun,  7 Sep 2025 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757285638; cv=none; b=GgPCoZy2BNXiph1j7cL2rSBTicamnqlNUeGJhwt0ZhTbb730b+5aEWQrM5BMo13g82bRshfFSX5XcDbDhv30tnJ27/tIsvS6AZp8Rvz7GSk8APcKPJpxi6TSvo6pkCrKq/WcHo7qEIukMMKZ7Xn7nnlwd5k9JliVYrjOkF1SY28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757285638; c=relaxed/simple;
	bh=Cm5YUZJ61VOI4bx0fqwwDflClgGmuNarWvEm18NLWFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9Q/+IgjoXSnDGRwJtXWnFnByrpcxTZG1l1MQYTMCCGYHbydHnoqFcdKnpl2Nu92KFdsbCTvGzcVtRDMY6wfPMGnoRUPZF1ojUb9bob5DkYTwfDwuCiBcK03gaeh68TMPEv6fWyR965B9jNwkIGiGeVbjFMVi7nH0VXoIhvBZwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sUXEcb5l; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=exHdnhb8; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cKlkV0Pbrz9tTZ;
	Mon,  8 Sep 2025 00:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757285634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QMb8JXvN1Gdvqc6Udpf9z7oyPReqbmlnrTlxo92lbAc=;
	b=sUXEcb5lQuNABUnIkG1XebMhxPIwO55Gy9U35fDxkj5mUIG+V+N5AfX+lqUqEl0BZmO25y
	pE9A5WedcrqUCaw4KELsP92+b3oNDfiMir451+CiwAwLwkxqVmQgmBc/eCjgOk+oYOQN5G
	bcXFVcI49FMgqEmg68Tn/w92ELTNAGCWaTE+FC/0dXc3mGNS6f/FHtI3xD6IT9NWrRvoOu
	b7nbwmj2Oqm7p93O0K4pf+tcS71r7yHOAZVHN9tXW7JRNMlCw+uuHbXsakTWmASlvLXv5M
	u4KElgR3o8hA+/cop5x7Opx3xRh30saz/9m7e54670Nh1uso8NPEOQmLQs/diQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757285632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QMb8JXvN1Gdvqc6Udpf9z7oyPReqbmlnrTlxo92lbAc=;
	b=exHdnhb8Ksnxr/SkYq+zVO52c07GOs38DWAwlpMFObJqIBNvo/YY2Qc9UAA+26TvSKp6nr
	81/x1Ck4vS8HnBX5qTcb+Vx1yb3HedmN4cxy/XVXoMxPovuB0aQ6GTqtq/LxvC90i3Oy6e
	2vuTuqEQYP281fyrfV6O/Sw53/YsqrkzsNp0cWYNYy8o164e/LxP0DmHoyoaqO7JQGgkOM
	1PcoP5tM5MvjvXHnWG/TNLwyHgzheOghWzIgz9QcfJLplPPfYA6E8Fg9TZwU1LJcfS76lD
	UUMJUMZSO5+I4dRJFYhKJ7eTa74bMO1YhpeWBz4C+/iKX+oyQ/9iNp4j77nsgw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Rework fan hwmon comment on Retronix R-Car V4H Sparrow Hawk fan DTO
Date: Mon,  8 Sep 2025 00:53:05 +0200
Message-ID: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 93710d2802da5fda573
X-MBO-RS-META: hdrs11rhq5j3stnthun7gy6t4ngnf6kq

Reword fan DT overlay hwmon comment to accurately locate the
fan control sysfs hwmon node on Retronix R-Car V4H Sparrow Hawk.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso  | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
index 50d53c8d76c5b..022374c5c8d07 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
@@ -9,21 +9,16 @@
  *
  * # Localize hwmon sysfs directory that matches the PWM fan,
  * # enable the PWM fan, and configure the fan speed manually.
- * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
- * /sys/class/hwmon/hwmon0/name:sensor1_thermal
- * /sys/class/hwmon/hwmon1/name:sensor2_thermal
- * /sys/class/hwmon/hwmon2/name:sensor3_thermal
- * /sys/class/hwmon/hwmon3/name:sensor4_thermal
- * /sys/class/hwmon/hwmon4/name:pwmfan
- *                       ^      ^^^^^^
+ * r8a779g3-sparrow-hawk$ ls -1 /sys/devices/platform/pwm-fan/hwmon/hwmon?/pwm?_enable
+ * /sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1_enable
  *
  * # Select mode 2 , enable fan PWM and regulator and keep them enabled.
  * # For details, see Linux Documentation/hwmon/pwm-fan.rst
- * r8a779g3-sparrow-hawk$ echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable
+ * r8a779g3-sparrow-hawk$ echo 2 > /sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1_enable
  *
  * # Configure PWM fan speed in range 0..255 , 0 is stopped , 255 is full speed .
  * # Fan speed 101 is about 2/5 of the PWM fan speed:
- * r8a779g3-sparrow-hawk$ echo 101 > /sys/class/hwmon/hwmon4/pwm1
+ * r8a779g3-sparrow-hawk$ echo 101 > /sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1
  */
 
 /dts-v1/;
-- 
2.51.0


