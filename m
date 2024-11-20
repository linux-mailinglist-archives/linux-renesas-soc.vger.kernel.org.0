Return-Path: <linux-renesas-soc+bounces-10642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFE9D3EB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 16:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B93281BF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 15:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9EA1C1F01;
	Wed, 20 Nov 2024 15:04:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D57E1BDA8A;
	Wed, 20 Nov 2024 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115043; cv=none; b=Q8CL5z17oo8I636pgX2t7x9MnXrkg1pXb10XRiCXWyO3y+dXKazkLX868q3ddd+Y4XDuZL23yp04eLXiuONy6iYq47U2siu953y9dF6kNsuNZfisnBMspoajcV1eKZ9fwF2i5nEx4lffuc7QKOB3XiXZTgUMZ1bUTNLmOznmjVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115043; c=relaxed/simple;
	bh=r4SAF2cOTdm2jyFOyWzCgGU+1QEheHgmCpKyv0+ymno=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z0WBetfsj+qG+h5fUesOXrlNqpux0cF83PAEz8Ox6ylyqhIobjJmSOFPxCtSDsN9ttyyAhEfJiKRD77XxsLRhQZ9cnGiJJmXpHwfp3hf/WCtL/X01YCm630mWU3aBkcRBPPYKHuor3QHJdB3UNKpP8MWJi1yb4ff/2GvuyiJN0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: C/0++ZR+QH2Ah413ePAsOw==
X-CSE-MsgGUID: YEsMYqFkQK6G2IUnl9lYNA==
X-IronPort-AV: E=Sophos;i="6.12,170,1728918000"; 
   d="scan'208";a="229423401"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2024 00:03:52 +0900
Received: from lenovo-p330.. (unknown [132.158.152.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A97D4005B44;
	Thu, 21 Nov 2024 00:03:39 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Brandt <chris.brandt@renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm: renesas: rz-du: Increase supported resolutions
Date: Wed, 20 Nov 2024 10:03:28 -0500
Message-Id: <20241120150328.4131525-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The supported resolutions were misrepresented in earlier versions of
hardware manuals.

Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index b99217b4e05d..90c6269ccd29 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -311,11 +311,11 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 	dev->mode_config.helper_private = &rzg2l_du_mode_config_helper;
 
 	/*
-	 * The RZ DU uses the VSP1 for memory access, and is limited
-	 * to frame sizes of 1920x1080.
+	 * The RZ DU was designed to support a frame size of 1920x1200 (landscape)
+	 * or 1200x1920 (portrait).
 	 */
 	dev->mode_config.max_width = 1920;
-	dev->mode_config.max_height = 1080;
+	dev->mode_config.max_height = 1920;
 
 	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
 
-- 
2.34.1


