Return-Path: <linux-renesas-soc+bounces-7634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B512941483
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFBD283091
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A20E18FC75;
	Tue, 30 Jul 2024 14:36:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D51A00CB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350209; cv=none; b=XiTib9PyU6yq2AspYFIv/blfB8ynZ89MQXLgnKC/hvGroNCZ7uckrMGhVPyZ58eukN/oBQfQpz0GFvhzOPgGMI2MTkal1hBggEEpyyQhFWDpIjCuMYUdKpO2OJac+1sBKAEINE3/E/tUtEnY8WCxFmO7k4NNYOXxugWSZlZrCB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350209; c=relaxed/simple;
	bh=89LrhPEBJnBAe3bSd0rOJTveZ30QjtlRDBJMSCxbu1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJ9KRrSvwwxQFXR6mfXNSAJ7i+4chn5uD+PaDmerGsLduxDjIt0BKWSjnvKEfLhd1d8bOGft64Bha8sXCu8+NbmvF9i2dGMAleD3TeTRIUhAN9qsYMFk0UxbYwA9GPmpnac88dv23hxmNOn4vGHXrh1uN1Z75vjVV9ZbeOWx0C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by michel.telenet-ops.be with bizsmtp
	id tqck2C00a30Ayot06qckpW; Tue, 30 Jul 2024 16:36:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYnxd-004B1l-L4;
	Tue, 30 Jul 2024 16:36:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYny0-00E1Fb-Nv;
	Tue, 30 Jul 2024 16:36:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/3] arm64: renesas: defconfig: Enable Renesas Ethernet-TSN support
Date: Tue, 30 Jul 2024 16:36:41 +0200
Message-Id: <072ea4b37445b994732ecd8235664ba988d67480.1722349965.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722349965.git.geert+renesas@glider.be>
References: <cover.1722349965.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for Renesas Ethernet-TSN, as found on R-Car V4H in the
White Hawk Single development board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index ec8af3ed1b382ac2..f6231582a066365c 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -143,6 +143,7 @@ CONFIG_VIRTIO_NET=y
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
+CONFIG_RTSN=y
 CONFIG_MARVELL_10G_PHY=y
 CONFIG_MARVELL_88Q2XXX_PHY=y
 CONFIG_MICREL_PHY=y
-- 
2.34.1


