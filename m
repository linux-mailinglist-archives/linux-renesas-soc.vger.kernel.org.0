Return-Path: <linux-renesas-soc+bounces-12857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E9A28797
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 11:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 971953A8F13
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 10:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A202B22CBD2;
	Wed,  5 Feb 2025 10:07:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE0722B5B9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750053; cv=none; b=rBnmZd6FWYH6gkfOcuJ1rZfgABAB83xagmNzvDlmhOpIWN5AUSRaXk3CDCtS+zaBmQMBP1Lc8CTtMa+WgIgd8XlLL6tO4Ceb7wv89NfDof498TYDHI9FgFpLbYxnOU4RnEGKKF4kKTHGU2SDudv1SEDfVt1c3a3rHWOXU+uKYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750053; c=relaxed/simple;
	bh=ae7TIh3Gusk3oLv0zbNr+eA38iML1jIGTB7W4VLX+v4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5fFxquxGRh4MzbsU2aru1dn/Zl4mZpZowqLgMmEf1WN7864qY9mlN9Seml60kacbpLl7yivHBwbikgoxyjTWSRKbF75iKO4mhCHWfInNDE+/IOauWaGFlD0I8PsHCjfLWrCzVd25NUs2KFZwXIUewOEqeTu8Wo6lMR6flB2zbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c448:5c9f:5d50:ad45])
	by xavier.telenet-ops.be with cmsmtp
	id 9m7U2E00Z5P95W301m7U48; Wed, 05 Feb 2025 11:07:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfcJQ-0000000FsfP-32mQ;
	Wed, 05 Feb 2025 11:07:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfcJc-00000006Lt3-2tA0;
	Wed, 05 Feb 2025 11:07:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] riscv: rzfive: defconfig: Disable unsupported ISA extensions
Date: Wed,  5 Feb 2025 11:07:19 +0100
Message-ID: <d184b4527cf7791f8c0d6f46ce4c901e662692df.1738749745.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable support for ISA extensions that are not supported by RZ/Five:
  - Svnapot extension support for supervisor mode NAPOT pages,
  - Svpbmt extension support for supervisor mode page-based memory
    types,
  - VECTOR extension support,
  - Zawrs extension support for more efficient busy waiting,
  - Zba and Zbb extension support for bit manipulation instructions,
  - Zbc extension support for carry-less multiplication
    instructions,
  - Zicboz extension support for faster zeroing of memory,
  - T-Head vendor extension support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index 14bb3fa1ed104d6e..b98acc93e3e37566 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -31,7 +31,16 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ERRATA_SIFIVE=y
 CONFIG_NONPORTABLE=y
 # CONFIG_RISCV_ISA_SUPM is not set
+# CONFIG_RISCV_ISA_SVNAPOT is not set
+# CONFIG_RISCV_ISA_SVPBMT is not set
+# CONFIG_RISCV_ISA_V is not set
+# CONFIG_RISCV_ISA_ZAWRS is not set
+# CONFIG_RISCV_ISA_ZBA is not set
+# CONFIG_RISCV_ISA_ZBB is not set
+# CONFIG_RISCV_ISA_ZBC is not set
 # CONFIG_RISCV_ISA_ZICBOM is not set
+# CONFIG_RISCV_ISA_ZICBOZ is not set
+# CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
 # CONFIG_EFI is not set
 CONFIG_PM_AUTOSLEEP=y
 CONFIG_CPU_IDLE=y
-- 
2.43.0


