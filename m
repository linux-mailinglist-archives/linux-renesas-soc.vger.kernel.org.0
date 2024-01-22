Return-Path: <linux-renesas-soc+bounces-1649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2C836560
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 15:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D6E6280AB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5673D3A7;
	Mon, 22 Jan 2024 14:29:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4FD3D39B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933744; cv=none; b=dOQ94PI8QIzdYhF/U5Sa6uYeIU4dwsHceIiiHo4zoECh5lyBJuhhhn0rvQ8c5zef/BJSf8tqIvX5uXXUlZjauc+ZdwcW98sz0iqwli99xjAYOK4pwJccmTeAjQbVPpiygHAEjdJuP/XOayLJYFiebSCYdMulO5+Bzwxo4cDgKsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933744; c=relaxed/simple;
	bh=Pxwh8tjqOCWqKLEXv8ROTvsDZDTBmc8xq8sW7jVMDZs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WNG8NQsvMVa6iCTS+4grlQg4hytqrl/Cp08zk01dAdrtg+lWQtmVjXy6E65i2BVhXXXNRcAWpYvsyuMxfzC7s5/9wNzEo+ghNVhonA6TyyU5yZOyHvXq9bN1sMGUd1BZ36g43lCfRlxixbnZ0E43ZbYk/mTSgtUvtlEiLRfk7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by michel.telenet-ops.be with bizsmtp
	id dqV02B00Q0ZxL6o06qV0Xf; Mon, 22 Jan 2024 15:29:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvHX-00GGxP-Fq;
	Mon, 22 Jan 2024 15:29:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvIK-00CFI3-FW;
	Mon, 22 Jan 2024 15:29:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: multi_v7_defconfig: Disable board staging
Date: Mon, 22 Jan 2024 15:28:59 +0100
Message-Id: <64c1d4613d5dfc1f70816f2136d66b75c8e39c1f.1705933656.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the DT conversion the SH-Mobile and Armadillo-800-EVA display
support, and the removal of the EMMA Mobile USB Gadget staging driver,
there is no longer a need to enable support for board staging drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.9.

EMMA Mobile USB Gadget staging driver removal submitted in "[PATCH v2
0/4] staging: Remove EMMA Mobile USB Gadget and board staging support"
https://lore.kernel.org/r/eec1bfb2878237888a8c3bc866d18dc53900739f.1705932585.git.geert+renesas@glider.be
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ecb3e286107a4c1a..4299f8f8aa9b6b40 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1047,7 +1047,6 @@ CONFIG_KEYBOARD_NVEC=y
 CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
-CONFIG_STAGING_BOARD=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=m
 CONFIG_CROS_EC_I2C=m
-- 
2.34.1


