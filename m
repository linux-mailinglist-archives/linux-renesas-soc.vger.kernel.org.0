Return-Path: <linux-renesas-soc+bounces-7268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDA92E7F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 14:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92FD11F210BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 12:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AC815B11D;
	Thu, 11 Jul 2024 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lO1tvjIc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935915B103
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699717; cv=none; b=ELGLY/6Gn+P015FZKC8571dOT8mUD+2Opvyo2pFMqQ8Z7AG9UVjMp2b5sU1hI/lT3HJt+9K1bkGDJTZ5ov4HkHncd1fZytgtMi0nW7OOJAkAZcRlThAYmA0usQYQh6qjNFB2jrg2ilPQwJK1GPTR995GJbf9CA+N8Nb83JIGoRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699717; c=relaxed/simple;
	bh=Esq9EMKJr//KVXY3Wy6aclmtW8kRS5RmnOqmM+v1FPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8Q7LKzbcWiZJPOdplHIjwKBL+b+QbuYaaKxrW9hdUDEmpI13mt/O2M50rEYe5tZoYtfOMgLUlxSo2ozOkQKwSXsDimunWdto3vVOhb9mU5XPnYDc5uFoKbrRqShyObEJdF5j+Wmvmy2avPeYU6/xcNrCtdB6OkoVVRkfJue4FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lO1tvjIc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=lKGOUQFqKioITe
	ghw3RVtO5M91yc2jLfkEIsxyv+arY=; b=lO1tvjIci896byHtFUPTYQvzgpTOsa
	sCJ5WexlsUMN/nOk6BvtTVEH2T3A4x9xq2H9uf2N3xlub+ZcbdRh6vnS0dUd8TU5
	aCmKsmEOl/jvasLjVyDIQu7b7pYBIJlstaVhz0k04/k9I7aiDw6E3lKcCkL6mqcq
	1WX7dkGWvjGerwF6+MUaFKWNNO6wVytzzo1A8ajAPJf/sQHEAltS9Q7scfjaL0T6
	v7gglmrZ19534WsX8ye4EnqtXiU8Fr6X/GUdGkcXyxmqounK3ndF/sb5KuvHrMmR
	gBJ2HdU1tspNm/J/74Dnpq5VOWD6N0+BGgUcr23brK84UfC9RCwQSVDA==
Received: (qmail 837138 invoked from network); 11 Jul 2024 14:08:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 14:08:22 +0200
X-UD-Smtp-Session: l3s3148p1@rTeHnvccMJkgAwDPXwmZAIsFIv4n+Dpm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: testunit: avoid re-issued work after read message
Date: Thu, 11 Jul 2024 14:08:19 +0200
Message-ID: <20240711120818.46543-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The to-be-fixed commit rightfully prevented that the registers will be
cleared. However, the index must be cleared. Otherwise a read message
will re-issue the last work. Fix it and add a comment describing the
situation.

Fixes: c422b6a63024 ("i2c: testunit: don't erase registers after STOP")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-testunit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index ca43e98cae1b..23a11e4e9256 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -118,6 +118,13 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 			queue_delayed_work(system_long_wq, &tu->worker,
 					   msecs_to_jiffies(10 * tu->regs[TU_REG_DELAY]));
 		}
+
+		/*
+		 * Reset reg_idx to avoid that work gets queued again in case of
+		 * STOP after a following read message. But do not clear TU regs
+		 * here because we still need them in the workqueue!
+		 */
+		tu->reg_idx = 0;
 		break;
 
 	case I2C_SLAVE_WRITE_REQUESTED:
-- 
2.43.0


