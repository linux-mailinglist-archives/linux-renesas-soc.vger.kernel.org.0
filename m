Return-Path: <linux-renesas-soc+bounces-7443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F8939F61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 13:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD6A282E08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 11:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EAB14E2CD;
	Tue, 23 Jul 2024 11:07:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AB214D29C;
	Tue, 23 Jul 2024 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721732869; cv=none; b=UN6WVi6X4dCNa6FGm3IttpbrgusHhpJlCbvwuumHzD6sooS2SN2xeF6sHowr7bQZ9zz4Mg3OTySQArjNKs8lGBQaL2YOGRjggrUp3BtQi3uENpdPZ+cfs3L/mz6PCEaq5Zj4SA1QszFDCwx4ti/M2Xk9deFZXHlx7erS+JSQbkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721732869; c=relaxed/simple;
	bh=cm4SY4Lq/Efgg8NENYT1kUR0lOfA4FZ6pr34sHeHYLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gQmxfM+wTAeRZHTJVG7ZOVrSemYQD7L9egfjo3LbXvM8bEMQOfl1sYVvEGyV9k7VFoNkmVZnvPYHBU41D4m23RXWMg0MoQ3PpYx/xcMrVTyCdMbcfC6gSIp3IIOM064aPmv/Gs058lz6PxHbYjDW4CgasV/3y6B8gOA6+/Ayw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="216331924"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jul 2024 20:07:46 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7930342F3F0C;
	Tue, 23 Jul 2024 20:07:42 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V1 resend 0/6] Document r8a774a3 SoC bindings
Date: Tue, 23 Jul 2024 12:07:27 +0100
Message-Id: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series updates the renesas DT bindings documentation for core
components (SoC, SYSC, reset, clk, pinctrl, scif) on the RZ/G2M v3.0 (R8A774A3) SoC.
This SoC is similar to R-CAR M3-W+ (R8A77961) SoC.

v1->v1 resend:
* Fixed commit header for patch #4.

Oliver Rhodes (6):
  dt-bindings: soc: renesas: Document RZ/G2M v3.0 (r8a774a3) SoC
  dt-bindings: power: renesas: Document RZ/G2M v3.0 (r8a774a3) SYSC
    binding
  dt-bindings: clock: renesas: Document RZ/G2M v3.0 (r8a774a3) clock
  dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset
    module
  dt-bindings: serial: renesas: Document RZ/G2M v3.0 (r8a774a3) scif
  dt-bindings: pinctrl: renesas: Document RZ/G2M v3.0 (r8a774a3) PFC
    support

 .../devicetree/bindings/clock/renesas,cpg-mssr.yaml  |  1 +
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml     |  1 +
 .../devicetree/bindings/power/renesas,rcar-sysc.yaml |  1 +
 .../devicetree/bindings/reset/renesas,rst.yaml       |  1 +
 .../devicetree/bindings/serial/renesas,scif.yaml     |  1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml     | 12 ++++++++++++
 6 files changed, 17 insertions(+)

-- 
2.34.1


