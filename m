Return-Path: <linux-renesas-soc+bounces-7156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD9929E4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 10:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B401F2102A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 08:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC2738FB0;
	Mon,  8 Jul 2024 08:27:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1253B3FB94
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720427247; cv=none; b=JBdxIs1hwSMFOy7rOm6J+Lv7fha0vhp587TLB5eZGoxnktBr9wNQYZ4sE8e7d8xZkemxTC33q6qdETpAqyQ6ooPmds8rermoUQIRB29hAgspq6NtY23Es3JfMnpg/asB6TkrtkZevQ7ate7jMTLp2Fw1w91dUq4y2UiFAagBeJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720427247; c=relaxed/simple;
	bh=62QawGjI94BHhDc+9DcC95SKlg/q4sDoBs5oMl73DUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPfsGZ1/giZiSZ00JkUvPPlRVsyncZIgab+Ppjk1RDvZmjN92qeI9PF0gUOyMpWF5qP7xAcsRxiC0LrxjLi/fYq53T25Ar3SikE75nrMn57S/wZSzkGMZ3JDjavS1o7biIB/4gNwlJLvUKlZ98UN97+IPR45EHkmUqIsu2S/VbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="214604511"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2024 17:27:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.86])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CE3EE43986DF;
	Mon,  8 Jul 2024 17:27:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance if RPM_ACTIVE is true
Date: Mon,  8 Jul 2024 09:27:09 +0100
Message-ID: <20240708082712.30257-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
case it won't call a put. This will result in PM imbalance as it
treat this as an error and propagate this to caller and the caller
never calls corresponding put(). Fix this issue by checking error
condition only.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 2e2f37b9d0a4..42a5d6876bec 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -208,7 +208,7 @@ static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
+	if (ret < 0)
 		return;
 
 	/* Reset and enable the LCDC. */
-- 
2.43.0


