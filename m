Return-Path: <linux-renesas-soc+bounces-3101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C584A85F9BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D745B27456
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 13:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF25613341F;
	Thu, 22 Feb 2024 13:26:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2511F133296;
	Thu, 22 Feb 2024 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608396; cv=none; b=upUjkL5qkxUH9+qqTuiPoGk2wnMEsxMUrK7vGOJVzpUwyT4ce4FxNoV092Rk0rIyTzU5c8Va8jt4FGag7gaMM0AsakmbLbBXAWm+IHtXA3/AWZ0/kUZt/O6qdU0mDIXTGctr0F/QOPALVxyQ+s0kvwc+1l9W79ISfda1rF6t8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608396; c=relaxed/simple;
	bh=aYQOvbBklwF1NlVui1FsMvVoBqeHHv7/99VBU+yaVT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jKaBj2CqrYn7lHqpD1Lg17sp2eRPmmbWJwh3k8Nc9iEgXgoaSoKYG1NICCyZghDuqznpxGrUQiXIT5Sory3hZh4bPWmLrV5ignMAjhONP3K+g5Xv3ayu6EYVtKSs0tgWhw0e04zRVWc8KhUsuomDKxsFJebuR1gqZORDqMpuZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; 
   d="scan'208";a="194923151"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Feb 2024 22:21:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.13])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C204D40062BB;
	Thu, 22 Feb 2024 22:21:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v9 0/3] Enable RZ/{G2L,G2LC} and RZ/V2L DU
Date: Thu, 22 Feb 2024 13:21:14 +0000
Message-Id: <20240222132117.137729-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DU on RZ/{G2L,G2LC} and RZ/V2L SMARC EVK.

This patch series tested with drm-misc.

v8->v9:
 * Added ports properties to DU nodes.
 * Dropped Rb tag from Geert for patch#1 and #2.
 * Moved DSI port properties from board dtsi to SoC dtsi
 * Linked DU with DSI in SoC dtsi
 * Enabled DU on the board dtsi. 
v7->v8:
 * Added Rb tags from Geert for patch#1 and patch#2
 * Added RZ/G2L fallback for RZ/V2L DU node.
v7:
 * Added dtsi patches for DU.

Biju Das (3):
  arm64: dts: renesas: r9a07g044: Add DU node
  arm64: dts: renesas: r9a07g054: Add DU node
  arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 46 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    | 47 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 14 ++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 14 ++----
 4 files changed, 101 insertions(+), 20 deletions(-)

-- 
2.25.1


