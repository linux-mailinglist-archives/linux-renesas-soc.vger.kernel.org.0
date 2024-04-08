Return-Path: <linux-renesas-soc+bounces-4383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922C89CA59
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 19:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E8A62896CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 17:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAF463CB;
	Mon,  8 Apr 2024 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsogvU7x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338B9142E79
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Apr 2024 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712595940; cv=none; b=pdky5Yn+TftuqlG/j4reDGEkqpChcDNmbsbC7VuBJcZUTK+8OFLXJoSkSAaN+oM8yTxGWmH6ST+21dn+DnNr55zwx7aYLLYzn3fkMmoDU0/mKEmMqGXDG9yVhn7qafNdTXJauCvMoOm32ZOI/DCEAt1FHq+0dPC9qYIgU4kMbnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712595940; c=relaxed/simple;
	bh=sql7RDKm51AFP9ntm9DdUud0kmotL9WNJUNmNTOpp7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMkuVo0KoZZHnfZXtdcY26LHp7gMm5+Zvv6bInuMH46szoblwBwJEQVUPQ47VwtdxolS0l5YXSKhATwdmXLpMC2h3uBLp1walu9wb+/CcQQhvRgL/DEbMvkEOWECV8Rwt+FaFGh3itx9xTcqJzCuUvq0Qd4ff3+ISxxNBhFVPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsogvU7x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712595939; x=1744131939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sql7RDKm51AFP9ntm9DdUud0kmotL9WNJUNmNTOpp7U=;
  b=MsogvU7xzsy9ZBlMx9mTK8bGfJoPKmRIhhwKyopq8zgRMx/tfYRX++Jc
   pVoqMwW0DzwMiBS1fAipSIGjIVc5SC7YP8nGq3na+VYgpTumxjPNBiMGm
   EObPo3a/c8MNvGcHUEAJI0uMvNnd3znzuHOQCJB5N/vJ+BBalrW2gc8j1
   muP2xXZRUx1NsxBIfQupLoNi872MuJmzj1Mo3C0tQYzOPGxaZZvDsW42R
   aDiEZeZQE3ac8JFvPiOcTPEBmQ0TM2pucjJaV3efcbTRBgHeiI8nXfAew
   GXYKoZ6R41H1pIaWt2Oi7i4LqsGy7y89JNaXB5AN3g/hAA2GN8LRiqcME
   w==;
X-CSE-ConnectionGUID: HvOWwUArR6+MC38aDm/W+g==
X-CSE-MsgGUID: ZIBaNdLiR3eYY13KZGh/Uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793494"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793494"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792344"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="827792344"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:34 -0700
Received: by stinkbox (sSMTP sendmail emulation); Mon, 08 Apr 2024 20:05:34 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 20/21] drm/rcar-du: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:25 +0300
Message-ID: <20240408170426.9285-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Allow rcar-du to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/renesas/rcar-du/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index 2dc739db2ba3..df8b08b1e537 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -2,7 +2,7 @@
 config DRM_RCAR_DU
 	tristate "DRM Support for R-Car Display Unit"
 	depends on DRM && OF
-	depends on ARM || ARM64
+	depends on ARM || ARM64 || COMPILE_TEST
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-- 
2.43.2


