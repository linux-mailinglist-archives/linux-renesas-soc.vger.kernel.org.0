Return-Path: <linux-renesas-soc+bounces-8893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A4973101
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 12:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7629AB26815
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A789918FC93;
	Tue, 10 Sep 2024 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkYmATCj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715717C22F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Sep 2024 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962646; cv=none; b=h3f7c3q8ZvbqN5YF4+eqEph9YONHWMyoHyIW05SylbHcKQZ5ymu7DgkiACgkyBUTnr159o7o4O6JpcZmTN9Sn0yvfefoq61FDIWSKjl9ofgZt6DKz1kgmAMrUimXY9E4vD2Yl8mDCOlA/iaY+kolxMaEJK81ddVAB3XM25fTl10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962646; c=relaxed/simple;
	bh=oTR3LhQAm71bWSBbJbvIqax15inVYeWQ5yzlcOhx1/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OemiqU5OxCXLuyZbvOoSA4y20by0tzV+tI9TkJYZBB4IUhS9n4FWNTmnYxwy8NvTK2p/pnZ3yvbFzYjVi/2eIsbUtpT7+mR4EbjjQ3Q8e9C44efJyje4JmhxAHXqwSVouvKZuyfAxERPNtVGOc2GGh6t+xp5CcU7Bidyof0bwMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkYmATCj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725962644; x=1757498644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTR3LhQAm71bWSBbJbvIqax15inVYeWQ5yzlcOhx1/8=;
  b=hkYmATCjqtfqq74JE7DC8Xf/QHgncIyk0P/I95DMxCxLNOe2M1a8dkj8
   Cm4l//kTg+BxF4OcChxZ7Gr/pBWfpYhv6W+NBExgV/0j7PzTP2CuFVNOB
   18xAwWkEOeklZbfOvkMRQ1Ni60wm9+xpNzZh5NFs3s48+H9i3KngjK8rQ
   WOhafnWCzPDRacK/Sdht8gmw7uGx+VbSIEsiF7iWFRh3iBMjTah0biwqH
   ztfdkIPylx27quWsUioRriw1L98q/0CTYHo3iO67PouWMcIXtFZI9p3QH
   JenM3buSe248I6c01dslb455PUv+4vPKFabGJj63UimxlCZbEn07qlRyQ
   A==;
X-CSE-ConnectionGUID: YCNm8S78QwKrK79UzNg0Xw==
X-CSE-MsgGUID: DYLrhk4AQuK5XMaUaI51aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28479088"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="28479088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:04:04 -0700
X-CSE-ConnectionGUID: KrKZuPBVRESjOgwZAe/rBA==
X-CSE-MsgGUID: qgzSZrwVSdG4YVQLH0rwng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71382002"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.43])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:04:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	jani.nikula@intel.com,
	Nathan Chancellor <nathan@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
Date: Tue, 10 Sep 2024 13:03:38 +0300
Message-Id: <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
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
2.39.2


