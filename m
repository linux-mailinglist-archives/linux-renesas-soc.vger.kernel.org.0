Return-Path: <linux-renesas-soc+bounces-32785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAO/CNgXDGrrVwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 09:57:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D55579863
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 09:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD0F7302F9F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 07:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE763DE45D;
	Tue, 19 May 2026 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LyqKPbrV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDA3DE457
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177387; cv=none; b=lWn7X+M5kD1JyCnZZhdFDewUl8QcN6SBtcGDRG6u/EP+PGSnCImvjcdXkSgN2xIdFUUelDXgh9GUgOypdyfXuXF7yKHrl5erhZXjMdgxlRHUFAd3oMQqANbNY/Y2yg/rReY4AkbHo3ZtrQjp7bybBVtnvAsDdttt3OdUWqy6S2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177387; c=relaxed/simple;
	bh=PXJXzbY3Zgcr6eePCkKDRWKnJXddIpuhEk08gJbzEaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtYcgR9ivyDY6+7FXvjO9TNUaxoSwJcZmVfzi+yewGkzO0O8vjBFBxsjTLLErOeKl6kBWw/0y0D/y+zfbIcQ73DNLHkn9q6DasgmsDkXflqH84tmYDfZ083D7q/ymdj58Y7/4XqFHPs2KqB9/ItRaphE4kd9HHOW0zKbGzjLlic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LyqKPbrV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Vk3PHAtVYjl7toQuX+dg2OLdM5W+Uf3V2OsQbVEw0QU=; b=LyqKPb
	rVSiuAtr/OpJYDHWd4T/xSD45zxpZYKTXAhcRD2WSfvtlfNq+PBTMEBrcMhGyM6g
	yMDBfXoTW+ZRSpZPkLVA7Y7bYHlJ8/O4bALYDvJVzO+Dgo+NfoJpNyxqqn5D0vsZ
	Zpk+Pyo/e3Gfm4g8ILFEnWg7aT8OsZ9uixSiYhGowHlgEt2qSE2+lc3ezqTr2Kb0
	qvFmt4gWNasORYCxAA6Gt0kUwTHVHGFRmmSJY8zN3elo9HusXGxkXw6HCr7G/Yqr
	3H/pm9QyJ5k1u8xjCi45LmCmDCt8flrXOcqXob0fmcWki6r2+wNsGgmZZM9AIxnc
	bGiKzV0tW8bEy5Ew==
Received: (qmail 170789 invoked from network); 19 May 2026 09:56:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 09:56:23 +0200
X-UD-Smtp-Session: l3s3148p1@wA/oAydSI9RUszca
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: renesas: mfis: add R-Car V4H/V4M support
Date: Tue, 19 May 2026 09:56:18 +0200
Message-ID: <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32785-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:dkim,glider.be:email]
X-Rspamd-Queue-Id: B8D55579863
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The above SoCs have only 12 mailboxes and do not have an extra register
space for mailboxes. Everything is contained in the common register set.
In addition to adding these SoCs, the other entries get updated to
enforce 2 register spaces and their specific number of interrupts.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
index eef8c0a59e9c..72b9fa67d1f7 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
@@ -19,25 +19,29 @@ description:
 properties:
   compatible:
     enum:
+      - renesas,r8a779g0-mfis       # R-Car V4H
+      - renesas,r8a779h0-mfis       # R-Car V4M
       - renesas,r8a78000-mfis       # R-Car X5H (AP<->AP, with PRR)
       - renesas,r8a78000-mfis-scp   # R-Car X5H (AP<->SCP, without PRR)
 
   reg:
+    minItems: 1
     maxItems: 2
 
   reg-names:
+    minItems: 1
     items:
       - const: common
       - const: mboxes
 
   interrupts:
-    minItems: 32
+    minItems: 12
     maxItems: 128
     description:
       The interrupts raised by the remote doorbells.
 
   interrupt-names:
-    minItems: 32
+    minItems: 12
     maxItems: 128
     description:
       An interrupt name is constructed with the prefix 'ch'. Then, the
@@ -56,6 +60,26 @@ properties:
       <dt-bindings/soc/renesas,r8a78000-mfis.h>.
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r8a779g0-mfis
+              - renesas,r8a779h0-mfis
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+        interrupts:
+          maxItems: 12
+        interrupt-names:
+          maxItems: 12
+          items:
+            pattern: "^ch[0-9]+e$"
+
   - if:
       properties:
         compatible:
@@ -63,6 +87,10 @@ allOf:
             const: renesas,r8a78000-mfis
     then:
       properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
         interrupts:
           minItems: 128
         interrupt-names:
@@ -77,9 +105,15 @@ allOf:
             const: renesas,r8a78000-mfis-scp
     then:
       properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
         interrupts:
+          minItems: 32
           maxItems: 32
         interrupt-names:
+          minItems: 32
           maxItems: 32
           items:
             pattern: "^ch[0-9]+i$"
-- 
2.51.0


