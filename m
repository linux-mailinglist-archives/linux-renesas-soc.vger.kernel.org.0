Return-Path: <linux-renesas-soc+bounces-9338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD5F98EC9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 12:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D00F61C20A3C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372DF84E0D;
	Thu,  3 Oct 2024 10:02:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F74E13D278
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727949767; cv=none; b=Za/BszVbFfTATdQsOx20emB179sFTh10dIGkH0y7hLNvbkXEpXen+kp8lgTm+CRtbSSfPN0Qlv4jgEHoBD+9bo/7npzIf0bMT+ufFTOV+FaCtpO4Rv0+aPHfGY30VLej4Dh7Ifrt64fJbknS14029ZDsZMz13MdvGs3zQWMRzJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727949767; c=relaxed/simple;
	bh=1htXzSZZEPTg1BVc91Rik/bVQ3W36hkBfmf5GLYM0hM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lcv0sd7J3gQhgP6nWVMfnkKGsycCxHSmGp/ierynF4clXj+JSSHVQtxIjpA6FEUB1Dg4IViVxAy75GdZgvCPrUJ86PaZoB9+ggygEwtGkx58StiAzRcN1G3kZ1fmtY9i95OuPq4yikA+Pl8+H7fnADO+f7UmbZGXHdDh0dEu0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by xavier.telenet-ops.be with cmsmtp
	id Km2c2D00d5K8SYz01m2cdY; Thu, 03 Oct 2024 12:02:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfE-001BCr-DH;
	Thu, 03 Oct 2024 12:02:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfM-0068YV-MY;
	Thu, 03 Oct 2024 12:02:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/3] arm64: renesas: defconfig: Enable RZ/V2H(P) Watchdog support
Date: Thu,  3 Oct 2024 12:02:33 +0200
Message-Id: <c235eb87c51d044939df0631fd5ad53723133e79.1727949523.git.geert+renesas@glider.be>
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

Enable Renesas RZ/V2H(P) Watchdog support, as used on the RZ/V2H EVK
board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 4e3e138da69b2d8a..ee49b343313d958a 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -201,6 +201,7 @@ CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZG2LWDT=y
+CONFIG_RENESAS_RZV2HWDT=y
 CONFIG_MFD_BD9571MWV=y
 CONFIG_MFD_DA9062=y
 CONFIG_RZ_MTU3=y
-- 
2.34.1


