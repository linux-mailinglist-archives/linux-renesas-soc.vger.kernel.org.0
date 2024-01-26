Return-Path: <linux-renesas-soc+bounces-1863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1283D896
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90C6F1F28CB7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 10:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3777E14299;
	Fri, 26 Jan 2024 10:56:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A212B6C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266613; cv=none; b=oYyKWC/vrC7VhdPvPkieqZoe3HNFVoDEYzLLWXdEbrfyJmac396A1qKpGkRaHwm1twZ7gWZ5oMVSjDLscCN5+WtZkcZTFAX61LfnvWrQEnzfaHkdtUXTOuORUrSIBWZxwbw6MHcQK4qg4CqPngHmxO3r0F44L4EA02fEQTZV7Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266613; c=relaxed/simple;
	bh=a3QQL3Z3nHnO8CCDTNdCchtT3i6TZHgg5DXDMsN3sDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FWMQJw2PO0DcZdRwfwyrNbws7zRYTaTbgQGGZgR022Eqp1m3UWUfHyg1m8PG58bj5xe0xrfoAbcWxp0q4lVD72RTiIyg1oUh4PffqMHRZY+ZIpFewGwpMbQB+homQU6YlAL3wF6VHAgxcUsJF+K+n/SvJuOan5RLtsoN9mRDNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by xavier.telenet-ops.be with bizsmtp
	id fNwm2B0031AdMdB01NwmSY; Fri, 26 Jan 2024 11:56:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsJ-00GWgE-Ov;
	Fri, 26 Jan 2024 11:56:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsh-00G5cy-6W;
	Fri, 26 Jan 2024 11:56:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/[LOCAL] arm64: renesas: defconfig: Enable R-Car V4M (R8A779H0) SoC support
Date: Fri, 26 Jan 2024 11:56:16 +0100
Message-Id: <378be6f9fb7a0e259eae7855697c6a0675411ce7.1706266517.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 133a2d164c697a14..1cc2b88a85d0f286 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -382,6 +382,7 @@ CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A779A0=y
 CONFIG_ARCH_R8A779G0=y
+CONFIG_ARCH_R8A779H0=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A774E1=y
 CONFIG_ARCH_R8A774A1=y
-- 
2.34.1


