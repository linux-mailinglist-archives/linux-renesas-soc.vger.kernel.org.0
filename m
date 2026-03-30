Return-Path: <linux-renesas-soc+bounces-30565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC+6Cs1Vymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:51:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E3D359B18
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ECA2303983B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E813BF692;
	Mon, 30 Mar 2026 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aASh7vEN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199AF3BE162
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867497; cv=none; b=B5UAh2O1hyGvY/fGKftAPw05HbesY0xjdPeJNC5G+8DqzGWoQ0nJUD9LYDQYIFa9abmz6roZ5SDRit6SL1n8kDPU01vtkwA01vpbCQFGP1kBlfcb2vs2UaPckIcKPvIVEsdBMSBMNbJRoBXfqp5VHDMSSe7Xp0MOhNOwwSpk9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867497; c=relaxed/simple;
	bh=f4rAtE8vL2LeqX7HrmP60xf02GC7I+FcyqdIHkqLAGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPoIRZBjc9Kyt/VrLPQk68aPoPLh+IZpMq4EzwTaaXBJHUZfIOh3EZtX+/wUIfn1vbXM3LVdNZgUTvmZWSxTrPEjV1Bv6sJuYa2R6RyTE1hc3u8Zv5g9rcBlmc4YYbnqGSOV/asPtX0RUkUTvErniKdwUvAcg74NEWS9CSrCdB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aASh7vEN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so57570005e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867493; x=1775472293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Cmbluhj5GyyYqaF3P2muL1bB8tOOS7mRoOIdtU1n1U=;
        b=aASh7vENOIrmOLYlx/DSOHnDM7s+y0dC0kfWazCSRI8Mjy+W6RqBQ14kSTFpx3XK9S
         vfTgz1v/4qYZjTCzJLG5/EwZLeQDpZHYljwO/Qsto8FUNTtqWiq0keg+J/LY90yN4xth
         05Tq8zjoLjQ0cryBrPhNjwL4KeO2npkqnbnDJ7Jzloy/3xSBq0wd1vPGxSHv64hIZjd+
         Ad5jKx+Y34IJWjyBBi3FYB8bu1HyaCNbL83gt5R9HEZV6YxM3AJNRiOa2dZsvCmjuA0r
         yBO69zAfZTbkYCctenlEuTIj8oVaifjvDXw9PecD0qbC+maiOqXMgoQgmqb4ZQIcGU+m
         stdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867493; x=1775472293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Cmbluhj5GyyYqaF3P2muL1bB8tOOS7mRoOIdtU1n1U=;
        b=Qf3LVqdxPGng7m+af5ZDQqMDshP7nWhhT3ha+i5MZScbJiTBgF5GSUYaGtEEhLSA3y
         ma9dnnp/GNPvDiBDEpD1q23eHTbxP3PjxBZBNisi1ev9BuRBBOA8RE9Oqtjm3au4bZ/e
         l1SjLShuaJ+0DBVNZOiLShbjxAKMvjPR6I5uqXYgMZDnIJPIzC/pkcLtm9LuP8FjAAo/
         cIPQKfwxggeM3MD+oqG5/PQHVWtzoQJ6yUDoJbk85R1P6O+EtTf37o7HWyat4/YiSDzP
         R4HV4Icgl2kOfZLk92tREPgrs7WLrv9wwOqbGnv1O+9AkHXQV4CRGpjWHI0aeGVvgGNd
         U2jA==
X-Forwarded-Encrypted: i=1; AJvYcCWz110zadSsL0QuL/N4fmKNsU+vzpF2tRdcqlX5EozVxqLuyWBc37eE4cJuhjxS5qcLi+zE9RLRVJErHyf1ptA1Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHfKvbuCDXFIbXXePv96qNXYw770eE40ySRv+cnW2uYuG0lIs4
	a4H6d+KsEzlp3UdiSibZqHritYoPdWdKZernWoySzVCuk5rQpHz034CK
X-Gm-Gg: ATEYQzwKzq3ZRicRvSVPSIaNrQKbkeWeLOcFxmBfzsidj5LHfLh2/BoTszbjtzqg0vO
	fqwy/qeQ5+QTdXBOa2zSWxYyMEl4+l2gMl4pcZjicKeTK21NsCWAnhV6IlqoQS1skdbdrUPjUHd
	fVKR1DJ5Y4dPBdLXHGDBoFZkDOOJ9sSjvAaIcDasEiXsBu+vR12onAwl9ZNAGzJ5lEYA8HngiUv
	7Zyc55osMvO0mV/CL0ej1Iwgs1oRCSkOGUFXHvGDMt2TASiNCDYoijP6NEJNkfAnaTCtPCYy2bn
	68KWP6i0RiZo0am+Ns1q1MNCLPETesKES0VZvLhbKhtA0uxUsvgBElZTjnwRYBpfyG6oEFXy47N
	M0uiB5nrlzOHoLgud8drAcOsGob2r5ceWpd37mYDFe98brnqtmNxU0CkYuSiaQvBReoHuUxsLbE
	ARipmndselBk00NxjtA/OzIR6blaZjAg==
X-Received: by 2002:a05:600c:c109:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-48727ec776bmr151656035e9.18.1774867493375;
        Mon, 30 Mar 2026 03:44:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm185842685e9.1.2026.03.30.03.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:44:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] drm: renesas: rzg2l_mipi_dsi: Move rzg2l_mipi_dsi_set_display_timing()
Date: Mon, 30 Mar 2026 11:44:44 +0100
Message-ID: <20260330104450.128512-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
References: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30565-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B5E3D359B18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
requires display timings to be set after the HS clock is started. Move
rzg2l_mipi_dsi_set_display_timing() from
rzg2l_mipi_dsi_atomic_pre_enable() to rzg2l_mipi_dsi_atomic_enable(),
placing it after rzg2l_mipi_dsi_start_hs_clock(). Drop the unused ret
variable from rzg2l_mipi_dsi_atomic_pre_enable().

Fixes: 5ce16c169a4c ("drm: renesas: rz-du: Add atomic_pre_enable")
Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v2:
 * New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a87a301326c7..ff95cb9a7de5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1025,29 +1025,33 @@ static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
-	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
 	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
 
-	ret = rzg2l_mipi_dsi_startup(dsi, mode);
-	if (ret < 0)
-		return;
-
-	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+	rzg2l_mipi_dsi_startup(dsi, mode);
 }
 
 static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
 	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 	int ret;
 
 	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
 		goto err_stop;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
+
+	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+
 	ret = rzg2l_mipi_dsi_start_video(dsi);
 	if (ret < 0)
 		goto err_stop_clock;
-- 
2.43.0


