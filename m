Return-Path: <linux-renesas-soc+bounces-34722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sc+sHdxTSmqSBQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 14:53:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE177709FE6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 14:53:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HkyBt8GE;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=yb6Gz8Hz;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E8173004F7F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jul 2026 12:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA247376A16;
	Sun,  5 Jul 2026 12:53:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395EF33F8D9;
	Sun,  5 Jul 2026 12:53:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783256025; cv=none; b=H6mhokFI2Dk+4w7JvGPDWfCSw4GZVxysTw/jZosH5907RJTNAPSmeLPouXvzFfRv4Q0DHk33vBvoH/B8WR/AsYKDlMZ4IJx1sh0FtzPCZzLsvEeRVPTh9pFy/CgQ/aMkhNu/wtXLF+wa8476mX6maSDouH/eKR8JaesRHaZhbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783256025; c=relaxed/simple;
	bh=TTtNzHArwyUcJ6V6T3vEECmYy4VQ8v4+vftXgVVxzqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJyPikxIWTJ9+KVp/kX1fhE+FTTRECcCCThSCg9/pfpI1oSP5Rhm/raOmjEUU2FAGjpnMeSQwvQdXBkIMEzKlbKmkn/JODELpCSoEVEWCuMNaIJZZxqWN1MLWdQYoxriGq2O5jlWzlh/h1AFC1d1CbpZ7ZMPkXlDPvu2845ORtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HkyBt8GE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yb6Gz8Hz; arc=none smtp.client-ip=80.241.56.171
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gtS8v0dlpz9ttN;
	Sun,  5 Jul 2026 14:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783256015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wz4aJVJnm03NmMAAn4VkW1gKrEfbr09NM4rUeKWhQuI=;
	b=HkyBt8GEUigNtYGx6Kz76fT31Q/i00IxuN97Ba/amJhBbRD7umdCMp8M9VQk1RNcR+Ek0B
	Ng2DrdPyslID+ksmOfHfRJXT8UTEwmplHHYNGMebeZYmRlQCBDM0jWjam2MuIHTJI4Y77c
	Z6SGg+B4YcfPNpg8ZbMC5WedEOpsPct5c1vLIEy7Y6KhSH3KoN3TmvrkqyHgsZnzHG9nbK
	y7kc7dn775jLiKYx5D7ZYQDhj38mTGdddGOKx4IOI7YYTonzrlUdMfmQahdu0xaZPzbrty
	cjVldQdIbaf/6kY70UQ3+VR9zRlkLd17hkcIkKjAGfacDW6dJpebKAtEzz+h0g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783256013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wz4aJVJnm03NmMAAn4VkW1gKrEfbr09NM4rUeKWhQuI=;
	b=yb6Gz8HzZ4qBR8B8XAh8DqJSK+H6pMi8Oth+TdB5DelXAbIaTsG2kwo2qlpszBF4DGrwsD
	FRCEFeYkNKB2dAdev2GSr/NE5c9y04aa7axnycOWWb1bl1hk9Gn96zaa6aSq/XRtR1Hi5x
	oob95xfTkCkE6ceZEnIkYqBM9UVFW/ezLD7jX1lPy/qk2rL/klp9NwIVXE1s6HzUCIEooH
	Y3XuB+sQtstK2OCF8/jfyuRRjQxblZe2UETsBTdkdsVBDE6lObJvdOv1aTNdrarQ910L8e
	LB7hwN5QTR0hOiw/bft+SeIPexbI+Y0k7ttFLZXVSyRK7U0s3+PSAS+L/81uew==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Always enable edge connector I2C busses
Date: Sun,  5 Jul 2026 14:52:46 +0200
Message-ID: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kyf8qh67uftqszxe71j5suhbdm8fs1bz
X-MBO-RS-ID: 88e8264257d96620000
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34722-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:yuya.hamamachi.sx@renesas.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE177709FE6

The interfaces on the edge connector of Retronix R-Car V4H Sparrow Hawk
board may be controlled from userspace using matching userspace tooling
that includes e.g. i2c-tools. Enable the edge connector I2C busses I2C3
and I2C4 to allow userspace applications to use those busses and access
peripherals attached to those busses.

Co-developed-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso     | 1 -
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts           | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
index c730ef39c7d7d..6f10310140b9b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
@@ -41,7 +41,6 @@ &i2c3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	clock-frequency = <400000>;
-	status = "okay";
 
 	pwmhat: pwm@1a {
 		compatible = "argon40,fan-hat";
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index af680290ce817..a6294fd32daee 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -498,6 +498,7 @@ &i2c3 {
 	#size-cells = <0>;
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 /* Page 31 / IO_CN */
@@ -506,6 +507,7 @@ &i2c4 {
 	#size-cells = <0>;
 	pinctrl-0 = <&i2c4_pins>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 /* Page 18 / POWER_CORE and Page 19 / POWER_PMIC */
-- 
2.53.0


