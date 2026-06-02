Return-Path: <linux-renesas-soc+bounces-33457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /wdFNjE7H2riiwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:21:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 254C8631B51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:21:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="DujbOkL/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32EBB30B9C9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 20:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F9B356758;
	Tue,  2 Jun 2026 20:13:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3B834C139
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 20:13:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780431231; cv=none; b=tk+AtPNVj/3YqE2i7byt+Uix2ukNvLGDP/olSGxy2B55vH/uGSyOgpn25U5O5bdhdgquTi+ueJVU6KpQUQl8NFVcNzyFo/F4xRPLM+pg+ShywsjPIyd/8QKZkE7IXv8LugM/pQvfGpCDu5MC4tRbq7fJEQy+PdBUEk1/ZombUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780431231; c=relaxed/simple;
	bh=nkKc9eAxXqQ+Dnqg7a5iNB9iiMTxfr611IbVN0vr3yE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfYQ2V/qoDA235RtFzRip2qAbd6MLgkx+R487UyMY/ZGg4TieIdAu7WvqA+SFXRDAZvfx0S9fH6+BQqK5/U1sZn61ZbcYo0VTxFHRFpSy2kknlFpwHbTrFxRVSvARaSBZBPw9cUQNpw7/UH7sNE0UV3DEa4ub4jiGo8gn/Yoa/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DujbOkL/; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49068493267so69116225e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780431229; x=1781036029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg5WhaKDN5P0G6TtyP193M1YCM4tZRnE2W1nIni4O0k=;
        b=DujbOkL/dJwStcwCC8tOaqiZK4y/msKUOFAqeeNcYMQxI3k+kIuEy9uRDBR8wNfnco
         3E2CAOmOtd4qEaxxuJ0qxfVUeQrJgeNhI/NBsbmodpNBCx4WumdjHd9r1HPCdaMpp1i5
         YGJc7SuOaoeO0bYEIC3FaHjXQKfyE0hoqKccxdmeXMzk0UbGg9VMrRuCOJpcWSw/zygF
         nJEgCJ5z35+w8nSWFWDKZwA4up4lI0YTs66AvA8nCmlfKCxbgj7SwAj8hDLvnZPWSNJd
         O03RmIAJmjmcp2abnnBV62ag1ipI3pOEN2hoV88pfSTnG5fH0etO7aag9rE4mVM12wa8
         4iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780431229; x=1781036029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg5WhaKDN5P0G6TtyP193M1YCM4tZRnE2W1nIni4O0k=;
        b=qYeS01J5OQEdr8l8cwpmWfcrVo5b1SIeAEFYFA+HRNOA/LYKWzryuEPzLgLN0hJ13M
         T2nMuY/2DxOQOBMN3kBy2jFgaU3wNsmkA1Jp+9TlQlaaA4oBp6vfXhONzbB9/T7w+PRL
         FEv0rUIkz5IVew0XpyI8xfbH/FWXVTF5tVUVJoYpBOD/MDSlYo2BY0X9sVMGzbilQ6rq
         0r1W9BYJoen+RxTaV5Qeq5bBIE31vYmGaAu77lZyeT40g940Xn9ueyt4lnQV0mJkmC6F
         FbwZGPqsOyJPObhwhQ8+K5CB6/xazXorzZt3xBMwHZ0jHblLuis4Js4ccjhZs12v7BRs
         JJ2w==
X-Forwarded-Encrypted: i=1; AFNElJ9A0A/cZFW9iXZ3LpnhNtTjcgpwPJ7Ig05+FY4orRqCX5xv02Gp5TLs9bz4UewP+bqDddVI6jJQxr+D0WUmFKxgIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Pf/JCPPQFOkEKLXZdPHRKcNH9mySNeEjniCbQFH5EbpNqLr/
	FkwqLiwAL0QWr01I4sFHUKZ0ZKc8LZCmE1zhBgvIGR268WGWjsnohlcl
X-Gm-Gg: Acq92OGdeMrAd2T9ODK4mjyYnumXjItspH4Wqgq2c+YmZ5ulHMZXb7inVngXxQ146y1
	QoeHFutrunQS+fY+uGFUpwSlLzWgXINdEWZ1ntUrHAnaneQL10eotM9jwbwlNun1Dh9OV0aHUKq
	JiFCXgQmiQ2aw3fHhXZUGmd0DdbplRUxEuTmXQ1TRZdxJZn59O4DKOoB14cuhhX8QAG6N+M1YU0
	u1Lp2qSyLtTPe7FhmK7x907U5NNVV9OtxPyTIlNUefp5q+TRAMehBYuxEgnct0I1GWf6sFEn2C9
	A+Pw0Y6VwU/FD5yaXP+NfnjBQkIFRVZfbagBQyGD7brv2Ne9mTkAdMaPWuBQBNmaljjLIYOFe25
	j+YbOhQ2xzm4nJIxnk5UJpGx3mp7uPe3XQ6U+ZAFwgIwM7bkH/fqQDrZ/XakMLWwwYRo0P7xy10
	SbBggPGhtSIBb8zMxOK/wBANOsn1Oh/gQleEpJtEHr+gUDxcu4mnFxpyZURifMlsXer6bs70xFn
	hGYA9IvuXD+jpp/tVtBbeiPONIuIwLSKGGqKmXmHB+8y/XGPhlhXRt6otIY8LHIvYo=
X-Received: by 2002:a05:600c:458b:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490b5fda3c3mr5787925e9.23.1780431228585;
        Tue, 02 Jun 2026 13:13:48 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b613f167sm1017515e9.22.2026.06.02.13.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:13:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] mmc: mmc_test: Fix __counted_by handling after kzalloc_flex() conversion
Date: Tue,  2 Jun 2026 21:13:44 +0100
Message-ID: <20260602201344.1809801-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33457-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pmladek@suse.com,m:geert+renesas@glider.be,m:linux-mmc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 254C8631B51

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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Switched back to v1 version of the patch.
- Addressed review comments from Geert.
- Add RB tag from Geert which was received on v1.

v1->v2:
- Started with cnt = 0 and incremented before assignment to ensure
  accurate tracking of initialized entries in mmc_test_alloc_mem().
- In mmc_test_free_mem(), replaced the while loop with a forward for-loop to
  safely iterate over initialized entries without risking underflow.
- Updated commit message to clarify the issue and the fix.

v2: https://lore.kernel.org/all/20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/mmc/core/mmc_test.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index ab38e4c45a8d..4dc16649e61d 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -318,9 +318,9 @@ static void mmc_test_free_mem(struct mmc_test_mem *mem)
 {
 	if (!mem)
 		return;
-	while (mem->cnt--)
-		__free_pages(mem->arr[mem->cnt].page,
-			     mem->arr[mem->cnt].order);
+	for (unsigned int i = 0; i < mem->cnt; i++)
+		__free_pages(mem->arr[i].page,
+			     mem->arr[i].order);
 	kfree(mem);
 }
 
@@ -341,6 +341,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
 	unsigned long page_cnt = 0;
 	unsigned long limit = nr_free_buffer_pages() >> 4;
 	struct mmc_test_mem *mem;
+	unsigned int idx = 0;
 
 	if (max_page_cnt > limit)
 		max_page_cnt = limit;
@@ -375,23 +376,26 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
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


