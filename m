Return-Path: <linux-renesas-soc+bounces-10965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343849E5947
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 16:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE482164F3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 15:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1441C218840;
	Thu,  5 Dec 2024 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kW+aEkOt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E61773A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733411000; cv=none; b=Wa8wcew9ezwYn6cNe+/y9/ZEjp31i6G1ySm2JZfgLphb8TVpURtdsV8vdd4o+BcfLcLNbkxtffVLUor5tiOguZ4QvHnCqMrh0zqdzh1KcjxN7YJr8ZdQOBlwf4cEwI7GiSQYo3YPYAcD/S/VksVH0zfKGlD2w0i8A6FyUmxCS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733411000; c=relaxed/simple;
	bh=xdm2W9G4tud+fGwnz4XctuLIlKhDZgs4DypnCRwNcTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n1sFzp0MNGKWPKzSWNknSijFoxenUeaQg5lWVrzWlyfZ5SwdJ4ZA/O/h4+J2xCuJvKEZXNxlXIrXNncVrAoyl+ENBojjrBvBfn1A+Iv3vlRM/2zCjSc5OG4B4B5zVm4Vdek50OZBM6vqE7KOBnnUDdOBkI18As3gYYI1ZNujXHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kW+aEkOt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733410998; x=1764946998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xdm2W9G4tud+fGwnz4XctuLIlKhDZgs4DypnCRwNcTg=;
  b=kW+aEkOtWl+xlAWXXb1rDU2ViLqVQ9vRRFDxH6Kp8PB6Cv3CS7pyBCU3
   K4sZnNtWYDhY3wVDujFfxkooNguecaKtoC2wX6gGNQCI3UPvhjnX1PcaR
   TE5+86XIf4xY+a3wGSARAYsqj+I6KgeH4ukG7LEZTZ2KQ8Y/7HjuYabwX
   8YxuHstXie+rE7+vXDE6xzneQooihp+5FWjFugNxahwChePVOxG0qS3iY
   BqYcSpOVWTpxOdI+mozz1CJv3K5rxW4D+hvgD5aFYBKaSuXC7VMAIfsbc
   6Wth853l36Jtu5EV9sR3Lc2oIvJgGKoAa5Pbfdw6s/zYmI0CEp5AlKyeR
   Q==;
X-CSE-ConnectionGUID: I3/HTA19TeCIGiytjFPd4Q==
X-CSE-MsgGUID: cP0iU2lRRGSWZMXM24Xfmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51142042"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="51142042"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 07:03:18 -0800
X-CSE-ConnectionGUID: R3T1NA7uQtyxhlI2jqefzg==
X-CSE-MsgGUID: VKyJbwVCSi2deNFrfogdIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="93983037"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 07:03:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 2/3] drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
Date: Thu,  5 Dec 2024 17:03:00 +0200
Message-Id: <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733410889.git.jani.nikula@intel.com>
References: <cover.1733410889.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Building with clang and and W=1 leads to warning about unused
rcar_cmm_read(). Fix by annotating it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
index 26a2f5ad8ee5..ea52b0af9226 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
@@ -32,7 +32,7 @@ struct rcar_cmm {
 	} lut;
 };
 
-static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
+static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
 {
 	return ioread32(rcmm->base + reg);
 }
-- 
2.39.5


