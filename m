Return-Path: <linux-renesas-soc+bounces-3132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5218861182
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 13:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F58FB2255A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 12:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71E259B5B;
	Fri, 23 Feb 2024 12:31:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213E05C8E3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708691495; cv=none; b=s6vR4ol0UnrP1XELkx3mFKtWdSZg9s4m8lmcXVg5tzn0HJyIe+dvY5omowmtIcqkxL2QF7DmTv7HOlb5J3YNCABKtmZTP3MUTQQqZWBSVCwcxbGFylzzyQp4J0wR4ceNqRpDQikEujU5pJqqVbjjoHsaGp6mTh2bv85ly8ixH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708691495; c=relaxed/simple;
	bh=343/hLeMPqJVopuTM4IR7UCgmhGnU7jgXMiTUDTfkWw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eQ4uSHS34UoBuQy16COUA9wawxZQoM/xyLcN6QotvN6EAAo2UerT+FmaQe32V3MM8/pq7flddjfwDbSuLQE76E0w8mwN8tQDsZQugmrr3d6f6qnxhaso+cT5IEG3SJNKMXeIVtYw8gzdpPKssQ95ryoKLmpCioee8R0tWUnD99U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,179,1705330800"; 
   d="scan'208";a="195035519"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Feb 2024 21:31:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.113])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 806C64218775;
	Fri, 23 Feb 2024 21:31:29 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: renesas_defconfig: Enable PANFROST and Renesas RZ/G2L display unit DRM driver
Date: Fri, 23 Feb 2024 12:31:27 +0000
Message-Id: <20240223123127.221610-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the PANFROST and RZ/G2L display unit DRM driver used in
RZ/{G2L,G2LC,V2L} SMARC EVK development boards.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 610dd46af14e..887cc620f3d9 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -272,6 +272,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
 CONFIG_DRM_RZG2L_MIPI_DSI=y
+CONFIG_DRM_RZG2L_DU=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
@@ -282,6 +283,7 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
+CONFIG_DRM_PANFROST=y
 CONFIG_FB_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
-- 
2.25.1


