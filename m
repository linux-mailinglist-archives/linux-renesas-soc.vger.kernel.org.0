Return-Path: <linux-renesas-soc+bounces-31969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLInIgAl+Wmz5wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 01:00:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E730F4C4AC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 01:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 197E630547D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 22:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC9C38D014;
	Mon,  4 May 2026 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ySQjWAue";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LxzZgGdp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F5B38D011;
	Mon,  4 May 2026 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935442; cv=none; b=ldfaKkYCirmVl6cXG+14adoL3I13dSB7I5qP03gv6t8WV0bNgcoRqMljhsDCPH7Q72vVy/Xw3QORecaHxeeLC4jG2YjOdWbJLmWrmxVdkGVgqFylcB1T+Eyew0DzXeoYAY2Isb99UqCSBI1B+qR/nG6SRr6bb3LkGxL7UrktAsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935442; c=relaxed/simple;
	bh=v9yb03D1ISdVAHwsL/sKf4FkwQ9IyI8Mtx41iKy+22M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XP6pu6XT6qMq+5iUzj7tEOGcwSzxXyh/xDQFfSAN3vAYEvyzL8004ZAy/vizL9kx3EWWt5OuuMfWxqOAyOjDhvIFE18BoqPkpUXFwTXMtThH+6OndN3RjJs37hcdcU1vWd85ZOUxdxcag8F9KxQeJxjoXwyDyZNPvSV61nNRn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ySQjWAue; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LxzZgGdp; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g8cV744Wxz9tkd;
	Tue,  5 May 2026 00:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/yKHq3c9e3uGgpl4ruRXjj8z5brLv19LBRwYLdjeLQ=;
	b=ySQjWAue0Z+TzXQS3SWwW2z05fUQflSyVjnt+i5s60G17B7hy4rcYz2wtj6M0Jy33DPQ/7
	EwROhqz+Ox1NbxNmEfj40EHpAIhENAQJHK/FO9t+Z5HX2phiVGcQAUr6fGegJBwV4K+roR
	QVgRfXg1gyd5C4SidQaIVR0yxiQFY+fY4uOblDrcB8aGJ/NN2sb3HD5bxG2+TmzeeIpVZk
	tU0sTtdICnn/e0EN5xaFqazQcN+N+SSF1YlwPQHKA6ZQhoVub806vnkoUW1WtSAFoMZDAn
	XnzmZ8CjXxrflUe+C78wFKP9Brvz94KzIFb3uJPI8oGvLW9FsnVcSfz+BBn/7Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/yKHq3c9e3uGgpl4ruRXjj8z5brLv19LBRwYLdjeLQ=;
	b=LxzZgGdpNXRN7KkzOGpUWHLwwLQRbrq+vsHJ6YGe5p9mDn/SY10DQhaNQDuSKRirv9xEaG
	2eyoOfIz3dn4OCapg/r48v27mnQ8Rk6L9FDeb4WDjjCmzaNOpG+p/hGe6UtCofKnF4McTJ
	UJWBwL39nTmuIuLo/auTUY73D++Wqd3Tsf/oTSunJFRpQSTp3IZzCruM734Ytw0+4hc6iR
	QUnm6N+ujry9tDKN4ppNmH02gdPB9UxE1waSYdgXjdQapvcc57t9s853wZFZgGjYHxOVVo
	LuIRGEjAeKX9Re7mH6Obd8ybqu1BUuN7VH1+s/myAXPASrnYdO7EJExvmKsMIg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: renesas: salvator-common: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:54 +0200
Message-ID: <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bu4mjmjt3nfsrmw4q3j17h6hhuu4f5cq
X-MBO-RS-ID: 4dcc9fe492346b65882
X-Rspamd-Queue-Id: E730F4C4AC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31969-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,4f:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]

Use standard clock-controller node name for the CS2000-CP.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 0b29bf9564eb1..b1f56efe25d9a 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -507,7 +507,7 @@ ak4613_endpoint: endpoint {
 		};
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


