Return-Path: <linux-renesas-soc+bounces-13088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D5A32E8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 19:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C11897A1053
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 18:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C37260A42;
	Wed, 12 Feb 2025 18:20:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3405D25E47A;
	Wed, 12 Feb 2025 18:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384448; cv=none; b=MKA3FZDFJpubImj0bAnaM9v8877/I/JF3RJyxJbewPeTRCzczP/F8rx3VX+8DB1j9jNQn3+1bRTZAe6PXscr9+L57wkWMqw14KtooAIyX+JzHdoBiLMkUfsvFYESdGrXRk4dFCQWgBbLaTPS2e/UUy+oIRRXOSVT4t46mrNczy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384448; c=relaxed/simple;
	bh=Bg8qyr/Ngr0/Q8CwMD22iZ5uwd/eL8hK9Xg2pMelyDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GyOYu66kK0Y70B0c4F+nNFCjj/hgg1xynKwq1iSH4ZUdsk8I3V0yypGKbzn0HmAFz0A4gn7oYB034sdlwVshXFoXJs8Y6KrCQhxYAIcoUShaMekFE8/VF1Q9oQ+oTkUeYUOGoG1OOehIzYDhhIfCEEk9t9YJAvFP79zMt+Y7nfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: ZpAlej24QzqFRoZAngVN7Q==
X-CSE-MsgGUID: TZcLhU/nRP609n5QSbJ9Jg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Feb 2025 03:20:42 +0900
Received: from mulinux.example.org (unknown [10.226.93.8])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC8AE4019C63;
	Thu, 13 Feb 2025 03:20:39 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/6] Improvements for the RZ/G2L IRQC driver
Date: Wed, 12 Feb 2025 18:20:28 +0000
Message-Id: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear All,

Just a few patches to improve rzg2l_irqc_common_init() from the Renesas
RZ/G2L IRQC driver.

Cheers,
Fab

Fabrizio Castro (6):
  irqchip/renesas-rzg2l: Use local dev pointer in
    rzg2l_irqc_common_init()
  irqchip/renesas-rzg2l: Use
    devm_reset_control_get_exclusive_deasserted()
  irqchip/renesas-rzg2l: Use devm_pm_runtime_enable()
  irqchip/renesas-rzg2l: Remove pm_put label
  irqchip/renesas-rzg2l: Switch to using dev_err_probe()
  irqchip/renesas-rzg2l: Simplify checks in rzg2l_irqc_common_init()

 drivers/irqchip/irq-renesas-rzg2l.c | 50 ++++++++++-------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

-- 
2.34.1


