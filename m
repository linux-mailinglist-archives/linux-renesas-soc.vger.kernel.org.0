Return-Path: <linux-renesas-soc+bounces-629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64E38034FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 14:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E425B20766
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 13:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1D52375B;
	Mon,  4 Dec 2023 13:32:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9FDA1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 05:32:09 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f143:dd2b:2cfe:eb7c])
	by andre.telenet-ops.be with bizsmtp
	id JDY42B00J5Tnyl201DY4yE; Mon, 04 Dec 2023 14:32:07 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rA932-00Awgb-Bo;
	Mon, 04 Dec 2023 14:32:04 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rA93M-002C9A-96;
	Mon, 04 Dec 2023 14:32:04 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Remove duplicate setup of soc_device_attribute.family
Date: Mon,  4 Dec 2023 14:32:03 +0100
Message-Id: <4c5e4d0d1819028466748ed684254fec41aae816.1701696627.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit 3f84aa5ec052dba9 ("base: soc: populate machine name in
soc_device_register if empty") in v6.4, soc_device_register() fills in
soc_device_attribute.family when it is still empty.  Hence the identical
code in renesas_soc_init() doing the same can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.8.

 drivers/soc/renesas/renesas-soc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 3d8e18923bddebf9..67de980ec4244c41 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -487,10 +487,6 @@ static int __init renesas_soc_init(void)
 		return -ENOMEM;
 	}
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
-
 	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
 	soc_dev_attr->soc_id = kstrdup_const(soc_id, GFP_KERNEL);
 
-- 
2.34.1


