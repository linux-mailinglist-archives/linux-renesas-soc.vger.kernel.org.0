Return-Path: <linux-renesas-soc+bounces-34949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mVG7C6iLT2qIjQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:53:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F97730AD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:53:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=id2qMRlt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92F1530013A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 11:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896C4332EBB;
	Thu,  9 Jul 2026 11:53:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50732BF41
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 11:53:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597985; cv=none; b=LyL+WWXnEU1lzha2tj/xIokOc4VMXn4nhmL+V5i2WyDTtBVSxo74EO9G1szGrpMknxcUVqAOxVopiPNgGgMvoTAOygPaSPYeCr5IprpJA4oxPFbRbhT4Wm785nFD4T1VqUgqGJVPlfMjH4ESH4l+R6cBXb2XYJzQYO0UyBsgdpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597985; c=relaxed/simple;
	bh=H7YqCwQusozXR7uaxAuHqSEm5nx74wemaLXfiCVfJX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xuh7sLwfooZbJ15BEBY5CEtvFi/s5xCi/XdHYfBzYvnI7xjrNtot+dGP7losSm69BA5hHa4weuxTsAd2zOCWQqjo6tynQGrOqUMhQUBCGu7+E/k64b5iDIEqpY8eVwhNZQCPVSnwPhehy+gCOylLloAdTU1E6BqavdMemZp3D6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=id2qMRlt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E5B1F000E9;
	Thu,  9 Jul 2026 11:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597983;
	bh=BbyFtQhSQE43baWkNi3gHafLxZFnWrsZEQY0V3Ej04c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=id2qMRltpRWpCHSawjhmiAE9fH0OwIlFwlx/0WHPDX6vrbW0L1W4XIfd7U4Cl9u1A
	 +OJenIbfuPWnGvENmzgopa4780lTdp28Y6l1exMxDfqScAzA+0uxqWhzK5WrIsVSby
	 g3G0iu3pysP68Cnkch9nRFFuSugUzEU8vc6V6Sn/NjQC4AycXQ3inYnRb+hjYt2iE3
	 nqR4qNns653wPOoVA/oSBXkW86J9TIaFEZLZT5GKS4FoG7DFjkuQF4MCmHo+MKiyAi
	 6J/pGijKE8OazOxK/HkGSP3BnBNlCY2eYwz8UJi1bxvuUNWGGlHx8ujJ3x4xVR9AkV
	 VlEJyC03H2MKQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 09 Jul 2026 13:51:17 +0200
Subject: [PATCH 51/60] drm/rcar-du: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-drm-no-more-plane-reset-v1-51-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 geert+renesas@glider.be, kieran.bingham+renesas@ideasonboard.com, 
 laurent.pinchart+renesas@ideasonboard.com, 
 linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, 
 tomi.valkeinen+renesas@ideasonboard.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8862; i=mripard@kernel.org;
 h=from:subject:message-id; bh=H7YqCwQusozXR7uaxAuHqSEm5nx74wemaLXfiCVfJX0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn+3fLbAhYXh3Wc4NvfUOErphXUf2nDC6ZU4TT1qpcrv
 ItMX53rmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMJ1GZs6DtndWXrTj6rCwdr
 1y//UvzrwkkRKfX43Wukni5ecj7p4Qr3E01XrzimLGtQLbX3OJ9+gbFhdnyL3Kx8X6vH7ftfhL0
 oytjJmGVq4vQhOtUo7pDbQp/djKs7rdKnP9l42kvn9/wZdcEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:mripard@kernel.org,m:geert+renesas@glider.be,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:magnus.damm@gmail.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert@glider.be,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:magnusdamm@gmail.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-34949-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,glider.be,ideasonboard.com,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25F97730AD9

The plane reset implementation creates a custom state
subclass, but only initializes a pristine state without resetting any
hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: geert+renesas@glider.be
Cc: kieran.bingham+renesas@ideasonboard.com
Cc: laurent.pinchart+renesas@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org
Cc: magnus.damm@gmail.com
Cc: tomi.valkeinen+renesas@ideasonboard.com
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c | 15 ++++++---------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c   | 15 ++++++---------
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
index 8870766b9e54..da2dff9bb317 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
@@ -710,28 +710,25 @@ static void rcar_du_plane_atomic_destroy_state(struct drm_plane *plane,
 {
 	__drm_atomic_helper_plane_destroy_state(state);
 	kfree(to_rcar_plane_state(state));
 }
 
-static void rcar_du_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *rcar_du_plane_create_state(struct drm_plane *plane)
 {
 	struct rcar_du_plane_state *state;
 
-	if (plane->state) {
-		rcar_du_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
 	if (state == NULL)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_plane_reset(plane, &state->state);
+	__drm_atomic_helper_plane_state_init(&state->state, plane);
 
 	state->hwindex = -1;
 	state->source = RCAR_DU_PLANE_MEMORY;
 	state->colorkey = RCAR_DU_COLORKEY_NONE;
+
+	return &state->state;
 }
 
 static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
 					     struct drm_plane_state *state,
 					     struct drm_property *property,
@@ -765,11 +762,11 @@ static int rcar_du_plane_atomic_get_property(struct drm_plane *plane,
 }
 
 static const struct drm_plane_funcs rcar_du_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = rcar_du_plane_reset,
+	.atomic_create_state = rcar_du_plane_create_state,
 	.destroy = drm_plane_cleanup,
 	.atomic_duplicate_state = rcar_du_plane_atomic_duplicate_state,
 	.atomic_destroy_state = rcar_du_plane_atomic_destroy_state,
 	.atomic_set_property = rcar_du_plane_atomic_set_property,
 	.atomic_get_property = rcar_du_plane_atomic_get_property,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index ae9f381b03c8..4293e792afdb 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -419,30 +419,27 @@ static void rcar_du_vsp_plane_atomic_destroy_state(struct drm_plane *plane,
 {
 	__drm_atomic_helper_plane_destroy_state(state);
 	kfree(to_rcar_vsp_plane_state(state));
 }
 
-static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *rcar_du_vsp_plane_create_state(struct drm_plane *plane)
 {
 	struct rcar_du_vsp_plane_state *state;
 
-	if (plane->state) {
-		rcar_du_vsp_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
 	if (state == NULL)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_plane_reset(plane, &state->state);
+	__drm_atomic_helper_plane_state_init(&state->state, plane);
+
+	return &state->state;
 }
 
 static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = rcar_du_vsp_plane_reset,
+	.atomic_create_state = rcar_du_vsp_plane_create_state,
 	.destroy = drm_plane_cleanup,
 	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
 	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
 };
 

-- 
2.54.0


