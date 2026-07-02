Return-Path: <linux-renesas-soc+bounces-34662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fPvyENpnRmpLTQsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 15:30:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D626F85C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 15:30:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A33D300C81B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 13:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3BA472766;
	Thu,  2 Jul 2026 13:27:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5018938A70C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 13:27:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998842; cv=none; b=CWy71kbkZTpNsOtMlxZ1wvb/CUC9Q6s9cHuKQu9dSZazdEvIJCeqpadqynzNl8LhBMp+mieSjMYAk6Af8inn6LZHCRM8aGFBM+Fu4st7h3loDGOvaTVyMi4OMPzJO7J6N2XvUdUEFlG6c/8EMIJ93zwiFljsvuDppWagNPeFmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998842; c=relaxed/simple;
	bh=rFVPwRmJXOuukbckyExOEqxhcMrI3l8VWIHz4onX7Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sNkvswp95cFssv5nQIrrAueQSP6Yfz/Pm0rhl6hLS7b2PNByvdaql6dQp9h6626qY/AInrbCddJjMp76W72IYZ33QvzYRkd1hEZrsHnsbJi5x/VpkMfdjCFlI+kBmhEX6BdMmFm0IojUNc4s4QT7ZdH7QcH13Ghh0MMPI7aKkko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122871F000E9;
	Thu,  2 Jul 2026 13:27:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Expand MFIS acronym in RCAR_MFIS help description
Date: Thu,  2 Jul 2026 15:27:16 +0200
Message-ID: <b92a4b39a18aec7cdffdfdfbc75de4ecadb0395d.1782998764.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert+renesas@glider.be,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34662-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8D626F85C1

People not very familiar with Renesas R-Car SoCs may not know the
meaning of the MFIS acronym.  Hence expand it in the help text.

While at it, drop "core driver", as there is only a single driver,
unlike early development revisions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2f2251d06457c9e3..8a625bc17091773f 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -490,9 +490,9 @@ config RCAR_MFIS
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on MAILBOX
 	help
-	  Select this option to enable the Renesas R-Car MFIS core driver for
-	  the MFIS device found on SoCs like R-Car. On families like Gen5, this
-	  is needed to communicate with the SCP.
+	  Select this option to enable support for the Renesas R-Car
+	  Multifunctional Interface (MFIS) device found on SoCs like R-Car.
+	  On families like Gen5, this is needed to communicate with the SCP.
 
 config PWC_RZV2M
 	bool "Renesas RZ/V2M PWC support" if COMPILE_TEST
-- 
2.43.0


