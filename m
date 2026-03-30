Return-Path: <linux-renesas-soc+bounces-30574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCwQOD9Wymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:53:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A73359BA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 424B5302AC00
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619FE3C13FC;
	Mon, 30 Mar 2026 10:48:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131D3C5DB8;
	Mon, 30 Mar 2026 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867712; cv=none; b=ekY2J3mptNbmznfRtBDI8imyJxU4/9+jbUkfGyM55Nq6vneMent4XJRFfK6nVlDJ9YzMYWc1SNQKOGE/MRsyjHNhuIp2ydVUlmFDLEa/zpJWoDv0WZMajRAFFiFYqYRYLvXCs4LKHW5JawCOMQeNEyrlhiSRqONlANkCbbw5Axs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867712; c=relaxed/simple;
	bh=MFNlQBask5tlbqzXB2h6hAi9KVM4XqNTR+M9bQFxOkw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ozv08jD2tTCqEr7TmKPZndrUynA2Q+JMdqGrCcPPRhNIYrtvR7mlNJithqaM5EYx6FywXMaN1vMGmXPrY7BcxbdHKZbGJWvU6H0c6LLneaBaZALhTxQSZTlYz4WdXsOqkrucOxllW5iUxynF2wKrXJ08v8tgUfQdQ1fKj8JNp1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 62UATRAb040497;
	Mon, 30 Mar 2026 18:29:27 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UASGfH038279;
	Mon, 30 Mar 2026 18:28:16 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:16 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename ax45mp-cache to llcache
Date: Mon, 30 Mar 2026 18:27:22 +0800
Message-ID: <20260330102724.1012470-6-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 62UATRAb040497
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[andestech.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30574-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,devicetree.org:url,0.204.119.192:email,andestech.com:email,andestech.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[minachou@andestech.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 76A73359BA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The AX45MP-specific cache binding is renamed to a generic Last Level
Cache (LLC) schema, as the driver now supports more Andes CPU cores
beyond just AX45MP.

Updated compatible strings:
  andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
  renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
  andestech,ax45mp-cache          -> andestech,llcache

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 ...ache.yaml => andestech,andes-llcache.yaml} | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)
 rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,andes-llcache.yaml} (76%)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
similarity index 76%
rename from Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
rename to Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
index b135ffa4ab6b..5b97625edd37 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
@@ -2,17 +2,17 @@
 # Copyright (C) 2023 Renesas Electronics Corp.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
+$id: http://devicetree.org/schemas/cache/andestech,llcache.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Andestech AX45MP L2 Cache Controller
+title: Andestech Last Level Cache Controller
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description:
-  A level-2 cache (L2C) is used to improve the system performance by providing
-  a large amount of cache line entries and reasonable access delays. The L2C
+  A last level cache (LLC) is used to improve the system performance by providing
+  a large amount of cache line entries and reasonable access delays. The LLC
   is shared between cores, and a non-inclusive non-exclusive policy is used.
 
 select:
@@ -20,7 +20,7 @@ select:
     compatible:
       contains:
         enum:
-          - andestech,ax45mp-cache
+          - andestech,llcache
 
   required:
     - compatible
@@ -29,9 +29,9 @@ properties:
   compatible:
     items:
       - enum:
-          - andestech,qilai-ax45mp-cache
-          - renesas,r9a07g043f-ax45mp-cache
-      - const: andestech,ax45mp-cache
+          - andestech,qilai-llcache
+          - renesas,r9a07g043f-llcache
+      - const: andestech,llcache
       - const: cache
 
   reg:
@@ -73,7 +73,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: andestech,qilai-ax45mp-cache
+            const: andestech,qilai-llcache
 
     then:
       properties:
@@ -91,7 +91,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     cache-controller@13400000 {
-        compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+        compatible = "renesas,r9a07g043f-llcache", "andestech,llcache",
                      "cache";
         reg = <0x13400000 0x100000>;
         interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


