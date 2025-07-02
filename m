Return-Path: <linux-renesas-soc+bounces-19000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C7AF0788
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 02:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4321BC7BF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 00:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B2245948;
	Wed,  2 Jul 2025 00:57:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9596A1CD0C;
	Wed,  2 Jul 2025 00:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417839; cv=none; b=dQpPTl+DYbwjyUmmt33tAiDNaF6YW9ZfwzqyAPZAh8NyedHBQUh2CuN1ASBi2QFcYH962gXpwmIDLy8GsvXzF9/FXSGGzcOgt2YLt+yENVoX4WHErUdcQQldwsSiRHMnlqUVBD6dX5F+Qx561pwDpYQqIXbLs6GpCl1RFzM9f5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417839; c=relaxed/simple;
	bh=TcUWqObj9A2aDg0Iet8eLoGrQoTTe4lzZr/+guMfsng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXuWg4puZVMPBybabXPlRQu40OTGgr192h34wHAGXSAPDqfuk6NOUZPqpw1/IHDHsY/HVeMXaYN9nHBJnZL12P/6Cx2j/gI8n8Aw+T5W2TF1MTk63GqYQ11oFbgFdL4BUNdZ0aOTP0akMge5loUkymih99u+CPGfXRoxvAR6Kd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: uvhiCRcwQK60zp4VXXpTtA==
X-CSE-MsgGUID: O1EJtcI7TJuedVH7xS+dgg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2025 09:57:15 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.9])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 95BF640E7741;
	Wed,  2 Jul 2025 09:57:09 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	netdev@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 0/4] Add support for GBETH IPs found on RZ/G3E SoCs
Date: Wed,  2 Jul 2025 02:57:02 +0200
Message-ID: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds support for the two Gigabit Ethernet (GBETH) interfaces on the
Renesas RZ/G3E (R9A09G047) SoCs and their enablement on the SMARC-II EVK. This
is achieved by integrating the necessary clock/reset signals prior to defining
common DTS nodes, and enabling both GBETH ports at the board level.

Some of the patches from the initial series have already been queued. As the
node enablement required OEN support, this fourth series includes two patches
that add support for OEN on RZ/G3E SoCs.

Changes in v2:
 - Appart from resending the patches and some collected tags, there is no
 changes in V2.
 - Separated binding patch sent as standalone patch can be found here [4]

Changes in v3:
 - Fixed consistency with clock names, replacing dashes with underscores
 - Labeled mdio nodes and used phandle-based override instead of node
 redefinition
 - Minor typo fixes

Changes in v4:
 - Added two patches to add OEN support on G3E for a better description of the hardware
 - Enforced consistency in clock patch to match v2h definitions

OEN pin configuration check logs:

```
root@smarc-rzg3e:/sys/kernel/debug/pinctrl/10410000.pinctrl-pinctrl-rzg2l# cat pinconf-pins | grep PB1  
pin 89 (PB1): input bias disabled, output drive push pull, output enabled, slew rate (0x0), output-impedance (1 x)
root@smarc-rzg3e:/sys/kernel/debug/pinctrl/10410000.pinctrl-pinctrl-rzg2l# cat pinconf-pins | grep PE1
pin 113 (PE1): input bias disabled, output drive push pull, output enabled, slew rate (0x0), output-impedance (1 x)
root@smarc-rzg3e:/sys/kernel/debug/pinctrl/10410000.pinctrl-pinctrl-rzg2l#
```

[1] - https://lore.kernel.org/all/20250604065200.163778-1-john.madieu.xa@bp.renesas.com/
[2] - https://lore.kernel.org/all/20250609083008.0157fe47@kernel.org/
[3] - https://lore.kernel.org/all/20250611061609.15527-1-john.madieu.xa@bp.renesas.com/
[4] - https://lore.kernel.org/all/20250611061204.15393-1-john.madieu.xa@bp.renesas.com/

Regards,
John Madieu

John Madieu (2):
  clk: renesas: r9a09g047: Add clock and reset signals for the GBETH IPs
  arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH)
    interfaces

Lad Prabhakar (2):
  pinctrl: renesas: rzg2l: Pass OEN pin names
  pinctrl: renesas: rzg2l: Add PFC_OEN support for RZ/G3E SoC

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 111 ++++++++++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  64 ++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  63 ++++++++--
 3 files changed, 229 insertions(+), 9 deletions(-)

-- 
2.25.1


