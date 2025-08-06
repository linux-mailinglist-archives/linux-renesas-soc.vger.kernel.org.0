Return-Path: <linux-renesas-soc+bounces-20049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D46B1C819
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 17:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF8718C442B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE77292B36;
	Wed,  6 Aug 2025 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GxLzgTIp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VFxuh2X0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56E4291C16;
	Wed,  6 Aug 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754492475; cv=none; b=fP+IqfpALi/mjBYv8pJzxQi0Fh6U2LqISjkVcS4+a8SnLBvPNcuLObPTrlEw5KVgh5REq5NKkKVFRpDjFevWmSlJRJxoz/58u8/iE37WiqkhGHT/+/qEBksq6t8PSQaWxFx2mvq2E6GmJNnyJ3Br10vA4m2w+xY9QirnVYT1yzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754492475; c=relaxed/simple;
	bh=2t9dXe/p6e8LfSiRUApci8B46BpQnjg7lxNHNHXgmig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jFcW5QSDiLil7fggK4yJLptgGVKoHOYE+PLVYYGwHpTlchNO7hABTEOqAvKJ2G17eh6BwjMkm72hdjQmdFF2GMkK5sXXr/YG6nUg+HwhWkypCd198XTo2hG+y5+XrgtYtwVsxrM4D4WoISbtJRNaAHGqrGMzoLt0LYSrPWme6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GxLzgTIp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VFxuh2X0; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bxtlq558Dz9tV8;
	Wed,  6 Aug 2025 17:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WtLG5gR3sMthibXuvk5Bd9l4Kb8kbXsv3wJprPxhgBk=;
	b=GxLzgTIpVQILsuTwSC9mDg7HXtxDFE2egKGtcC2QDylzjVVIu9gwzs+BXYh44z5wIV46EO
	0ot9/AtTjpWq/yOWqezrFMYkc285yN4SGsvLMbwrWPoCrZlvlAUH6AxRgcRnnVmKzW+k34
	iinKgI1s/1/3YQ3HG0NGHj/mKqCMWbYOik6U99OVJVvmeGR2AVTeEKy4igl79jOz0KTqzn
	JJ3E9bO2j0RWmY5KY9Km+72k17OtqrW0CLn2LkZ06mSJ3I9f6kb2Bj+hK4PaIm7Qd9ms+q
	EU81jAqOABcevJgTDYayfpcTfmF+zSBsu8Y1LrlScuI+EyLxKKSnliGKKCdDIQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WtLG5gR3sMthibXuvk5Bd9l4Kb8kbXsv3wJprPxhgBk=;
	b=VFxuh2X06o7Id6jccCf4sMfDuIW6Ehqty0b4/dAdAVc/nbiYf0pjOvc512u0miDl3P1W37
	lacnMBSLzB4PvbfRd4qNOFORC0VTanrJ4HT2w0a2TSJ46LF2frC2+TS6mHOhUnwtTlxbG6
	75iz/ijeuDUssbF6T8Jngk3gASdNRQ35ks5vGAQshLOEgo1x9g9tvJQhO9FYTTS5wmEwCg
	msZwG3bZy7AGZhCT3DUMVqGCuYqvuuJgnCMftk1jThailcOiFxzUCWOUdCK+muRamS8Epx
	PzKYawMvNh9at7vZm5WtyiDeq5aEDh/tzz6USohT93T7nbKKzOjiiN+5Btc5aA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: r8a779g3: Describe generic SPI NOR support on Retronix R-Car V4H Sparrow Hawk board
Date: Wed,  6 Aug 2025 17:00:36 +0200
Message-ID: <20250806150048.9364-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qpdbkyocr5pt4993qbeqcmi5bda499ok
X-MBO-RS-ID: 89bfb218fdeb541d283

Retronix R-Car V4H Sparrow Hawk EVTA1 is populated with Spansion S25FS512S,
EVTB1 is populated with Winbond W77Q51NW. Describe the SPI NOR using generic
"jedec,spi-nor" compatible, because both flashes can be auto-detected based on
their built-in IDs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update commit message, s@spi-flash@jedec,spi-nor@
    - Add RB from Geert
    - Use capital f in the fS part of code comment, s@S25fS512S@S25FS512S@
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index ba81df3c779d..a40b65a35ab6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -757,7 +757,11 @@ &rpc {
 	status = "okay";
 
 	flash@0 {
-		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		/*
+		 * EVTA1 is populated with Spansion S25FS512S
+		 * EVTB1 is populated with Winbond W77Q51NW
+		 */
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 		spi-rx-bus-width = <4>;
-- 
2.47.2


