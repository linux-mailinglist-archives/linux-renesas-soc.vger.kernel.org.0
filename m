Return-Path: <linux-renesas-soc+bounces-24666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC3C5F0F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 20:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D93B83AE9DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 19:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDE1326952;
	Fri, 14 Nov 2025 19:37:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5565233C530;
	Fri, 14 Nov 2025 19:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763149073; cv=none; b=aOPwxDgqs9jnaiJpMZa/35SzHRyU0Q09c0vPvnsp/W9QUC43bAqBAuPhVBXdB6TQEHOcU4PRSRDRanuRtcPV7ejRfPLl7UGZk4iwHJoWQ15wEoJQFL/y4FOFhDoS4EDx7iI8EF6P1kEAPrpE7rUnPSHDNq6jUWKi2sd7YgTetvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763149073; c=relaxed/simple;
	bh=dc5fwMBJGgKBTc7pctHFmjD0Kyl9oc/SqtVN+TA6T30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fCMqUgVTc+etNsA8Ihs6mKrKFf9dDApQngWEftp6kLahDc2ZgCJcrUQCqzFVaF/DLa2KOlSdSeK1RnuD6iYyBsxGM7QmowaXc+CayCWoApm0rQDogZAbt20DTd3CtQCYdGktrUpqYVsgLaLgHcYMqxrRgd8nH4OrtdaCHbu7mPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: rRmcO2jKQm6PWemZQkj+ag==
X-CSE-MsgGUID: p9FD7DplSUOVM8o1Gfx0AA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Nov 2025 04:37:43 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AC1AE4021B5A;
	Sat, 15 Nov 2025 04:37:34 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Brandt <chris.brandt@renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: renesas: rzg2l: Fix intin variable size
Date: Fri, 14 Nov 2025 14:37:11 -0500
Message-ID: <20251114193711.3277912-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

INTIN is a 12-bit register value, so u8 is too small.

Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
Cc: stable@vger.kernel.org
Reported-by: Hugo Villeneuve <hugo@hugovil.com>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 07909e80bae2..4c3f6ce71f2f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -122,8 +122,8 @@ struct div_hw_data {
 
 struct rzg2l_pll5_param {
 	u32 pl5_fracin;
+	u16 pl5_intin;
 	u8 pl5_refdiv;
-	u8 pl5_intin;
 	u8 pl5_postdiv1;
 	u8 pl5_postdiv2;
 	u8 pl5_spread;
-- 
2.50.1


