Return-Path: <linux-renesas-soc+bounces-2347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D336084AEB2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 08:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7121A1F24BAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 07:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD812AADC;
	Tue,  6 Feb 2024 07:13:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEEF1292EA;
	Tue,  6 Feb 2024 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707203625; cv=none; b=gK+h9QdUQOHEQDtDvmIgeKSuqWXrdASO60aT0mhftwOoaxVIgOvvOuZ25PpU/jgImFGLa3pFv/bVoxXTh/McvhqGj3kKzYV2uZLbHBUlrVEES9Wqu5hEtd0vSaNmWMSYtYDN7NFYq/ObcUbKrd+uZiB5ca9G7gGJ/BFxI0XzRTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707203625; c=relaxed/simple;
	bh=XjNK5tD3PgNfFWjmMkNu3aavaec+5bFrkGs/fc1AHDg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t6oIlKLa7M545GrHSW159FQuq4+bDoLI0qYbyXfZ8PIOnp2YYjLyhTXFKseyDOPfviX7AzRkw9HlQRTuMFqcvSYIGLa58Gphqa/o7A2WWXXNuQnTEMzk2gK0q/GYzmUhs32d38+XxKGqOxECyoq/MlKPb7Gz53MX+dFeuLw/E5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00137;
        Tue, 06 Feb 2024 15:13:37 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:37 +0800
From: Bo Liu <liubo03@inspur.com>
To: <lee@kernel.org>, <wens@csie.org>, <marek.vasut+renesas@gmail.com>,
	<support.opensource@diasemi.com>, <neil.armstrong@linaro.org>,
	<ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
	<mazziesaccount@gmail.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <patches@opensource.cirrus.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH 06/18] mfd: bd9571mwv: convert to use maple tree register cache
Date: Tue, 6 Feb 2024 02:13:02 -0500
Message-ID: <20240206071314.8721-7-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
tUid: 20242061513371fa66d01b7fc0fd2c57f6d4a721357dc
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/mfd/bd9571mwv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 819d09e4d100..0a955178d469 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -67,7 +67,7 @@ static const struct regmap_access_table bd9571mwv_volatile_table = {
 static const struct regmap_config bd9571mwv_regmap_config = {
 	.reg_bits	= 8,
 	.val_bits	= 8,
-	.cache_type	= REGCACHE_RBTREE,
+	.cache_type	= REGCACHE_MAPLE,
 	.rd_table	= &bd9571mwv_readable_table,
 	.wr_table	= &bd9571mwv_writable_table,
 	.volatile_table	= &bd9571mwv_volatile_table,
@@ -152,7 +152,7 @@ static const struct regmap_access_table bd9574mwf_volatile_table = {
 static const struct regmap_config bd9574mwf_regmap_config = {
 	.reg_bits	= 8,
 	.val_bits	= 8,
-	.cache_type	= REGCACHE_RBTREE,
+	.cache_type	= REGCACHE_MAPLE,
 	.rd_table	= &bd9574mwf_readable_table,
 	.wr_table	= &bd9574mwf_writable_table,
 	.volatile_table	= &bd9574mwf_volatile_table,
-- 
2.18.2


