Return-Path: <linux-renesas-soc+bounces-26929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDED37A4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 18:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7D6C3125979
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 17:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6573939BD;
	Fri, 16 Jan 2026 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A9nNee/q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46E393400
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584807; cv=none; b=UDAHqdsA2BvNqjJFpFNyHgG4v58Xss8sZPxMSLkK1AiDGbjTuuzPSpcdUE+LpATNOruVTvKCsMVnjwHgQspi3WwMqsKUOdHh7e1H4Gh2YMM8XcMroHIoTECS062WDebUWfbRzqGmZO0gggSuoTeIm98S4W8G9Lv4Zaj+y/DlWus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584807; c=relaxed/simple;
	bh=22ZUyODgCQrkw0xGdlQfjJFi8n3l1aokaQjxeqDFD5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXbcKazCOzl1rYQXHSYKrM2f36kn1+QAyf7BVGwjdaLuttQE9rMLE3D8NReHtWERRSnZCvSfIkGcEGsoBcaP+MywXnc9RsM2LYywEC+Sf8pHCpaqODe24AAhDve4ozw+97aDrykNfdQAFI59S9jVQ6fCU0zpdI+j9+ChwP9H8nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A9nNee/q; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B9B2C1F1FC;
	Fri, 16 Jan 2026 17:32:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EF58606F9;
	Fri, 16 Jan 2026 17:33:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32EFE10B686C1;
	Fri, 16 Jan 2026 18:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768584800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JT9tt5+vYn3tFfsnu8u8PU5Tm0hiFHW/bTFd3Um4N54=;
	b=A9nNee/qOpnUVD2WtdF3s+ntVaBnalIdxUrWhBAOVWYK8A9JkH8SGy9jJyEZISOfp/xNBi
	aJAgRnBAeiSypskHt48RCbtHRZ3LuYnwhXw2H0DlzgLIlXy1Vo5tiKNBrn9i1nTn6P5DK+
	X6qPQpTn0cGxo1COQrpOoBPrmektQEQVyKjCYu2ruemb56iS9CNBIaPsfApeBkFR1e9lfx
	3lbdZTh+aD+BE62caxX363CQD7SlnZ682uZP4EW7m/TLzDjXtmRGCcDh+6PlGYkC1x3Kd/
	3g97XosijAtgCfvN4PN0ZOmcOtNP6BcMiWuvr1P6dJQ9S/zeMgSPav0h6zvmLQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 Jan 2026 18:32:38 +0100
Subject: [PATCH 3/6] drm/mcde: dsi: warn in case of multiple subnodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com>
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
In-Reply-To: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

mcde_dsi_bind() has a loop over all subnodes looking for a panel, but does
not exit when a match is found and only stores the last match. However this
will be problematic when introducing refcounting on the struct drm_device
pointer in a following commit, because of_drm_find_and_get_bridge() would
get a reference to multiple bridges.

Assuming there is no real reason for looking for multiple panels, add a
warning so it gets noticed in case the assumption is wrong.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

I think the correct thing to do would be adding a break statement when
there is a match. However I don't have knowledge of this driver and the
hardware, thus this patch is a prudential alternative, not changing the
behaviour.
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index a3423459dd7a..3faebe571fc2 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1103,6 +1103,9 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 
 	/* Look for a panel as a child to this node */
 	for_each_available_child_of_node(dev->of_node, child) {
+		/* There should be only one panel subnode */
+		WARN_ON(panel || bridge);
+
 		panel = of_drm_find_panel(child);
 		if (IS_ERR(panel)) {
 			dev_err(dev, "failed to find panel try bridge (%ld)\n",

-- 
2.52.0


