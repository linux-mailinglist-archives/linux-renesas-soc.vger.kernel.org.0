Return-Path: <linux-renesas-soc+bounces-33965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OoKpOYaILGqnSAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 00:30:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7867CC36
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 00:30:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="jyrBBV/D";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA5113156BF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 22:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC74E3D3CF7;
	Fri, 12 Jun 2026 22:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693D2FB97D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 22:30:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303426; cv=none; b=ri9KxzVNyEyQde8WQvezueGXqu443NyKd7mpYyhVDpPZ3p3XQ7ZbVvLRGZTqHXZCyjBRmIAwHg9G7Uaq3e/SdKOP+yrSStXncAHU1CGQB8158E9zgNa8wTKSVQOnPodTDgYeyhloPwVb0dl1j49Yk+/x0FlHHA4dx5ALsdhxwdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303426; c=relaxed/simple;
	bh=gZ3n+Kgll3kq73yQeqlls7ZLOEc1Z5XF5nmxX3h3XHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVmKMM5AcA7JZ/y1sNl6gjZlHmP/YPlnde4QHz8tDLt4P/nGZTmRdI2EiG2N7fgppW2JYwFAn8gywwo8LeW1X2BVVwSkMvuFiFS4p9QONYCDS3MJOHrWPWsfhmuAJxNXXF+ai9GxDF+bda0NiaY5jFs1mt481bLVA5wKofWv0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jyrBBV/D; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Tk22QqNBn2VJgu
	UCN3Zcaq5q3QspvH22rdnYl/88cck=; b=jyrBBV/DMGN01Wd5a/F5omJ2FWgbw1
	weaFtqhnusNjTTTZbQ0ncC60SWDrP0XrAM4cAKxnashzfku5bRSgkFA5/aMlVryt
	EBb41SnOw71yXENsuyLk2Pmg21ya5VnZ7dTIOTs9+7oO2HM7h8v5bXr1ZgNORSLR
	Vdkn8Ud1eM+Zn+ry6UgSoS07pBwrBAj02pl7TelP97KASowfg1ZMaVUX+vTxz7MJ
	dFOEg/NmM5EiNv7SqZ9O6SGmD/cQ2KIxiYIxQaTJ3nzR1ZPiGKmDmxgjmcKucK8Y
	fBzbTaySOKqEVDUAaCpP3V73kjWcfRjPJWILs98U7DmaaCXssKwheusA==
Received: (qmail 2665323 invoked from network); 13 Jun 2026 00:30:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2026 00:30:18 +0200
X-UD-Smtp-Session: l3s3148p1@WydzBRZUBoAujnsK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: rcu@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] hwspinlock: annotate slot pointer as RCU sensitive
Date: Sat, 13 Jun 2026 00:27:21 +0200
Message-ID: <20260612223002.13121-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:rcu@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:andersson@kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-remoteproc@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33965-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FA7867CC36

Because 'slot' is used within an RCU read-lock, it must not be accessed
directly but with RCU helpers. Annotate the pointer to enforce checking
this. Sparse confirms the missing annotation:

drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:393:48: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:393:48:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:393:48:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:397:30:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Just dived into the topic of __rcu annotations. I hope the commit
description makes sense.

 drivers/hwspinlock/hwspinlock_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..50a875b2353f 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -372,7 +372,7 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	struct of_phandle_args args;
 	struct hwspinlock *hwlock;
 	struct radix_tree_iter iter;
-	void **slot;
+	void __rcu **slot;
 	int id;
 	int ret;
 
-- 
2.51.0


