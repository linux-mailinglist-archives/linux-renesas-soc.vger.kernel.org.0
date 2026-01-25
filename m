Return-Path: <linux-renesas-soc+bounces-27393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFAkOF1mdmkmQQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 19:52:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A7181D40
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 19:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A8253001025
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 18:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9D01E9B3D;
	Sun, 25 Jan 2026 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gYbwWaos"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A79248880
	for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Jan 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769367132; cv=none; b=bZN9tVrb+fA30uG8tdfLU/ZZbN0CBXBDg0X2D7O40Wi9EUsUEAVwWuarfRWHFwrLkHZbU908PszmaLxGNzjoKc4VJbtx9TFkuzHJpjKisPrglW9ODFYN1EkZHw7HPxbQWA8DfGayaqYAUkM70WGMkY1/6/FYt1IT2gF49AAEM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769367132; c=relaxed/simple;
	bh=W7ntiEhgZn/T9SK9RAONWpu7pdiWIJHEWtGeTz8qc5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpx7DDsvVevo+601IaGKe5Oq9TsidlXEQPhxZz2ydQb+DDp9Vo7mEOplXYIgUEH2tD8D9tg1ds3NqOreVxbo5BC+inW77BOpZhiLLhdzB6j3XUfnsCI4GkViLKlcxfZ9qqQxBy++hEqaSALt8EpodSeK1i3Kjz/m78x2V4eyUA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gYbwWaos; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=E6BeMEJlgjSIUTQuX6JMUqaREyvh2C86tjXwrXmK7To=; b=gYbwWa
	osf8rgik0phuteZv6GqU7iUnQQbe82XkcN5tRAnuxbsfuSYAKOsfz6mHH9D1eVrV
	TP/AG0NYXJ+Dq0mclXVqkqdpsRgX8MVP+iNvJ4vbId1G2Q5TEZX2ojEkmtdXfnGy
	A9PWNLOeUJpgulXgKYVRLzx4F2pOoxYTza0za+KL5mHYXvH1XQcCuopXqN4g37pP
	H+/3RQ8XkoTEcz8f+RkpmLygQqFHafYDFiPxwM+S/tuPcKAOYzmkoigbFdk3fxR5
	GKlz+b7VbgVaeP66IIG9Qg9Orw5aYWDsxV2NlE4v/XHPxbsJ/ShgUQ/dcedL7CDF
	O2hqiBKoYW9yQ45w==
Received: (qmail 2369669 invoked from network); 25 Jan 2026 19:51:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2026 19:51:55 +0100
X-UD-Smtp-Session: l3s3148p1@c4Be4jpJxSBtKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 4/4] hwspinlock: remove old header file
Date: Sun, 25 Jan 2026 19:46:55 +0100
Message-ID: <20260125184654.17843-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	DMARC_NA(0.00)[sang-engineering.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-27393-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+]
X-Rspamd-Queue-Id: A7A7181D40
X-Rspamd-Action: no action

All hwspinlock users are converted to the new header files. Time to
remove the old one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS                | 1 -
 include/linux/hwspinlock.h | 4 ----
 2 files changed, 5 deletions(-)
 delete mode 100644 include/linux/hwspinlock.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 18f4991044ee..308ed5d7ac8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11188,7 +11188,6 @@ F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
 F:	include/linux/hwspinlock/
-F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
 M:	Alexander Shishkin <alexander.shishkin@linux.intel.com>
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
deleted file mode 100644
index 7220f7f2368b..000000000000
--- a/include/linux/hwspinlock.h
+++ /dev/null
@@ -1,4 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Temporary. Until all users are converted. */
-
-#include <hwspinlock/consumer.h>
-- 
2.47.3


