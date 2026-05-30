Return-Path: <linux-renesas-soc+bounces-33376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFnmLvMMG2q/+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6126560E096
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5737D30C7155
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D983446C7;
	Sat, 30 May 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEz0XFOt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC453403E1
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157323; cv=none; b=jFGLqO07KLZ8eg5BI6yNfDXwGLCDPFVD5JCoLZoWFIJoTAvutdCRGy4ARnW4iBWYQ6Rawv2QL8uXPfxr+LntMBZeaHMeROK+99AxtI49ohXGxhKAW6aVP5d4eNUKOohXbsLOgE0qMX3VUSBmxVuaiyN8uyo/2aRjLmTWJwTeSiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157323; c=relaxed/simple;
	bh=WL00R54JtnIGCqbVD23oMHeV2SNxcWSfX0/F2cNxCRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqDcKrcZ77Ox8P3cvAVYBRWjdWZ5GDMibcnGw1Vy9g5K2FwGzOKvoLu0fo8DarB1vWhQUcJqdii/gZ0aTLZTdE505et9L0ahiC9eSBrnKu6vHWNdzunwInvIcOuVRPb5K76S1fWCpjL6LUCzZQFNUxrAGccWLJRo9PsTJUPnOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEz0XFOt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so5180607f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157318; x=1780762118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXkjQLqG1wqQ9sN8pwB+4cPvEKXxoY4geiEx2luqEGA=;
        b=UEz0XFOtmaZRi89bj/Y/uo3k935smUFwdrEyVKWqSW1QBpZGI9Qftouw3XZ88QqFZ0
         KSBwfkPkrc1BHWtCtKrsU4z76fYbhrG67SNmLVP0RKnWAOYZ5QnZLzqW/iwFBG1BgwIG
         uKS9ub0NZoL1VkEcmGA0D+pupwehK8Ut0XYU804rz36lX0aCooYqg1/G/Fo2VHM6Pjg6
         h7hXSAWa/2cGTKxFu19q6QkNN5LSkhzCSrcyGeZ5LOIvU1kIr5ycnsBpmjwuA1qnboh0
         jNc9cWzlk9ca48/iFzVqVxZwOxuPU2/VgWZT746BVFOrKoVEx2sgXRGY08QS4/pSX1Fk
         P8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157318; x=1780762118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXkjQLqG1wqQ9sN8pwB+4cPvEKXxoY4geiEx2luqEGA=;
        b=bHcgGmqqf+ZCDdJl6rg8niK+tHy9WH0YHmokp9fr9QRMyxtd+OTzz6d9u5c3Lfh0uu
         vf3s04ipT1s9UW05V07N/zzlYqDMpT7aKWz+3otiW7NRPR9yVRGvjNnMDfAyYto8WIoH
         bxWkMLa2uYklFHEJ5RAX27kH71ueHBBlpg1f9+og1lFt+WLpEkE55E+RAbQFiqgkyn0h
         tneP3T0cnqzbJC/O1CKaKUX8lAHTKbHDPRjfv/XIAr44LvRdHGXsMqJ9ppaY4a1vhRnA
         XK726Qu1MOZGKVHNqiNSamc5f6fdpSVLUCI9En7AL9VjtHOVeSaa3fv0k8gU6hJ1F0Fg
         OwDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+e6yobEeSi0iEfhwEsN2EghQk3IYR67XFcs2CKQxdnuv7ww3nnOCl7JoOBKs6vVshi8DrZQPiWwtAZFGM74KnfqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4ZlZtaF1NkuLcMW0GyIeWX4SkoATYdash3DLzBSl0/c//9mx
	1/oMhGKugqi6iER4XOlMTydDnjlJkT7l5HJND0pbAFWe1im6R8TsLoD5
X-Gm-Gg: Acq92OFaL/hQksODobK25qS06ne6rnp9SzM3Ig84PRIKcruYiWJSCJTi1gUiN67MPP9
	2zDDRH5SnsbTS11uN7jIDv9pwvQW6I641ve7efvpUuHY1m26MCvZ79WwFeLipVnb5eI5widtgvB
	kuufd7CfEOgpciYGABoND3W/7W4JTKQlt5P3HzXctz42onbDAY4r6ig25uWrSKeqrTmR6LxDUeU
	99G6zu+VDeekyEh6adv3n8By+iyF9VD/BPdc+OSLSsOX+XfBsiv/yr/OZmYTJCvdR7qG78qXq34
	jOnAThvt+Da/5BO5912DDdREkvvnbNWWaiWkantGxVZDS+1/Vybu7rFNYwfJ5ICooMLol7BHE3U
	X31cJ0iGb5WZJDEVHtFbrQAumt/Lvxc2HeGgLirE+KmPHfqCL4kcj+rlt06ZCv1Xh0eDqKhmb4v
	N8de9HElXf5xDPySq4TT4knszpcA+TLeqXcpAtD65UAgTgqcyNx5AFECQ49j0=
X-Received: by 2002:a05:600c:34cf:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-490a2901abcmr77279835e9.7.1780157317975;
        Sat, 30 May 2026 09:08:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 10/17] mmc: renesas_sdhi: Add optional axis/axim reset controls
Date: Sat, 30 May 2026 17:08:04 +0100
Message-ID: <20260530160823.130907-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33376-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6126560E096
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has axis/axim resets compared to other SoCs.

Add two optional reset controls, rstc_axis and rstc_axim, to the
renesas_sdhi struct. Both are acquired at probe time using
devm_reset_control_get_optional_exclusive_deasserted() with the
"axis" and "axim" reset names respectively.

Include them alongside the existing rstc in bulk reset/assert/deassert
operations: triggered together in renesas_sdhi_reset(), and managed
via reset_control_bulk_assert/deassert() in the suspend and resume
paths, replacing the previous single-control calls.

Being optional, these resets are a no-op on platforms that do not
provide them, so existing behaviour is preserved.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 0ca8ec27c320..6c024e7f69e1 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -111,6 +111,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 8e2fb19b994b..699872766f88 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -615,6 +615,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axis);
+			reset_control_reset(priv->rstc_axim);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1128,6 +1130,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	priv->rstc_axim = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axim");
+	if (IS_ERR(priv->rstc_axim))
+		return PTR_ERR(priv->rstc_axim);
+
+	priv->rstc_axis = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axis");
+	if (IS_ERR(priv->rstc_axis))
+		return PTR_ERR(priv->rstc_axis);
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
@@ -1351,13 +1361,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc_axis },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1369,15 +1384,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc_axis },
+	};
 	int ret;
 
-	ret = reset_control_deassert(priv->rstc);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_assert(priv->rstc);
+		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 	return ret;
 }
-- 
2.43.0


