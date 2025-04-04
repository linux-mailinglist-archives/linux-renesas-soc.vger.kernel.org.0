Return-Path: <linux-renesas-soc+bounces-15400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B66A7BDD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 15:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEECC7A28F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 13:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1818818D656;
	Fri,  4 Apr 2025 13:30:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B691B07AE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Apr 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773459; cv=none; b=YcENw+zNQqA875PjSrchr2DMDZ+U5Nj/XcBlJpLEVG56oI6Xs4Gf/40E3E/wBx6E04101snVVDk76bf1o9gyKo2SMXHSIUTs8nBwk7he9TExvpv6Ewr9A1JW8ENg6O03SXgWYyIz0a08rxaiDEhEdFQFwPFPoZVFjMVGXoxl5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773459; c=relaxed/simple;
	bh=JI6X16WSckvpdx4HymAn/R1fWt3ENuB4/6XBNTufahs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7DULNzj4a02eWL7by2hH73r9X37bZgxYKDlff4hEI9EhZf4v5yZRQImQrxzqesL0OJEPLPLEgEFGq610ScA7ACy6/jtO/oyQD4NqmfdFmbOwpD76E+bcxAPq4fzb/8tZndfpjhnKCwQj01ILdAWOG+rwT4Jid/tj7hk9oRAzsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZtlBYCn1TkGm2BQAwGXDAg==
X-CSE-MsgGUID: VA+xeUKjTWu6Icq7FgYE+g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Apr 2025 22:30:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BDF2642A1899;
	Fri,  4 Apr 2025 22:30:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: Add zpos, alpha and blend properties to RZ/G2L DU
Date: Fri,  4 Apr 2025 14:30:45 +0100
Message-ID: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for zpos, alpha and blend properties to RZ/G2L DU
driver as the IP supports all these properties.

It is tested by the below modetest commands:

modetest -M rzg2l-du -s 44@42:1920x1080@AR24 -d -P \
37@42:512x300+200+200@XR15

modetest -M rzg2l-du -w {32,37}:alpha:{0,65535}
modetest -M rzg2l-du -w {32,37}:zpos:{0,1}

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index 8643ff2eec46..040d4e4aff00 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -340,6 +340,15 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 
 		drm_plane_helper_add(&plane->plane,
 				     &rzg2l_du_vsp_plane_helper_funcs);
+
+		drm_plane_create_alpha_property(&plane->plane);
+		drm_plane_create_zpos_property(&plane->plane, i, 0,
+					       num_planes - 1);
+
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
 	}
 
 	return 0;
-- 
2.43.0


