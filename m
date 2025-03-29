Return-Path: <linux-renesas-soc+bounces-15047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCCA7562E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 13:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806C13AC363
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 12:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D651C3308;
	Sat, 29 Mar 2025 12:13:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CB06FBF;
	Sat, 29 Mar 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743250395; cv=none; b=IeKlrov2vhagqUdULg1+XdlgshCcmem64Tuf7SqRMbil8LUPnZaiNIDvk65cgqs3gxYIil3+Xqg8iRpmYOEDPjc3E+Wk8ipnA7ArVpYiBz59zUSXmNsNzyf3QOQMVeY3ogAsMzkbhs4ju/aQBE/wb+lcMvgOWVQYrYFVKJ6X8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743250395; c=relaxed/simple;
	bh=jrK7b4pAGD3WtrjgK9dgREIRbNlUcV7RLSeQuht4Y5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUWik75sTTql0c62ETtJ99/YhyPTo7c8HFnUOeuGlkFll6rHv87tvnunYwsFBhpKhsAfDAyNH0Ozc43QxvYKYZOwP3hholoYorriZXQ3+NqyTSrgYOWP0EJEE0/p70UsYr4PVikbpcHnrAdbZOyN3BEQ/BVxKSNcTR8OvnlaDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: PJoertgIQt+WaFThNYPYGw==
X-CSE-MsgGUID: 9p+mjqpfRyWcSd03qq6CIQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Mar 2025 21:13:05 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.9])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BB22B40061A5;
	Sat, 29 Mar 2025 21:13:01 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: renesas: r9a09g047e57-smarc: Add I2C2 and PMIC support
Date: Sat, 29 Mar 2025 13:12:55 +0100
Message-ID: <20250329121258.172099-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds initial support for the Renesas RAA215300 PMIC
(CONFIG_REGULATOR_RAA215300 kernel symbol) on the RZ/G3E SMARC EVK board.
To enable PMIC communication, the I2C2 pinctrl configuration is added first,
followed by the RAA215300 node.

Patch 1 adds the pin control configuration for I2C2 to enable communication
with the PMIC over the appropriate bus.

Patch 2 introduces the device tree node for the RAA215300 PMIC, connected via
I2C2. This will indirectly enable support for the built-in RTC chip, compatible
with the ISL1208 (CONFIG_RTC_DRV_ISL1208 symbol needs to be enabled for support)

RTC and its alarm (via wakealarm sysfs file) have been tested and validated on
RZ/G3E SMARC EVK board.

This patch series depends upon [1].
Feedback is welcome.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250207113653.21641-13-biju.das.jz@bp.renesas.com/

John Madieu (2):
  arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol
  arm64: dts: renesas: rzg3e-smarc-som: add raa215300 pmic support

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

-- 
2.25.1


