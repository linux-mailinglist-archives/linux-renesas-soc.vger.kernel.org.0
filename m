Return-Path: <linux-renesas-soc+bounces-32786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LavMK4ZDGrrVwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:05:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A55579A2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E546230E7898
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 07:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CE1223DC6;
	Tue, 19 May 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Jg8Xx6Ub"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B272459C5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177388; cv=none; b=X2hfzKw85SwJIM/dAgc5Tb5YdKH5+stanmZRVnebl8oGrqR0gptFWCO9s7n5CEsAyIAKHL2weVlYFaOouwpcM6ioeLAEPXRpogzAzpJZD8yDNunswIM3hRGeAadDwAhVOAA17KQsg5WDV/c8JXoUWx0MwicwKhuJ9IcvaB5z95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177388; c=relaxed/simple;
	bh=KLIPdLhFBPfWhRcMbEMpGuI5D5x2SMyF5Y8TagADrz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4B74qsvZFzyuDD5GRQaHGjn+4vG0vDSS00in7lFeMfkJcjwQfqHdy3zXD2LekhUBRXP016W26TqP1H3/XtTeHb6pjWEhuWWxVDOrvzKKtXsgNQuGbRIIASxa2MTB9lQOWynHkrZY0FxBzTaRUB22m0eThN23yw+XFzepOqXlG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Jg8Xx6Ub; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=U4cLMXffIWbAmgErYWAiVMgt/zMjHCSgmLTq7qUkOPU=; b=Jg8Xx6
	Ubqn0TembXuHjLHaN2Fh5E7TArU/UxBsy36WtyGfb4lZFNE1ftjFlP17Bm/JrQTi
	bz6EcMGeIKAYUOQf+o16Xs+xKPj9c26Fje8woj9az4zqsZY0+hnr6uGrqEeLaKwr
	09filGeMu6bw/xWEV+jLluuXxQPSrWBdgzQJ+/TqGk43O/TDp2NRGojJluXUiPnR
	vNDVkCAANdCeGnW5XbQYsjMGGS7zNmo0X/DwJ6BS91EYXAsgIuq8JHxV2DjUfVcx
	I8T57WeKg5yWkpY4eTs+t1OJ+7hXi7UE6rMtbax81JPfjTHM2+4vGL8sPTbzfD9g
	haJCHnYAToG1qlnQ==
Received: (qmail 170853 invoked from network); 19 May 2026 09:56:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 09:56:24 +0200
X-UD-Smtp-Session: l3s3148p1@chb6AydSH/VUszca
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 2/2] soc: renesas: mfis: add R-Car V4H/V4M support
Date: Tue, 19 May 2026 09:56:19 +0200
Message-ID: <20260519075620.4128-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32786-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 47A55579A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The above SoCs have a weird register layout for the mailbox registers.
So, encapsulate register offset calculation in a per-SoC callback. Other
than that, only a separate config struct and compatibles are needed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-mfis.c | 44 +++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/rcar-mfis.c b/drivers/soc/renesas/rcar-mfis.c
index b334b35306ae..3435c3e16198 100644
--- a/drivers/soc/renesas/rcar-mfis.c
+++ b/drivers/soc/renesas/rcar-mfis.c
@@ -41,6 +41,7 @@ struct mfis_info {
 	unsigned int mb_reg_comes_from_dt:1;
 	unsigned int mb_tx_uses_eicr:1;
 	unsigned int mb_channels_are_unidir:1;
+	u32 (*mb_calc_reg)(u32 chan_num, bool tx_uses_eicr, bool is_only_rx);
 };
 
 struct mfis_chan_priv {
@@ -155,6 +156,35 @@ static const struct mbox_chan_ops mfis_iicr_ops = {
 	.last_tx_done = mfis_mb_iicr_last_tx_done,
 };
 
+static u32 mfis_mb_r8a779g0_calc_reg(u32 chan_num, bool tx_uses_eicr, bool is_only_rx)
+{
+	unsigned int i, k;
+	u32 reg;
+
+	i = chan_num & 3;
+	k = chan_num >> 2;
+
+	if (is_only_rx) {
+		if (k < 2)
+			reg = 0x9404 + 0x1020 * k + 0x08 * i;
+		else
+			reg = 0xb504 + 0x08 * i;
+	} else {
+		if (k < 2)
+			reg = 0x1400 + 0x1008 * i + 0x20 * k;
+		else
+			reg = 0x1500 + 0x1008 * i;
+	}
+
+	return reg;
+}
+
+static u32 mfis_mb_r8a78000_calc_reg(u32 chan_num, bool tx_uses_eicr, bool is_only_rx)
+{
+	return (tx_uses_eicr ^ is_only_rx) ? MFIS_X5H_EICR(chan_num) :
+					     MFIS_X5H_IICR(chan_num);
+}
+
 static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
 					  const struct of_phandle_args *sp)
 {
@@ -191,8 +221,7 @@ static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
 	}
 
 	chan_priv = chan->con_priv;
-	chan_priv->reg = (tx_uses_eicr ^ is_only_rx) ? MFIS_X5H_EICR(chan_num) :
-						       MFIS_X5H_IICR(chan_num);
+	chan_priv->reg = priv->info->mb_calc_reg(chan_num, tx_uses_eicr, is_only_rx);
 
 	if (!priv->info->mb_channels_are_unidir || is_only_rx) {
 		char irqname[8];
@@ -307,11 +336,19 @@ static int mfis_probe(struct platform_device *pdev)
 	return mfis_mb_probe(priv);
 }
 
+static const struct mfis_info mfis_info_r8a779g0 = {
+	.unprotect_mask	= 0x0000ffff,
+	.mb_num_channels = 12,
+	.mb_channels_are_unidir = true,
+	.mb_calc_reg = mfis_mb_r8a779g0_calc_reg,
+};
+
 static const struct mfis_info mfis_info_r8a78000 = {
 	.unprotect_mask	= 0x000fffff,
 	.mb_num_channels = 64,
 	.mb_reg_comes_from_dt = true,
 	.mb_channels_are_unidir = true,
+	.mb_calc_reg = mfis_mb_r8a78000_calc_reg,
 };
 
 static const struct mfis_info mfis_info_r8a78000_scp = {
@@ -319,9 +356,12 @@ static const struct mfis_info mfis_info_r8a78000_scp = {
 	.mb_num_channels = 32,
 	.mb_tx_uses_eicr = true,
 	.mb_channels_are_unidir = true,
+	.mb_calc_reg = mfis_mb_r8a78000_calc_reg,
 };
 
 static const struct of_device_id mfis_mfd_of_match[] = {
+	{ .compatible = "renesas,r8a779g0-mfis", .data = &mfis_info_r8a779g0, },
+	{ .compatible = "renesas,r8a779h0-mfis", .data = &mfis_info_r8a779g0, },
 	{ .compatible = "renesas,r8a78000-mfis", .data = &mfis_info_r8a78000, },
 	{ .compatible = "renesas,r8a78000-mfis-scp", .data = &mfis_info_r8a78000_scp, },
 	{}
-- 
2.51.0


