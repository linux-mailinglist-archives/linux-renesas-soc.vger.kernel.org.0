Return-Path: <linux-renesas-soc+bounces-34690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yuMfMefTSGopuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:35:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2408B707473
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:35:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e01jDtQ0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907893027B6B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A9A3A75B6;
	Sat,  4 Jul 2026 09:34:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC03A5E8E
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157681; cv=none; b=RZioVTugzp2e2y7+qIdlm0eA4UtZWa7+10pxfbg6GoCAbDrsjQnFhnf1VEYJNMgnz5rzCrtoVuesDxtQoI518w2X118zNvrOHrevnzGjj6ReUPGMivlYM3H5igRwIz/lc6isybajW/W1Gka0buyf180z3DqBI3Gy+tw3OvGm9i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157681; c=relaxed/simple;
	bh=69al5Mxjy7X0PWYBawzWFeOpjzudDdfdLbk5AH40kJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYRo+fauvv+ui6H5cWzDH3G9uySn8CJFLRQ98jkp+s/KFZh838QiJ3iwPTC/Xk09Cvw6blcPoNLAnWVt0NTmkFauMO009vCMjSVHM2UgbkQGIhw10WZEZgSbgRwAh7ce5+oqyjlCi4jKMsb7jGJL9WgDTBVYpb90/g9jKzW/OhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e01jDtQ0; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so9320505e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157678; x=1783762478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwvnaSsxH/NJRZaU480O8mWvjK6UX8Z/pGsTgqyXhY8=;
        b=e01jDtQ0qijaDrOh6gfutWdEVmFyMJyhwUUbKTYjOCbCAnzs++QDro2tg2bNgJC/j1
         6bVFYmfHC7rNmn3LFDe1v/Q+Xh+WjsalrnnyMap6MmyKfRkUyy2UK1k+VikzVqQGp58A
         /oKP4PVVgBKJScnzUXoEcS0xsZySef9p/CHv9yn6/mMy0asa1iHnL58YuaWQVOqS2fH/
         DjdUyzS+k0zXnZ1jpIZJAm/LikCjHazsD2bgEaVfDsKMfybZm6QCwEHfU1ZWnRfCckO4
         DYf+tkhJcwn6ThxbaYGpOjsWL8uQgd3XmHhewceY59DBPQbZZKcWV51DFz8jcI2hr4bm
         V3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157678; x=1783762478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwvnaSsxH/NJRZaU480O8mWvjK6UX8Z/pGsTgqyXhY8=;
        b=KHUsXszwS9sEqKDSMaZCT+z2q/zN1gY7RsPQegA/Kk7Fjo2ulzS/t3EbyZc6FxlHtN
         CP4HdfgEmP3q0oMG0HY2lR3oboxAcZhn+Frgiq8Mq4JeLnMhf8Pd7a5U8MUb1KjsP/GA
         Ah0j2K0BAs1LMfoSkipJYCQpJQJrPx2KtbiFbFT3x3WxmO1l+IwFeO3rKHF3QnPyxIdo
         ZzDwM//piWKOgNwzdKsa1/76Yg893HWiM+Q+VHKlCE0ovVAih0twCMeXAOneaMQFcHIS
         fwkgQpLpHcreDTJxwPeBC3J6i7et7DTXGCLWRm7vatDYehS8DeZWsoTEvYzQamIfpp9h
         ee6g==
X-Forwarded-Encrypted: i=1; AFNElJ83ctUMKddn8GPTrUkN0AqbsV5M0JDLzYxVhwWdaAPHRNwUfaprXMhdybFHX38ZtknscaqUr9a026mMHzjojVAg2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKv62L6qaBcgUllID1A+VRrBSdyzxxt9oesUtn+Yb9HRqa5mWy
	DhTOo7Wgk7U/9gBRaHxar5k3D38jfKXkDROfBMGKHbGQWQZy8aCIAKBB
X-Gm-Gg: AfdE7cmF39tXANCtkDECZr2I5pr7rh3rbudykKXrJBGA9KHRKItsvrJjpoJAFPh72JW
	qOcZziHqxktMI10f9kInfe2EMIZGeARWZG4PZcmYTqLxH8sp9AqcMwQNs7rqfnC/j+wmM4hBsZv
	iQlwEPCLOiouP+6u9k4WbgOYaMrUWr07sV1qQVPR5fZqkiEkJNFSYPD7ZzwYc2nMRhQBSy3f19F
	qMX8Ngt8c9AQKbigAOeKYPos6jIYKP2wp9c24eohOMFBwEnN97GI6HhV8g5SMVsY8d7b61DNQN3
	ZYZOoxDn17AbFvPRfOPGz8JLK3BTydYVfPJYQ3vTqsp91fT/Aly03BUQjJRWDvbI2FKcpLruuPu
	3vemSMIdx0f59roAevxJQTHAzKKrEKdh4cgW70Zy/NcQhqO0tSjKdvEarR7GvvUkXYtuQW4prN5
	20K4EJU+CrWoo52Wlwm2xV
X-Received: by 2002:a05:600c:3551:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-493d11faf3amr31491425e9.38.1783157677450;
        Sat, 04 Jul 2026 02:34:37 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 04/16] drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info struct
Date: Sat,  4 Jul 2026 10:34:14 +0100
Message-ID: <20260704093433.273672-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34690-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2408B707473

From: Biju Das <biju.das.jz@bp.renesas.com>

Move rzg2l_mipi_dsi_global_timings and its array size out of the hardcoded
ARRAY_SIZE reference in rzg2l_mipi_dsi_dphy_init() and into the struct
rzg2l_mipi_dsi_hw_info. This allows future hardware variants to supply
their own timing tables rather than sharing a single global array, making
the driver more extensible without code duplication.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 1538eeece2b5..180384c10264 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -54,6 +54,8 @@ struct rzg2l_mipi_dsi_hw_info {
 		const u8 *table;
 		const u8 table_size;
 	} cpg_plldsi;
+	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
+	unsigned int num_dsi_global_timings;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	u32 dphyctrl0_init_val;
@@ -488,8 +490,8 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim3;
 
 	/* All DSI global operation timings are set with recommended setting */
-	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
-		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
+	for (i = 0; i < dsi->info->num_dsi_global_timings; ++i) {
+		dphy_timings = &dsi->info->dsi_global_timings[i];
 		if (hsfreq <= dphy_timings->hsfreq_max)
 			break;
 	}
@@ -1519,6 +1521,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.cpg_plldsi.limits = rzv2h_plldsi_limits,
 	.cpg_plldsi.table = rzv2h_cpg_div_table,
 	.cpg_plldsi.table_size = ARRAY_SIZE(rzv2h_cpg_div_table),
+	.dsi_global_timings = rzg2l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg2l_mipi_dsi_global_timings),
 	.phy_reg_offset = 0x10000,
 	.link_reg_offset = 0,
 	.min_dclk = 5440,
@@ -1530,6 +1534,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg2l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg2l_mipi_dsi_global_timings),
 	.link_reg_offset = 0x10000,
 	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
-- 
2.43.0


