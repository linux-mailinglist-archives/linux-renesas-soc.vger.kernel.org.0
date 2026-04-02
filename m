Return-Path: <linux-renesas-soc+bounces-30735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNgINBBWzmnrmwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 13:42:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DE8388776
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 13:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E95CE309BDAE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 11:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4213D813F;
	Thu,  2 Apr 2026 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bUHfvwgQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F43361DA8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129280; cv=none; b=fY3Z0hURZF1RhG6VpPZ/pj6Dg/4Djp+Z5KCl9GMzuI2ZgMJCWnLnCWuw5PX61leJKheYJTebmM5EjJbneIlUY6xLzJXpg73vbZbwB8MVSCbiXo9AdNs87qttXdxnuKB7qil09U15CEYeO9kOnMe84b1CqP8gzS5L2GPv7SlSAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129280; c=relaxed/simple;
	bh=bGWGJx8MkhM629L4Zr31C8nT4U00Cvc66QjhBWFQUbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBetG/XBeYTv13Kk+SpCsbCmTyG+ebcVkspxnvSLmV2++1wT2Ku/pK3x0nYGTV1/2RM/v8W1zRg92IBfCLIvZE6lRr6w+Fy1zhIKBiiOQ+8s4K8m8ugkEVPvOIb6p+9L31laXcZ+Bq6iVgfvbwNDd7GG0qHOh1wDmzSuTJYGNKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bUHfvwgQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Nn3QaFo1np3L98e7M0Y1IBqFkF+Jb/kbVUUslInmhH8=; b=bUHfvw
	gQrUn4FWZGJMwNFr9asnOrs9n/PVtzCRhQ8iqThgvX+dNWBUO1oeVLzXHaZ2mJVp
	8kcwF0lsMAiHcdtzpFGalV6XJV57Zej0zVXubrsKkD8Nr4wDXqr7fTx9GtPTCGiB
	LdBUR4MzJnyl8sBIUcsDZV8WXLpcBLwzsy7dduwKQmf7/40+VQb3xwyzga7KIH7V
	7q61iEEIXPWJqHHM4b/nipkYo+RC39SdLtu7xLANBqMmKW6Jn3dMhH2AEKsOqYq3
	DstpZ4MxeP1YtmubDyxq5j7jsSfuP/sZl8j4SZjO8V5W0SPm06PxL+ncOPKmXy+L
	rhIIzCd0k4OJDgbQ==
Received: (qmail 2479232 invoked from network); 2 Apr 2026 13:27:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2026 13:27:43 +0200
X-UD-Smtp-Session: l3s3148p1@0lUmfXhOq9BUhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 3/3] soc: renesas: add X5H PRR support
Date: Thu,  2 Apr 2026 13:27:07 +0200
Message-ID: <20260402112709.13002-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
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
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30735-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[kernel.org,mailbox.org,vger.kernel.org,sang-engineering.com,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Queue-Id: D2DE8388776
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On this SoC, PRR is now inside the MFIS memory block, so we need to
access it similar to e.g. RZ/G2L.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v3: none

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


