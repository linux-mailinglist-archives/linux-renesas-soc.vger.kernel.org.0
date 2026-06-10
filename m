Return-Path: <linux-renesas-soc+bounces-33826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dXIxOo+DKWqGYQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 17:32:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870F66ACFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 17:32:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5FE03109EAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 15:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55940306741;
	Wed, 10 Jun 2026 15:24:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B32BE05F;
	Wed, 10 Jun 2026 15:24:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105094; cv=none; b=tEIo+xhRoKM/CbE/a3Bfi51M+XrfSJR9iZZzmS5axKIp+q+2v5bxOCHalVcOYvMCg3vkeUUc/kVzfK/wI6hAMp/fo5E1jjdLgtc75hrcS95rfRW7V7Dc7ZgUEDIHXp9hkEosMYsa2tCA99riKmSx4O+v7cyaPa09367KyrajDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105094; c=relaxed/simple;
	bh=8IzCxAQXih+Sb8cJNqqX04/FqubEw8GSFBCCrdW1htE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahBLbF8j95GAMzsD/py1Gxlp4RVal7BcdSXIiEu8AQjnlH6TwsvnRctcxOkiPlPdQRqafjdioJkckAf8pbFgxD54n9oxGd+NOvEOVWFTnBV3DhZjZb0b+ctMjgQi8ldfEDEKvurNqN6r1hO88sUiO4Aw3N6NEa3nKAjvDUtwnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3CE1F00898;
	Wed, 10 Jun 2026 15:24:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: interrupt-controller: renesas,r9a09g077-icu: Fix reg size in example
Date: Wed, 10 Jun 2026 17:24:45 +0200
Message-ID: <364ff570c8a1845fab24bd89557f06c9e406f8de.1781105007.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:cosmin-gabriel.tanislav.xa@renesas.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33826-lists,linux-renesas-soc=lfdr.de,renesas];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,glider.be:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9870F66ACFB

According to Figure 5.1 ("Unified memory map"), the safety register
block is 64 KiB large, just like the non-safety register block.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
  - Drop Fixes tag,
  - Add Acked-by.
---
 .../bindings/interrupt-controller/renesas,r9a09g077-icu.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
index 78c01d14e765721b..a809bc4f75159c60 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
@@ -165,7 +165,7 @@ examples:
     icu: interrupt-controller@802a0000 {
       compatible = "renesas,r9a09g077-icu";
       reg = <0x802a0000 0x10000>,
-            <0x812a0000 0x50>;
+            <0x812a0000 0x10000>;
       #interrupt-cells = <2>;
       #address-cells = <0>;
       interrupt-controller;
-- 
2.43.0


