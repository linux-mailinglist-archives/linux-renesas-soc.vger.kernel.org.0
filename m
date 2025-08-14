Return-Path: <linux-renesas-soc+bounces-20492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B0B25F88
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 10:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 584DE7A6805
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 08:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8692E7F08;
	Thu, 14 Aug 2025 08:50:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1675225DD0C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Aug 2025 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161440; cv=none; b=apazS+yTCrJYbskeQzT26yuP7yIRcJ/JkVZ35ux1hS/dPJR3e9efspJOg6XdBdrY582AQdeiuNH38iD7TvKgfu78Ct2qCxolNFaMoFoM/kjF4dj7UXYyXTmXeYF9T0uoL+1tsxhvchdnuYpKOGFt+lp69NTyBPdEVavdocFATu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161440; c=relaxed/simple;
	bh=wxYCx6cgEgO20BbuPKgzD3HEr2uiasJcx/LkFOMzY7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbyAfVkMo+3tO7uTXLO63sCvjIyvnFYxJtqQdL1A55hnt7FsiuHKENsPYhMsxIKVwMOXL+XZdwpLTyismsmKpFuIBPI8MExqe39SxR9oQwieIsMEYJdPkfTOaK3ujOWLNueTgSH52eBkTDGu6W8BkT+Bg20rSUy3u/eFTYTb+YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B0CC4CEEF;
	Thu, 14 Aug 2025 08:50:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.17-rc1
Date: Thu, 14 Aug 2025 10:50:35 +0200
Message-ID: <23551e5d104a43431dc53abc58b124abf11a3838.1755161299.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Move CONFIG_SND_SIMPLE_CARD (moved in commit acc84d15e45393fb
    ("ASoC: generic: Standardize ASoC menu"),
  - Enable Cryptographic API support (no longer auto-enabled since
    commit f93c27092a5b61b2 ("apparmor: use SHA-256 library API instead
    of crypto_shash API")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index cad73b9e83eceac5..3655b030c1685c49 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -141,9 +141,9 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_WM8978=y
-CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_EHCI_HCD=y
@@ -200,6 +200,7 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_CRYPTO=y
 CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
-- 
2.43.0


