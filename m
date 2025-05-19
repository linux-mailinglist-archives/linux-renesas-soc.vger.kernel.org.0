Return-Path: <linux-renesas-soc+bounces-17227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FBABCA76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 23:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4A9C188676E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 21:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B2E20FAA9;
	Mon, 19 May 2025 21:57:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B464B7261D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691867; cv=none; b=qTm9f0DFfc4veUlQxn+6pzY1AU2lS7/M7OvO2SfwibB9llRenadrLjtxUu/cmFzEYRY0tJMCmbbmM4456VyCX4PFV8K9n0xhrNOquf+ioz5ZZh7+FWiD/WYnUMc1UViI7RyE0Wm0jLGtkh/w+z1t9twz9YoqCOzI+V95Kl1ulpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691867; c=relaxed/simple;
	bh=FK+82izZ9iCyQNaRULe4Xbe72ZvAmBSDCTP+zvSlt3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WAbHo0tCXRd6EIpgfYswktPWlRwgmTfy/DGhe6q06zPlMdBVkpxOJ0MHsV8J+KzPSbsXnJSxfSNH42YT2ZcEQXMAbXv2hNBd2ZhdPHqls2+UC8Avafpdh91VZ3mDM64bkvms04MCsz2r+cwB4BPfS9amT11Gzy/oIo/HkFs55lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: r66phRFlRee7T/IhTZXsfg==
X-CSE-MsgGUID: W+01vLmdT4mM8BGjB9Kvvw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 May 2025 06:57:43 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.3])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 090AC40B3E4E;
	Tue, 20 May 2025 06:57:40 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: [PATCH 0/3] Add support for RZ/T2H pinctrl
Date: Mon, 19 May 2025 23:57:30 +0200
Message-ID: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for RZ/T2H pinctrl and gpio

The basic GPIO tests have been done on the RZ/T2H Evaluation Board.
More pinctrl tests will come with a further patchset that enables
peripherals using pinctrl modes.

- GPIO writes:
(User led Green 1)
gpioset P23_1=1

(User led Green 2)
gpioset P32_2=1

(User led Yellow)
gpioset P6_7=1

For GPIO reads, used the CN49 connector;
Connect pin10 to pin11 (ground)

gpioget P9_1
"P9_1"=inactive

Connect pin10 to pin12 (3v3)

gpioget P9_1
"P9_1"=inactive

This patchset applies on top of patchset [1]

[1]: https://lore.kernel.org/linux-renesas-soc/20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com/T/#t

Thierry Bultel (3):
  dt-bindings: pinctrl: add compatible for Renesas RZ/T2H
  Add the pinctrl and gpio driver for RZ/T2H
  arm64: dts: renesas: Add pinctrl for renesas RZ/T2H SoC

 .../bindings/pinctrl/renesas,pfc.yaml         |  59 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |   9 +
 drivers/pinctrl/renesas/Kconfig               |  13 +
 drivers/pinctrl/renesas/Makefile              |   1 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 783 ++++++++++++++++++
 include/dt-bindings/pinctrl/rzt2h-pinctrl.h   |  23 +
 6 files changed, 871 insertions(+), 17 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzt2h.c
 create mode 100644 include/dt-bindings/pinctrl/rzt2h-pinctrl.h

-- 
2.43.0


