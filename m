Return-Path: <linux-renesas-soc+bounces-11039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9199E7AFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 22:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EDC8188A206
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 21:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E70212F87;
	Fri,  6 Dec 2024 21:26:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35C7203710;
	Fri,  6 Dec 2024 21:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520385; cv=none; b=eMljkGODU6Q3hy91pVeRB1GYG5xHHy4KWS4Ib1CCJm5vlRE2yrm953O5lIDhQRfg+89WE5hn+SWeTA/4woo0ie1OuTpZeGOyGCJcA8OfN0Obth22ouPyBzV3GkMwl1SICi1BHSDDO7NtDlPxX6QRq5qGxLnCE/DLiIekJ6KP4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520385; c=relaxed/simple;
	bh=vwbnjMHw+xksP7WhWpRJH247ClEYq7SZVgWhjva7jcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/YzzFLcAo55C+/r16+vhkSO+o8Y1TFayF7JdzL9vRPg+Y+mTwiXatixwH2grYVUiVRCC4ZfDFy42VLM5jtVEqnrwbYtL0YEzL5GkvdQ7jzcYirbiydk6CcZ04EotPZq9FiTqx5vAn6F609iMzbMn1fhOe8OHdkCMHZsgSTj/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: qvJaJ8G5QbuRH5Hks30Mjg==
X-CSE-MsgGUID: 4kjj9xcgQJGPrvXnjdLzfQ==
X-IronPort-AV: E=Sophos;i="6.12,214,1728918000"; 
   d="scan'208";a="227147358"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2024 06:26:14 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.246])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 66C6A4090598;
	Sat,  7 Dec 2024 06:26:04 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 0/5] soc: renesas: Add system controller support for RZ/G3E SoC
Date: Fri,  6 Dec 2024 22:25:54 +0100
Message-ID: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the RZ/G3E system controller and extends
the existing RZ/V2H(P) system controller to support syscon. The RZ/G3E
system controller allows detecting various SoC features like core count,
NPU availability, and CA55 PLL configuration.

Key features:
- Syscon support for both RZ/V2H and RZ/G3E system controllers
- Detection of quad/dual core configuration
- Detection of Ethos-U55 NPU presence
- Validation of CA55 PLL frequency setting
- SoC-specific extended identification through callbacks

This patch series depends upon [1] and [2].

Tested:
- Example of SoC detection:
[    0.065608] renesas-rz-sysc 10430000.system-controller: Detected Renesas Quad Core RZ/G3E r9a09g047 Rev 0  with Ethos-U55
- Example of PLL misconfiguration warning:
 [    0.065616] renesas-rz-sysc 10430000.system-controller: CA55 PLL is not set to 1.7GHz

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914097
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=912697

John Madieu (5):
  dt-bindings: arm: renesas: Add syscon compatibility to RZ/V2H(P) SYS
    Controller
  dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
  soc: renesas: rz-sysc: Add support for RZ/G3E family
  arm64: dts: renesas: r9a09g047: add sys node
  arm64: dts: renesas: r9a09g057: Add syscon compatibility to sys node

 .../soc/renesas/renesas,r9a09g057-sys.yaml    |  8 ++-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  7 ++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  2 +-
 drivers/soc/renesas/Kconfig                   |  6 ++
 drivers/soc/renesas/Makefile                  |  1 +
 drivers/soc/renesas/r9a09g047-sysc.c          | 70 +++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c                 | 44 ++++++++----
 drivers/soc/renesas/rz-sysc.h                 |  7 ++
 8 files changed, 128 insertions(+), 17 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a09g047-sysc.c

-- 
2.25.1


