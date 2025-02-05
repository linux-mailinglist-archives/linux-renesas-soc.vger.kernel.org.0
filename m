Return-Path: <linux-renesas-soc+bounces-12876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5049A295DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 17:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE20B7A2D55
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 16:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCF91990B7;
	Wed,  5 Feb 2025 16:10:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E9192D6B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771805; cv=none; b=QTYlNaaxRVoF18L2lU5vlKxRNmMMcWFwu22rtngCdRWE7FYQ/iRuu2NKq2chXoM5yoWCZVJdMV9S/hMdg+AeTgqDYL0GOKojChQh6V0lNOoDYMXGPzTAMAmvTEcu3Nnf5dLSbUa4zU4JUBwCEiYgH95JQ+QZKshlVaMP587zqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771805; c=relaxed/simple;
	bh=gP5Jx/RTaGVadp6ITV3o7rEpXX0n34qFkAHj15QpqYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YW2QMygx1lGWB46FobDnvBe2G0/OL5/9s8nZEDyqEoOeJ+hTO09qaE46j/HrOkhLd2l3fHsd+BPxM5vHDHk9WG6vSUu1lWrEHFDg9VTJFlyBQ7/shkydl5DPK6qyY/Lc0J0pTm8JyQkNwRMERPBExh3dU0nSlBsvJla8+P99LAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by baptiste.telenet-ops.be with cmsmtp
	id 9s9r2E00V3f221S01s9rqQ; Wed, 05 Feb 2025 17:09:54 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfhy7-0000000FwpE-1tNH;
	Wed, 05 Feb 2025 17:09:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfhyJ-00000006dgE-25U5;
	Wed, 05 Feb 2025 17:09:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next] net: pcs: rzn1-miic: Convert to for_each_available_child_of_node() helper
Date: Wed,  5 Feb 2025 17:09:47 +0100
Message-ID: <3e394d4cf8204bcf17b184bfda474085aa8ed0dd.1738771631.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify miic_parse_dt() by using the for_each_available_child_of_node()
helper instead of manually skipping unavailable child nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 74a1c28ffc014796..991f05a40c758ccd 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -472,13 +472,10 @@ static int miic_parse_dt(struct device *dev, u32 *mode_cfg)
 	if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf) == 0)
 		dt_val[0] = conf;
 
-	for_each_child_of_node(np, conv) {
+	for_each_available_child_of_node(np, conv) {
 		if (of_property_read_u32(conv, "reg", &port))
 			continue;
 
-		if (!of_device_is_available(conv))
-			continue;
-
 		if (of_property_read_u32(conv, "renesas,miic-input", &conf) == 0)
 			dt_val[port] = conf;
 	}
-- 
2.43.0


