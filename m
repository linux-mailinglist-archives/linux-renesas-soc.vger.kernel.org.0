Return-Path: <linux-renesas-soc+bounces-16821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68767AB02D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 20:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7E159C6034
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 18:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B746217707;
	Thu,  8 May 2025 18:31:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA5420458A;
	Thu,  8 May 2025 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729084; cv=none; b=GDdNHRsq+eY+sF01Gdm0yz+UvuzldHIfTs/rLYMgcP5mEl61Cl5oaLPZRATivFwK5t/aza/BUUBx1Z2Woqezo3/AgpalEIBq5DibS/GNurLXDi/0kj+vMaxu923EtME72K6pE2zzLaX+WiToyodABT+q3DA6fywIVoczreIXZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729084; c=relaxed/simple;
	bh=Go9O/fYKbGvi4R6niCTYycn1jum1XosacVBLk0bvxV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2dmHrDy+92ghCwkruWRBRedOr/nqfoHI2JjMR82+i3WjyOH/96Il6hBUk0IeNK1ne2YLQs0frng6tHyEX26784eQ2qtYqmERjIOM5Ell5BN24RgNXg2rFu/H0rJIYKzuiCBIYaygJQgB/z/LX4GOUPp3LgJILSFPEPkWW5veag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: x/HSRrEJQyiUBQ467L7L7Q==
X-CSE-MsgGUID: oJnhJ9MCQqGqEiJI1RGx6g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 May 2025 03:31:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.89])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 91E8E405D108;
	Fri,  9 May 2025 03:31:11 +0900 (JST)
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
Subject: [PATCH 0/2] Enable serial NOR flash on RZ/G3E SMARC EVK
Date: Thu,  8 May 2025 19:31:02 +0100
Message-ID: <20250508183109.137721-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to enable serial NOR flash on RZ/G3E SMARC EVK.

We can flash bootloaders in Linux by executing the below commands:
flash_erase /dev/mtd0  0 0
flash_erase /dev/mtd1  0 0
mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
mtd_debug write /dev/mtd1 0 ${FIP_FILE_SIZE} ${FIP_IMAGE}

Biju Das (2):
  arm64: dts: renesas: r9a09g047: Add XSPI node
  arm64: dts: renesas: rzg3e-smarc-som: Enable serial nor flash

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 21 +++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 46 +++++++++++++++++++
 2 files changed, 67 insertions(+)

-- 
2.43.0


