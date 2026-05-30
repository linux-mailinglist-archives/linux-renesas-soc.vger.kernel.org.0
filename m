Return-Path: <linux-renesas-soc+bounces-33365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMfGKVXvGmre9wgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8460D4C2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50A5E304EA0A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 14:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2981D435F;
	Sat, 30 May 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYVV3WQu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954A3C2D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149760; cv=none; b=aW2anU8GvNUc1ROsyG8JKYZyx6Ou/ts9a3c1S9V63UvXW77RDaSVJWzfyxH/7PrkZMkGWJl3NBMUM5uGWoNqm6Mt+FdaCNmlwBCNifMX8VDWVkKCVXzdSh7onv+b13QUi28z+XpFoAjJ/B+NZVg3IFBUS1Qtr56GZLwwVezunag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149760; c=relaxed/simple;
	bh=AbVFZ/alLj656mhFYPTJIEYokrMzZqJ3u8NjC854QY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MThk/CTdG/B7LKb0mLdCmg63KbB5yRd8Vd38qtJL2DS21WgxsKk+tb/156fkioD3SB24N4lubehTXUVJBK9mfUwj/xNNxijuFIzpVyq9yu0dBeG5Ref1dgYvnTtAyH8mvS2C09ZHBOm9JXNJApCvv8nvAOKsHybAwMBvbJRlHDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYVV3WQu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CC41F00899;
	Sat, 30 May 2026 14:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149759;
	bh=KiKS2dw0/K6VhMDULqoA7xkiJMxybcQFfLu7EwBv9Co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kYVV3WQuzroDpRJCyk3yAQr7gSfSCdDMqxf7mLQzmW68boqEeR/Db9BTYWEsOCPRJ
	 qohn2akqAKUN/MKUstJf4Q9SM4fspI1EuMAaMgKiMZdoGv4mCjbTQDFMJUhnI93gEV
	 eMZA1p7NevJiQZjyuANtPCymQpHIgVDehAOjVN7NXLofPnx7X+RMwdd66vaSGFqQhr
	 kWoVht6pGItz6WD7DoAtIbsl8HODEJQqO0bEGl3jZmFfr/+5P0rfFj+cCBPz6cSBhj
	 jdvqrGdrAg9vuzV5DvVbV0Sb+V/M3cfVQ5yjaV7HItjNDy+Trps88KCF6bNPB0TZKt
	 4Htybrw+6OEpA==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 16:00:06 +0200
Subject: [PATCH 61/76] drm/renesas: rz-du: mipi_dsi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-61-875d828d31bc@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=mripard@kernel.org;
 h=from:subject:message-id; bh=AbVFZ/alLj656mhFYPTJIEYokrMzZqJ3u8NjC854QY8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSbwNKbj+f++DPs/p59cVXZazrpO+9uHF//9q0L7sMx
 a9Hqbh3dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlB1gbLg2//pL77/fjrxW
 bhAXbbqlcPXqcpbSDaq3rNv/K98RdlZ/83PdrgtpVXK20bns69M+7WWss3d7P2ef1ek5f3vPVFn
 L6FsvEFuxKnjzJwkOa81riU/0eO5srTy/SVnx8ZojVRGzTZk+AgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33365-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,lists.freedesktop.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 32C8460D4C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a2c864860075..0590ade96b91 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1107,11 +1107,11 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
 	.attach = rzg2l_mipi_dsi_attach,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_pre_enable = rzg2l_mipi_dsi_atomic_pre_enable,
 	.atomic_enable = rzg2l_mipi_dsi_atomic_enable,
 	.atomic_disable = rzg2l_mipi_dsi_atomic_disable,
 	.atomic_post_disable = rzg2l_mipi_dsi_atomic_post_disable,
 	.mode_valid = rzg2l_mipi_dsi_bridge_mode_valid,

-- 
2.54.0


