Return-Path: <linux-renesas-soc+bounces-11739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F299FDE7E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B43B23A13A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 10:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7504126F0A;
	Sun, 29 Dec 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M6oPC6Gt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D412DD8A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Dec 2024 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467169; cv=none; b=hrVLMAbR/1mz6aNN9AiJpR/UK28m8Het2P6AHnCD1MuNEt1bjaZ0gSVUHP/1rGFgjWGzaqiSOmBlzZl8QV0mSyatsCEE5HMPxCOpTPX5FUrl87iaDLiEPZDS/iglG8QA1kNuonkakmLNjecQ4/pLm72yEWy3wpywpTtnux5BqVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467169; c=relaxed/simple;
	bh=mIeRqhDuiwHFKlnukfjGYt2UKBf196i9hF58Gak8iD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NfGHpw6TYsnYY9hvxBrsmrlitXFeOBBeHJrFinAb7E9ydLEafjZXH4n4Q7JZOOBeNFoVY5X98rGMhZLU17fn+YGTMU2vJUwyKxPKufBt3tvdhQ0MEiO5V2WBUmX/60o3Bf/F9BCE6qxwrf1EkLAz+p58NMRu2dvegXuUHQpp+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M6oPC6Gt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=HcEn4SC6k8TM3B5gnzbEg5duKt2BAHa6/yH+isc0eiY=; b=M6oPC6
	GtxOju2Rp23MsXuWEpjI0wp0wTTuPQ8qVd4iki1LoP4TYeSG65Uirmt7AIxPR/rj
	VSr/nmQ6eEb3ry3J0ztf97z5zXzdfdqvaSE7r/R9YSQA+bElRNGH3lNUdKZllN2G
	SAHEdZWO/UcY48+JMliB+JeGnl99jUx/BEV19sjS+jLQPYdzw5te4egVqD5Zc9ED
	cSFRerfJCulX/HdSNceXyOIfeaB4aC1ecLaUDkga7kTD4gdYkkVM7SOwrOHvL1jI
	bc6z653Vpr3iKaj8XnrTiotj99+DRn+QJNJr9513R8nxpb4I/rGh7vDveTPX7Ivy
	JoSK/ce3JKSCqqzQ==
Received: (qmail 3656724 invoked from network); 29 Dec 2024 11:12:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:37 +0100
X-UD-Smtp-Session: l3s3148p1@mkFx72UqmLEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT v2 3/5] i3c: dw: use get_parity8 helper instead of open coding it
Date: Sun, 29 Dec 2024 11:12:31 +0100
Message-Id: <20241229101234.2896-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* rebased to 6.13-rc4

 drivers/i3c/master/dw-i3c-master.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d4b80eb8cecd..0d4d44458c11 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -251,14 +251,6 @@ struct dw_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
-static u8 even_parity(u8 p)
-{
-	p ^= p >> 4;
-	p &= 0xf;
-
-	return (0x9669 >> p) & 1;
-}
-
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -848,7 +840,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
 	u32 olddevs, newdevs;
-	u8 p, last_addr = 0;
+	u8 last_addr = 0;
 	int ret, pos;
 
 	ret = pm_runtime_resume_and_get(master->dev);
@@ -873,9 +865,9 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		}
 
 		master->devs[pos].addr = ret;
-		p = even_parity(ret);
 		last_addr = ret;
-		ret |= (p << 7);
+
+		ret |= parity8(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
-- 
2.39.2


