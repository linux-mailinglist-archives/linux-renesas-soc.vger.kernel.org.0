Return-Path: <linux-renesas-soc+bounces-5621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2CF8D32A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56E10283434
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F836169360;
	Wed, 29 May 2024 09:12:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B76516A374
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716973948; cv=none; b=lNDVriSaEDZqLTBLruF4uQoYa5IlEwszJgdpY00plRObOkvP7bPo8sJgib1svzXbYkRKoG+BOtQMIMaJgDM+GMXCre6RoSVlbYiGM1NgpdB7Sko3Uc7hucKG1bm5z4fRWryJopoCgD/ZsMatbRm5GjMXII0Wb9/t/2nD2pDUMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716973948; c=relaxed/simple;
	bh=6DRVo83b+DRVEiT4o5Gr1b8cmp/ONQYcfrCg5VurbFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fFgoi/QhasOf7FZWcgOg8ACSgHN3n1fwbI0B1Cj1CdsGost7YecMV5FgTzdqD5MZGMxymEv5lLW8ZpZRAonzTG5k1W5EuNzmurvV1oOubEGB0qjfdn4W67g4oNiDBdEm8dWG48+kScldLpOfpgRZgcVd9nr2RwFjsxCZqzDfW7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by andre.telenet-ops.be with bizsmtp
	id UxCJ2C0033VPV9V01xCJnm; Wed, 29 May 2024 11:12:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFL5-00GF9b-FS;
	Wed, 29 May 2024 11:12:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFM1-008w8h-SP;
	Wed, 29 May 2024 11:12:17 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] can: rcar_canfd: Remove superfluous parentheses in address calculations
Date: Wed, 29 May 2024 11:12:15 +0200
Message-Id: <b5aee80895fa029070fd37d1d837cf1c0ecb52dc.1716973640.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716973640.git.geert+renesas@glider.be>
References: <cover.1716973640.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to wrap simple variables or multiplications inside
parentheses.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/can/rcar/rcar_canfd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index c2c1c47bcc7a166c..c919668bbe7a5541 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -627,28 +627,28 @@ static inline void rcar_canfd_update(u32 mask, u32 val, u32 __iomem *reg)
 
 static inline u32 rcar_canfd_read(void __iomem *base, u32 offset)
 {
-	return readl(base + (offset));
+	return readl(base + offset);
 }
 
 static inline void rcar_canfd_write(void __iomem *base, u32 offset, u32 val)
 {
-	writel(val, base + (offset));
+	writel(val, base + offset);
 }
 
 static void rcar_canfd_set_bit(void __iomem *base, u32 reg, u32 val)
 {
-	rcar_canfd_update(val, val, base + (reg));
+	rcar_canfd_update(val, val, base + reg);
 }
 
 static void rcar_canfd_clear_bit(void __iomem *base, u32 reg, u32 val)
 {
-	rcar_canfd_update(val, 0, base + (reg));
+	rcar_canfd_update(val, 0, base + reg);
 }
 
 static void rcar_canfd_update_bit(void __iomem *base, u32 reg,
 				  u32 mask, u32 val)
 {
-	rcar_canfd_update(mask, val, base + (reg));
+	rcar_canfd_update(mask, val, base + reg);
 }
 
 static void rcar_canfd_get_data(struct rcar_canfd_channel *priv,
@@ -659,7 +659,7 @@ static void rcar_canfd_get_data(struct rcar_canfd_channel *priv,
 	lwords = DIV_ROUND_UP(cf->len, sizeof(u32));
 	for (i = 0; i < lwords; i++)
 		*((u32 *)cf->data + i) =
-			rcar_canfd_read(priv->base, off + (i * sizeof(u32)));
+			rcar_canfd_read(priv->base, off + i * sizeof(u32));
 }
 
 static void rcar_canfd_put_data(struct rcar_canfd_channel *priv,
@@ -669,7 +669,7 @@ static void rcar_canfd_put_data(struct rcar_canfd_channel *priv,
 
 	lwords = DIV_ROUND_UP(cf->len, sizeof(u32));
 	for (i = 0; i < lwords; i++)
-		rcar_canfd_write(priv->base, off + (i * sizeof(u32)),
+		rcar_canfd_write(priv->base, off + i * sizeof(u32),
 				 *((u32 *)cf->data + i));
 }
 
-- 
2.34.1


