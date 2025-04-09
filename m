Return-Path: <linux-renesas-soc+bounces-15668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E7A82597
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 15:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29CDD464A1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 13:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EDF25FA04;
	Wed,  9 Apr 2025 13:07:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B525F991
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204077; cv=none; b=CemMOq/yceYBl4rsIYLVes0k1InjXbqRgs+k5cbWc4zOfnnSaMVBRQUX27s68H7lb01Cl4/mtZfKmlLYAUZIjnJsrvj8gmdPCYu/2eFvshWmJGqswU7dRxmhqW2X3FRB1EenwkLZjsEtUmSst3X1p4o33j1TWLFHdzgo7KoaMoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204077; c=relaxed/simple;
	bh=njzMjrL9v6oOjZCkson+d/1biGX8TVkb0gJ1MMouJJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZI9aQGmzyVEDDFZcvs2xXs/aNODWYbDUq9ILhGw2E+8SoOqRke/kqFUvdKyc5gTpKtblGgCphYuj2kQ4uY/UhA3k6H15bbpYWB2aYAUflP8tEEVh1djPPwb1PvJRGlWtjUNT+QOFEl97LWeu1TTS83STeicQbECjJ0oSTpSdwco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZXjsw47B7z4x1mS
	for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Apr 2025 15:07:48 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d6c1:79b5:9acd:4fad])
	by laurent.telenet-ops.be with cmsmtp
	id b17g2E00B1LzlAN0117gWx; Wed, 09 Apr 2025 15:07:41 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2V9X-00000000DQJ-1FFm;
	Wed, 09 Apr 2025 15:07:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2V6o-00000003Kae-1eOu;
	Wed, 09 Apr 2025 15:04:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Remove individual Renesas SoC entries
Date: Wed,  9 Apr 2025 15:04:49 +0200
Message-ID: <b76439632baf86289dea00ff6b2e3ac69251cebc.1744203849.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove explicit entries for individual Renesas SoCs from the defconfig
file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
is selected, and ARCH_RENESAS is already enabled in the defconfig,
listing them separately is redundant.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 54face65d831129a..c6e1fa75134a482b 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -382,29 +382,6 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_ARM64_ERRATUM_858921 is not set
 CONFIG_RENESAS_OSTM=y
 CONFIG_MAILBOX=y
-CONFIG_ARCH_R8A77995=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77951=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77960=y
-CONFIG_ARCH_R8A77961=y
-CONFIG_ARCH_R8A779F0=y
-CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77970=y
-CONFIG_ARCH_R8A779A0=y
-CONFIG_ARCH_R8A779G0=y
-CONFIG_ARCH_R8A779H0=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A774E1=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774B1=y
-CONFIG_ARCH_R9A07G043=y
-CONFIG_ARCH_R9A07G044=y
-CONFIG_ARCH_R9A07G054=y
-CONFIG_ARCH_R9A08G045=y
-CONFIG_ARCH_R9A09G011=y
-CONFIG_ARCH_R9A09G047=y
-CONFIG_ARCH_R9A09G057=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
-- 
2.43.0


