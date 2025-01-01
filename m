Return-Path: <linux-renesas-soc+bounces-11759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F949FF498
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 17:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA5093A29E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 16:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E661E32BB;
	Wed,  1 Jan 2025 16:39:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD9F1854;
	Wed,  1 Jan 2025 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735749568; cv=none; b=lPO9OEdDkw2pwOo52A6+aphR6nyqmgwY0NOYs0FTYV6aS9/n7u//2hruh2CoabbKxe84h8SiVssxoDpr9MGShtuBdlgLJS/E6NoVnfSjREZ6l2kuJRt53Skh64SbE0iIAMkMtEppm+bmCwMxxatPdvFpUQnkhrWg2C/kr4/p/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735749568; c=relaxed/simple;
	bh=10lf4L9j2ImlYynPSlLc/iXl8oDcwqivU7ovR+RyJZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S36ceZY2FFVy8e1hrW2pVIqrRva92/KigMzIb301rw4zcbGDWBW1dujCHuB3tz9z0sK03tgTc6ofuGoK22nHAlUUvyq+N2REiwyYRinDxYCpNzksopkLVDsOX7q3ahsamt5NDHSJhhqjIltkE99R88hM1pX5a8N2PFcrL79dCRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 10fr/eY/RZ22E8bbk6x7Cg==
X-CSE-MsgGUID: K7IuNOELT32c4RN3Whqjig==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jan 2025 01:34:14 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 251FD4026C88;
	Thu,  2 Jan 2025 01:34:10 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Subject: [PATCH v2 2/4] soc: renesas: rz-sysc: Fix SoC ID string extraction
Date: Wed,  1 Jan 2025 17:33:42 +0100
Message-ID: <20250101163344.128139-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix string length calculation when extracting the SoC ID from the compatible
string. Add +1 to the size calculation to ensure proper string termination when
copying with strncpy().

This prevents potential string trunctation when processing the device tree
compatible string to identify the SoC.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
New patch introduced in v2, targetting specific fix.

 drivers/soc/renesas/rz-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index d34d295831b8..e472fda3995b 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -231,7 +231,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 
 	soc_id_start = strchr(match->compatible, ',') + 1;
 	soc_id_end = strchr(match->compatible, '-');
-	size = soc_id_end - soc_id_start;
+	size = soc_id_end - soc_id_start + 1;
 	if (size > 32)
 		size = 32;
 	strscpy(soc_id, soc_id_start, size);
-- 
2.25.1


