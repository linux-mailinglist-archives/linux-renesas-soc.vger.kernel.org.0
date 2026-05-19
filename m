Return-Path: <linux-renesas-soc+bounces-32807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFLmDJ5nDGrihAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:37:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09C57FD26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1639E306BCDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E29348C67;
	Tue, 19 May 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM17acKl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA23348C63
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197440; cv=none; b=KINZtDWFU5rcjx4ZA6dAInfIwCZCEH7W9fuZjpDYPaEDuldpICbggkpVyYIII4wea9rFN/iSZ68GOzqafAJi52xB7ha0deTHoLoHxZTDrhMrpO/Lit4sDft8K+tbiyTBtoCLyCJX9+vlso+uTkPkNccIcdiJN5I4uLr5aOMnoDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197440; c=relaxed/simple;
	bh=T7hmCnyhQzzscqgFF2ZS1aF6SwPsdArS5/C7Z+iJcVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHR1x5Jyi5LlEOoVJKQjXsA5nNppY91phFBTN8c13VViiDvIZKmoezAZXDMQEj09bVVAZiChcvy3JN/hxr7zsDQnNKEWwtFKuGOjnTo4FxHW4MC09cFppja4GWo2bKtVfUZJeiTU7hGNnuRW71rWqrhhpgzXQZuEDaNBs7EW4pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM17acKl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso36558945e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197437; x=1779802237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKiZp6w902hBrKMv0fRjCuQOc40X5kR259+Yoc8tiYk=;
        b=jM17acKlcoLbkVA/VLY6b8YYxhnvT87fG9oGIh04hDKEmNDa7AzsGWsLXqH7szLrjF
         F7uwuteTOBFRdsygRakPiQ1SCJGSD8TsEjzYC78S52k6BgRWokP8lCim4ikvVoSukXF2
         0tjEn+PzK+phoHsS+7MOTLzhtz5rBc2oDmFeW0nByhtOwxhuE2Xmz0C0V0EB3gDdA/Hd
         Jp4FoWSufMwrfgFQoeyf/zsibPXvxDnAKYsW2+wuf0M1S4+m7DyYy79I9kBu2ChB/tIo
         FRZ/KIQDAlOp9HVRqc7qqlQFMWxvPaSltGgnTJOC55c4L25e5Cs4JJsCk4JptZcANVxJ
         ULKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197437; x=1779802237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKiZp6w902hBrKMv0fRjCuQOc40X5kR259+Yoc8tiYk=;
        b=iRc3F2D5abzqhw8H4m7GaQfxWsm4x93rM0E9CfTq/+4/bNiZZhI35tjNy+9zvVWvPI
         jZZ0EOWnEvAvpmryP1KVKpESD7SfaiyLHVcv92HrABq7EWfaygB0XEisQm0tIthx8Dj0
         znrNJQdqOszBT2PSerqULhRJ1EkfI2yRBRJt5kbwcNAi/pt2n+IMTOCpbE98NOwqQdsh
         zD9XG1j08rUuFBLzBWHzFpmS9SUhpP8HnCJmPoobjrN8VpLSeCRx/6PySCHKXw4SWDbK
         6TujQ3G2/dy79C1nV3D2epSMsGo8wX5DXAzgH7lItm1GgiQeztGogeLGkJc4OnCu2k90
         T6jw==
X-Forwarded-Encrypted: i=1; AFNElJ9tW1eXDOqQJa+emuTHGLZFsUZ2HbP4D0Yi1gtFVcjxKWtXSlQsGhcVCP9y008CHkFZH1HTaHPD9DalOFxqlu+5Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/yEeX+QaXrdRxKGx6i7gpYFG8CVzZ+qO4ERaLSnuoKff7rQe
	aXIkKGT+Llilo4AKrwsTSDN+QVJrKpR5NTO78krDC0s1ay/Jy9vYK7SR
X-Gm-Gg: Acq92OHlF6mDljCPiqgYyq4z4q6jxf8BKKDy4gOFJuI2D/Bv5QQvXyqjBOarjB9Urp3
	GMMflRryEr+uWc2GDWXZCmMqpORBfE1lYHMqVa7+9krt0RswhpbOeOCOE/N9FWi8AMdbIcGsKXN
	LvTFW9zJx+PyaqII3hG6aMBir372FafgPqCJ53NjuDoHv2Kze5V/qNFtq0gc029CYpd2gJ21l22
	ZwVIIzIsWTT7lTIPTEchRGd0/cSOaSFxNahM0fcP0WH+RkNaQLrh45asWN6n9CMZzhxGRyU9tEr
	at9n1vQtwSo2UfcA0t+T4FeJiJVHfBTl7IqLO2g8itLc1Q936KDkRclsplVTTFMOO9PAGEPgDYW
	KIvut6rgvOORzRt7nrfJqV9F5a729VDN9JpSvg3vs83moQW+M2nmX2oWwZfoP1Bt0NwJbYyM8ne
	9RVzli8XpoJIxDvlTKbZVf8X3ru9i4uCyk7LD92/neDVgLZUCM+HUmhYOi1LftnS/lfF9mlaRnu
	DWGF7Y1+YFj+xVK6hMlUOvbfq+uwDl1nS9eOw==
