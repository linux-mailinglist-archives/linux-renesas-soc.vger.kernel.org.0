Return-Path: <linux-renesas-soc+bounces-30567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MHAAjhUymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:45:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C33599BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EE18300DCCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7832D3C0612;
	Mon, 30 Mar 2026 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhe6acUX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA06F3BED4A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867498; cv=none; b=Cn4LaAfMC8vgfwj+dqgoTee2H+CJ9ytTi0AtpZkgvpWwSH+ZdTBu0dg3T9MgbjljdB3pWiFFjVX4C6A6iCAawDiuJv+QGuI2RY22dyrTmTzUWfV2ZzyPeXOLMIugimB3IBwEU3o9V9eefjItGjYMSdUjL0FgiHep9lObQX4ZcNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867498; c=relaxed/simple;
	bh=JmV6JKnOIzmqemdJsb/v71+zMpzIGCGG/f1NutNSkbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCNrKWCZ5PASgVbbZ1D9op1gjzMlNVJMYX8RxkfIyq0jt+JacUNtRRVTB59UmArzgOyhZgnmVTh2Mijcwrp1HZbIjAWE/ngJEn0nawKgPrgOgb5iFcSp0mZIgMccKM7z0wz5oGKh/VOpUa+jy9SMpnhowgWFYWMeHpJTt1HOJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhe6acUX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso36672805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867495; x=1775472295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwQ4dRMFArea8SYkY8eqqNt1lO8reAvWgec/k1eN+cI=;
        b=mhe6acUXgAzUsl+q8eTUOtmWIFF5Pup5QGjq9r/A0PQVZcDf65ZYeNrUlDz06N5rGY
         IyZnwJqi2mE1ubytHOwsDytxL2Qgtxbfcm0HQAFbd5hhUAqCwx5e+lTpMNPTiTXgVetW
         ey2E8SA6XaTwzj7ECsSWn5GeGIIMZMvP8o819Twzpi4h6yFcGk4GMlwaWESlvMqAkZMM
         E9bZAUQDz75bHQ6zMBM9y2CEngl43ZRjoyP0DaiOMAQ6dT+2nItY/pmqM++UY1KvWWUZ
         o4Cd8PnqVHjmmStc8kQ993oNZi07BZ0D4UDdUN5f9afCYpfOIcPTeKqDex+lNyRxeJNH
         oXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867495; x=1775472295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwQ4dRMFArea8SYkY8eqqNt1lO8reAvWgec/k1eN+cI=;
        b=l3X/ECTGE6azTjUTdqFsDInuv5OKdyDp+pdcGxS5AZMp/AOJCLJTwyKIk2hZhmOU33
         K40QaEvWwckfxKRzU1HsCZT0m1LXwhIADVmLPxwvAU0y1tPMOn6LvxBULQNawLR/zORC
         +P3VoI9Z5jiEFy74nBbyqXXLC4zossoL56M6NhFR2VfQEd+aEe6Q4hEUyYlKY9+P8Pvm
         hFGNlzzHS7Ct/N4Aji652+yAEbdO0KAk6wozhSrHXkZtlBj1QSylfC5zzpgTZ/phuzIA
         HXKpl5v0V2T3sn1i1M/cZNSBp1d/Cos2tTNa4r1niNkuCcLohc7eOuV606OD0imd8XI+
         Xs3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzV/5UuT/VKv8EEKAGqxGpj5Uh+eiIkEdmYmUk9lP14nDC2KedxaEiCZt0QhZzU6Of/XBvoyWZEXv4bikH50jk9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXuPezz1pm7AfrIZJiffiHsXu+hepZ8J4gT2qv86+hkjUSnRBT
	a5e7zZk8YQpC4y0w8teGn2VPXyqg/OPPzEPmdy8aBWE35ZEqWcUQzL/L
X-Gm-Gg: ATEYQzz0wsNri8/zYqPNzSKC4jXjq+5T0YJg6kdxMM9mMAdQs3eHxGQyXr/BaTgb0fm
	Y4SxquGad/4Wk87HHP6W59BeaITPS00qJa//00A0BuOJZfNTL1U55Y5YU/uO9x2tD4zoLXJYrdy
	KyoSNlZPBOi/xzIj3R9OTVRKMx0RsI7UZJ38guIzP32HYafHE5XCUomGxJwFsu/bU5cM4H8S4DD
	/+Y00kHCZSHHpm0kasniT7e8342uvecf+/ZTdP2eLOmQFVpeK0qBCAfbVqGPFEPcI1U60garxfq
	ksT/VAbctAHSfyeSothODRdf2tpWDQVj/R/yGdRdCSN8ckyLWZdLdfTiQc41eDNByeQNmoZaHjN
	4e7LH0i30CssyXjBNBq4CtnNZA/eRz/I5lvor25kg2YVoHeDZgIvM7vjteQEfR2+3Y26SLWmJ9i
	q6aO3kRhGNLHYVIl+/100rF6Z2fzS49Q==
X-Received: by 2002:a05:600c:8489:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-4872807483cmr201130955e9.25.1774867495178;
        Mon, 30 Mar 2026 03:44:55 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm185842685e9.1.2026.03.30.03.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:44:54 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 3/3] drm: renesas: rzg2l_mipi_dsi: Fix deassert/assert of CMN_RSTB signal
Date: Mon, 30 Mar 2026 11:44:46 +0100
Message-ID: <20260330104450.128512-4-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30567-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: AA7C33599BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
requires deasserting the CMN_RSTB signal after setting the Link registers.
Move the reset_control_deassert() call from rzg2l_mipi_dsi_dphy_init() to
rzg2l_mipi_dsi_startup(), placing it after the Link register writes. This
reset signal is optional for RZ/V2H SoCs, so add a NULL check. Drop the
unused ret variable from rzg2l_mipi_dsi_dphy_init().

The CMN_RSTB signal is not required for reading PHY registers in the
probe. Move reset_control_assert() from rzg2l_mipi_dsi_dphy_exit() to
rzg2l_mipi_dsi_stop(), placing it before the dphy_exit() call. Since this
reset signal is optional for RZ/V2H, the call is a no-op on that SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Merged patch#2 and patch#3 to avoid breakage.
 * Updated commit description
v1->v2:
 * Updated commit header and description
 * Moved the code from rzg2l_mipi_dsi_dphy_init() to rzg2l_mipi_dsi_startup()
 * Moved the check before calling reset_control_deassert(), so that it will be
   skipped for RZ/V2H SoC
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 9d9f77d8f949..715872130780 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim1;
 	u32 dphytim2;
 	u32 dphytim3;
-	int ret;
 
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
@@ -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
 
-	ret = reset_control_deassert(dsi->rstc);
-	if (ret < 0)
-		return ret;
-
-	fsleep(1000);
-
 	return 0;
 }
 
@@ -541,8 +534,6 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 
 	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
-
-	reset_control_assert(dsi->rstc);
 }
 
 static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
@@ -811,6 +802,14 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	FIELD_MODIFY(DSISETR_MRPSZ, &dsisetr, RZG2L_DCS_BUF_SIZE);
 	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
 
+	if (dsi->rstc) {
+		ret = reset_control_deassert(dsi->rstc);
+		if (ret < 0)
+			goto err_phy;
+
+		fsleep(1000);
+	}
+
 	return 0;
 
 err_phy:
@@ -822,6 +821,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
+	reset_control_assert(dsi->rstc);
 	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
-- 
2.43.0


