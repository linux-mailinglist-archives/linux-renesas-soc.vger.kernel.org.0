Return-Path: <linux-renesas-soc+bounces-32598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC+eJoHbBGrYPwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 22:13:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E16AC53A60C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 22:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6E4F301953C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 20:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756B33A9DAB;
	Wed, 13 May 2026 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ja6pzugG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965743A2E36
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778703216; cv=none; b=Mnh1OsQ9YY6sHVhJx18a+MSPrT5xxvBMdjZTvVaNN6WjleB6xXjTR8deSGH4LGYrYUb7LRR82wjCwvFNfiAUfkwnIcu7Oe+qPc0vaxXllZGa5lLdCDA+CzPTBfXPkHBqAUGMn2HaOV4FTLi9zqGG62oyp2HDjngcKaPar6GHHUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778703216; c=relaxed/simple;
	bh=c/uTj3eUMahseda4ijCDXZHTgGCnC+nQ71EeQCnj+V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMc6wU10jMz39c4EsPL49YNzIPcto8hfuGG5ZLDPdA/Y0YWQ/ynsCeKbZrq6QhA9QjEKWlFwJbL4UdXWSLW4E8iTauHwwtB6fRHDdH+k4hiLjZWar2lm36ci33zbLyan0JNUbd23gH1D/e9c0yXYjyFp6sHbNwfDDJNMxJC7Cc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ja6pzugG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so59340905e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778703213; x=1779308013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcwsrIgXQYyK1SppA08OyTKLgYONdYnS8FYyBfl9uV8=;
        b=Ja6pzugGGmBBciUf98d3vCdvIm0CZp15cvbqCnIj2NVSWG9Zr2Kvpm7Pa4fljogrWD
         APSSeiCDb9AQcSbA3vrOv6/BXRcc6uw4jWhpsO/ugwRt8qppFdX4A16V0v5DygNtxUb8
         Chs6qZo0S3SBE+n4tUayYIAuyBVO0TkCDLHU3hQ0qUhcUFmzspzJv1lE9Q9F93VI2mRx
         0lVMGUTfpjfOxrQTsXqo4f0+b9LMCja7I7Y9SRBd6o47vXK2qsWDTuWtTpwV5R9spudg
         pefOz9JsTC+FXOvyiAR+wKBU53/Fg+jklyv6vcjk7aXiu8pyOS1l7sfGQdnmlKt8+1PC
         6cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778703213; x=1779308013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcwsrIgXQYyK1SppA08OyTKLgYONdYnS8FYyBfl9uV8=;
        b=QcpC8OH0k9lwM+03ujHMC9Q1rD8WG0Vi8nvg2VrYhtPdv6PAnqPurr+zU6YkT6YVrK
         qZ+KBxeismhKRAAVgxRQO3k0s+PK2hStZWqBRjkioZAzc3hIcE7fRf/54QPQTzxKp6z0
         7bDy8waWPlO3WXEylUd95Qt6ECabNJwPM9RV5XkOTS6o+mNfAA9d0m1ApNS9MLmFGB5g
         9XfTUVJ9xFgc4Hhh5wOlQRgZcCRug0ZKWG9Y1M78sSCcMzuaBhGd/s0IoEwtoz21eGUg
         MtQSk8PbuAb/Bvx6RF2/+Trxie5TaB1EzbkS0Q2QBIZT5FcJrXkt6/mGGk9IV1FWFw8A
         opgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AN4Ek4BBgPC/6d4PzdriTOkMTZL4gQmZTzCUcNr6QRyTqPeiG8m978cerl+fWo/KvFiL5K8qOv490LtbKJkuIbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0OTEZcdJHXia2S39CnfLtxUguN2dsNpbbyejrztwEd9rUHrg
	2V3GbejL1XFMqEYJ26ROEK5myM1bREOZLYpXARLu69IAIX5Ja6xzK824A6Xg2xnuvFM=
