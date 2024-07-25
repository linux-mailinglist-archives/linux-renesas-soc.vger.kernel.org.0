Return-Path: <linux-renesas-soc+bounces-7503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64593BF67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 11:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FABD1F22C60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 09:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC85713C691;
	Thu, 25 Jul 2024 09:55:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2036AD7;
	Thu, 25 Jul 2024 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901346; cv=none; b=cJf4MRqs+DsSuBKD5DSY8p7XnYYQB5uKHAa06pGVSTDQaFaiG2S6ZCohT5qnzc1oLTUAZd1M2hRLEcEYegmMUTZpBQWqUixk52J2PwiUNfjfrxWv9dcoAoGDGyP2qpb8buyXiJK+z8m0jjf+AvtbklMjHslUEFoxGJAVzOE7SSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901346; c=relaxed/simple;
	bh=Jw/GsAGqcHKj3AtKsadcCA6sc1aGc8bFjrut53gvkjM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XR5cmpIX5X8oLUiBdLhRiQ+uJ6MFsZdL4gVqi30RA603xxuTX9sElccpYsXrHXrTg+sHdg4UdyIU+k10Hc/lmtvUNfp4oLREE6g5vC580XdRjCKiP/U6M/B9MHXEx2WTvd1lSsZyQ8UUNO80obevgtEZ9syBkVmdtYuCE/Qt3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216707474"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 18:55:42 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8B3814004BB8;
	Thu, 25 Jul 2024 18:55:38 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V2 0/6] Document r8a774a3 SoC bindings
Date: Thu, 25 Jul 2024 10:55:24 +0100
Message-Id: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
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

v1 resend->v2:
* Added ack from Rob Herring for patches #1 and #2
* Updated the commit descriptions for patches #2 and #3, as suggested by Conor Dooley
v1->v1 resend:
* Fixed the commit header for patch #4.

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


