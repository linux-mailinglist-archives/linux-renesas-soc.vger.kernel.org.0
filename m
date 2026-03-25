Return-Path: <linux-renesas-soc+bounces-30224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKBALY/Cw2n6twQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:10:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5643239CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33CE930821F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B173C9EC8;
	Wed, 25 Mar 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lo3Z6cey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9193338E122
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436846; cv=none; b=KNViXyn9CC4i7E/A84b4VR4t9DgmWwprRnHwft9qbfdn9lour4WVS+mDCt835BxB5jaFd9hipmm7E1XMHa2L3yt0ND5hix0LZqxEFLPZz9G6Zl9yeP3ioZ2QB520qLH58sSgG2vj6SYLR2AzOGbfzns7F9isA+jcdVXrTVOoQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436846; c=relaxed/simple;
	bh=aIu5ABYuD1fk1eq9Ga3LCuwP7/q+DSpFfp9LZzrDYgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ow30bMUkRpZ5DQ08OZ2ALqj+jWqFv6/yLy5rhQE98B+Ko3dnv7t0LXQDRFZFKumHsHze98lpFpP/RXbpIM5dyJZ59ZcoHeyzLwxWhsc1JMZecUf+Y9VXtizpu8z/drlzxbxFwf3x6IHI0owuPJ1fUwuXcFJc3gPJgxqKYN5k64E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lo3Z6cey; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=I7vF7IE8x+s4rVuu/TSvtJQBlsbLrKRWI9hYhk0VV+U=; b=lo3Z6c
	eyjA+0t7DK2oQwma2ruwgMlWyQlv8MROR26thgsdOKcDg7Br4K7Q/IE4KYYeuZy5
	DwXL0VYnFx1Q8LftJsPAsewhZxlcL+rqUZv4OzzKQrDTKayuuFjEejzEyHnDoHMT
	IyxU4RLroiHR0agSaHy4aVg+DXS44OgHOemTqrui+7fMJ3SFCvUM9dM8Qbw5Xxq9
	A2Qhn0/BCiwLRFwWrPKLhq/igLbe6M88ukPQaZUDyqVHiq+Hcwn8LKzBWP8CXNlt
	xc73AZdG4D4KZlLQT16d7t26tjDjB4JH++pYg7V6OEQvrDba4n0kAB1/jryreDRi
	UhoAfw94Aoni8p8Q==
Received: (qmail 3520870 invoked from network); 25 Mar 2026 12:07:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2026 12:07:21 +0100
X-UD-Smtp-Session: l3s3148p1@z/yfRddNcqIujnt7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 3/3] soc: renesas: add X5H PRR support
Date: Wed, 25 Mar 2026 12:07:15 +0100
Message-ID: <20260325110717.17083-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
References: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30224-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,vger.kernel.org,sang-engineering.com,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D5643239CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On this SoC, PRR is now inside the MFIS memory block, so we need to
access it similar to e.g. RZ/G2L.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1:
* added tag from Geert (thanks!)

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


