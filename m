Return-Path: <linux-renesas-soc+bounces-7632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE394146B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 699A2B27CA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB3019F497;
	Tue, 30 Jul 2024 14:32:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249041A2577
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349958; cv=none; b=nRluEN8fcOCFDxungU6QGL2UrDXzZC2dbE25F2rC8gXx0E5PlTAkmmWEZusYRuJm09ZnWRC1BrgJDAodf6LTVnn9MxyhKbUIhxDFvXAMgMML0ZbwwtsAT9orjs7lho0yBGg/4VYqtVFwuYA7iCgjWTinROIQTqZ4siPnx7FQlOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349958; c=relaxed/simple;
	bh=7E593rQCM8WiXzvXM+cWBadL/r55gu0x/IReP0dsVK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u6SCcYWl+QBBeV9GhCsNt3HKnyj+e0OziItvG/9UbtIfDIi6xsn66aPmn3iZ2T9A84PcGxRc0SjyaJgCoDTN7B4NPg+vTzewIAisitdsV/fMq9YexncdZt5FLi32/RpKa/KqBzDy4p0AB5YPLx3cKVlAF0fxCTh8DlXPBgMp6lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by albert.telenet-ops.be with bizsmtp
	id tqYY2C00d30Ayot06qYYul; Tue, 30 Jul 2024 16:32:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYntZ-004B0d-HP;
	Tue, 30 Jul 2024 16:32:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYntw-00E1Ch-JJ;
	Tue, 30 Jul 2024 16:32:32 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Enable slab hardening and kmalloc buckets
Date: Tue, 30 Jul 2024 16:32:24 +0200
Message-Id: <96fc3f0ed509b6364d8aeb297d5acf4abed18404.1722349907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable slab freelist metadata hardening, which in turn enables support
for allocation from separate kmalloc buckets.  The latter is recommended
to be enabled, as per its help text.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.12.
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 56925adfe8422921..0e380e450a620e61 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -24,6 +24,7 @@ CONFIG_CPUFREQ_DT=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
2.34.1


