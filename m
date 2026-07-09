Return-Path: <linux-renesas-soc+bounces-34946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z8fnNp+CT2qxiQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:14:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7E7301AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:14:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B4A30ED67B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 10:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB47E3FFADA;
	Thu,  9 Jul 2026 10:47:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A240B6FB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 10:47:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594074; cv=none; b=YpmitS05FwRSfBG+B6S5PUIYBwFGUa+edpKb7t0UWlt0FVeDpiXkAKkWXYhellNGDNR4ViSlSPCyEoiUlh9SnrgL/BM7VjH8Qg4vzCDHYhdV+9S03nRpYaktCL5Bk7Bw/ij0e5GEvMsgncfn2JgGblKwRQ1O+3gf91jz3jgbAtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594074; c=relaxed/simple;
	bh=P7O7uTgJ7QBwbiJv4Jh9UynbJw5EB+rMsE7tohvbjRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0apjdW0Z8x0vPIrrKsT6dH8MIdFvPGOoV+gX0JCq9DN4j5zK7xdFXBpta+sVYV08z5t6vrdvQY/51YXKahyrkINkFdKvCkkCx0bXGXVde6ndZ0OI94PNMRJ2lCqqu67l2Mhsb3/9tG97XA2gAnOEs4KMR7YTiXgzS88UpfQRxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862141F000E9;
	Thu,  9 Jul 2026 10:47:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Huy Bui <huy.bui.wm@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: [PATCH] soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
Date: Thu,  9 Jul 2026 12:47:44 +0200
Message-ID: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:magnus.damm@gmail.com,m:huy.bui.wm@renesas.com,m:duy.nguyen.rh@renesas.com,m:kuninori.morimoto.gx@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert+renesas@glider.be,m:marek.vasut@mailbox.org,m:magnusdamm@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,renesas.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34946-lists,linux-renesas-soc=lfdr.de,renesas];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BA7E7301AB

The Kconfig entry for ARCH_R8A78000 contains both "default y if
ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.

Drop the latter, to restore consistency with the other ARM64 entries.

Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
Reported-by: Marek Vasut <marek.vasut@mailbox.org>
Closes: https://lore.kernel.org/a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.3.

 drivers/soc/renesas/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 8a625bc17091773f..e0ce51a9912beabe 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -356,7 +356,6 @@ config ARCH_R8A779H0
 config ARCH_R8A78000
 	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
 	default y if ARCH_RENESAS
-	default ARCH_RENESAS
 	select ARCH_RCAR_GEN5
 	help
 	  This enables support for the Renesas R-Car X5H SoC.
-- 
2.43.0


