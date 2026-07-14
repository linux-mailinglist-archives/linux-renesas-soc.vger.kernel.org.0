Return-Path: <linux-renesas-soc+bounces-35194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EHw3FBs0Vmpz1QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:05:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8349754D62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:05:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Y/iJABlh";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=iJKtndP1;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B0313034455
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5EA472774;
	Tue, 14 Jul 2026 13:04:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F1A46AF1B;
	Tue, 14 Jul 2026 13:04:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034290; cv=none; b=GVc2xCBz+AbIueMbV4fJjylg7BycMny593r38g8tT+JNgwZadx6dpEnF7Mo5puN/7SGyu4FXBmnghSPtoQTdYchuOqXcUtM+9tUyr/m2WQTj4rO/XPBsncvUgGkV6we4P84FvWTMlAX64JDpogBB5PHO7Yk+3fOf8XGHW46Nhok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034290; c=relaxed/simple;
	bh=0EEuYJnODTcJitU5oN7zh0Ed2Ny8cPFn6OZVCcqhMYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EcA6OqVohXGc7ceA4lnWFvo8LBWHaosRb0euXcbwaHmDpcxac31BBB27He2cqKLcFCNPNT6080Zdqsm2bPbpTOff7TAQRTM5hTs+aQYGvWGauEPobyE8NO+2I4UuU7APQkJuGLGfY1+L+zBrCHJe2bcfCAvXo4adWeoYZum6oS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Y/iJABlh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iJKtndP1; arc=none smtp.client-ip=80.241.56.151
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gzzzY1ffnz8v9G;
	Tue, 14 Jul 2026 15:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxZTDis523UeX9WvIQtOsfnmnd6iLGOy5eWcWKoUzWc=;
	b=Y/iJABlhB9876LoaliTfRURkM63Z0jfM4WccGgSMo/DriLgpmbT7NI/pOVZxUDrB09L+h3
	xgnKYFXp7rPuoBq222Zyi5FH6FVhZOSleNTySiSSRDsy16yes31L3hd0OFbCsSv6eDlKYr
	XVJ38fXIAvUpDIftpk3I/SZhUD+x411lI9/x+v6DQmz7jF/it+qUF6JOX4LoITztkXTCCX
	zFsoLPKgk7gUsZjPIwhGkW3APNIcKlj67lU588L57YxU80qixoOGhiQaGHQOM8uPUkHy+V
	3hhJkFIHMJVmm2Rz46kJ3BkzsIKYpchHzXToxGRleglsbZ3bHTWc1oUR7gVnyA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxZTDis523UeX9WvIQtOsfnmnd6iLGOy5eWcWKoUzWc=;
	b=iJKtndP11GiN+pHGNmybiu3mz7xaVAvSSFRfwJONHrCcmyK0QYI+PeE4A/z3ks+dgNHwVp
	h5R0j6D1ybbl3j9MdtdHwAYM6n200bZsa2+4QgkkjkPeoSXsXHPZG0e2KiAVuwXJMlALWf
	xvGPtDuxGfyY4tV7vcEHydz8eQ6G/v2cJoTJ0k75aus5UTH3rs22kzqE8xTzPltHiOwmCG
	SapJmIunpFTMf5crlTohAAEEd4F3CvuLRZzdKx7aFwzQHktoLQxhbxWV0ELvJO9FaK/eXQ
	d/+90VgNmpVgNjyfEIveR0sQ/943Nzqr2zg+B579Q0Mc3yXVJJQ6a9pub92/Sw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/9] arm: dts: renesas: stout: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:55 +0200
Message-ID: <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ax7ssajim4caxm4mh5xwgae1jxosy8nu
X-MBO-RS-ID: 1828e40cd7139f8bfba
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35194-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,microchip.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8349754D62

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
the system wait after deassertion of the PHY reset and before start
of communication with the PHY via MDIO. Opt for the same value as
used for KSZ9031RNX, which is 300 us.

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
reset high is at minimum 10 ms. Set the DT property reset-assert-us
to 10ms because the KSZ8041RNL RM does not explicitly spell out how
long the reset has to be asserted, but this at least covers the worst
case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

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
 arch/arm/boot/dts/renesas/r8a7790-stout.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index 8ba9d85f10389..b062423499e48 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -210,12 +210,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 1 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0


