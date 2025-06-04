Return-Path: <linux-renesas-soc+bounces-17848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB8ACE174
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585771898972
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879CC19D07E;
	Wed,  4 Jun 2025 15:30:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1518DF8D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051000; cv=none; b=MurAvc+LXpIMAIo8G1AaUB4BYKyjeW0n6lfDZ1IIVexRddXXvRJqTRgo+2crYiUnIuTKg5r4AJBxVpBsD0eq9SO9wpf+Kze3KRQQhCDbmgtL5jB4eZmc7Zl4yMjTqt0cOPoih3zVUR92TGFOSnFXva6SC/B8gzZEvwcsft/7/pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051000; c=relaxed/simple;
	bh=Y4PnUNedH73eFTsytZLRu58ANWMo+iKbn+rsWHuw340=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xr63HLJaFarUPqNNq3DIsGD0DOnYMbP2sHJQ/HunOWHQgBZqnCzAr0gFzdEhYIhw2xx5driAe9KiZiz36tbeyByCyJ+ANJy9jD66/WvvxlyfAtqaijEDbEBymLO7Vmbj96GbW6eGdDFUMZZ/9nSsyYZ4bnwB9TeKR8KyJ9aGbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A739EC4CEE4;
	Wed,  4 Jun 2025 15:29:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 4/6] can: rcar_canfd: Increase number of channels on R-Car Gen3
Date: Wed,  4 Jun 2025 17:29:49 +0200
Message-ID: <3413e662bb01e3fad492ce8ff7c80dc2f0c022d7.1749048734.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749048734.git.geert+renesas@glider.be>
References: <cover.1749048734.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CAN-FD Controller in the Renesas R-Car V3H2 (R8A77980A) SoC is very
similar to CAN-FD on other R-Car Gen3 SoCs, but supports a third
channel.

Commit e9ffa12e02e19339 ("can: rcar_canfd: Add rnc_field_width variable
to struct rcar_canfd_hw_info") removed the assumption of a maximum of
two channels on controllers using the R-Car Gen3 register layout.  Hence
add support for a third channel by increasing the maximum number of
channels on R-Car Gen3 to three.

Just like on R-Car Gen4, the applicable maximum numbers of channels is
enforced by SoC-specific rules in the DT bindings, and the "dtbs_check"
make target.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/can/rcar/rcar_canfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index a9c5b4ac040bdc0a..cedc1a8b12bd07a1 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -715,7 +715,7 @@ static const struct rcar_canfd_hw_info rcar_gen3_hw_info = {
 	.rnc_field_width = 8,
 	.max_aflpn = 31,
 	.max_cftml = 15,
-	.max_channels = 2,
+	.max_channels = 3,
 	.postdiv = 2,
 	.shared_global_irqs = 1,
 	.ch_interface_mode = 0,
-- 
2.43.0


