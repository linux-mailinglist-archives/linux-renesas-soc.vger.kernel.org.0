Return-Path: <linux-renesas-soc+bounces-31008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WInZOkNO1mm8DQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:46:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 635BB3BC5CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22FA3305E9D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 12:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC453793AA;
	Wed,  8 Apr 2026 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ROEfoJDw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49A737D134
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652132; cv=none; b=FSthu3RT0ku/TooqDAjIPhFQSzFOoHOdjOlgblD6b5FGImO8j2ahCeKlQEt9xQDta81yr27ma+YchaRzdQckfCxyQPo1lRZS3HlBYJxqUHHYtEMXkSK2WAa6kWe+uOj79ce39PTpnccBYuEpLq65RmoyUnD0wQTerVFF8iXAJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652132; c=relaxed/simple;
	bh=sfyYf39sm08Vy2f5kjydzUWGnUXTWqP0LYw7KB55p2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+xyVWLFf5ms5uHnpnvN6S8YG7flBncrjnZTVREmr1yQeP48H21ieoM367jHzIVOWHV6AxJceeud5oOMZ2kvZbzLkBQxWQKRWtzQIFUQFl5f8zeRrZ6Ibnx6VHzzeqlH3QMnabXxZzaoJ27NmYYa014r2xJbE5t5rupqv7kkanA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ROEfoJDw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1DF8E236;
	Wed,  8 Apr 2026 14:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775652039;
	bh=sfyYf39sm08Vy2f5kjydzUWGnUXTWqP0LYw7KB55p2k=;
	h=From:To:Cc:Subject:Date:From;
	b=ROEfoJDwBVVhhCl7bFfmOcrtNI/M92yazwzrYSn0tjZjc52P/9wy/NWqtnsG6h65q
	 gbkLXoSRAJSgogx8n0gf50AeSJa3H0Xof+y/7O+y9XOkjNPuOjSxJBvwhqHy/CCs4n
	 r4NQduGP7DlUwRwbAXaIS1P7BvdDqcoEED5n0BLU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: rcar-du: Fix crash when no CMM is available
Date: Wed,  8 Apr 2026 15:42:05 +0300
Message-ID: <20260408124205.1962448-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31008-lists,linux-renesas-soc=lfdr.de,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 635BB3BC5CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
refactored CMM handling, and introduced an incorrect test for CMM
availability. When no CMM is present, the rcrtc->cmm field is NULL,
testing rcrtc->cmm->dev causes a NULL pointer dereference. This slipped
through testing as all tests were run with the CMM present.

Fix this issue by correctly testing for rcrtc->cmm.

Fixes: 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/dri-devel/CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7c36c30a75b6..1a246ebbfc61 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -513,7 +513,7 @@ static void rcar_du_cmm_setup(struct drm_crtc *crtc)
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct rcar_cmm_config cmm_config = {};
 
-	if (!rcrtc->cmm->dev)
+	if (!rcrtc->cmm)
 		return;
 
 	if (drm_lut)
@@ -667,7 +667,7 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_disable(rcrtc);
 
-	if (rcrtc->cmm->dev)
+	if (rcrtc->cmm)
 		rcar_cmm_disable(rcrtc->cmm->dev);
 
 	/*
@@ -726,7 +726,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
-	if (rcrtc->cmm->dev)
+	if (rcrtc->cmm)
 		rcar_cmm_enable(rcrtc->cmm->dev);
 	rcar_du_crtc_get(rcrtc);
 

base-commit: dc2d30e7db8321a6696d266838f7af7e9d1c7155
-- 
Regards,

Laurent Pinchart


