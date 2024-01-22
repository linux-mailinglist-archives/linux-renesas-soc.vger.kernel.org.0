Return-Path: <linux-renesas-soc+bounces-1648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB098836559
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 15:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 194DC1C22097
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807243D54C;
	Mon, 22 Jan 2024 14:27:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD13D54B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933655; cv=none; b=FpU6o5Ks3Us/CxQneqmw6ts2UO1VRmnVoUteGPpNxVvoxQ5EawhFkvLeogE9z3PfHCXRi+77LTATjpOd5zhrCN6rAFAxTCkKorLsR2D2SgLfU4siBKWLNoUe/30g8WkKUjA74IkI5tWbfHCuu/rFuz3s+5R7JIzo0Nyzt2PdZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933655; c=relaxed/simple;
	bh=DPTpx/enJ42KFi65eyqHeTKZQfLK5XOQ715K4fmJ9Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fpxshbEpavYh1DzNDir0NBV7n1ujfON4mbbplgOqqtgDcXK+x6zLw+cLOraz2WEJlDMWlWsoaYhVDYaWnt9CM24sIMMW+i5Y7hak6ydp5h2bHv47qA2ChHyyvz8ptzw+jOaTNMWeW2BE4EzDnKuCft9zFWfV8dJ61OOq71H8VhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by baptiste.telenet-ops.be with bizsmtp
	id dqTY2B0050ZxL6o01qTYoq; Mon, 22 Jan 2024 15:27:32 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvG6-00GGxK-Uc;
	Mon, 22 Jan 2024 15:27:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvGt-00CFG1-VG;
	Mon, 22 Jan 2024 15:27:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Disable staging
Date: Mon, 22 Jan 2024 15:27:30 +0100
Message-Id: <7f1fa862cb508a5d29947380b72324be027ac76f.1705933596.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the DT conversion of SH-Mobile and Armadillo-800-EVA display
support, and the removal of the EMMA Mobile USB Gadget staging driver,
there is no longer a need to enable support for board staging or any
other staging drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.9.

EMMA Mobile USB Gadget staging driver removal submitted in "[PATCH v2
0/4] staging: Remove EMMA Mobile USB Gadget and board staging support"
https://lore.kernel.org/r/eec1bfb2878237888a8c3bc866d18dc53900739f.1705932585.git.geert+renesas@glider.be
---
 arch/arm/configs/shmobile_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index c47a638172a89bfd..091e1840933cf2c6 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -191,8 +191,6 @@ CONFIG_DW_DMAC=y
 CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
-CONFIG_STAGING=y
-CONFIG_STAGING_BOARD=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_ARCH_EMEV2=y
 CONFIG_ARCH_R8A7794=y
-- 
2.34.1


