Return-Path: <linux-renesas-soc+bounces-30517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK0dAHsWx2mWSgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:44:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C034C7C6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44942306ADDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 23:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F405392C5A;
	Fri, 27 Mar 2026 23:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h2zIHxod";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pvdm50wL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285233C186;
	Fri, 27 Mar 2026 23:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654990; cv=none; b=DxCU6mCZAfRdnGZ3ofLL333KVSF64hl1ODdLFRJmNCz3TZ4loWi86MUDTt7CBZn7yQAncmtDu1tUST3OY4J1yjGEjo53z3k7hcSvd0cytCJbizxzEY9CyETaA29DJ2paAF2z0XMqM/AxknhfIDGhs9d05EASl3NRlx5p1qY0kxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654990; c=relaxed/simple;
	bh=PHP94wq1PtZAzQ8d+3f9ueoVhkEW0qtEx6oBFA4xh+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWmwI+JhSRR05TWxtOnGpuGQjNRUJlBeoxhFMpfnQIYeUF3wJOkarTlBMLRVuzrdRYNJYhZ2QV/GWIR5/4r4q/8IdUoB7wlXF/AeONNsgglkRG6n50sUzEDfaCJEE/fCIjGb3g6Vw2Bj3WCVlcoIdZF+KsA642bTHiUlCzCl9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h2zIHxod; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pvdm50wL; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fjHJN6Klrz9swL;
	Sat, 28 Mar 2026 00:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYJeCF0nQl7zb6MrpSRiPjdvriFm9do248PLZ8Dx1kY=;
	b=h2zIHxoddhXiROdSWkj1sd/PxanJr89alb6KUZuHSZ6+T6VH0G1ZwFXsy4lMA7USc1gqSQ
	WhAQem6P1qFe6eHSq2XkhPB6b4kDHRy1iBxV6AbxFpRo6O5aFky+llMs8qJnD9AofLp+sF
	Xl5DgldfdCkATTXleJ93H3W7Ok2XmK8kztf95ftjJL1zI3G2QSSF2rrltn4Azy6wKeIdou
	d68ZujTrDd+H9WhncSGFhlygv8BGpcnyM0UEhPqFCyGTFYflg1f0AnsB1dBbgDuKoiKwR+
	BZlNWWRUOOOyacLKstxUKnjawADihByOP0qzSubOUIzOo6hvpuT8dP8FMQdJJQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pvdm50wL;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYJeCF0nQl7zb6MrpSRiPjdvriFm9do248PLZ8Dx1kY=;
	b=pvdm50wL9FtQT+RoI4OHp5SgIqEjO1KOLeJx5BuSVN77BTj5mXBUPtZPZasL+PIx5vofde
	heX+ET+eQpUxaI59FBYqc2H6pwLB/SG45R8W6pWeKinpbMe9EguF/LlndASuQmHrMuqpvw
	mT7TDftROD4Aq006gbyPu+1flcjf0U7DzdClRVHFZ+z8OxABRrvV0d279yJ5Jegjgb8WBI
	fWNbLHBBxssIapLBJ7qW/xhDTGptDnOareHFD716un4gLd9ZTMjtMlLU1mpaC+pDJTgSOe
	2snLPgpr+Jg1faQy7pw0o8IuAdzCeoG8bDMSrG8TsGvzB2Jo39KfaSIFQI8xbg==
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
Subject: [PATCH 3/6] ARM: dts: renesas: r8a7792: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:08 +0100
Message-ID: <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jp5rmwcdfn34synzjd7jw6hkjcg6xh8k
X-MBO-RS-ID: edf64275894b926e806
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30517-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Queue-Id: D16C034C7C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing unit to bus node to fix the following DTC warning:
"
arch/arm/boot/dts/renesas/r8a7792.dtsi:89.12-94.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
"

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
 arch/arm/boot/dts/renesas/r8a7792.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index 9e0de69ac3a3a..fbdbcff1cbed4 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -86,7 +86,7 @@ extal_clk: extal {
 		bootph-all;
 	};
 
-	lbsc: bus {
+	lbsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


