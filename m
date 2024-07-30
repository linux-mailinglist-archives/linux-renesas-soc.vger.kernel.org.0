Return-Path: <linux-renesas-soc+bounces-7633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB5941482
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C0C282D02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5CA1A01A6;
	Tue, 30 Jul 2024 14:36:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64318FC75
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350208; cv=none; b=bCQlYGH/hmOJG7bBu+jZIMhN6aYf2rSOr5KY3s9PX/UIXRgKVmpjGKJLHPbhJy9WStlMYBCjFGRzILI03HazHr9i/i8IvAfqLJera/aqTblG03pDBkwuVaFhrzYyc8oabNghSe42xgYLgNq5o+i00ALw5PxJtHXzAJ2pe2TbYjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350208; c=relaxed/simple;
	bh=69YH8cN+nQB8RFt7L8+Ud1bN33LaFfFnWYjzN1binFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EA5xpRi+3PluvRbrsQnAk6oFHD6t9g/LnM/u/b1yRXvzIwi6P6VSZN/e3zXK6dCPDxFJprhTphdxsn8BEc4NY9WLbr8xkd9zp8zBOKRoOj8x4Np13N28fPakLD7CMKbleiIac7bkrmd90gPfUSIRa7E0axZJR+5bR1pqv5Al43U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by albert.telenet-ops.be with bizsmtp
	id tqck2C00W30Ayot06qckbd; Tue, 30 Jul 2024 16:36:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYnxd-004B1j-Kf;
	Tue, 30 Jul 2024 16:36:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYny0-00E1FY-NK;
	Tue, 30 Jul 2024 16:36:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/3] arm64: renesas: defconfig: Enable slab hardening and kmalloc buckets
Date: Tue, 30 Jul 2024 16:36:40 +0200
Message-Id: <6daddb7e01d98cbd386da75b6892d9d8296609bb.1722349965.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722349965.git.geert+renesas@glider.be>
References: <cover.1722349965.git.geert+renesas@glider.be>
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
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index c778d1b792c6d852..ec8af3ed1b382ac2 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -78,6 +78,7 @@ CONFIG_KVM=y
 CONFIG_JUMP_LABEL=y
 CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_SLAB_FREELIST_HARDENED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
-- 
2.34.1


