Return-Path: <linux-renesas-soc+bounces-34263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H1vlDK9RN2oIMgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:51:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA446AA07E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:51:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qY7mCDDc;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YwrVIRTd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4EE83003713
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 02:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221BE25A2BB;
	Sun, 21 Jun 2026 02:51:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E823D28C;
	Sun, 21 Jun 2026 02:51:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010266; cv=none; b=OWIsM4QkVc4poryWxztis3oBStt6bkYQmPj7whqCz7oIL7K9FEecTDh4sdsQtAGUojAmjZ8a2SRjJdV7DM9PF4fx2p4btlrv0/hl6p9N0MBejHQfl+MU9XXFyxBP+MTcsNGXmW277pUdVCVI3LWTmmDV1+V4NDFM4mJ9oqRYbUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010266; c=relaxed/simple;
	bh=NX9n5170QrFbBbcdZeBoBizFbkVZQ9Rbj1S7EzOrskc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPm8Od3OsvckeyFXvLSbpPJdbtm4Ixrtd1Op8HhVCZrArIEU5jtCTBIpDeZWzJnEkrq3yVMVNcEGB2215Ibk+KobOgx+M1zXmQPLmlgn59MhRwzmv1wLtvbEVMqsoYcljWaM4MuYFA/Lmi3aH896cGRwrhCT7509hx/Lx2I1FGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qY7mCDDc; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YwrVIRTd; arc=none smtp.client-ip=80.241.56.171
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbS546N1z9th9;
	Sun, 21 Jun 2026 04:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8H/BzmvfdXAxoPINyZMZPFQoJH/QAsgzKpvh+uKYDKU=;
	b=qY7mCDDcuAzNEHhCbb1m/PKfK+eIryd2BF7qC2t8zm6/ne1cdXVliwrRWPzx8hQcXPJZuu
	OggZoih2zI0ys4HLST9HEI+osZLpGEZ0CKRxZ6DE+mGMdhk7k2BUyN/X1LJN8vk/EpqPXQ
	XbxO+OtV6Syc9ype9FxG3jUAR62WeqCAhPQ4ehpXDoiddnpBQ28IbQpzO0tRTKAsfOuTBT
	Y9p9PFaL/KApdkHG9EjWgU4NHTu0Iid8DJ+cKLeR81nOGnKkd65Xinr7aebzx3FExran/M
	i53T0ruizDq9oLSpQeR8EK9w6pSn+4wZa0oUvfc+M52Of/g2eCVn2rzwsvHUKw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8H/BzmvfdXAxoPINyZMZPFQoJH/QAsgzKpvh+uKYDKU=;
	b=YwrVIRTdbZdURODYPnEYK3lCjzMgii+MGSG7rp0gXOOWX3+e+Q1m/dpyvmrFUV/CQnOXr8
	M40EVMFz+nLwxA6i0KJ0d0NpypOezlc1JFJi+KQx4hqtGr0CeTBFrE4FIWMQY0jWttdcbd
	3GvW8nfW1dy55ezEwnIdX3/flYL1WLm4vYaUbfj2z5am+weC1dg8pyQikDZA8J4JVCAsYZ
	MG/YiQbIxxD77Cbn1DSPuqmAZqdoxckev/VxHvovX3UB0DRG8cBvJw+LwEXyA5psqWIY8h
	9+u9T2HbMopUV+YEOin3qWqNzdboiwBm+fCvXvChDLYCU5nLixrzXhQTUdj97w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: renesas: r8a774b1: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:22 +0200
Message-ID: <20260621025052.406507-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: argcn6s6eee1gxixbrctojrenhne85dk
X-MBO-RS-ID: cd2612fd6255db4ecd5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34263-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CA446AA07E

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

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
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index ceef0104f75e8..62c6703917db4 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -146,7 +146,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


