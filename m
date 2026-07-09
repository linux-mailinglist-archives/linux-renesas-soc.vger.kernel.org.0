Return-Path: <linux-renesas-soc+bounces-34950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w+K3LBiMT2q8jQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:55:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D4730B61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="R1/ehSmk";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C311303ED83
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 11:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0DA3B8BD4;
	Thu,  9 Jul 2026 11:53:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DDE32BF41
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 11:53:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597987; cv=none; b=FBZM8vYvMYnak90B/EAhktsdO1YXqdRKlA+OUzI5/ZrOPdHVGZweCN+uFitypwz9kJmqjRJ2hNjnLaV8zO0g3zheAi5161hHVrtbB212KCJeq+syQYfRkfehvJbqJSmS6V2i47F5jJz3wEqYgE0/1CZkYliQmfClWwi2EqeSGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597987; c=relaxed/simple;
	bh=zLzCiIlYhe836vwPTHP/Ek73yMSC+0sXZ0j/7NwWEcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5NTMgSOJFDOB2jYp8ujXh5g4jhfEOjnhV3rBVEgbaNpOnoASTZ+L2E/yrG5jkIVg6Woli30MoIhiQLzQhwf5O/qi1akzx9Dj3S5CeFwz6OjcRyJn1obArbLq+tnDgUobgw+pLkjn3Hx1nMjrXGD3fcQDXISUejjgggp8R4qgTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1/ehSmk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC271F00A3A;
	Thu,  9 Jul 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597986;
	bh=BBl07Wg8XAYqUZdpLZ1WmPAMyEXpoygeYR5pTIzgjIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R1/ehSmkmMoDljeH/5tqIoBTy6agRd+9kbMYf89sk3wxRorYDUCEn+YXYId04Yt+H
	 0ljZr2ZGmkf1J1nYTSzMhMgUWObUjkyKYta2SFdukeoALH+9jXk3/eii3jIkZGTouY
	 KPkPbcECjrk50r3hQUnTT2/hvOpqhSY1NChtsfE+cDxBSemdQmc6NjL1bgAFCMp7gn
	 nOMQOwBMeJ/nj6goZsf6eii2ETu19GRTEahoSHnZaBL3oUO9vtkP92JzSPIGrDk2dY
	 7tM3H8vSnotA3dweA4ygBTgFTljz0h+RBQxSz3FKFUBDOu7Ybq6CK54pyd9VrKgKht
	 8m1pyruRhc78Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 09 Jul 2026 13:51:18 +0200
Subject: [PATCH 52/60] drm/rz-du: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-drm-no-more-plane-reset-v1-52-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6735; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zLzCiIlYhe836vwPTHP/Ek73yMSC+0sXZ0j/7NwWEcs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn+3QpKbm9eaOqFWB2wPLrf4LqVZWZCyM9mPznZCnP+K
 VmaP/g6prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwERWvWFsOMJv47lyR3Ha86IN
 n1+9XpmzNvIWx9P9k9NZdriWa8T+tGCY/8VctXCRwe0X/8T60zZ+ZGxYZ59v9jFfZcr0BWkqu8+
 svOL8ge9rQVZSceE0phSP1K0bzwmdePim9P+B7Rltq2Urz0UDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:mripard@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34950-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E9D4730B61

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
Cc: biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index 1efa0f0451fe..944bc9ac9589 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -264,30 +264,27 @@ static void rzg2l_du_vsp_plane_atomic_destroy_state(struct drm_plane *plane,
 {
 	__drm_atomic_helper_plane_destroy_state(state);
 	kfree(to_rzg2l_vsp_plane_state(state));
 }
 
-static void rzg2l_du_vsp_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *rzg2l_du_vsp_plane_create_state(struct drm_plane *plane)
 {
 	struct rzg2l_du_vsp_plane_state *state;
 
-	if (plane->state) {
-		rzg2l_du_vsp_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
 	state = kzalloc_obj(*state);
 	if (!state)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_plane_reset(plane, &state->state);
+	__drm_atomic_helper_plane_state_init(&state->state, plane);
+
+	return &state->state;
 }
 
 static const struct drm_plane_funcs rzg2l_du_vsp_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = rzg2l_du_vsp_plane_reset,
+	.atomic_create_state = rzg2l_du_vsp_plane_create_state,
 	.atomic_duplicate_state = rzg2l_du_vsp_plane_atomic_duplicate_state,
 	.atomic_destroy_state = rzg2l_du_vsp_plane_atomic_destroy_state,
 };
 
 static void rzg2l_du_vsp_cleanup(struct drm_device *dev, void *res)

-- 
2.54.0


