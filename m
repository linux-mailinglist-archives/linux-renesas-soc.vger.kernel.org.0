Return-Path: <linux-renesas-soc+bounces-34264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vFBXEbVRN2oMMgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:51:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6C6AA08A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:51:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xgolok+H;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZFbYxBwj;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82DC1300621E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 02:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA09F264A86;
	Sun, 21 Jun 2026 02:51:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9424E4B5;
	Sun, 21 Jun 2026 02:51:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010266; cv=none; b=pnRyo9TtcHA3SXLgnINljvUnmrkkML7wn/er/bM9slpgaUxBhrXcHRTjq7hDmupGnbxTHY3sxlTeZaUSWsGcjfrVgGgVvwfQiPiScfyvTPMDIgfMQ2qSO3fWU7Vl+eGKhJDgtyGnhxP4AE/edNNmZgA8BKjMffM+mslvK6gSvSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010266; c=relaxed/simple;
	bh=/OJRwb2ASJGhl1Dvb2cGKZ3URNLGW36xlZcFZuxIAHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SuMn5hIAiDMZRSxTcIR9PKETSiFUnQziSDUAHY7nhgASxNFsTaOiFTRoH8x4nDSQ+TG4NZNpacpwlPgKOQIzmIXMjwI8x1+gJTTbilnzB8SaaIO67Zj+Sfqe8gQsYt7FqV03bzXMYPvyw8sTQA7Fx5Cxs2o15uPFKSTqfJWFES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xgolok+H; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZFbYxBwj; arc=none smtp.client-ip=80.241.56.171
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbS75kpgz9ty9;
	Sun, 21 Jun 2026 04:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSpCTFvM5CGoSh0YNKp7bvTUJBpZmhGPb6YmCd8E2Ys=;
	b=xgolok+HUXFciW7Rsg2+BEXtdHSvg4W4IQueB/lbHgwBXtWJQbUsuukZ2AhVek2cBABiZd
	Xlw08xXgSiiV/czU+efoJx3WKacN5lK4ZTJfgs7DNDBpeKNbLtmNbYXdU2BcdtT/mrK5G+
	lxipHEyF8/ZUi+QW6u/pumdrRBvfhKbQ/O2VMjatde+pnJ8A+Dpu5+mC+ru7hsA9Fo0lHE
	D7VEtAZ3bcHpoRfcZrW7t0rdz9u+ZbZQvABu62bKeI4Jmet8RAqaQT8UK6zqrS6OZuQiLn
	S8fsv9hyZLMM7SMMXSFz/FNch+/3XvbTDXuPGUcagw4wQmygnNVKSqeRGDFYrA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSpCTFvM5CGoSh0YNKp7bvTUJBpZmhGPb6YmCd8E2Ys=;
	b=ZFbYxBwjAe18YFejK6UrLCttXPjtHawlF3QoO65z0SPHeE072X/EC/1eqP9NAY4yFK/Vw1
	Dkfns4YilhjeV/QtNoJ7UlpwL2Je6gwaxOXI63TVNcmxWAJBV6YZ9owZF4B/t3jxjZ6yd4
	01LJ+1LzaXFin+07sI1qpWt734SZlNnubk/4RcAnqXs3FLixwR3P1RQbqF+Gltpvg80f+I
	hQnspsmHcgY6bM5QNdjjGq0TmjfSzsPBj6+tN5nilwDtPUbKVZcu+Yq5JSNCdICMhJ3+Nb
	GHmn8aRKWKSjwQGMNRWWdEk5MhCp2IzZ5CD59/7JHczjiWL+5fFHAoPoxkluFQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: renesas: r8a774e1: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:23 +0200
Message-ID: <20260621025052.406507-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: b3ntanrgis7dwbcbub16a3pz5m9ukp67
X-MBO-RS-ID: 8adb634046178569373
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
	TAGGED_FROM(0.00)[bounces-34264-lists,linux-renesas-soc=lfdr.de,renesas];
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
X-Rspamd-Queue-Id: 89D6C6AA08A

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
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 9df5f1a424004..0ae9bb72d2dda 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -326,7 +326,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


