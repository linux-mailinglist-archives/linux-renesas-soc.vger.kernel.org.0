Return-Path: <linux-renesas-soc+bounces-30846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC/TG2qkz2mZyQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2BC393AD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02F1B303F3F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E111A3009D4;
	Fri,  3 Apr 2026 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9pCyO1P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D913B19D1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215671; cv=none; b=kt6Y67s3TJMKiYg9UPGzOrfPheVw0AK2J0Mv1s0fX4PgxAObyRiJ3jcbJ/yrL2I/NjQOr6XtrsgpUPVbXyKzOo6boBiojnMJcDt3TOuSlFOwqOlsAId7eAqQeDZT9bxU5Ft3bXAYUB04bFEkvBZOu5I65XS85blaHKSi86Gie3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215671; c=relaxed/simple;
	bh=BVteWb/phfOhOywch6JtszRF/l+CN+UQyrXxfcmY7BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCOS8aE2gmv1v4nB5nG6zn2/6CbDXq5QEFdQnHFAkUTrdV1RmnuMt9a4M/htpEroaZYwp1UH9T5CiSXiPIWs2zayZcbppTNBkCDMjO7hEjgEtags0fjCUyVnRhBmvawt+bF+IiZwOltEf7jihcXchocQu1bWSH7s/v9ooSxAG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9pCyO1P; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82cef263bedso882975b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215662; x=1775820462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7WBGw3HYIKasCGZa6UoZqUVbnabzZNeOPFe5FYqFjk=;
        b=O9pCyO1PADi8rd6HfOFS5Zrua0Y6TPixSAZao6hbAqIlyfstz8FEWNURkxyOVQ8XOl
         oI5KowzbD9ncDz7PlYdz3II0LFIAP/+iAhcQZw6gAwU3wKWmhbkcAabwVzpayVNWOqB0
         rNGFd/GPA/dZqTMO9GqewuNEBknrawo4S2evKLd6uxhJ0VffPt5pAQ6CJF9zqCMVETAo
         6lxT6t4EmBeGe8u/GcF7F4n1O23oAk74uwj7dffBNlPhy0gP+jJi7mgFacRRiB8cF3RH
         kovG/EtPlEHsmlgvULN/Qe46NtGQd8pa8UYLFmMTFFxVFwSmwY7TNQ04IjC936prDq0r
         ZHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215662; x=1775820462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7WBGw3HYIKasCGZa6UoZqUVbnabzZNeOPFe5FYqFjk=;
        b=KksEpXb9m4fFdDPvEL0Hz0U2vFpn9raTasBgI/3CQrhlAHlMPeLeKsjsGT3W4i8y8l
         j6l18NwZit0B1KHd2DxDe/uqHelrnbjnkhYdIgX3oZug+WKa9Zpt4caMXEcB/mPVFv2B
         BCTVaLjNPO2bced7J2e98KdPPqz1jwkNXyq/7TLgt2ue951JPeuyBuAbIS4hOxTZGluu
         Q5Z0pkOJ7Xt82SUiYbjhKcrkjRDnC0NETZFYta+4hpKcM54KcMvEzG956HuYqq6iIg9I
         JRPcf8YMuS4+cjR1moqOV/fibwRpXZb+qdk9lmC2mJv5BpFec2dfT4c5wMqjqWLZqGUv
         hZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHaCOeB+eRghqaIcTDowkw2q4rCQQoRPZXfEZJ25iDaPeorI3QajERBXA82SU4D8GHqJgYyWY3lv12zFdcClEi6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhQdmCX3iLVdLhBCspA9bXeW6y5AB5XMLvmojediFm2OwRZq/
	I8mlW5nrDvBpnUbNyoNMc9dOwWGaryqBI3b6T7NlaMVeKHNPL4Nb1wkD
X-Gm-Gg: AeBDiethWVZh4p3dpwesIGPpcI94LDmKTF2ZMcGeCnnuWLV5qy+HXPJXSGQ5VhIZL9x
	p3DtA50qMpYwPpAKxrggESZl2v6T6aZOFL6pxRJeb1+pfpOSsK68x+Lkt9GKRiBUf1Anm+4DxQW
	BgIVuoCJ66ONk/neWPu9Scym0xceNsl2P2vu/fKJUXOymtEzgkRQkmFiEGc6GaEBXzJ3UK9amH2
	UP/pIR8+FLrZtUOaSgvBLAuNR/QMd0gf+p33xz7XCTx2MQyQmhe1ZKSPrpVs3l9Ckyr15fu/BmQ
	QRTcUWf7M4cgBIHN/USMx38oWelFbMylQHlDO8zg9PTMdIMwPY2JGnmm041LSGyJUK5bKHeX8E6
	ryHyuxnymZ6FgnXZb4y0LP+RDIxQewY+LHkUJqFKxKGR6KqosvWMWkRAvFQWIQ5DFz5wNecs13a
	GXZtn/s2oA2xNS9ePimey7Gklq9wa6JPvdVpqRPdkreTf2Nowq5dk5BHtCcQ==
X-Received: by 2002:a05:6a00:3d56:b0:82c:d7c4:4c6b with SMTP id d2e1a72fcca58-82d0da2e1ffmr2446985b3a.11.1775215661982;
        Fri, 03 Apr 2026 04:27:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
Date: Fri,  3 Apr 2026 18:26:55 +0700
Message-ID: <20260403112655.167593-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-30846-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D2BC393AD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Retrieve the "spu" clock in probe and enable it during
DAI startup. Disable the clock on shutdown to match the
audio stream lifecycle.
This ensures safe register access and prevents system
hangs during audio playback.
This is required even if the FSI functional clock is
enabled, as internal units depend on the SPU clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1491c2f2cc96..44bd1c1e6294 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,6 +292,7 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
 	spinlock_t lock;
 };
@@ -1554,6 +1555,11 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
+	int ret;
+
+	ret = clk_prepare_enable(fsi->master->clk_spu);
+	if (ret)
+		return ret;
 
 	fsi_clk_invalid(fsi);
 
@@ -1566,6 +1572,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
 	fsi_clk_invalid(fsi);
+	clk_disable_unprepare(fsi->master->clk_spu);
 }
 
 static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -1963,6 +1970,13 @@ static int fsi_probe(struct platform_device *pdev)
 	master->core		= core;
 	spin_lock_init(&master->lock);
 
+	/* SPU clock is required for FSI register access */
+	master->clk_spu = devm_clk_get(&pdev->dev, "spu");
+	if (IS_ERR(master->clk_spu)) {
+		dev_err(&pdev->dev, "Failed to get spu clock\n");
+		return PTR_ERR(master->clk_spu);
+	}
+
 	/* FSI A setting */
 	fsi		= &master->fsia;
 	fsi->base	= master->base;
-- 
2.43.0


