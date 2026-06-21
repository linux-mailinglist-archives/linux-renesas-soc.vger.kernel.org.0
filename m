Return-Path: <linux-renesas-soc+bounces-34265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6iNWB95RN2oUMgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:52:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F96AA09B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:52:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=blZ3x85d;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kop7N3tb;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EB5530219B2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 02:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84175280CD5;
	Sun, 21 Jun 2026 02:51:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AFF26ED45;
	Sun, 21 Jun 2026 02:51:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010269; cv=none; b=R66UjdhEgbhgxq66/Cyr41xiDW52f8GvNGFlsl7z5mvCC21uoZBOYl8qOXPSeC/2dwl8FMVYGazbeeJGXRnQxPErx8Dd+BuFQzsbmPUc5dp59dqnI/tKkFckTD4O0wOclztecbGvOChkcyEiEWWWHLpOT5Scp8JzOAWcuInNX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010269; c=relaxed/simple;
	bh=r0JYLCDnw3mju5T1u1K5KGc9oE5o5pgb/+FA0d6CNt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAquhVnXPy9DHIj0qBfddgvm9zxVZileLYnvIkkpLtj8kJpU7I+xp7XcFgrkXy74l3+ij2wovboat+tr0GgnB0VuKyECV5/Zjafy0MNrLLBBLNLW73YMyJWse8PXrd7b3iMSrzSP7LxaXgbsueU7rPY7E/fYuNBuS83HE5CCak8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=blZ3x85d; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kop7N3tb; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbS94Ljrz9tg2;
	Sun, 21 Jun 2026 04:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vwDhshsfBptlMTY7VE86CNApFtJIrIMOdCXnOtH5pk=;
	b=blZ3x85di0Mc+8DspDB8JvOLib+SYJtaijiVM7iFGt05YDPjHvwtzoNL6u/eNZ0EdrQeQ3
	OE9Y6zqqqqv26yNtBNMYO2HvNruTWbNPn9hlKkZk9kSkhvOh2tIU2/ddkXXkSwwDAQ0wBj
	JPdYb4QB76BzuBCETFNjLnCw10ZsoKfQfRU6khb+0tVlEqvzZwRalbvQA+fA/IAFLgvYYK
	aVWKQQ4XU0UZyNHT4WX8MSa5Ehv/oPUZJPHQicFUyf6Nu47iWmmenH49V622lgc3idgWqe
	1JR6a/NzKzltYBZZcQDNVs8DTo3P1r/RFNXhIx6gMglCBSrIA+HjPpa9yNH1QQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vwDhshsfBptlMTY7VE86CNApFtJIrIMOdCXnOtH5pk=;
	b=kop7N3tb5P52tgfdugkvynN9OQOUzztGStgYOJtjV9QyXUn1pnmVP8dolDLB2PlQ6cxEqE
	/FzyRaTZlwWLZoXfeNg3og0sw9fUvsnjah3uRorGGKNhsK5ofCP2HpqIo6gq+fanibz1WR
	5KAvKZHvhtZBErGODNlAXH1jKtP3k6c88MReV5uX7lYAy8Fe3n2v/bIfd93jUsNgX56stv
	XmyPveN1S2RzlRl7X9bpTRYudJwbNq6DLmGcqCYUp80OM4/CTEfio46Bv/L/bE99UXy0TK
	9+S+1iaNFJB4nm6+edlAh1QxJoYfhVqg7+tSjH6Ul1KrOXGbQnrVEhSTMIdY7w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: renesas: r8a77960: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:24 +0200
Message-ID: <20260621025052.406507-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ba4zb9oa13djny9jfwb6adoethxgwh5w
X-MBO-RS-ID: 00a4af7481a848232c8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34265-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C4F96AA09B

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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index ad36aa8e75435..4f9989b5e77a8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -311,7 +311,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


