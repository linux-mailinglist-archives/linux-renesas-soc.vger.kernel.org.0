Return-Path: <linux-renesas-soc+bounces-4854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A9F8B036D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 09:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E366281B78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 07:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718611534E0;
	Wed, 24 Apr 2024 07:45:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED56157E79
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2024 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713944734; cv=none; b=Yjh432qiS5vmAGCTJ8k0Aporg6NglZRIY7w2VyD7ZTV0CcZDtrwlPpeV4KFTbluHihJiqfoJ1fF6vJ+5glxAeibIzQmJAMjoZ82J05e9LdiZIk0Y96tULj5BMztUJg78x5NsnmYIyiRzppIDi1bYaS8S+OaY7aq6dGza68a4eKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713944734; c=relaxed/simple;
	bh=ssEEaHJeH/+FXd54tyEFn55ATdJwDE9WT446KlnZ0QA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KivlN/GYrTGORyGue37VwEiVsfA4GOdWkr2nKTvVXxaGDvNF2pveGeZs3PbZRJ2tzaDv84nxjxHSYV76QnIujllCPY4LnzIYmHOf/IapLpXOAN/gGj+QIBkRlKnJZhujcqvJm8gTbmBYeKdYDjDdescdycmZqvDpP+BPeznFlxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id EvlN2C0080SSLxL01vlNdh; Wed, 24 Apr 2024 09:45:24 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzXJ4-005m6Q-3E;
	Wed, 24 Apr 2024 09:45:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzXJi-00ACdE-4y;
	Wed, 24 Apr 2024 09:45:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] net: ravb: Fix registered interrupt names
Date: Wed, 24 Apr 2024 09:45:21 +0200
Message-Id: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As interrupts are now requested from ravb_probe(), before calling
register_netdev(), ndev->name still contains the template "eth%d",
leading to funny names in /proc/interrupts.  E.g. on R-Car E3:

	89:  0      0  GICv2  93 Level  eth%d:ch22:multi
	90:  0      3  GICv2  95 Level  eth%d:ch24:emac
	91:  0  23484  GICv2  71 Level  eth%d:ch0:rx_be
	92:  0      0  GICv2  72 Level  eth%d:ch1:rx_nc
	93:  0  13735  GICv2  89 Level  eth%d:ch18:tx_be
	94:  0      0  GICv2  90 Level  eth%d:ch19:tx_nc

Worse, on platforms with multiple RAVB instances (e.g. R-Car V4H), all
interrupts have similar names.

Fix this by using the device name instead, like is done in several other
drivers:

	89:  0      0  GICv2  93 Level  e6800000.ethernet:ch22:multi
	90:  0      1  GICv2  95 Level  e6800000.ethernet:ch24:emac
	91:  0  28578  GICv2  71 Level  e6800000.ethernet:ch0:rx_be
	92:  0      0  GICv2  72 Level  e6800000.ethernet:ch1:rx_nc
	93:  0  14044  GICv2  89 Level  e6800000.ethernet:ch18:tx_be
	94:  0      0  GICv2  90 Level  e6800000.ethernet:ch19:tx_nc

Rename the local variable dev_name, as it shadows the dev_name()
function, and pre-initialize it, to simplify the code.

Fixes: 32f012b8c01ca9fd ("net: ravb: Move getting/requesting IRQs in the probe() method")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/ravb_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index b621ddd4539cf517..384ddad65aaf641a 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2729,19 +2729,18 @@ static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
 	struct platform_device *pdev = priv->pdev;
 	struct net_device *ndev = priv->ndev;
 	struct device *dev = &pdev->dev;
-	const char *dev_name;
+	const char *devname = dev_name(dev);
 	unsigned long flags;
 	int error, irq_num;
 
 	if (irq_name) {
-		dev_name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", ndev->name, ch);
-		if (!dev_name)
+		devname = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", devname, ch);
+		if (!devname)
 			return -ENOMEM;
 
 		irq_num = platform_get_irq_byname(pdev, irq_name);
 		flags = 0;
 	} else {
-		dev_name = ndev->name;
 		irq_num = platform_get_irq(pdev, 0);
 		flags = IRQF_SHARED;
 	}
@@ -2751,9 +2750,9 @@ static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
 	if (irq)
 		*irq = irq_num;
 
-	error = devm_request_irq(dev, irq_num, handler, flags, dev_name, ndev);
+	error = devm_request_irq(dev, irq_num, handler, flags, devname, ndev);
 	if (error)
-		netdev_err(ndev, "cannot request IRQ %s\n", dev_name);
+		netdev_err(ndev, "cannot request IRQ %s\n", devname);
 
 	return error;
 }
-- 
2.34.1


