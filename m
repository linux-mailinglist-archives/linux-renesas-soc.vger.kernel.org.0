Return-Path: <linux-renesas-soc+bounces-28509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEe3Gu/4oGmboQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 02:52:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C80561B1A5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 02:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19EAC3013975
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 01:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027EA212D7C;
	Fri, 27 Feb 2026 01:52:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010DC1D8E01
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 01:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157163; cv=none; b=GlBPId8ZZYDSoJ/QwNCA4ZkBZLJZQQpt2iJWS/eat156gUHb7l1RNP/l9uYBrKvviZxT/RB9Knb9iYX1/iofNuT2nM1PgN9YHuI0+KkLv1LVGuIC5wVkMYjcycBi921Tq7L8ueA3/fjDLlmzID3UcJH/STycu/ivhHsSrrkakvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157163; c=relaxed/simple;
	bh=DdN2QJqdWhFxAdM6WmLW2aGm9T3bAvPm4X5aSOFwJtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OxnTgrXhmxH9bFJsMbi3YkezE7UDF2RqEzdYJP/ewQok3oNkQmNVHPkY9OPDlZEGvak2ARv+iHhGxnyPPiorsXM7Hhm5NZvg84fTvSX6N3cEAjBL10TAcR/m8dvY0lotDnuUBnN4TPn/chlaccxSru59mYp6y9KS8Dvh8fTwURY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: jdxLis3IQ72lyui7KVGRow==
X-CSE-MsgGUID: Ok4qfgcOTYGWfo8pjidsxQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2026 10:52:34 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 780874121E69;
	Fri, 27 Feb 2026 10:52:31 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Date: Thu, 26 Feb 2026 20:52:16 -0500
Message-ID: <20260227015216.2721504-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,renesas.com,hugovil.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28509-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[chris.brandt@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C80561B1A5C
X-Rspamd-Action: no action

Before the MIPI DSI clock source can be configured, the target divide
ratio needs to be set.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

---
v1->v2:
- Add spaces around '/' in comments
- Add target argument in new API

v2->v3:
- Add missing period in comment (Hugo)
- Changed '1' to 'PLL5_TARGET_DSI' (Hugo)
- Added Reviewed-by and Tested-by (Biju)

v3->v4:
- Fixed up the comments
- Fixed the match for the divider to set (was missing a * 2)

v4->v5:
- Rename patch title (Hugo)
- Add bpp varable for easy reuse (Hugo)

v5->v6:
- Remove clock diagram that was wrong (Chris)

v6->v7:
- Rebase to v7.0-rc1
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f74a0aa85ba8..29f2b7d24fe5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1122,6 +1122,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 				      struct mipi_dsi_device *device)
 {
 	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
+	int bpp;
 	int ret;
 
 	if (device->lanes > dsi->num_data_lanes) {
@@ -1131,7 +1132,8 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 		return -EINVAL;
 	}
 
-	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
+	bpp = mipi_dsi_pixel_format_to_bpp(device->format);
+	switch (bpp) {
 	case 24:
 		break;
 	case 18:
@@ -1162,6 +1164,18 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
+	/*
+	 * Report the required division ratio setting for the MIPI clock dividers.
+	 *
+	 * vclk * bpp = hsclk * 8 * num_lanes
+	 *
+	 * vclk * DSI_AB_divider = hsclk * 16
+	 *
+	 *   which simplifies to...
+	 * DSI_AB_divider = bpp * 2 / num_lanes
+	 */
+	rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes, PLL5_TARGET_DSI);
+
 	return 0;
 }
 
-- 
2.52.0


