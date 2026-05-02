Return-Path: <linux-renesas-soc+bounces-31876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIlqDuZI9mneTQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 20:56:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A74B33BB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 20:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7D013011070
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 18:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7970738239C;
	Sat,  2 May 2026 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="urkVpFDH";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DNdkN5rY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10592FB084;
	Sat,  2 May 2026 18:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748180; cv=none; b=tWBtKff9i+zUx77gjMFDInlJbxTOTGhlLuYyLMuLBpwSLHpfRI/7ElhGGkJA6xubygH434d7mcGSDzS7rUX4Do42X778P5ih27oVzSogk+1qI9ieSR9Lq+CB0zVYcKQtmYVdxXiLdiOdNz8tA6As8BOjX/6v3/asrqlpqTBC4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748180; c=relaxed/simple;
	bh=SCl2xtltmL93OPjjCQu1B6mnUwtNXopQTQp9OqTXcjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7Mv+2i9GjNhZyMdaMQV4E6VU2EEbVvashLPDHP0+BcallqCPLsrjO5DnMIZ6M7T4YQfYhOQsI3JMtDKgOEf+AQyQZC4Vd00AMJzwYN4tHGirouyIolXKax3/aRHbZaLVZqlq6o8roxgF3wkpVsF+s7bWDBqDQKLpmcJCbUKokA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=urkVpFDH; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DNdkN5rY; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g7HDp6tmQz9slK;
	Sat,  2 May 2026 20:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8CyOu1jAgUyzExSTfTJ47zvCfGtulOLtwadhcScWE=;
	b=urkVpFDH8o76gzBzivWuQc4ccWWmNIyAtZ5AMEDT+cjAPGQCTIGlKPoMZOFZjQwcAZAbeY
	VmZ2tCAjhwf6cnRd136y3bT3wd+/Tv3HrekcONSfS1HR0sdEwdGSglZchq5erEQ7xch6Ib
	Dt8sv1NUKINVhpxZ9050NcxsbUJTPHj4iTa/q/PJQ0Lxw92uQSk60UOZyTkVd9cWTp2vQJ
	1yhn5C9WYG9HiPtStoZYM8BYpXJ+cYbreEKjiG8/ksco8XorbjLCyvXKImEoxKJLxeN3Em
	YNM6bl/jcPtXyyGHNftqxAxmqnzL+nyEMhKPLZy60YvSN11afFGg08PbYZiwPQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8CyOu1jAgUyzExSTfTJ47zvCfGtulOLtwadhcScWE=;
	b=DNdkN5rYz/3ln3lP4+ifoRGkLCjjHsmS6LvU7H/B9l8m96fmdspTiAKwerS+M6pvKkh6+o
	bLl+MxfN5jrQumTg3HafyyCyImcgtXUJEuynddsBBOsrjj6IrRKHwyD+/SQZTty5z4Bi7N
	4f5FB8If/gdm9frFxmYF6WR8qaleKHXz3vNg1zgRvy8Z52fcJ8VIZiGPnkxrgWIiVw1/Vb
	A7V3aVBsdTrOYJw2peU2kd8Y/DB4WAF7Fh5pfB4C1eqqvi+2vpIWrDuwoD/E/gm9gLgfN0
	E0MOYyBAUYPZzvoOTx03y7Dy5TaRth7n+MiyolYGZI8uSz7nWNN5H2VwxvBiow==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:42 +0200
Message-ID: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3scm56hh3excz98e688ii1y83ibo3aus
X-MBO-RS-ID: 413a3d3222bd004d73d
X-Rspamd-Queue-Id: E58A74B33BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31876-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,glider.be:email]

Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
These clock supply the coresight tracing modules, PTM, TPIU,
ETB and replicator. Without these clock, the coresight tracing
can not be operated. While this does change the ABI, it does so
by extending the existing clock-output-names, therefore if an
old software is used with new DT, the coresight tracing parts
will likely fail to probe, otherwise if new software is used
with an old DT, there is no impact.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml | 2 ++
 include/dt-bindings/clock/r8a73a4-clock.h                       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index 925ed35d6658a..703b5bf26717c 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -90,6 +90,8 @@ allOf:
             - const: zx
             - const: zs
             - const: hp
+            - const: ztr
+            - const: zt
 
   - if:
       properties:
diff --git a/include/dt-bindings/clock/r8a73a4-clock.h b/include/dt-bindings/clock/r8a73a4-clock.h
index 655440a3e7c68..028ecef81451c 100644
--- a/include/dt-bindings/clock/r8a73a4-clock.h
+++ b/include/dt-bindings/clock/r8a73a4-clock.h
@@ -23,6 +23,8 @@
 #define R8A73A4_CLK_ZX		13
 #define R8A73A4_CLK_ZS		14
 #define R8A73A4_CLK_HP		15
+#define R8A73A4_CLK_ZTR		16
+#define R8A73A4_CLK_ZT		17
 
 /* MSTP1 */
 #define R8A73A4_CLK_TMU0	25
-- 
2.53.0


