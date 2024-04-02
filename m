Return-Path: <linux-renesas-soc+bounces-4203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56750895008
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 12:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CECA1C223B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 10:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F6A5A4CD;
	Tue,  2 Apr 2024 10:27:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C05A11A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053666; cv=none; b=mOC8UBAk0TFbk3bCVz/YHce50usfvZAsEWFiUAuCnMVR+7ZQ76KfijWLh2sHLCAR9kQ4xx18kHu1kZKRC4s4QjXMwtKsaLErpemyyZpVMHmIcLeJ+0ReywqhZJRMn6rN536B5udxXGH6Tla2t2YtFKE7epdCN2QuDHSMXJ2/vn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053666; c=relaxed/simple;
	bh=hlXGGYQKSl5A4WvcxlK0X51P0CVZfx3pnZRGot5u7vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sLnEjf/H3nHz8LuZW7wrSK7bwAnpeVe/wwF1/ZjPv4VUJxpkj9y85K9wJxm/a9bKP3eZjKtINVbO9Ek6sWLSS/FxnGq9Hrq1QBH574fbcUafRoGkOm77jtH0vgoIdyoSQNwAA738TVPPd4yJAq9einW2J0KR9WwiqqnOQclNzXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4V83wn57ZJz4wxQ6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Apr 2024 12:27:37 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by albert.telenet-ops.be with bizsmtp
	id 6ATW2C0070SSLxL06ATWF0; Tue, 02 Apr 2024 12:27:30 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbM6-00FYU4-Mm;
	Tue, 02 Apr 2024 12:27:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbMY-009Vqd-2C;
	Tue, 02 Apr 2024 12:27:30 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/2] arm64: renesas: defconfig: Revive kexec
Date: Tue,  2 Apr 2024 12:27:27 +0200
Message-Id: <bad4858973a2af65eb5158346f1c8074a76d8dca.1712053450.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712053450.git.geert+renesas@glider.be>
References: <cover.1712053450.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kexec support was accidentally disabled since commit dccf78d39f1069a5
("kernel/Kconfig.kexec: drop select of KEXEC for CRASH_DUMP") in
v6.7-rc5.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 1b23e8311b829c3a..89cd8f0dead77be2 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -25,6 +25,7 @@ CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
+CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_AMPERE_ERRATUM_AC03_CPU_38 is not set
-- 
2.34.1


