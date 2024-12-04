Return-Path: <linux-renesas-soc+bounces-10906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9E9E3BF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 15:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42FB7286CCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E6D1F707A;
	Wed,  4 Dec 2024 14:02:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD91DFE1E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320920; cv=none; b=LPUBjhaH6WPZxp9/ZbbZkQYDNxusbxJwr0oBzT+U4DcuUcB0++mpuUcHbjxqRypm0LO/NlH03en6iG2R+ITs5S/YsPftGPgU/Ipyei1Va16Iz7Uf/XyaZdR7JtIHPfYtnOEsrH+RrGujxxzlUaAklO8YbFrEKv5QNdxrUjGPZc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320920; c=relaxed/simple;
	bh=cGuwZYZHWRJDseomsRMm7VW4nvzN7bO2xqpHyxgB7Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E60tF/vcAWpQn2uuQnEhocxSq0e0WaaTH+Yflw/1VyY1zoecMnOzevJMeqv102/cYEDRU4aaC9fP2KrMj9Caol1c4z8SFtH9AolGNs5h9UUbY8XCSHVgNueum4cYW3xS5sskExO8qD6X2YbiGz6Qx19I1RJlS9Sc4YyjHeh6Ax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:8249:563a:8153:89fa])
	by laurent.telenet-ops.be with cmsmtp
	id ke1q2D00M1ljHKM01e1qCN; Wed, 04 Dec 2024 15:01:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIpwr-000HEE-Dc;
	Wed, 04 Dec 2024 15:01:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIpws-00DJcO-4S;
	Wed, 04 Dec 2024 15:01:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.13-rc1
Date: Wed,  4 Dec 2024 15:01:47 +0100
Message-Id: <b8727e642508433016290a998c880b54de2e208d.1733320866.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM systems:
  - Enable RZ DMA Controller support, as used on the Genmai and RSK+RZA1
    development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.14.

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 0e380e450a620e61..fd28f3176c6ba181 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -192,6 +192,7 @@ CONFIG_DW_DMAC=y
 CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
+CONFIG_RZ_DMAC=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_ARCH_EMEV2=y
 CONFIG_ARCH_R8A7794=y
-- 
2.34.1


