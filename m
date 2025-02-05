Return-Path: <linux-renesas-soc+bounces-12877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D556DA295ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 17:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4BDA1881479
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 16:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB645193436;
	Wed,  5 Feb 2025 16:12:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF86E1519B4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771936; cv=none; b=iTuhzL2CzaQBSo4YzSqcoZ7kwtt6Wuw+Lmmg5db5YzFHq09mvk5+K3r7pIfWHIPzT1MFRayyYIJrcSxeGyqDwrbtsIOE1kvffwmNa6OXK0BClqKpHUeh/NV/wXRW8BLbVG6C7rtG3K9tdwQO7p7UxCW7hLiwaerdToncewlmreY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771936; c=relaxed/simple;
	bh=K9irMtaEYFX//7NJpgii0w03K4sA+S9bXyBQt9yABg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjCkYLALfVIooVqIn/aXjJEV0do/P67MpKwlNt59x9V2y+ELJZK+06bQWmG5wAog1HNI3KhRevEE6F1qC4K+YbGiiySEF3TvINh02c8mb7vqA2gseLdiBfnhO8FgQoBgFRWoc08jXy2qSzGZGVF11jzUh2J87i05ie+/vf7XuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by andre.telenet-ops.be with cmsmtp
	id 9sCB2E0083f221S01sCBB0; Wed, 05 Feb 2025 17:12:12 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfi0N-0000000FwpK-029M;
	Wed, 05 Feb 2025 17:12:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfi0Z-00000006dib-0MDQ;
	Wed, 05 Feb 2025 17:12:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next] net: renesas: rswitch: Convert to for_each_available_child_of_node()
Date: Wed,  5 Feb 2025 17:12:09 +0100
Message-ID: <54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rswitch_get_port_node() by using the
for_each_available_child_of_node() helper instead of manually ignoring
unavailable child nodes, and leaking a reference.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on R-Car S4 Starter Kit, which has port 2 disabled.
---
 drivers/net/ethernet/renesas/rswitch.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 84d09a8973b78ee5..aba772e14555d308 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1287,17 +1287,14 @@ static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 	if (!ports)
 		return NULL;
 
-	for_each_child_of_node(ports, port) {
+	for_each_available_child_of_node(ports, port) {
 		err = of_property_read_u32(port, "reg", &index);
 		if (err < 0) {
 			port = NULL;
 			goto out;
 		}
-		if (index == rdev->etha->index) {
-			if (!of_device_is_available(port))
-				port = NULL;
+		if (index == rdev->etha->index)
 			break;
-		}
 	}
 
 out:
-- 
2.43.0


