Return-Path: <linux-renesas-soc+bounces-10950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 802799E55DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10041881CE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 12:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63D5218AC2;
	Thu,  5 Dec 2024 12:53:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5B21885D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403238; cv=none; b=W7cwD6vpXJx+LansNOLjtKmBX3LXiHrB5pV3FFegCgaQvHiWpBzzT8qu5rJkcUNQ/UEksm780paYqb0IP7VoiuukJnTjYr0feHwW6IB5JLu+S8MIkLnT2tjSFhGVKQLxuE7cQSSlw/FNU9a/1pnVtBNf+q+Tk+FswgSmNsRPSUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403238; c=relaxed/simple;
	bh=3gSVDVX1lH+JzmZUPe8GZ4PRdwheDBvrzSko03LJx5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SM8tBGZ/U/IPeyMZZXUs1XRxnCgcsSOzak3MyHdsg60QfKaPIIQjAoD0ukdYK8mwcu5z9e4iilau5rM0eC/gdKCMztDahaF1C9eYu74gl95qm67sTWUhiwuZ3qnb0tFlk0iUGtTaY5xTk08A/gU7PUBSsQwAfirAQgzET9BCbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by laurent.telenet-ops.be with cmsmtp
	id l0ts2D00M3EEtj2010tsVD; Thu, 05 Dec 2024 13:53:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMd-000LOd-Pq;
	Thu, 05 Dec 2024 13:53:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMe-00EQDL-Gf;
	Thu, 05 Dec 2024 13:53:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: white-hawk-ard-audio: Drop SoC part
Date: Thu,  5 Dec 2024 13:53:48 +0100
Message-Id: <0a72c67991828784066f76b61605d2f7913a353c.1733402907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733402907.git.geert+renesas@glider.be>
References: <cover.1733402907.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The White Hawk with ARD-AUDIO-DA7212 external audio board stack is not
specific to R8A779G0.  Hence rename its DTS file name to drop the
"r8a779g0-" prefix.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile                          | 4 ++--
 ...ard-audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ard-audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} (100%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index df9ea5b2e20818f4..dea812ba55f3132e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -86,8 +86,8 @@ dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f4-s4sk.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-cpu.dtb
-dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
-r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb r8a779g0-white-hawk-ard-audio-da7212.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += white-hawk-ard-audio-da7212.dtbo
+r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb white-hawk-ard-audio-da7212.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
similarity index 100%
rename from arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
rename to arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
-- 
2.34.1


