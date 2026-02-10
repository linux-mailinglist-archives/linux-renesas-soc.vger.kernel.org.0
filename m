Return-Path: <linux-renesas-soc+bounces-28112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDdnNlMQi2l/PQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:02:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85675119F00
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 738F5303FDD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FCB23DEB6;
	Tue, 10 Feb 2026 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MU7konWC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7483311587
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721266; cv=none; b=nZmzPIj6O78D5+rueJWD+qEZOB4+9VGe+QmoN2P8mrx3JPIwp3tZf9FtqI8dUzIywPOrfdhWC4RIaxY0JOAMbYt7OibYalDMKV55KVbk6z7xZdLMfjHiwvJw5bPuzfmV6D59fCSiSwaiaQX4NkgoJrptz511C4n+rLX3RK06GhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721266; c=relaxed/simple;
	bh=wpQXoiGf6xuFOCX29KtA+mYn9kZEMHmil09SNGf3Hi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfSduqnTNvKb7ImQgTNm65DqmuMRVtNql1CiyOLABTWh5tMz6S3NZCt1J4xLcaBHRDB7Cbdn3qw+lhExWYaDbeSA/sg5yuKdjkckkEYl3NaFKmbrevgjZyycI9lY02CVmTl8f3cBfZ1o3htg6hKHdGWf29vKZvbpl59G4G4uRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MU7konWC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wwshHZNadT8HUjInGzJyUY51Bs+OpL0yMVN+dJVHkmU=; b=MU7kon
	WCxEAs3u8KAZ6m5PnGDsM2e4nJbiS/mqLydPqTj/ytwLxnPZT2rL8L5QmiZ+hnXs
	r8wiD/S85ZbCm2erZ2+EARpxQVeR3hBKCimCEwrymGi99yupyoLo0X8JoVKNi8DD
	x2xpgpj8+n8Gmdh7r5tJHXuENfIs6YSkZlmsHI4LbaANXzJtVlO3f7FvPLGOGiUC
	Mz1ceIPwvoUFFqTZhJXFbiwAE0fezHv3J2e1mzJ2T1+UvW5WNOc3QSTO+aVIYNG+
	hunE3Rx8vbHbr6XcnClVdAFzKbbhecRe23lTz1SZ4071wtWdnMGkV+l+qB60pH2Z
	DSh+FbjLMK1VIBFQ==
Received: (qmail 353891 invoked from network); 10 Feb 2026 12:01:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:01:02 +0100
X-UD-Smtp-Session: l3s3148p1@K7TYK3ZKopkujnuT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/2] hwspinlock: remove now unused pdata from header file
Date: Tue, 10 Feb 2026 12:00:56 +0100
Message-ID: <20260210110057.10869-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28112-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85675119F00
X-Rspamd-Action: no action

The last user turned out to be obsolete and was removed. Remove the
unused struct now, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/hwspinlock.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f35b42e8c5de..74b91244fe0e 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -25,34 +25,6 @@ struct hwspinlock;
 struct hwspinlock_device;
 struct hwspinlock_ops;
 
-/**
- * struct hwspinlock_pdata - platform data for hwspinlock drivers
- * @base_id: base id for this hwspinlock device
- *
- * hwspinlock devices provide system-wide hardware locks that are used
- * by remote processors that have no other way to achieve synchronization.
- *
- * To achieve that, each physical lock must have a system-wide id number
- * that is agreed upon, otherwise remote processors can't possibly assume
- * they're using the same hardware lock.
- *
- * Usually boards have a single hwspinlock device, which provides several
- * hwspinlocks, and in this case, they can be trivially numbered 0 to
- * (num-of-locks - 1).
- *
- * In case boards have several hwspinlocks devices, a different base id
- * should be used for each hwspinlock device (they can't all use 0 as
- * a starting id!).
- *
- * This platform data structure should be used to provide the base id
- * for each device (which is trivially 0 when only a single hwspinlock
- * device exists). It can be shared between different platforms, hence
- * its location.
- */
-struct hwspinlock_pdata {
-	int base_id;
-};
-
 #ifdef CONFIG_HWSPINLOCK
 
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-- 
2.51.0


