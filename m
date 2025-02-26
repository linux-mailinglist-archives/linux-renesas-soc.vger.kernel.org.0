Return-Path: <linux-renesas-soc+bounces-13698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60644A46051
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC553B03B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 13:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A714121ABDF;
	Wed, 26 Feb 2025 13:10:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D68143166;
	Wed, 26 Feb 2025 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575408; cv=none; b=vFVTwoNrdwjKzR7PPhfgsZKFkfKyocuyxsUe6gZ/y4E5kvoar7tqCzg44B9JSBXgt+wrQ0OEc76KqNa3Bla1colqR5pScmjl5r5QMoucQnGwYqgeE4p40NhBHUcyt0oGeBnol27xaLFjPkM3aQiTtJU4sQgh2fmJwxf+MRcKzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575408; c=relaxed/simple;
	bh=q3m/QyHa58ppfrjGBXQldmWGxTccHWH5M/5MlAAUpdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVfqO0Vo3qRULyFKouYsYHEtCpNuyNJFNE/4265e9oCorDgLJxW6KphN6R4CvYCbIiyzRRZ4dfOtd/IUFVsH1mA9IIYZlsidJheZ4jpowFaqa7HcGAz1JtNpKbU7e1ba9brOoTpozadaO0yEWuk4VqPxMD80+yqKOy6CtAr7yKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: MLkuNRBXS4WLt3gK3/SJVA==
X-CSE-MsgGUID: PCBGCApiSKaTDkfUDzza1A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Feb 2025 22:10:05 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.221])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 947D1406960A;
	Wed, 26 Feb 2025 22:10:02 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/13] soc: renesas: Add RZ/T2H (R9A09G077) config option
Date: Wed, 26 Feb 2025 14:09:23 +0100
Message-ID: <20250226130935.3029927-5-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration option for the RZ/T2H SoC.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 6d2e135eed89..91a815e0a522 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -356,6 +356,11 @@ config ARCH_R9A09G057
 	help
 	  This enables support for the Renesas RZ/V2H(P) SoC variants.
 
+config ARCH_R9A09G077
+	bool "ARM64 Platform support for RZ/T2H"
+	help
+	  This enables support for the Renesas RZ/T2H SoC variants.
+
 endif # ARM64
 
 if RISCV
-- 
2.43.0


