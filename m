Return-Path: <linux-renesas-soc+bounces-29609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOvNIFtTuWnYAgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:12:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B42AA9AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C2B8309C476
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E43E3CB2D9;
	Tue, 17 Mar 2026 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OBEMeRuI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731803CB2D1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752820; cv=none; b=C7fSs7xJNbJo77UEqJ9Ew4i6EGe2rSngR+lDbC72hQmNEzBNStoAYLLyD/EinkU+T1rrpybGufC8JwUVdWI/6uwx5PBrmN/a6fXG1UQtIWoDeF6Wfxu4JeaSrgxnVln2ZWKHv1f99A2E3cOUopcpUTB/VBEDskC5aSGbN8+tpVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752820; c=relaxed/simple;
	bh=Z6SEu1iR0OOJVNDnzwLH7jOvHp/9H66QVURaeQ55kqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snsptrXESIZOBWM9xBvrajXT+qBzZI56y0oRj8miK792B5A/FlIs4pDaqknhW9mnis2mxrDYy2w7qI5YO5EHdKDtxFwVGPsg52S/zzCKhAfkowM+eYZMEe/3C+kkecF0v8O0pAFDFuD2i1hF2VFsT+of8DrLMVAVr31iShZGXq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OBEMeRuI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=66cafDy73BMhGTMwKqMyviHzFurY54vde5tII7vbsUQ=; b=OBEMeR
	uIBD3GYHLir+BELJtokKcd6c18qIX7Om/WwRHUjwlfT/N4YGZm9pSiCmVxeND7sU
	vALxLdvCGGTYJPPrTdC0Sow2P1UlzM/QSHtQ+7aEEa932LBIjA9D0TvZ45C1rkl7
	FKfFZp482aYvFzPYcegwD4EbNRKy7X+dXTSjEUYBTEBnFWRoXzOZOENBOntpO0p/
	eDVu+xD6iZHhz9Xl0NERuK8/V2hlpLIxOugcEMMeKYPMvQLv+IQ1ftHsfE2X5ciO
	J+saMkVYLhYXl0rIMJlEvIRMeeguJNgj0JnI7OK+5kLLXdX+tMzFd2iGY8Lqgjya
	BdOgACsmnlTV3bQA==
Received: (qmail 287691 invoked from network); 17 Mar 2026 14:06:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 14:06:56 +0100
X-UD-Smtp-Session: l3s3148p1@5wuKAjhNWrQ+XdJ7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 3/3] soc: renesas: add X5H PRR support
Date: Tue, 17 Mar 2026 14:06:36 +0100
Message-ID: <20260317130638.2804-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29609-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sang-engineering.com,glider.be];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Queue-Id: 236B42AA9AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On this SoC, PRR is now inside the MFIS memory block, so we need to
access it similar to e.g. RZ/G2L.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
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


