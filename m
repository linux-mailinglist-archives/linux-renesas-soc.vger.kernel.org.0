Return-Path: <linux-renesas-soc+bounces-33363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGd6GFTvGmqF9wgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B797E60D4B4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C10303E4EE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 14:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13EC2652B0;
	Sat, 30 May 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYEdlvcP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E022C11CB
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149755; cv=none; b=AdY5xO32tE2/zJcC7UKhVNuxyFy1EGzFnVUUpdwOqbsdEMZJey+YmJIPSFv7bMAL9b2YIefLIbLHlEL+BBcTP99LjNfL2ip/DEHkilpulv9teFQxVQr9M4JRbeteFVksI+Pue0l0O370sbP3BIOMdT8Sl34H9rBlJ2YABqdTlaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149755; c=relaxed/simple;
	bh=YWxGgR3lMNyHxWzU2V/s1BnCMgdON7Fb65+tP9DASBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLTNd4vWBqZYZOEv/6J/wrpdXiRBNvD3F0X+9ju2Efm+RbxZjd4esJdOq8lf/lEG/pthaI3HB3wqEemOFIXDH2vSHbdiYrTu9nd/1l0gs2WXpoOG/K3oZIVOz7P2HZ6VX3IxWaTXeekGhRt5Mk7jiQzvwxNV1nJwYmc7SdrN5vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYEdlvcP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2624C1F008A0;
	Sat, 30 May 2026 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149753;
	bh=rIcYAqyZnzeCpwcv/SdJdhMKgVQqE4Y5D67Vid8jK6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DYEdlvcPWU8+IlQW/Elor8jKC321bkGTNrvmnktVfdXrBC3eyWYcw1bYBg5BofVej
	 LsuRaSjGmRQjwtRa2XTzD4Rhcvy2IgHL8fczBmMyOT61lSRDqV1do42UHigG5C7Wby
	 kv9DyDYtGSzaAPb9Ww+DVDj9Tm4pyI5TOEByJUGA0Gq37QHEvu1ayTlJvmFWw75gtF
	 9Uv+54yLoOBYeGMto/Jrk/VvAuiVsv4fvSTLAVFgbXScElbV9Xt73KjhqUieuLM/CC
	 +vKqB+9rSaMnpB849+lNAElUYf6D99fJxoINpNfUSBKy0KNg7oLOOAp2JZo8m9lst9
	 qT9pMb38wDN4g==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 16:00:04 +0200
Subject: [PATCH 59/76] drm/renesas: rcar-du: lvds: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-59-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YWxGgR3lMNyHxWzU2V/s1BnCMgdON7Fb65+tP9DASBY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb/19eGe+L3rdJPjl/vWo7vkHzC7KRSrVKkl2vrZZK
 5oqco21YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkxDbGhiXm/e09T9yOrd/y
 /WVitdcTiaUHa0u+dF34xKT3NYptN9vEmjU53OWnPgYXapz9v/GjBGNDw9zFHq09+jMTZik/m/O
 j351d+PdK5vZVkbv9bYQKpBavKnEp9Mnb46MRtuzr31DrjF4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33363-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,ideasonboard.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Queue-Id: B797E60D4B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 154410745a74..e433ce61d431 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -656,11 +656,11 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.attach = rcar_lvds_attach,
 	.destroy = rcar_lvds_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_enable = rcar_lvds_atomic_enable,
 	.atomic_disable = rcar_lvds_atomic_disable,
 	.mode_fixup = rcar_lvds_mode_fixup,
 };
 

-- 
2.54.0


