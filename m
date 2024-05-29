Return-Path: <linux-renesas-soc+bounces-5623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BE8D32AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29C251F239F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E4B16D304;
	Wed, 29 May 2024 09:12:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830B16A381
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716973949; cv=none; b=VjSzb/R+OL6NBlmkngB/Er6NmhedvrJL+RsJiY+BhvPZxfjKYqMllJW9l77JQghfx4nAeLi9DMBil3bhbxe7h9EOCpRVwiiW2ETa1ZSLnqJUVMjQ9Z5xbHA7wsUcJcAYh10Wtl67j5NvKeOSzuW5CGyLR/rmhsZb2AB+HsbYFRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716973949; c=relaxed/simple;
	bh=FaQW69bwWIIghwkQdBMochv1fi+x9fc0JtNMz7gRvgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PMkGo3qVc7LNNtNUeuzb99e9FQww3hOApwkGUhTUybbWu2a2D5HfW1dQeZMXDOJvdcFXPpwlN9ahGYzRAsTtOSyCFZB0uHixCAPfcrjIkQZF1JTaCv6IZBf1EQOj4ZndyQBL56/N4UHbIO21/AazG3TerwdT6Q6NNdv0wySXOxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by michel.telenet-ops.be with bizsmtp
	id UxCJ2C0013VPV9V06xCJ24; Wed, 29 May 2024 11:12:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFL5-00GF9Y-Ek;
	Wed, 29 May 2024 11:12:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFM1-008w8c-RZ;
	Wed, 29 May 2024 11:12:17 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] can: rcar_canfd: Improve printing of global operational state
Date: Wed, 29 May 2024 11:12:14 +0200
Message-Id: <14c8c5ce026e9fec128404706d1c73c8ffa11ced.1716973640.git.geert+renesas@glider.be>
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

Replace the printing of internal numerical values by the printing of
strings reflecting their meaning, to make the message self-explanatory.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/can/rcar/rcar_canfd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 474840b58e8f13f1..c2c1c47bcc7a166c 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2049,8 +2049,9 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, gpriv);
-	dev_info(dev, "global operational state (clk %d, fdmode %d)\n",
-		 gpriv->extclk, gpriv->fdmode);
+	dev_info(dev, "global operational state (%s clk, %s mode)\n",
+		 gpriv->extclk ? "ext" : "canfd",
+		 gpriv->fdmode ? "fd" : "classical");
 	return 0;
 
 fail_channel:
-- 
2.34.1


