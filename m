Return-Path: <linux-renesas-soc+bounces-14567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A240BA66F7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 10:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE075171A08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A984D2066FC;
	Tue, 18 Mar 2025 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jlpa+8h7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E0E206F1B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289279; cv=none; b=shUOvBbnIg9zygCAOf/0QhVdS23kdBXd8g+Vy5l7MhS8/mIuje0JvhTvKFKow5KRd189w9kmyNQmzh5j+SMdL2O73nJIzJUlysTST9p0HK4GFIfBVRLlfCkSS4T38DkAgM/kVYq+0Z7N0wd2wwUcWlEj7NzWrq5amy4i+hyRVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289279; c=relaxed/simple;
	bh=v/wzPYVeTwPQP2F2JU/4PMFfUpoXQ7WFyQ/ccXxcr60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7VptuNxwmA/Sh5+CeSqeBUs5YQ0yCXteR2FM2SC/9TXuU4mTKm1FXNGdVmC8SwMh0BiYStizPvDsAeV1nYU7gOwujXIEkymm5Wj93FLU2gfe8FxOhkBx0G56u7F8Bp9QntURtXw2v7Wjhp4ozktTBwwQBnQIRGNj06WraEXOvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jlpa+8h7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=yhs8lVccypHOK1
	9hsAS2bTrivBq32rF2ZWYvcOFqEhA=; b=jlpa+8h7lOPVWrJQzrh4FR5HCXev0W
	z0Y4Z0B0Yv8dxteci5wBBk6cYWGvuLQ79zsYoN9nTRvT2ftWwDkPNfnNl+C1Y6tY
	qfzd6Ubt1Y6Ah32dPsNFG2p5pQxX22zVLe6rQnRUG50Vu4g4wxLzb423i1Gs255V
	2pL3/bbc3PD80XAZVN58S/xh2iux34aV/MEfzFAy4VG45YS3rf/SW/1wCxHxss1M
	PPDn5Y3VcO5f7kIAYaMu1JjkwJ6RM9SXXxSonVs9AUPFvLNSICo9PW3B1CcXD31x
	JaJoT1q53wcLXvFxGiBuq1fc0H8hnhZC2JA2sgITaOseuwF1W3iUFykw==
Received: (qmail 3661896 invoked from network); 18 Mar 2025 10:14:31 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 10:14:31 +0100
X-UD-Smtp-Session: l3s3148p1@blwiVZow5rcgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH RFT] mfd: aat2870: use per-client debugfs directory
Date: Tue, 18 Mar 2025 10:13:41 +0100
Message-ID: <20250318091426.22258-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now provides a debugfs entry for each client. Let this
driver use it instead of the custom directory in debugfs root. Further
improvements by this change: automatic clean up on removal, support of
multiple instances.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only, by me and buildbots.

 drivers/mfd/aat2870-core.c  | 4 +---
 include/linux/mfd/aat2870.h | 3 ---
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 8ef510e84688..34d66ba9646a 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -320,9 +320,7 @@ static const struct file_operations aat2870_reg_fops = {
 
 static void aat2870_init_debugfs(struct aat2870_data *aat2870)
 {
-	aat2870->dentry_root = debugfs_create_dir("aat2870", NULL);
-
-	debugfs_create_file("regs", 0644, aat2870->dentry_root, aat2870,
+	debugfs_create_file("regs", 0644, aat2870->client->debugfs, aat2870,
 			    &aat2870_reg_fops);
 }
 
diff --git a/include/linux/mfd/aat2870.h b/include/linux/mfd/aat2870.h
index 2445842d482d..c7a3c53eba68 100644
--- a/include/linux/mfd/aat2870.h
+++ b/include/linux/mfd/aat2870.h
@@ -133,9 +133,6 @@ struct aat2870_data {
 	int (*read)(struct aat2870_data *aat2870, u8 addr, u8 *val);
 	int (*write)(struct aat2870_data *aat2870, u8 addr, u8 val);
 	int (*update)(struct aat2870_data *aat2870, u8 addr, u8 mask, u8 val);
-
-	/* for debugfs */
-	struct dentry *dentry_root;
 };
 
 struct aat2870_subdev_info {
-- 
2.47.2


