Return-Path: <linux-renesas-soc+bounces-11375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48D9F2FD8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 12:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80BB97A2DA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 11:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C3E204088;
	Mon, 16 Dec 2024 11:53:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE8C203D56
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734350022; cv=none; b=kX/XuAb0ijBoY6K8O5TvizijoA6pgpVYDRLwstvECgWJQo/ftawLgG4+twqEiRLumWErBCKLOzO2rDkebAw5Y5Hnk6otoP8cuggXUL8hBahZPDOwY4eNinrjb/Mlt573GncjePcjwN4wPAJaZAnXr2faGtSb2hmnfwkWMwLfI4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734350022; c=relaxed/simple;
	bh=liYcG+dd1t/Bjrx9FdOseAIxRKJH3zl6yR1/sIN8RRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOX3QvbY87OGF2LzA/+fXasXN9aUxiaFkFnPZf/Bziz16dzTTjfA2HMLJFQaIMGc3l8FtrpMg0QNkaggSGolPEMI191oGSNejG8Fd+tXQ+ByMvpyh2rMsavi9+3z5geCpiOWr72EL2s9c94DPNgSO48htyPI50OjIe+geUP3rDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: i01p6AEMQHqFfQk03KHhXw==
X-CSE-MsgGUID: MxI+/LN9Q329AGq/WotNsg==
X-IronPort-AV: E=Sophos;i="6.12,238,1728918000"; 
   d="scan'208";a="231971748"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2024 20:53:32 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 244334006DFF;
	Mon, 16 Dec 2024 20:53:29 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: renesas: renesas_defconfig: Enable RZ/G3E SoC
Date: Mon, 16 Dec 2024 11:53:25 +0000
Message-ID: <20241216115327.138833-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for the RZ/G3E (R9A09G047) SoC in the renesas_defconfig for
Renesas ARM64 systems.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index b6713b6f4b02..ddde2e566a20 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -402,6 +402,7 @@ CONFIG_ARCH_R9A07G044=y
 CONFIG_ARCH_R9A07G054=y
 CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
+CONFIG_ARCH_R9A09G047=y
 CONFIG_ARCH_R9A09G057=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
-- 
2.43.0


