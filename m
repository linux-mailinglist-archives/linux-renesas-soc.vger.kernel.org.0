Return-Path: <linux-renesas-soc+bounces-6075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F373903DEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 15:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAFE8282415
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 13:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EC217D36E;
	Tue, 11 Jun 2024 13:49:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B631E4AF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113742; cv=none; b=lm5H1LlOpHS7PxciyQd6ixrRIAc+8V8yjJmWgaETAoziaGElZEZbI6Zfvfbvov158pESI27AA6cGG0Sn7l8t7dSmWUSYIgSirZvYmsHb34Og/gd3Mp/7GHUxdiRfuTxUymSPqPkhd0LsBnpSUqp0soU0esMJ6poENVsduNIdPaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113742; c=relaxed/simple;
	bh=D5K2TMxvMJ+qceZTxEVmc3PF1Jofh145caTNhMCnmUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fl/ccjIeeDb9kTDcjzVHKY+851GBueJ3pXT/RV9o6NCzkY6opYDXIJh8dvagPTDC40VpRnfyIbV72ukTVO7dbdqDgTcg5zVEHT2pQ/DBzGPnwEu7xwmTSa6lcl8estZPrdZCJo+Lls/EGGZ+m27OX8q4/dGgjXoOtL/sqeiannc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b931:6762:38d0:e682])
	by xavier.telenet-ops.be with bizsmtp
	id aDop2C00W4Jsf0901Dop6D; Tue, 11 Jun 2024 15:48:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sH1qj-00631S-75;
	Tue, 11 Jun 2024 15:48:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sH1rl-00Dea8-L4;
	Tue, 11 Jun 2024 15:48:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [net] ravb: RAVB should select PAGE_POOL
Date: Tue, 11 Jun 2024 15:48:48 +0200
Message-Id: <fa61b464ae1aa7630e9024f091991937941d49f1.1718113630.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_PAGE_POOL is not enabled:

    aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
    aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
    aarch64-linux-gnu-ld: drivers/net/ethernet/renesas/ravb_main.o: in function `ravb_rx_ring_refill':
    ravb_main.c:(.text+0x8d8): undefined reference to `page_pool_alloc_pages'
    aarch64-linux-gnu-ld: ravb_main.c:(.text+0x944): undefined reference to `page_pool_alloc_frag'
    aarch64-linux-gnu-ld: drivers/net/ethernet/renesas/ravb_main.o: in function `ravb_ring_init':
    ravb_main.c:(.text+0x1d4c): undefined reference to `page_pool_create'

Fixes: 966726324b7b1400 ("net: ravb: Allocate RX buffers via page pool")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index b03fae7a0f72ec5e..83de7e56da61bbb1 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -33,6 +33,7 @@ config RAVB
 	select CRC32
 	select MII
 	select MDIO_BITBANG
+	select PAGE_POOL
 	select PHYLIB
 	select RESET_CONTROLLER
 	help
-- 
2.34.1