X-Gm-Gg: Acq92OEZVZkLNJakQqG/XkVhsxZQ/tAup7cr9Hy3ZgBnkHyaalHZUWPiD7faWTgwG0p
	jlBq2kJpZ5VkNXRbzeRRoy+IdgeUPuy8/qVFhp0indoXZjaHJMzswUJHFXsgJ9eDt3MDNwQLLOb
	jALyv94qHiE/eksci/uvKZyi6F7kVGXbxH32xM3cSzQBZ4njWjdUf3c0Z1z1YHFx2JDhdxA9QS0
	24IkePYW7zfBJHJnZsnUimeK3c3ifZFZsj9q4ZpabIM4gBCqPbKPV5xxMvWvjD1pWALi4c4oVKS
	34WnL5g4J4EaLSUXrTL8lxXxipbR/4ZnLfG4o5AWxh998GRar2XQjxqvVxw7dkAB3Gy2wRSrc5b
	04+lKiLPbQec9LNuNY8iv22mENZuUDvOKUJYNuQ2AXuri7c25UaKLcx6fyi3HJubrGq6m1yCNfQ
	RbdXGdErhIc84+1kkhy0datthciIkleVDBZsaVjiwRJuSl5HYe66Ql47KmGJ+QE/mW47s6x5+r8
	epv3KNHw4uH8sPUsw43uyaxiEpMSlNG8qVy/NIZKLPQTGyA
X-Received: by 2002:a05:600c:8b56:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48fc9a4bb0cmr78676015e9.26.1778703212855;
        Wed, 13 May 2026 13:13:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3e5f:9005:e5d2:460e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd649ea63sm11927465e9.8.2026.05.13.13.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:13:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] mmc: mmc_test: Fix __counted_by handling after kzalloc_flex() conversion
Date: Wed, 13 May 2026 21:13:15 +0100
Message-ID: <20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E16AC53A60C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32598-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix logic issues introduced by the kzalloc_flex() conversion in
mmc_test_alloc_mem() due to interaction with the __counted_by
annotation on the flexible array.

Bounds-checking sanitizers rely on the counter field reflecting the
allocated array size before any array access occurs. However, use
mem->cnt both as the allocation size and as the runtime insertion
index, causing incorrect indexing and potentially invalid bounds
tracking.

Initialize mem->cnt to the maximum allocated number of segments
immediately after kzalloc_flex(), then use a separate local index
variable to track successfully allocated entries. Update mem->cnt to
the actual number of initialized elements before returning or entering
the cleanup path.

Also rewrite mmc_test_free_mem() to use a forward for-loop, improving
readability and ensuring only initialized entries are freed.

Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/mmc/core/mmc_test.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index ab38e4c45a8d..e0e1b5df76dc 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -316,11 +316,13 @@ static int mmc_test_buffer_transfer(struct mmc_test_card *test,
 
 static void mmc_test_free_mem(struct mmc_test_mem *mem)
 {
+	unsigned int idx;
+
 	if (!mem)
 		return;
-	while (mem->cnt--)
-		__free_pages(mem->arr[mem->cnt].page,
-			     mem->arr[mem->cnt].order);
+	for (idx = 0; idx < mem->cnt; idx++)
+		__free_pages(mem->arr[idx].page,
+			     mem->arr[idx].order);
 	kfree(mem);
 }
 
@@ -341,6 +343,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
 	unsigned long page_cnt = 0;
 	unsigned long limit = nr_free_buffer_pages() >> 4;
 	struct mmc_test_mem *mem;
+	unsigned int idx = 0;
 
 	if (max_page_cnt > limit)
 		max_page_cnt = limit;
@@ -356,6 +359,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
 	mem = kzalloc_flex(*mem, arr, max_segs);
 	if (!mem)
 		return NULL;
+	mem->cnt = max_segs;
 
 	while (max_page_cnt) {
 		struct page *page;
@@ -375,23 +379,26 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
 				goto out_free;
 			break;
 		}
-		mem->arr[mem->cnt].page = page;
-		mem->arr[mem->cnt].order = order;
-		mem->cnt += 1;
+		mem->arr[idx].page = page;
+		mem->arr[idx].order = order;
+		idx += 1;
 		if (max_page_cnt <= (1UL << order))
 			break;
 		max_page_cnt -= 1UL << order;
 		page_cnt += 1UL << order;
-		if (mem->cnt >= max_segs) {
+		if (idx >= mem->cnt) {
 			if (page_cnt < min_page_cnt)
 				goto out_free;
 			break;
 		}
 	}
 
+	mem->cnt = idx;
+
 	return mem;
 
 out_free:
+	mem->cnt = idx;
 	mmc_test_free_mem(mem);
 	return NULL;
 }
-- 
2.54.0


