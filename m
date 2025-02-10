Return-Path: <linux-renesas-soc+bounces-12986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9094DA2EC20
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 687673A2801
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 12:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECEF1F8922;
	Mon, 10 Feb 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cL4zWusl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B9B14B08C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189040; cv=none; b=qt3BZ+vLoJmyeFUIrq8rj9B93d9wHivOfoR24znNMMM9gh1H8qi701B8iR4y2jFhGek0ZXziH9bqG63AGrfxIA0IgJ5aNnEZRGUP0jQX6FHFXo0fl+qb6g7W2VXGGKhFxFOmF7cWK5tMsqDvy4d/TF3RyJ8PQn+wLxIM5xRa7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189040; c=relaxed/simple;
	bh=pVW2DPWWnRlO6cSkH00JI0wCj1XcBBDzCknXL3SDhBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXlHccRVumF6MzFNnjxpMhV3tyzmKSUvbBEU+mh272z46K0gLhbVGx9v8xa00EA/WY3Qza1oRCjER2iDmz6nYYmHUYf7yvpHd20sk1vp4BE9NgM6SgcF/farAZiucK5Dkk3YObe3RU0GjgFAu588E/8xqRgBwESDl5pYkraiRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cL4zWusl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=eO+wgU8y3xZjdZ
	TKGxeQQH8dsWwMBUyVXuKeHTDQXk4=; b=cL4zWuslEGTlrhCZedViw/JIjErjj0
	MEIebBoEfMdSY6BO8RKAepOp/dVMtw9R0uGPEKk0Uw7bO7n7rN5iHcp2FNt7qn/z
	Fal28J6HhdRodeC8gec/yMN3hMoADU8WypQDkjjYq5sLqC1iAOFU7/dlwpSXCGIm
	ND2A3gw4VXMhYTnxkCsaND4Dwoqq+jXntoENrzpBDRyiut7aJD+bCLdsvoJTwEk8
	MY7TxkELmilHyRxq10QkpMMX6xoVYakZvrOMQZB8OHa0MYzUAfwQ6IzNtYTB3LW7
	qnrIbVGzrEJi6tjAyJZVFmZYGG5JRn5vV/6/jOzSIfFCQQCXbKnAYpZQ==
Received: (qmail 810770 invoked from network); 10 Feb 2025 13:03:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2025 13:03:55 +0100
X-UD-Smtp-Session: l3s3148p1@PV6jgMgtZKpehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] bitmap: improve header protection
Date: Mon, 10 Feb 2025 13:01:57 +0100
Message-ID: <20250210120350.53901-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check to bail out if 'find.h' is included instead of 'bitmap.h' is
weak. It fails if 'bitmap.h' is included before 'find.h'. So, introduce
a specific define just for this check. Put the error string in quotes
while here. To avoid build regressions, all faulty includes have been
fixed before.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Here is my promised patch from the discusson at [1]. Buildbot is happy
with it.

[1] https://lore.kernel.org/r/Z2Goxx27WL-G-13y@google.com

 include/linux/bitmap.h | 2 ++
 include/linux/find.h   | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 2026953e2c4e..8a1e88080d46 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef __LINUX_BITMAP_H
 #define __LINUX_BITMAP_H
+#define __LINUX_INSIDE_BITMAP_H
 
 #ifndef __ASSEMBLY__
 
@@ -831,4 +832,5 @@ void bitmap_write(unsigned long *map, unsigned long value,
 
 #endif /* __ASSEMBLY__ */
 
+#undef __LINUX_INSIDE_BITMAP_H
 #endif /* __LINUX_BITMAP_H */
diff --git a/include/linux/find.h b/include/linux/find.h
index 68685714bc18..44812c4fb5ec 100644
--- a/include/linux/find.h
+++ b/include/linux/find.h
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_INSIDE_BITMAP_H
+#error "only <linux/bitmap.h> can be included directly"
+#endif
+
 #ifndef __LINUX_FIND_H_
 #define __LINUX_FIND_H_
 
-#ifndef __LINUX_BITMAP_H
-#error only <linux/bitmap.h> can be included directly
-#endif
-
 #include <linux/bitops.h>
 
 unsigned long _find_next_bit(const unsigned long *addr1, unsigned long nbits,
-- 
2.45.2


