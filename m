Return-Path: <linux-renesas-soc+bounces-31234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKqlBLjI3GmcWQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:43:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 755133EAC48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E75300FB71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AF03B6BF4;
	Mon, 13 Apr 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KzuOmP5K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B063370FF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076970; cv=none; b=NboJA3ePuCUb3EtFC3POOXLmaFtIYy4B46i0+Cl9KfiNcBqlHHkIO2NOrCiTqbnlJUAhHItktfNf+WFY6wCexxJYqRV7rCbXuwghpOhpk29XfTD16q27IfxQ1J32PfGrL3u+qFoWw/Uml9sgJSlxepD2B3+eV7U6OOUsNBtiDaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076970; c=relaxed/simple;
	bh=ddBwk4QOSkBugdgQUDUB6zMSCHOhmj6ecKcicRyfeLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlwGoTGrvQhX4Zt023Lz361RBQaQR2692kVul8EHLL1xlLIh+gHraHMffbXDYhQYjUyicb6QFvm3NU82i/gY5R8GZTQpJWpREhUOqTk8E/bbIXSLNPQ/+c1abGWExe2HkCCZZD68fC2El4KFhxg7PA+SrluyPxGWZp+M8s8/BvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KzuOmP5K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=nTclSCn0962mLnu5azu3BPWWzp6DS+Gv5wIel996218=; b=KzuOmP
	5KJG7gzZAta2qrKiQ5cUx2z1d3Ra1tVspdwMdD1a7mYMtObIP82dw4fAlxVDb7IC
	rki9BK4sMsGp8TD3TSfZUAonLcsnKa2TeQi8vYzmY2JbA4znP6b/YjEbu38gEjzN
	RNB3VyhVTQcGgVP3uOij4SHlgQ/Aex6x2cOOKWutV+2aj5OACljEseLu49E7wuyB
	tDmEbuu4u6b7pYzItKq2JW2aQrwfVZWfNmCdSGxF5RPP5Ej4jhncTKpvWedy+kqm
	Mz9MYbJDQaY8IOZvAVIdRn8Bwk+mBEEzzcmZ/NyD+NT3SVb6D7oTRNkRAePwc779
	e55SkROWh+IHRwzw==
Received: (qmail 2255994 invoked from network); 13 Apr 2026 12:42:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2026 12:42:44 +0200
X-UD-Smtp-Session: l3s3148p1@RISNJFVPzr8ujnvz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: [PATCH 1/2] mailbox: add sanity check for channel array
Date: Mon, 13 Apr 2026 12:42:38 +0200
Message-ID: <20260413104240.30493-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31234-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com,linaro.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 755133EAC48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fail gracefully if there is no channel array attached to the mailbox
controller. Otherwise the later dereference will cause an OOPS which
might not be seen because mailbox controllers might instantiate very
early. Remove the comment explaining the obvious while here.

Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

On my Renesas R-Car X5H based board, the OOPS was indeed silent. I
injected the error manually.

 drivers/mailbox/mailbox.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 14d9655d5424..0ed34f8f7556 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -533,8 +533,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 {
 	int i, txdone;
 
-	/* Sanity check */
-	if (!mbox || !mbox->dev || !mbox->ops || !mbox->num_chans)
+	if (!mbox || !mbox->dev || !mbox->ops || !mbox->chans || !mbox->num_chans)
 		return -EINVAL;
 
 	if (mbox->txdone_irq)
-- 
2.51.0


