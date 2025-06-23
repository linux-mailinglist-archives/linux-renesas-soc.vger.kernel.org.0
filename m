Return-Path: <linux-renesas-soc+bounces-18613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F47AE37E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 10:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE4E1887C5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 08:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135162144B4;
	Mon, 23 Jun 2025 08:09:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4323C3C;
	Mon, 23 Jun 2025 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666193; cv=none; b=diYYVMV9wQuYGQxgnZ3n7JEEUry/SoOFFZDRWq0h8cTKYsezQXJEaoSAvJsHRqf9ZEchBeYPvfnFNGVjY3CEZwErCqdcRCgdh64kELBcfLHKlYh7kxrNf4Z+xqaKcYZlhlGPFft7Wn/JJCJYTdogHMdLoHJfWKwOFRgJEBNkzMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666193; c=relaxed/simple;
	bh=yzDROjhSklpW6F9Q/hVoK6cpVbi+O//aoyDTe91y/ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAEGClBqkaPFabkek2bEK++2RnDDIt5gcuJ4nSG1ZazTbEkSXdyJ58GDtlbwhhiWqlCEbkdoUCRqhKifuLbpOhfOj2SVkIyEho10F3HamvfpzMx01fmj9kHoGZHVREfu6UoUHDk+7UHFUe2MuIZj57WMgo15hUikJ8Wr1Cwhs38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: uzOpVZaOSFWOzqjhLvgzCg==
X-CSE-MsgGUID: syUGVdaAT4SPqE3xaD03EA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jun 2025 17:04:39 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.157])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D2A440103C9;
	Mon, 23 Jun 2025 17:04:34 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	netdev@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v3 0/3] Add support for GBETH IPs found on RZ/G3E SoCs
Date: Mon, 23 Jun 2025 10:04:02 +0200
Message-ID: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com>
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

Here are pach dependencies:

 - Patch 1/3 is based on renesas-drivers tree, on top of renesas-clk-for-v6.17
 branch
 - Patches [2,3]/3  are based on renesas-devel tree, on top of
 renesas-dts-for-v6.17 branch

V1 of this series is located here [1]. It originaly included a patch for
binding documentation, which, in response to Jakub [2], has been resubmited
as a standalone patch for net-next.

V2 can be found here [3].

Changes in v2:
 - Appart from resending the patches and some collected tags, there is no
 changes in V2.
 - Separated binding patch send as standalone patch can be found here [4]

Changes in v3:
 - Fixed consistency with clock names, replacing dashes with underscores
 - Labeled mdio nodes and used phandle-based override instead of node
 redefinition
 - Minor typo fixes

Note for DT maintainers:
Documentation/dt-bindings patch was sent separately and has already been applied here [5]

[1] - https://lore.kernel.org/all/20250604065200.163778-1-john.madieu.xa@bp.renesas.com/
[2] - https://lore.kernel.org/all/20250609083008.0157fe47@kernel.org/
[3] - https://lore.kernel.org/all/20250611061609.15527-1-john.madieu.xa@bp.renesas.com/
[4] - https://lore.kernel.org/all/20250611061204.15393-1-john.madieu.xa@bp.renesas.com/
[5] - https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=31b928210df1097eaa5e8cb51e2ff79989ebe57e

Regards,
John Madieu

John Madieu (3):
  clk: renesas: r9a09g047: Add clock and reset signals for the GBETH IPs
  arm64: dts: renesas: r9a09g047: Add GBETH nodes
  arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH)
    interfaces

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 207 ++++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  98 +++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  64 ++++++
 3 files changed, 369 insertions(+)

-- 
2.25.1


