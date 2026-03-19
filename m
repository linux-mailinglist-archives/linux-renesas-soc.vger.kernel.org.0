Return-Path: <linux-renesas-soc+bounces-29875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDNzAWjYu2lgpAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:05:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9232C9FF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 850F1323B58F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 11:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BCA3C8708;
	Thu, 19 Mar 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fHwEAvjt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CB63C73D2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918020; cv=none; b=IGB9tws12MIdpFDUtFnXgCNBYAFMWrOTMakbsaU1Xn80rIz9m/TQs8ZqIEwOzqmXkibx/TOZfJLSx/n0rcK20tlCvzsQnqSHEySjbaZMHgJK6RZtaT8GyhF+1u6V4Isbl89DczPXA09zBXdq8GnRTM/tdXN2kIRjyumFOjUOzLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918020; c=relaxed/simple;
	bh=NYiPCzdYDU9BdHcA+eu/2dPkEVePnOw3CoYxF3To1jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWbR+kmfycN1qX6d1PaxZnJxs17ON1fjoD3hEd1Gz+SnaJtqc8asOSQkvHemd6mDM/YRsb+l4fJxfds3bqcBm1nK0pllbDPKw+bvC1Mt9iB+rAvZYZUH50eMUGf1tdlqkGBuRebQ6U7sN/Ao5Ua+KgiJGThwFL1roNA5USuXxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fHwEAvjt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=c5DSTYKJVivgA9XXvmh9gEwArmRd1OpMLRV7T5NJLQc=; b=fHwEAv
	jt7nJiexHdNIGWyO7wr26nuVcMp7pFwk8Phi0O67qiEHdJ3i+9iPQgmf7TMM+YZh
	EMfBN5dniXX68ivb5yYc1mm2C7yIOTDZcg3fdAqs7ncv6b0ntPaZc0lZ1cgCR7Lt
	r9bboFNyDH6V+ltAawbZJYkDK5SxXPeLbAS+gmwcJA9Jyj8xfDNLq/q63V+robV6
	DJFP1Yzj0qq+y7tTG6k9tXY84mxCznLwDY527Q2ePxsbEVP6AC8eCRp+ilQG79Zn
	maZgD2n9yebTxCtbMpQ2IoQ2oKcvrCebI40Sfi+fSIN+VbvTRef0odFD/GafN8Xr
	n9K4+5NmaUMIN6QQ==
Received: (qmail 1099573 invoked from network); 19 Mar 2026 11:59:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:58 +0100
X-UD-Smtp-Session: l3s3148p1@75wieF5NYJsgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 06/15] hwspinlock: qcom: use new callback to initialize hwspinlock priv
Date: Thu, 19 Mar 2026 11:59:28 +0100
Message-ID: <20260319105947.6237-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
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
	TAGGED_FROM(0.00)[bounces-29875-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,init.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D9232C9FF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Apply the new helper to avoid using internal structures from the core.
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 45 ++++++++++++++++------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 7960a4972eab..73b280988109 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -25,6 +25,13 @@ struct qcom_hwspinlock_of_data {
 	const struct regmap_config *regmap_config;
 };
 
+struct qcom_hwspinlock_priv_init_data {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 base;
+	u32 stride;
+};
+
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 {
 	struct regmap_field *field = hwspin_lock_get_priv(lock);
@@ -89,10 +96,23 @@ static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 	return 0;
 }
 
+static void *qcom_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	struct qcom_hwspinlock_priv_init_data *init = init_data;
+	struct reg_field field;
+
+	field.reg = init->base + local_id * init->stride;
+	field.lsb = 0;
+	field.msb = 31;
+
+	return devm_regmap_field_alloc(init->dev, init->regmap, field);
+}
+
 static const struct hwspinlock_ops qcom_hwspinlock_ops = {
 	.trylock	= qcom_hwspinlock_trylock,
 	.unlock		= qcom_hwspinlock_unlock,
 	.bust		= qcom_hwspinlock_bust,
+	.init_priv	= qcom_hwspinlock_init_priv,
 };
 
 static const struct regmap_config sfpb_mutex_config = {
@@ -202,17 +222,14 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
 {
+	struct qcom_hwspinlock_priv_init_data init;
 	struct hwspinlock_device *bank;
-	struct reg_field field;
 	struct regmap *regmap;
 	size_t array_size;
-	u32 stride;
-	u32 base;
-	int i;
 
-	regmap = qcom_hwspinlock_probe_syscon(pdev, &base, &stride);
+	regmap = qcom_hwspinlock_probe_syscon(pdev, &init.base, &init.stride);
 	if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
-		regmap = qcom_hwspinlock_probe_mmio(pdev, &base, &stride);
+		regmap = qcom_hwspinlock_probe_mmio(pdev, &init.base, &init.stride);
 
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
@@ -222,21 +239,11 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	if (!bank)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, bank);
-
-	for (i = 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
-		field.reg = base + i * stride;
-		field.lsb = 0;
-		field.msb = 31;
-
-		bank->lock[i].priv = devm_regmap_field_alloc(&pdev->dev,
-							     regmap, field);
-		if (IS_ERR(bank->lock[i].priv))
-			return PTR_ERR(bank->lock[i].priv);
-	}
+	init.dev = &pdev->dev;
+	init.regmap = regmap;
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-					 0, QCOM_MUTEX_NUM_LOCKS, NULL);
+					 0, QCOM_MUTEX_NUM_LOCKS, &init);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
-- 
2.51.0


