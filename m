Return-Path: <linux-renesas-soc+bounces-14699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF60DA6AB42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 17:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77BB58A7468
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 16:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D65221F25;
	Thu, 20 Mar 2025 16:41:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27D9221573;
	Thu, 20 Mar 2025 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742488891; cv=none; b=SNb90MNZ99ZGFRY2uCoA7p/ZpXLHvfDtWO0TZ67+4vc82ZA7BiaEkMLuJRMkfpJNAg05noYjm5jfL8m0eMZmM0QbkaEg5ANoaf7QmPdWC20czQL8zt787ek5PParzMXV5Y8GiTbB3f7fogasDta23YzFWi+87BcMNi5F3Qw7+GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742488891; c=relaxed/simple;
	bh=Y00dHDsS1AEMR6VYop3qoh8OpnRF4NYOZCj5eD0mEeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XvWU3VMonOiu4c5Jl+rwCdEmfwaYWvzdnjaPT5lGXRzv6GQJLC+MWPrO+MrJL3SEE0ydWv1dzZS7onssHy+oTnddHA0GxRV2xkp/ER6DMdtxj/5a4Oi7TJPBvWGtkQxm/FlSTu+1XVDnGn2Kl2WooSQfmUO27/eUbeKLmFKFYZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Q9s0XjUtSgGCv0WOBtNGAQ==
X-CSE-MsgGUID: DC83XCZ7RG2/GwxlDW+k6A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Mar 2025 01:41:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C38B400721F;
	Fri, 21 Mar 2025 01:41:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] Enable CANFD and CAN Transceiver
Date: Thu, 20 Mar 2025 16:41:15 +0000
Message-ID: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E SMARC EVK has 2 CANFD connectors connected to TCAN1046V-Q1
Transceiver that is connected to channel1 and channel4 on the SoC.
Enable CANFD and CAN Transceiver

v1->v2:
 * Make it as separate series
 * Replaced integer with hexadecimal for module clock and reset numbers.
 * Defined the macros SW_LCD_EN and SW_PDM_EN  which routes signals to
   CAN0 and CAN1 based on SYS.5 and BOOT.6 switches.
 * Replaced GPIO hog with CAN Transceiver.

Biju Das (3):
  arm64: dts: renesas: r9a09g047: Add CANFD node
  arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
  arm64: dts: renesas: r9a09g047e57-smarc: Enable CAN Transceiver

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 60 +++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 53 ++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 29 +++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 14 ++++-
 4 files changed, 153 insertions(+), 3 deletions(-)

-- 
2.43.0


