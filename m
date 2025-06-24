Return-Path: <linux-renesas-soc+bounces-18679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B01AE6F7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 21:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCEA23B3BB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659D22EB5D1;
	Tue, 24 Jun 2025 19:23:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEE82E7F24;
	Tue, 24 Jun 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793022; cv=none; b=iKR03Mz8cjGwEneNn+pXGpzh9GDhd/QrwGXgImBdwULgqFv7CweVEeotbVWbEH/VARwFeyiNC+Y8xISMXptKjMg1ZngOVSWyD4TKzjrob5rqAmP3uKbkWc0+sknNeMVppilHHxn+QoiZ+UAU0y7kf101+1H1DfKOgLmRYtLNKAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793022; c=relaxed/simple;
	bh=IKhD+2zcGZ8T+VFrizuqUTFHrNLFzs3llxmTX8GFrG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PETMztjSSxbwbEq6IxtGL3Jw0x2iSQxbZtr9bwTz6/zXg6GMQLy4eLKLjKUjvDlax0x2EVypW+BPHHJkwpGdaa13q7fyVNByiW8HAMmHUOSxdLHmbx7Ylt5hK8mROlUxlugaxQ8f8262GrAvGbULg6DqYyP74PZ0jeyLBM8kQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: LW/XlAJSQnakXr3F3ssVrQ==
X-CSE-MsgGUID: wEQHibMjQ7OmZf70HSz0Lw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2025 04:23:32 +0900
Received: from mulinux.example.org (unknown [10.26.240.23])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A76F9400F738;
	Wed, 25 Jun 2025 04:23:29 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] MAINTAINERS: Add entries for the RZ/V2H(P) RSPI
Date: Tue, 24 Jun 2025 20:23:02 +0100
Message-Id: <20250624192304.338979-5-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MAINTAINERS entries for the Renesas RZ/V2H(P) RSPI
driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d9b940ee8ee..f467e6900c09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21219,6 +21219,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
+RENESAS RZ/V2H(P) RSPI DRIVER
+M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
+L:	linux-spi@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+F:	drivers/spi/spi-rzv2h-rspi.c
+
 RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
-- 
2.34.1


