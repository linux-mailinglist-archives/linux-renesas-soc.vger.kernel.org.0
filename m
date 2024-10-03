Return-Path: <linux-renesas-soc+bounces-9339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095798EC9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 12:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36FEE2833EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 10:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436D4148314;
	Thu,  3 Oct 2024 10:02:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA571487E5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727949767; cv=none; b=F6OkpbTU4/eoKATh7Xz+LnSQOtblLUCSWPBtgu493ulgd3StMzaPZRWIFFTzfbY/onVSt0yQxumRRH8CSaNZUl510e7DPCiGNakvi3bMGd9/augLsYJ4Qgd0hxbAE3m274zcOZCnbJt3WRDovyevADVKfYy3+OjdMcWWvm2Herw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727949767; c=relaxed/simple;
	bh=+TPp7UoE2gvhF28gv7mpambqVCaH/3UtV/sM495vzXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pIiEgUCznVN4Qco1XIltVrCUH2vLKhlf4bn9c5V8zXfNPDTogvdrTiQyvCiGyJ3q7ZW+aOCOSp6vmw0NM4EatCh6baP/xUGZeJDXbkYb6F9IBPr5MIWm3j7fcQBiOfvawFnVonaT3syQzDax7z78aB7l8lJCqJJjdZj5LqabM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by laurent.telenet-ops.be with cmsmtp
	id Km2c2D00S5K8SYz01m2cRT; Thu, 03 Oct 2024 12:02:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfE-001BCo-Cz;
	Thu, 03 Oct 2024 12:02:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfM-0068YS-Lv;
	Thu, 03 Oct 2024 12:02:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/3] arm64: renesas: defconfig: Disable Synopsys DesignWare I2C support
Date: Thu,  3 Oct 2024 12:02:32 +0200
Message-Id: <a46e8faac557755c2ab97582797b52224247fbe7.1727949523.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727949523.git.geert+renesas@glider.be>
References: <cover.1727949523.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas ARM64 systems do not use Synopsys DesignWare I2C adapters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d3cfbc4315632d89..4e3e138da69b2d8a 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -177,7 +177,6 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_RIIC=y
 CONFIG_I2C_RZV2M=y
 CONFIG_I2C_SH_MOBILE=y
-- 
2.34.1


