Return-Path: <linux-renesas-soc+bounces-172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6067F5B1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 10:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCBDD1C20D05
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 09:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1872110D;
	Thu, 23 Nov 2023 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94546DD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Nov 2023 01:33:09 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d60:3031:68fb:d1ad])
	by xavier.telenet-ops.be with bizsmtp
	id DlZ62B00L3EmSSH01lZ69d; Thu, 23 Nov 2023 10:33:06 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r664q-00A121-JH;
	Thu, 23 Nov 2023 10:33:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r6654-00HOKT-F3;
	Thu, 23 Nov 2023 10:33:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL v2] arm64: renesas: defconfig: Refresh for v6.7-rc1
Date: Thu, 23 Nov 2023 10:33:05 +0100
Message-Id: <f690f4ab553305df9ff738e5f00db80532ff4f46.1700731806.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Enable Renesas R-Car Gen4 PCIe host/endpoint controller support
    (Spider),
  - Disable CONFIG_SERIAL_8250_EXAR (auto-enabled since commit
    5939ff7ffae095ac ("tty: serial: 8250_exar: Does not use anything
    from 8250_pci")),
  - Enable Renesas VersaClock 3 support (RZ/G2L family SMARC EVK).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Enable COMMON_CLK_VC3.

Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index a947a43f97e89cb4..d4cc97d642cc5e04 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -108,6 +108,8 @@ CONFIG_HOTPLUG_PCI=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RCAR_GEN4_HOST=y
+CONFIG_PCIE_RCAR_GEN4_EP=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=y
@@ -159,6 +161,7 @@ CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
+# CONFIG_SERIAL_8250_EXAR is not set
 CONFIG_SERIAL_8250_NR_UARTS=2
 CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_8250_EM=y
@@ -353,6 +356,7 @@ CONFIG_VIDEO_MAX96712=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_HWSPINLOCK=y
-- 
2.34.1


