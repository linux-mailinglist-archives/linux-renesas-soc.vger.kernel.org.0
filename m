Return-Path: <linux-renesas-soc+bounces-31308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ecpMLkcg4GlMcwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 01:33:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F72C408F74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 01:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 659A830C5851
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 23:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18163101C0;
	Wed, 15 Apr 2026 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I+YJxD6J";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kBBG6Pc9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF73101B4;
	Wed, 15 Apr 2026 23:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776296002; cv=none; b=kokhNrVnlfstyXqFu5ANEm3WT1/pFQjYbIJ9f32Cxn0bDLtESOKIdOHWNcojNOqYKYTnQ0Ajp9acMsNYEI1pNq7gjYlUsGhJx///L8OJJw6FU5aZ3BdE4LsHQgNrYfOwVA6aUqQuHC73mUtK6jb9P826JfbQ4ymJOMKIt2aE5b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776296002; c=relaxed/simple;
	bh=L6gso9lHv5J5ft8sRcy4+pND1Y3L8d0bC7G+oprQC4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxU92fmNy+sxLX0/OjYFcLHfLVPddPI6s45sqcpzS+fxtoLhIoRhy3p2vTNQI2GCWYZ51dlrpCOwzND58+yL9EADcTJfq1nn7en5AnhHdoret23qn5XOHtBsSo9il0Byd7atitaW4NbGfS2bLnT+tUT4r9fS78IlhX5h4EWnl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I+YJxD6J; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kBBG6Pc9; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fwyBQ5LQ2z9v1T;
	Thu, 16 Apr 2026 01:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Uzpxb6DtyGHQDbmAOcel7Q32uUlKf4f9KooP+/aMlU=;
	b=I+YJxD6JOeTuvdvqBS4rZfzM3Gc/UQ0dyk3c3R9qyHX9c7om+ifxD2VWesTrgTpZ8Ic3kN
	u8vrGhcawLS7uBNuBy/eQbK3/5OuiCHJpqTRsG31VepWRPHbYqqy8PVEzE2VY+kcfqhWzU
	+Tnl4cfTyo3WiPr4NMpP13mYS+rtbtY1d2S9fGmvJHVzvwBAUjGHOXSj1Xncu/tpzFqN9Y
	PJYBTHouqPICc0kjB6zlHd08rKBGfEqY5ZKSmr35keDdNkXdTvCOA30al5bb/zcdUBzX2L
	mW3KCUKSEB4EnqwPHiJpApR1kLUDTBf9DlPUPZtc7KXGdqu6Tk/RiTi9bRNy1w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kBBG6Pc9;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Uzpxb6DtyGHQDbmAOcel7Q32uUlKf4f9KooP+/aMlU=;
	b=kBBG6Pc91jhmGNTDv5o/v4UchGhW+21cU+Iq6ekWDvr2C95gjGBShLMXDppMLS+DN7hdPx
	QBojmQ9NhAr/HvUz8MprD3y8sAH59dWZTR6GL8faeqjCRKwtFeZapxQtOD9ShTABFoDzFn
	W6Lh1gHlTHnRdb/kWOlWqNQJNRG793j68YNSjQmU8697itXTSdr3H2yuvAbStGDvFfn8CM
	0KB8jNEzM7slP2K0E6PoK18WqyzT5+B1s9Zbfc1Yw31sUIN1i5JgHLDwwhmPW7O6mosMVP
	xLJz06XWt7qj5fCYK05mc1plWk7HgXSg8Vr+a+BlPts9sLJFAALYV6n3xqqd0g==
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
Subject: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:38 +0200
Message-ID: <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2307a0a962d2af639f0
X-MBO-RS-META: yb79zqqnpc4e74rh61ehhwnu18fx1bsi
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
	TAGGED_FROM(0.00)[bounces-31308-lists,linux-renesas-soc=lfdr.de,renesas];
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
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 6F72C408F74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document ZT trace bus and ZTR trace clock on the R-Mobile A1.

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
V2: Reorder new clock at the end to match bindings
---
 .../devicetree/bindings/clock/renesas,cpg-clocks.yaml       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index a0e09b7002f07..925ed35d6658a 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -41,7 +41,7 @@ properties:
 
   clock-output-names:
     minItems: 3
-    maxItems: 17
+    maxItems: 19
 
   renesas,mode:
     description: Board-specific settings of the MD_CK* bits on R-Mobile A1
@@ -123,6 +123,8 @@ allOf:
             - const: zb
             - const: m3
             - const: cp
+            - const: ztr
+            - const: zt
 
       required:
         - renesas,mode
@@ -240,6 +242,6 @@ examples:
             #clock-cells = <1>;
             clock-output-names = "system", "pllc0", "pllc1", "pllc2", "r",
                                  "usb24s", "i", "zg", "b", "m1", "hp", "hpp",
-                                 "usbp", "s", "zb", "m3", "cp";
+                                 "usbp", "s", "zb", "m3", "cp", "ztr", "zt";
             renesas,mode = <0x05>;
     };
-- 
2.53.0


