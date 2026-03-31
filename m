Return-Path: <linux-renesas-soc+bounces-30647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBPFEDCny2nJJwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:51:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7BB368568
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B222B30BD9B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6EA39C016;
	Tue, 31 Mar 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K+uUHMOQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9793A6400
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953944; cv=none; b=cwbQBSsGneM8GDT1N8ZrDgRSBBpEzClELewL16/kMz3D/7ea1cF2JE5KzaouroNBFVO+sxjdtK6zjRjQhZ8uKS2KOTLzfit6t45BYp9HtDk+nuiVPM80PD59oWvfM6uaj002Khy6Go+gcLqjsAHNcQZ0vg0nDPUryxzEkeRNf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953944; c=relaxed/simple;
	bh=MhXebzY2l+UePRsoWuKRvuEtYZFTVabJDp6QhSopjvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQ5DTfWF3cNV0t1a1SuX5Ea9gp4QOmMEsbqPTlcDUJ0gM1Fy+7PGpI/0gu37fsLLZ4x3UEJYRVJ9FM5/PUeTjiILT6naGgKcVgQd6PNk/gPqEH9dSVkeSG67waoYrkzFBBjAdmiHM+aRue34WSORV6qds5ySUyY5gZj2Gcm5dvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K+uUHMOQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=v/OkImDE8PYM5dSeroRJxrCKUxjUqiHjXpB+sGkUpz0=; b=K+uUHM
	OQFDNq8ByTS/41OfGlAj8+MnslPIgj7wAf0x8d7RqHAN0hfHmhx/gX6rEOC3hgNB
	szGtOCgz3WkAxui0FQsN452wfhIjeRtXtYekr+wkibJdxr9sqApSyg+uhj1iPVNL
	ICwhc8vJPULPDjSxFqUW4D0wYwDf9LrLI6cicZVI8+KBvNJuuyjLHeuysPXjATuA
	QYl1V7jHd86C6ANzjFICJMmU6BIXpjvPnVsYS2+bcsqZp1+wA7Y+mziAKEk2JhPj
	/tT515MSpi/Wrmkt24Mf6VV0RHHcm2Hw5M7fQYNHp+Ck2Pp37xjJRhSL/iAQcbZ/
	Xf7omphv/tVlIP5g==
Received: (qmail 1653904 invoked from network); 31 Mar 2026 12:45:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 12:45:41 +0200
X-UD-Smtp-Session: l3s3148p1@Tmsiq09OEq8ujnu8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 3/3] soc: renesas: add X5H PRR support
Date: Tue, 31 Mar 2026 12:45:25 +0200
Message-ID: <20260331104527.29170-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331104527.29170-1-wsa+renesas@sang-engineering.com>
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30647-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,mailbox.org,sang-engineering.com,glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 8B7BB368568
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On this SoC, PRR is now inside the MFIS memory block, so we need to
access it similar to e.g. RZ/G2L.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v2: none

 drivers/soc/renesas/renesas-soc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bda..60b09020c935 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -442,8 +442,14 @@ static const struct renesas_id id_prr __initconst = {
 	.mask = 0xff00,
 };
 
+static const struct renesas_id id_mfis __initconst = {
+	.offset = 0x44,
+	.mask = 0xff00,
+};
+
 static const struct of_device_id renesas_ids[] __initconst = {
 	{ .compatible = "renesas,bsid",			.data = &id_bsid },
+	{ .compatible = "renesas,r8a78000-mfis",	.data = &id_mfis },
 	{ .compatible = "renesas,r9a07g043-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g044-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g054-sysc",	.data = &id_rzg2l },
@@ -501,7 +507,7 @@ static int __init renesas_soc_init(void)
 		product = readl(chipid + id->offset);
 		iounmap(chipid);
 
-		if (id == &id_prr) {
+		if (id == &id_prr || id == &id_mfis) {
 			/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
 			if ((product & 0x7fff) == 0x5210)
 				product ^= 0x11;
-- 
2.51.0