X-Received: by 2002:a05:600c:a406:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-48fe4fa1902mr235741575e9.6.1779197437094;
        Tue, 19 May 2026 06:30:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2a878sm168177835e9.1.2026.05.19.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:30:36 -0700 (PDT)
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
Subject: [PATCH v2] mmc: mmc_test: Fix counter tracking in mmc_test_alloc_mem()
Date: Tue, 19 May 2026 14:30:25 +0100
Message-ID: <20260519133025.618255-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32807-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7B09C57FD26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix an counter tracking in mmc_test_alloc_mem() that causes a kernel panic
during error unwinding.

The `struct mmc_test_mem` uses the `__counted_by(cnt)` annotation on its
flexible array member `arr`. While kzalloc_flex() initially sets the
counter field (`cnt`) to `max_segs`, the allocation loop needs to track
how many elements have actually been populated.

Previously, leaving `mem->cnt` at `max_segs` meant that if the loop failed
midway (e.g., "Failed to map sg list"), the error unwinding path in
mmc_test_free_mem() would attempt to clean up uninitialized trailing
array slots. This resulted in passing NULL pointers to __free_pages(),
triggering a kernel panic:

  [   66.172845] mmc0: Failed to map sg list
  [   66.176722] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  ...
  [   66.432747] Call trace:
  [   66.435191]  ___free_pages+0x1c/0xc4 (P)
  [   66.439119]  __free_pages+0x14/0x20
  [   66.442608]  mmc_test_area_cleanup+0x58/0x84 [mmc_test]

Fix this by explicitly resetting `mem->cnt` to 0 immediately after
allocation. Then, move the existing `mem->cnt` increment so that it occurs
prior to populating each array slot, using `mem->cnt - 1` for the actual
assignment index. This guarantees that the counter accurately tracks
initialized entries for safe error cleanup, while dynamically expanding
the `__counted_by` validation boundary ahead of each flexible array write.

Additionally, rewrite the cleanup loop in mmc_test_free_mem() to use a
standard forward for-loop. This addresses the unsafe post-decrement logic
in the original `while (mem->cnt--)` loop which evaluated and decremented
the counter field before indexing the array, and avoids a potential integer
underflow/wrap-around of the counter field if the cleanup path is invoked
when `mem->cnt` is 0.

Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Started with cnt = 0 and incremented before assignment to ensure
  accurate tracking of initialized entries in mmc_test_alloc_mem().
- In mmc_test_free_mem(), replaced the while loop with a forward for-loop to
  safely iterate over initialized entries without risking underflow.
- Updated commit message to clarify the issue and the fix.

v1: https://lore.kernel.org/all/20260513201315.3186621-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/mmc/core/mmc_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index ab38e4c45a8d..3c7e8a0704bb 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -318,9 +318,8 @@ static void mmc_test_free_mem(struct mmc_test_mem *mem)
 {
 	if (!mem)
 		return;
-	while (mem->cnt--)
-		__free_pages(mem->arr[mem->cnt].page,
-			     mem->arr[mem->cnt].order);
+	for (unsigned int i = 0; i < mem->cnt; i++)
+		__free_pages(mem->arr[i].page, mem->arr[i].order);
 	kfree(mem);
 }
 
@@ -356,6 +355,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
 	mem = kzalloc_flex(*mem, arr, max_segs);
 	if (!mem)
 		return NULL;
+	mem->cnt = 0;
 
 	while (max_page_cnt) {
 		struct page *page;
@@ -375,9 +375,9 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsigned long min_sz,
 				goto out_free;
 			break;
 		}
-		mem->arr[mem->cnt].page = page;
-		mem->arr[mem->cnt].order = order;
 		mem->cnt += 1;
+		mem->arr[mem->cnt - 1].page = page;
+		mem->arr[mem->cnt - 1].order = order;
 		if (max_page_cnt <= (1UL << order))
 			break;
 		max_page_cnt -= 1UL << order;
-- 
2.54.0


