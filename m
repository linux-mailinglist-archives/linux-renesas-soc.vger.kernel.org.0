Return-Path: <linux-renesas-soc+bounces-25793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD75CC2F7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 13:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D782F3030740
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED01F341AB6;
	Tue, 16 Dec 2025 12:35:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8F534A3A7;
	Tue, 16 Dec 2025 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888521; cv=none; b=l1/4FLwAyXsVKuqZKJvGc22VwqSqMTQO9rgl6wugeG1F2FgMSbWDEkdNGRqLA/EYCJaQIROSH7wWnz1qnvNs2X+/62RCMupAmvnm3XSAg5CbKC5n/jRCnLPhaIpvcy6BBei3woX/hLkMK/v6bmx/uKW96UTTpgFvDFS9v+fBREI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888521; c=relaxed/simple;
	bh=FrZl4qilAYFFFriBpB/WfWTbMEyQxC743LnYg3o8X8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYBW4G4hUl+VD/wgoZA7n6KpMCQfjHox76E2xRfyb+crMv6iY8nZyg9NCtLTHpdFrhQCevYzvWxI6XDgQ4rsjTeCXG1rtjGvo0zjBbj7NxaqFw93z8ZAX+dQPiLA/rbM/0nHAOrQHPO8jOIOTHab1bXbqdHgQlmbJk4k/6+beU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: WJyCJBXESdmaJalTgNjWoA==
X-CSE-MsgGUID: 2C/4tuQUQnuNc9+T4JUeiA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2025 21:35:11 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.95])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 33C80418F461;
	Tue, 16 Dec 2025 21:35:09 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH] soc: renesas: enable ICU support on RZ/N2H
Date: Tue, 16 Dec 2025 14:34:21 +0200
Message-ID: <20251216123421.124401-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/N2H (R9A09G087) SoC has the same Interrupt Controller
(ICU) as the Renesas RZ/T2H (R9A09G077) SoC.

Enable support for it by selecting the RENESAS_RZT2H_ICU config.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 198baf890b14..9ec9458b8e30 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -430,6 +430,7 @@ config ARCH_R9A09G077
 config ARCH_R9A09G087
 	bool "ARM64 Platform support for R9A09G087 (RZ/N2H)"
 	default y if ARCH_RENESAS
+	select RENESAS_RZT2H_ICU
 	help
 	  This enables support for the Renesas RZ/N2H SoC variants.
 
-- 
2.52.0


