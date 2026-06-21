Return-Path: <linux-renesas-soc+bounces-34268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N21MDQ5SN2oiMgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:53:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64986AA0BF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:53:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bAtLK4BP;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=girzEagu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B57BC30300CB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 02:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A23229ACD7;
	Sun, 21 Jun 2026 02:51:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B62882B7;
	Sun, 21 Jun 2026 02:51:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010277; cv=none; b=FEgHn+Pfd7nZs/GZ/z3vyHqDGSSByh576qyMawxHSm22Z7L/k+Cvbl4mdV7nzjuLsWLH/VCkCxU68GT4iSaMwu8UINXY08Q0VaVYHX6fct8BmkSpRj+DgGHq8d6r29qzqwySElw67ucciMUeUwE8kF9IyTrntlZrIIZNMxiHCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010277; c=relaxed/simple;
	bh=e4Ew263OidCv0BUkRhgjajVx3j5V+wwDcubRbMcmehU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXNrOlV4yVcmzvCYl/s0zQ16Id9x3HbFpKtrfxgMFjX+Y78NQXvJm3XNAxXTNWaX3m0Q5ihroyDl0cUSJlO+zOE3ZtI24IkGuSWeYs1lU7L4G02PmoKhHEqjsw7dctSWADr5bYrVF9ox8AjzGE3zS4xdtPka0gWTfP2QpYm3g4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bAtLK4BP; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=girzEagu; arc=none smtp.client-ip=80.241.56.161
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gjbSD1Lvtz9smJ;
	Sun, 21 Jun 2026 04:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ossxZ78Hg/cW+cDS48M+y/9kOzu3muGsd3p5SED7JIQ=;
	b=bAtLK4BPCaMvJ2Cbl0mhR63gGMz1ugr8KBEqyOnLWiNpqSNrBSY5ifspvtWKv0U2Mq02Iu
	GFieBfiF2V2g1D1mCPoSZ45fgzfP/U2aqd1nuUaaKd7oplIWtGIkQ9JprBbgMtwRJMPi2Q
	ubLEujx/MyHhmWnDahpo5YtLBoQ6L7EzCAPCetKgSJ94oQ7vwHlsOutQNwyarxQVep3j5x
	47udzT0adn7pddjgc3blse3wfV/ZP3tSJc+D4mMDt5OOgy+hoMT6wXfvAVjmnhhcupCKG6
	daOMDAt0W3YtVxvXAmXK0HlVkP7sleuEfxAnZm9FXgEr1jNWlXnHJADY6yt36Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ossxZ78Hg/cW+cDS48M+y/9kOzu3muGsd3p5SED7JIQ=;
	b=girzEagu0dbsURCZmH/6g+KI6s7bFGwqRexvFjfYbE0sokDjbBLUzxPin+rtfYDyndQ5QH
	GV5KYzQKlQBwYYGgHMIu5dmr4e1F2j1LcVm7lFhH1qsW57k3lYxg25k+LshY9x0H9fO023
	SpL28gdFJ1w0wuTOQTNoBpbP8RE6BrH9sCP7JMnFcaEWN1K7Ipm0wpSdr/KQ+oRNt7O4mK
	Xl4G/8Eh8OfPN0U8GkANqWQ1u4DUqm0Qcu4vko0T4P33Fb1Y+D959zq1JF2xKzQjystiZ1
	PtV0kJwpJcUCK26QSK99c12gfsAsfB93xqnx3f94IworsR89I8pVlpBBYZ3gsA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:25 +0200
Message-ID: <20260621025052.406507-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b2607534602c0fc3376
X-MBO-RS-META: xr66haj7tqn85hsdbt7pk3n14x7y54a4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34268-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E64986AA0BF

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
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 9d76e39eab72e..ad4491ba948f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -311,7 +311,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


