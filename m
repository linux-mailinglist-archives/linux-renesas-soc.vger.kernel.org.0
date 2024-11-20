Return-Path: <linux-renesas-soc+bounces-10634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C49D3857
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 11:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4907284073
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BDE19CC1C;
	Wed, 20 Nov 2024 10:27:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5019C54D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732098476; cv=none; b=Gm5qzSrFLsBfOYYRzCoL+tTNkZIOEBi5oqmH/daBJ+1gjRkSvQAzNxUQItG/2jfo++StS/xB5+ljNs3LwXHTemQtTdAq7Fa4G1nJ0Ar5Q/xORxY3ZN2Ao6akGKfpDAQJXScpqNqi5y0iZ6pRj6x+63FLYSnLeETv4R93AEPm694=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732098476; c=relaxed/simple;
	bh=8znUTrcJ10aGDjGTQ502ZNZo0QnZtBBWFxtfF0TTNpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DFN/O8G2BSH9z4dfScUgAA4Jy9QFiNlLJq05IOU5pv/d2Pizzj57oeDYat9ZCEXN+eAHv9Q8pDjZZdgJBt4WnZy1q7CNn/KKda+AYKFUy3eFsIHK6eV99Uxw8eNEYFq5ghwwApLXiOCisSgQqPpiLESyMXLV0bWAwVlJIvqiin4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:35da:ab43:467b:7991])
	by xavier.telenet-ops.be with cmsmtp
	id eyTr2D0153gUftr01yTrbZ; Wed, 20 Nov 2024 11:27:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhvk-007bjq-FD;
	Wed, 20 Nov 2024 11:27:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhw7-005PUd-NR;
	Wed, 20 Nov 2024 11:27:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: defconfig: Disable Renesas SoC support
Date: Wed, 20 Nov 2024 11:27:50 +0100
Message-Id: <d33c9e3245c0bd3073d9618fcd014ba37e90e6bd.1732098271.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow-up to commit e36ddf3226864e09 ("riscv: defconfig: Disable RZ/Five
peripheral support") in v6.12-rc1:

  - Disable ARCH_RENESAS, too, as currently RZ/Five is the sole Renesas
    RISC-V SoC,
  - Drop no longer needed explicit disable of USB_XHCI_RCAR, which
    depends on ARCH_RENESAS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Apparently I forgot to submit this, probably due to Palmer's version
https://lore.kernel.org/all/20240917131936.18980-1-palmer@rivosinc.com

 arch/riscv/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703eb357..db0ce2c2c766ac15 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,7 +27,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
-CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_SOC_STARFIVE=y
@@ -201,7 +200,6 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
-# CONFIG_USB_XHCI_RCAR is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.34.1


