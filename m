Return-Path: <linux-renesas-soc+bounces-23060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C586BDE701
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBC2B4E1CF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 12:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19741324B23;
	Wed, 15 Oct 2025 12:17:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01527322DB7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530648; cv=none; b=hzG45FI5KiNRuY9e47tanqt2Qg3w7isAjwX0qTV/yWEGjdhPELbU/4sCG+/ivhtYWhcEYz1xQxu01xgBHcrXVPN0ll5of2M6PvmnRgRxt7uNC9H5DQk+ZLfe4s0qv3y2sMR/1PUwhfh9xXgyJPNZAA9iO6TW1VhndFu0KyO959M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530648; c=relaxed/simple;
	bh=wceokXccFrO1GiXcVFqc013OQiMMxsQeRI72XCeNBJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nzjlB6WeEDKXbZbjBKiiSHbfZp3b5HujjapJpcucMmUVQMlsZhmMCnGh2YIqkxJT/SMXjhm/rhpZm/lFmThVAW5QcSl8RrYkjDg6CSSLIGnTWWA+2S+hNoPqLod6vhemAd+qsF/5I4OvbN2jTgYJAZQyXJd44HYV/gx2EsH8k0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825A7C4CEF8;
	Wed, 15 Oct 2025 12:17:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.18-rc1
Date: Wed, 15 Oct 2025 14:17:23 +0200
Message-ID: <c33e8d0a4102ea2a2758b855372f23bc2dc3abf7.1760530600.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Disable support for the Zacas ISA-extension (not supported by
    RZ/Five),
  - Disable support for MIPS vendor extensions (not supported by
    RZ/Five),
  - Move CONFIG_SND_SIMPLE_CARD (moved in commit f13ab498726bb6c6
    ("ASoC: generic: tidyup standardized ASoC menu for generic")),
  - Disable support for RISC-V RPMI clock service group clocks (not
    supported by RZ/Five),
  - Disable support for RISC-V SBI Message Proxy (MPXY) extension
    mailboxes (not supported by RZ/Five).
  - Drop CONFIG_CRYPTO=y (auto-enabled since commit d8e97cc476e33037
    ("SUNRPC: Make RPCSEC_GSS_KRB5 select CRYPTO instead of depending on
    it")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index 3655b030c1685c49..11d117438270793f 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -33,6 +33,7 @@ CONFIG_NONPORTABLE=y
 # CONFIG_RISCV_ISA_SVPBMT is not set
 # CONFIG_RISCV_ISA_V is not set
 # CONFIG_RISCV_ISA_ZAWRS is not set
+# CONFIG_RISCV_ISA_ZACAS is not set
 # CONFIG_RISCV_ISA_ZBA is not set
 # CONFIG_RISCV_ISA_ZBB is not set
 # CONFIG_RISCV_ISA_ZBC is not set
@@ -40,6 +41,7 @@ CONFIG_NONPORTABLE=y
 # CONFIG_RISCV_ISA_ZICBOM is not set
 # CONFIG_RISCV_ISA_ZICBOZ is not set
 # CONFIG_RISCV_ISA_ZICBOP is not set
+# CONFIG_RISCV_ISA_VENDOR_EXT_MIPS is not set
 # CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE is not set
 # CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
 # CONFIG_EFI is not set
@@ -141,9 +143,9 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
-CONFIG_SND_SIMPLE_CARD=y
 CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_WM8978=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_EHCI_HCD=y
@@ -163,8 +165,10 @@ CONFIG_DMADEVICES=y
 CONFIG_RZ_DMAC=y
 CONFIG_SYNC_FILE=y
 CONFIG_COMMON_CLK_VC3=y
+# CONFIG_COMMON_CLK_RPMI is not set
 CONFIG_RENESAS_OSTM=y
 CONFIG_MAILBOX=y
+# CONFIG_RISCV_SBI_MPXY_MBOX is not set
 # CONFIG_RISCV_IOMMU is not set
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
@@ -200,7 +204,6 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_CRYPTO=y
 CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
-- 
2.43.0


