Return-Path: <linux-renesas-soc+bounces-28499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEPdNGtuoGk3jgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 17:01:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA71A96CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 17:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF555311128E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 15:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DC940FD9A;
	Thu, 26 Feb 2026 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SvHRzomx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay128-hz1.antispameurope.com (mx-relay128-hz1.antispameurope.com [94.100.132.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198CA410D04
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120406; cv=pass; b=ZppdBHxfxvmV+fjQAHRvgU+UqArL417yud8kmNEsdpHo7S+h0hJ6zUEanIBhZZHobI+TFeinytTxfJMl4lhG6KX10XKRZbVFRv6J/xsNsxt5YiDt9U0p7rEunygWB/5qbJvQKLJ5VM8v1gTdbG2mPfjYRZ9h7jkbNsATh1ltEtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120406; c=relaxed/simple;
	bh=ZmBNK6ovNNRYQURoOJns8PrYmpFe1BC+SKTaRc6G7Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5rfBPgO0/7T34TcoR/CgTA8GtmDzg0tzBJ1OCX5iXxe+sSGCfNNTjpMYCqFci3PBHcanfeXYyOJWywZ4rcrspA2oDnYHqL7fTX5I68edFY9zHRRMyYQfZmCVeO2TaGRm5yl1FCifyoS9y+sNUIc0KCdWQyyGsLyfNCj6L5RaDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=SvHRzomx; arc=pass smtp.client-ip=94.100.132.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pcFCnv0cKdWyH49bkY0HloB9Tdx8I3uW4jqI9l2KHIQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120362;
 b=e8ZDYDiPvenge99TUYkTM8mIR+LoW4RoLIz/v58YgCVOEuz8ZsskP2u+jRMYJtZgnsgHftrn
 CLF2prXbDWzTqOFcdk7V3B42KHA/0kzLt02xdLajB3irHSlMawslqagcRVrpnp747s4QeeebZqk
 uXe37J4mOZMhYsQxCjCyque8JGJMv6eoo1eX1kuzN+3c6HoO3pqfLneP17Uhz/OhxJaupfPjgeN
 /TnZhXnFkNKxwM/OFL9xAqWhHXugWvmPY7U36/i0Vfh1lWjEuguqL/qMsnzB3wE561LOobaZIbZ
 K4xoQ9s7GouJe9PiuyY3CJ93pf3q7HzX1IwEgNVMU+hBw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120362;
 b=cphJf616LA04QQIRgUAlscDUIBn2+96So3Q3FYSxih/bPTFYCHCfIkF06r215vV+yYpMock6
 kIkYLdtIVcquj4kHXRRUwWi7s5+t1duHZWDght9YnS7wvbY8cysoxLX9HEt3mMffEb/W6hIS/bK
 qyaVWY2tp/VzYjscywK6fY4ZTBuaPByE7KtRis4DAeu1Hgwj7xfyk9pkfSrVeB8HkJ6mVPwNZ9Y
 Z9s8IZlCLhqcOrcxGoRZn6gxu607H/70nBKzULfSdR2BrFpHM1SfZiXYJc/YGWWhpLl7ELWrgMf
 TK/2nPSE6iNnwGWHIYkYavOTMX9pnnCbzeOTOyQXQAXeQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay128-hz1.antispameurope.com;
 Thu, 26 Feb 2026 16:39:22 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 92AA8A40AB4;
	Thu, 26 Feb 2026 16:39:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 2/5] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Thu, 26 Feb 2026 16:38:51 +0100
Message-ID: <20260226153859.665901-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay128-hz1.antispameurope.com with 4fMFxP5yjMzvRJq
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1fde6229671282bda88180e09167ed21
X-cloud-security:scantime:1.821
DKIM-Signature: a=rsa-sha256;
 bh=pcFCnv0cKdWyH49bkY0HloB9Tdx8I3uW4jqI9l2KHIQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120361; v=1;
 b=SvHRzomxh1/yXhzoGtFuE1/bY59f4KF3MSe0MW9Nsi8vRt65iT3WDnsmssCSKKDTT2aIgiVw
 M/9PvNMtd94t/we0F+GQfUK+9rjVZ2yhHC+2X53UAfT+J/ygSH0ykVLThzOa07aR7d5OdPB4nUI
 E12EbV4ot7fo3Ad5yGdRsXI3E2iBfgbDLLom8L/FiqWvvr7SYUMZNGJWC83aN9FvjM4rachjMMT
 yIvqZqFh2TRE+LYlldew2iBBDBRJ1sKPD7JlG1JFFEqxmiMXmurRoeyFln5L8oOWz6usBKYmI8+
 mSRVteduUnbGNgKdvDM1JhMD6kn5DDKdkzY7B6PKXUmwg==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28499-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ew.tq-group.com:mid,ew.tq-group.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tq-group.com:email]
X-Rspamd-Queue-Id: 39BA71A96CB
X-Rspamd-Action: no action

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe9..f2c94cdb682b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
 		ranges = <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
 			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
-- 
2.43.0


