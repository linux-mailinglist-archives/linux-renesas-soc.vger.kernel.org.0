Return-Path: <linux-renesas-soc+bounces-25892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78933CCCF5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 18:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5395F3026F1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 17:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109B63559EA;
	Thu, 18 Dec 2025 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="IawBBw8k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6743559D2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071337; cv=pass; b=pqv7ItXZWuG2EH4UE/J7xge0dS52ukPR6AOu4x2T3282SNPb4D1wSpM6PccMXkwxksbzd5dmtaRx3Wb7VjKRonA0U44L+GtR4SOga36Sq5kbt59Ya6e+ifG2cdauHgde0JcNAKGWZ9o2JG4pEyvdTj+WR9EposQ+TgtPHIOdjHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071337; c=relaxed/simple;
	bh=XQ46J/0Q/s1txq+6yOGv2tGq9CYnPBG5axSq5J5swGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJKHnV/hp7nFj3rl4kV/85Pyl81URbarRtqRo2CMzdC9uE3OF8CJaXcu0O+++zUhd1GZ5pcwa32wEvJ0Wb/TDsdx/tIC44bGO/c0ErSms1Z3PCHTH4xRptsyBnWj+FXVLvboqjFCXs2iTigRNQkuYO71SKr56h9c7p6GSLs5HlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=IawBBw8k; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071301;
 b=ND/ROXCW6i5D0LYNTIse6UrVqP2QYhsykiA9xCBaRDUoNGhzOwYMTkYILjcB8h/j8ra/rqZ0
 YqyufzIiaGiK5GAo2jNNdLw/CRjqkh7GE/JCWGMnr3b43eibig3ckW7XxD2pHPlGrJpH/eAv+J7
 bUAu/YiwfmAC0Ap8pmFVRVwt8joPMt53TCt1jt4ZVNmfgoqt4HLVl0ImrALxdXBBv6WGAdDKgcQ
 OQ3xZl6nJwuhJCW6BjonZYfBd0o2GwWhjwNv19yKVZg7FZtWCZF2wiAXQKNyLaBwYsqLQrCeNaU
 Z1F17Lg0j/LGyRvnlocTPt7zJt6wygKpkguNsqNp8fhig==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071301;
 b=rSivnns/CbA4qZ1CITwPgSGZU8DPkfZfti4lxaeC3MQ38fVzK9gg6W2b8bhZ3wNzbdUuGHuI
 +DBkt1IRo7ZcZYaSSx6NH1CF5zBf88xk3pSaLnxb8uedw/Wc+mACrlC2hDQYrgT4qz/CXZR8EgT
 xHwhyBwVG3DEujr6RFN2jZxxmlQxY2sqfqGMKgPNdpYtRJaKA2Cc3np4iMDqT8bOXDo3pEN6ddK
 KYFvxbELqB1cJHs75UE6e3n1IdHjHmtUMWHwsDKZw8nUMQpxF6BOAlpRaAsYzN73MUTRcubDclY
 Gc6EhKb3objNPS51zD8phu/r1dH73IQW0vctROFZXAbmg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 18 Dec 2025 16:21:41 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 16D9ACC0D31;
	Thu, 18 Dec 2025 16:21:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/6] Support TQMa8QM
Date: Thu, 18 Dec 2025 16:20:47 +0100
Message-ID: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4dXDrx4SHSz4F929
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:836eb70413c5acce62e457440dd9da8d
X-cloud-security:scantime:4.420
DKIM-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071301; v=1;
 b=IawBBw8kNStOoPipnqcLDp3qAczELwrgnrkJ87eIVTQmukhlPDuLAWFSJD5fPGGo/qjCekSu
 nbB2ijIfJUM73iAaaOKiro03olgWWOVbvrjoBQ6iAa5vBs/qws3tyEACqautg6FNCBGLv7fXQ6Q
 QCodM+78kzqDQwDa3FQEauAUtDmzxoos775+DxieahJJU2JqAg2iPNZiU/99JyWHVwybFkRkrSV
 M9k3bocxNL/JlsBTzEHVCHBitcCGKMVIfqHzmhAMLKkKQUJymb0jaLGiiFoIbUa7X1Gowf62BJZ
 MZyVdCLPUZDHPjt9Mrz5EK9k2mqIEJ0f6Ol6AG9/UvsjQ==

Hi,

this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
property on the parent clock.

2. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

3. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

4 & 5. Device bindings and platform DT

6. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (6):
  dt-bindings: clk: rs9: add clock-output-names property
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: Add TQ imx8qm based board
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../bindings/clock/renesas,9series.yaml       |  37 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |  11 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 322 +++++++
 7 files changed, 1253 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


