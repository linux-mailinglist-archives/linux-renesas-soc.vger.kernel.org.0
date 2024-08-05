Return-Path: <linux-renesas-soc+bounces-7725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548D947BAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 15:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9707C1C21B85
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 13:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A631155315;
	Mon,  5 Aug 2024 13:17:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D821C17C;
	Mon,  5 Aug 2024 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722863839; cv=none; b=oGD4DFuoE7rVpO6xKi3HxA8JInsH0XV9UJL2ObLK4/OkeiJz0VPuwuFqv5zM110Lnee026aElafO4csmOH5if4J1GtiCo5gxaPLv3k83iaZnQ3f56rtTeBgL+SBjlziif7Vxkadgwh2OgPBPpseqTepmP0fXsnZJQ4N5M8KP++A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722863839; c=relaxed/simple;
	bh=EXGHxu1+AmC0Qpkp+kCCzxhURJc66hrOSb2WDAemzuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQGex0sktYc0drTAGber3ne0AfdstWIntHSLqHAwPi8HAEn3UhH/RIg8TPlhT/oooE5HRCmREWm5/i33QP9tERL/58ddlpiHlBgpRzx7aXtcvlqvNyMUctWO4b/tr/g27nSQKrV81qBczA6UuVPjBrS6VXMYHrssTFxoDlsdQGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,264,1716217200"; 
   d="scan'208";a="214728764"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2024 22:17:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1D049422F825;
	Mon,  5 Aug 2024 22:17:11 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Add RZ/G2UL {fcpvd, vspd} device nodes
Date: Mon,  5 Aug 2024 14:17:04 +0100
Message-ID: <20240805131709.101679-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to add {VSPD, FCPVD} nodes on RZ/G2UL
SoC dtsi.

This patch series depend upon the bindings [1]

v2->v3:
 * Split patch series based on subsystem from DU patch series [2].
 * Reordered the patch as vspd needs fcpvd handle, so added fcpvd node
   first.
 * Added Rb tag from Laurent.
 
[1] https://lore.kernel.org/all/20240805103549.92369-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  arm64: dts: renesas: r9a07g043u: Add fcpvd node
  arm64: dts: renesas: r9a07g043u: Add vspd node

 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.43.0


