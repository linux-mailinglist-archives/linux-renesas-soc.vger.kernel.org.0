Return-Path: <linux-renesas-soc+bounces-32458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK3cCCTqAmpKygEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 10:51:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950851D0B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 10:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE6F2301725D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 08:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBA238B15B;
	Tue, 12 May 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lhnMUiLw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394D389114
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575765; cv=none; b=s9pbqgBabKXWdOnHekZ5r6UWaXTOsTEh3rtSG7BaJTLY8GoCLOICXlzUzKw3MyHwTRhWH/zkMArUy9wYn8ODf0RNh+Kq7HnM509A9YnoCnF9RbwTiA0Ul83PXJnGXUlsBe7cY/Gnqzb84/3GnOj4QMfrH6s1SThtF+WDjSqhIQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575765; c=relaxed/simple;
	bh=/VsQN4XVPGeArCNXsSMOUGuMEsA3np4OZ+t7QDMzjXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FYJkDU+2+pDTI2T/PPAbPWen0zk1Crl7uszHgce/wybEbR4MMMZaGTC9VoUHJVhxENbP2CLKVggJIq9mu87cIegb1BHLCxGlGHotLvpn23c+sYY1CcHGuqbY1pHws+TekpJL34xy8JfQrxgPvEElbxpqjopggFfnf4/BORjRpwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lhnMUiLw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=gZFWGCc+QN5NQ5
	spvS6bX+zjGm1rbhV4VCgMWO+xCXo=; b=lhnMUiLwVC5CISeFyseppRdX2iJrrd
	3wozMPqq6smTutCY5J/OBM77fn56qEA8oNlhYxaOH/3ynxtVdted2Bfnygdzcl8g
	5XaDehI8qTrd8i4zAqKawLS0hvjGr4K+aVE5Mjj9GCjAgacHRL7L6IqK7BkBm61E
	VWxTSuhBvux/Q+5Se2s6JSxHmVhZgZX7Lpqf0pinfvg9Bb8N/GYXKX2qMqSl166y
	qFhEj9MgdizRQxKjhJnrxu+yhSVIsFPg80Yhb0lqYY/IIh7yzItb1cSXF8MxHNKz
	ax5XdFaBMrmvsO2SQ8Fqqe9Q/BKwz9oNREwFSLtyehZt51dfkfOEtZ+w==
Received: (qmail 2912974 invoked from network); 12 May 2026 10:49:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2026 10:49:05 +0200
X-UD-Smtp-Session: l3s3148p1@M0F675pRjoEujns3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] hwspinlock: propagate errno when registering single lock
Date: Tue, 12 May 2026 10:48:23 +0200
Message-ID: <20260512084856.30497-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8950851D0B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32458-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sang-engineering.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

hwspin_lock_register_single() always returns 0 despite checking the
result from radix_tree_insert(). Propagate the errno to make sanity
checks in callers of this function actually meaningful.

Fixes: 300bab9770e2 ("hwspinlock/core: register a bank of hwspinlocks in a single API call")
Link: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com # review of patch 14
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..a509b73da190 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -472,7 +472,7 @@ static int hwspin_lock_register_single(struct hwspinlock *hwlock, int id)
 
 out:
 	mutex_unlock(&hwspinlock_tree_lock);
-	return 0;
+	return ret;
 }
 
 static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
-- 
2.47.3


