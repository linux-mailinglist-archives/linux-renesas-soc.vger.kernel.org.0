Return-Path: <linux-renesas-soc+bounces-25971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1EFCD5480
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 10:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A2D03005186
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 09:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AC7221D9E;
	Mon, 22 Dec 2025 09:16:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BB5221710
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394993; cv=none; b=Kq3gYUhXUDPM2SDmsiqfvHAujDU3V4AhQph3hsAnaTRD2afK1vdnuauS34iznbCB7/w/YN9/CMRq3RmsgoJ018fNTS5xlhnnMvmM9ruGuGJanJ3LI+o/rGBlVF22uWtgf8MZECvGdn0UvIZiPBt/9ESasaIsQwbBlsRDpIrMSOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394993; c=relaxed/simple;
	bh=2S7bvvXPI7WThJZPSAVjXM8/SJY0L5Lr8wskqDShHE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ryJ5Mm//U9D62tvuQGH8Bd77NeROG1eK/p6lgRIHNurbJYOaYJcuw61ZNlYeOFF2KH1+0kie7Q9C7+EIWQhN7lpWmMRsKvoU2Q/LmEVuFyV1t9pvcB/Z8TOjxi6kVSp0qbMpQoa16ss7YBHhqYJJsC9obj3ma4w67y9lCK5N1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488F3C4CEF1;
	Mon, 22 Dec 2025 09:16:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH local] riscv: rzfive: defconfig: Refresh for v6.19-rc1
Date: Mon, 22 Dec 2025 10:16:29 +0100
Message-ID: <7b6154130b973d85a224ee0026eef88979fbb1cf.1766394936.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Disable support for the Svrsw60t59b ISA extension for using PTE bits
    60 and 59, as it is not supported by RZ/Five,
  - Drop CONFIG_SND_SUPPORT_OLD_API=n (disabled by default since commit
    74ac7558ea763011 ("ALSA: Do not build obsolete API")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index 622ee0136fc7a51c..35a672805fb0eb74 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -41,6 +41,7 @@ CONFIG_NONPORTABLE=y
 # CONFIG_RISCV_ISA_ZICBOM is not set
 # CONFIG_RISCV_ISA_ZICBOZ is not set
 # CONFIG_RISCV_ISA_ZICBOP is not set
+# CONFIG_RISCV_ISA_SVRSW60T59B is not set
 # CONFIG_RISCV_ISA_VENDOR_EXT_MIPS is not set
 # CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE is not set
 # CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
@@ -136,7 +137,6 @@ CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_PCM_TIMER is not set
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_PROC_FS is not set
 # CONFIG_SND_CTL_FAST_LOOKUP is not set
 # CONFIG_SND_DRIVERS is not set
-- 
2.43.0


