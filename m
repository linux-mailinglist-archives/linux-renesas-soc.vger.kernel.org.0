Return-Path: <linux-renesas-soc+bounces-33375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGQ1JagLG2qH+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:09:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D760DEC3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9124D302316F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF473438B0;
	Sat, 30 May 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0tVdjdD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44B3368AA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157323; cv=none; b=hpOkkFYlDdDvpYQAJts7Uvpsn+bIbirf2Pe2GFXJRwE721NTuUrACDUwZ13DdmDnjDoBgoggHDnzm+MB5CLJimmP8KGicixKkgTp7lNq8qrvIVsnGuJY9JLDCcMROB6TwB7Qmd/cODICz1TGJhs4zL4qE5FuFHQ2GTgzrCYCxqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157323; c=relaxed/simple;
	bh=BhBy+S0HeAqMqVD0vfTgVyzMzn6TzF9an+zKeggyjho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyKjDvR/yM8kQDr91r3eWV8yBk/1z1NVOPGYVekdO/PC9HW9C1IgqHjrCDR8UC2Mr0ET6huGk3dIuYsai8gNwIDg5d9k7ypt+dVvDhBevI5FeKzw7i8nINyoQDG5t6IBsvU55njY+8geRYoqJXglSXCUXrbu4nQyFih7HZBeFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0tVdjdD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso91798505e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157320; x=1780762120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPP3Gc7DbsXSkC2W1JsK595/iLwnbQR3mPGG4AseLmY=;
        b=M0tVdjdD0SgY3nodBIAp6NbzPbyDUF8nSXqpOsHV0JfOoMSyhey4r0XkQfBhEWVq4L
         hJwZ7LNP2EWudyRx4uz9y3ba9udM5fNJ7IC79vgKbms5ynqqwirG+Rpn3C4ZcRxN8bz+
         xU7rErewuM2lykH/MiWyFF+Exa+cZtVuPtVRNB44Q9K88oG3fn4uzVrpOrUC1aJJVEDU
         VXRjZ19+23+QLqDPo6cI9dfgYvf60O5LR/8IoE71CtO0OAB2nbcrwoSxTMdtJjmCAOoD
         bJCyPsY+rccSAOLi+9s441FCz0k+koGhQ/LQlF5PtlY1k7sw0w834MGX/5aguIysu5T9
         e/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157320; x=1780762120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPP3Gc7DbsXSkC2W1JsK595/iLwnbQR3mPGG4AseLmY=;
        b=NoAApL6H83nh2+9qh+9RbVSRc/UwNPxp0bT0fzAwTFepIZH232cBsR3gFVhTdQnm2C
         4j1nkb/AarVIM4X+hGarSBVZuycdd0cZGidQrvsDXKLv5FSWMyt6Q/JlSQIAzVEfy0bj
         YhK1BX0tiilgQzuesKhWgEmJRZeb5C0EhyAEz+c4ffhCEUopS4VurfripCUf6UEXnrU8
         Fh+VJO08G735K0Zpev/mE3L0OrRq+nOJdTlmx94ZRG7+Ki7JB1u3NKzkpJNMmTdDW0lI
         yVF91sjBSbIfFl6zxgg0iqxuJKMXBNRBMMERchK267pFTSMh379WBcYO78uxlaowwVdy
         /26A==
X-Forwarded-Encrypted: i=1; AFNElJ8DE412UaYFDALuCHxOEtNGq92shvLucP1mXtM7h6GcQWQ0RZt35XFTpbbCo9q1ECkGnq63BrSLda1i5dkE8mDnMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWeja1Tq6KO4OBYd16M8iqPt/Ir9dXM9KWYRBSPjEM04EEsO6C
	16Ewwkg1esdsGZMCdK+BSwW9w8skc1NEpYLSC+9ZqXgSvGu9NXdE6+Xq
X-Gm-Gg: Acq92OG0Sf+phDJe2hzQ8OZaapPrTAZsmCn/TXsK8TVDiNjyJyysVwgJ2YtOajNDG0X
	7TPDfylACeYq0ixu1Mk10odwFufYMYF8imJnsdc2I1cqG3NVUkAU0cFtthgi4sUwbAUe8oQp9L5
	vWEGVgpbEaitFL/GVLvDm3CurBncPsPJze7pvEQQ2pMRfA+AmJFY/VnQ3MDqSdPwCGcXK+Nazuy
	wyLGciZjSmSTcd60Dw9GC36eU7sFyveiCvS1CQs1upumWNIxmeyFz7kPip5vVMKaFnveZVAnl/M
	2WhgBcc9tF9K2xpyY3V/P9NGKEViI91Gly2nAILZ/MoqvJW98eHCZWo7T8Xg/MnjyUTNwKTA7NR
	2wuHqv3FFN4hmT5xTqqs82Dm6glLF5bjL/UVNUjGpY2X1uEjtNXLPwKWOFscN0PtobbuSrXqE/A
	IGEwLysZdB+EfKtSGnllw7HGlFtXo9sxNTlhFEvTNuPOS/LPmB+Jznbdq3AgE=
X-Received: by 2002:a05:600c:1989:b0:490:5655:8d3f with SMTP id 5b1f17b1804b1-490a297d462mr81500585e9.28.1780157319627;
        Sat, 30 May 2026 09:08:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 12/17] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Sat, 30 May 2026 17:08:06 +0100
Message-ID: <20260530160823.130907-13-biju.das.jz@bp.renesas.com>
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33375-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3E1D760DEC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
save/restore is only performed when a regulator device (rdev) is present,
as the IOVS bit is only relevant in that context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 6c024e7f69e1..10f634349da9 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -117,6 +117,7 @@ struct renesas_sdhi {
 	struct regulator_dev *rdev;
 
 	unsigned int divider;
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index ee1b1f70c9e3..974acdf110d3 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1379,6 +1379,9 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev)
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1410,6 +1413,9 @@ int renesas_sdhi_resume(struct device *dev)
 	if (ret)
 		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
+	if (priv->rdev)
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
-- 
2.43.0


