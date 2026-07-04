Return-Path: <linux-renesas-soc+bounces-34689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rsefIbrTSGoduQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:34:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0470743C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:34:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nzBB2m9X;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C2A0300A662
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035753A7595;
	Sat,  4 Jul 2026 09:34:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D039EB73
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157680; cv=none; b=mfP5fnm2MafT+90wz21FJWJ1MT30Cbyehj7et7sTe1VsWKthDx2gR38OE4B5r8JSGduGotXdv4GXvwU1E1Z5gxMUA7gy1ZKyQcSfUEvtRxkcajMfo0ZZyvjT5WGS3YCfyyhfoRmZf5tgTh38DVMZiY53D7MrollV2a7k0H7zNPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157680; c=relaxed/simple;
	bh=BAJiPQK9KOziHgyCa1LkW+YSfW1lTMdCZVS5y0SXJrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQo0AfBSTrxbHyE/NrEtxbq1TDMk1UgbBTNPZ1zhkMf39xvVbWauZ/xV9QDlQMhSDpMHVf5F3TWKwTKSc0gPjCYfO6yLUqWN91EktRSevLYfdxKwS3CoBEVSGJdP6UktxhB3CXy3nfVvL0pBMUtdkJMtISha9tq+qJ5Hyp/Ff4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzBB2m9X; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso7545385e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157676; x=1783762476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qcP8EPHpeRw8GGZwK9AJJe0lfKflcJRQSrck6Nv9iE=;
        b=nzBB2m9XCvRqWP5VyyjsLu3qxwku6CKE3d402raKGbCQBxL3Gb4fL57DxyfIJwMDxi
         UWZr4Bp8FtuxeFzUgvbSh/P6tf1eHUMrZ1ibjJrnUEU6fVLyto5MOh7WO/TUA9JSpjN9
         9xBNfkc1GLwnNqYDOyn9oHeEThKz+/h9tZtb8GBKiTWLtZjEgZWnHoczB0J4ONN/x+Kf
         iTEyccWeDHGfFzuKWVzVPabrqchTnFjyGy937XyDs+DF9OIASdL1M2XZTOvq9jp1IDDr
         ya8sDF/DJDAiZm/T/aWFzuPRUwhaLtGy59nTXi7LvNCq611uyO8FPABYdZvgdXALx/sx
         fw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157676; x=1783762476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+qcP8EPHpeRw8GGZwK9AJJe0lfKflcJRQSrck6Nv9iE=;
        b=mYpl0yip9W6qzbjs/irndTX1WCwbqzqKEWcDlFBRO6woMRL8qTNuyylZyqoA7iNm2S
         suMGTt+oPjZpU3OPe/TkfGjbkVnrIDUIRfFauGATwj4jdcYP4Ri//ldPQ7k/be3INiuS
         bIP4CNkYWm1cRQ7dRUS7wLtZjK4HgAZlgFNtaLxGl/IRS4SctyBIo5acUgJCjNyE8Adq
         SWw1zoLRpc/ThgFBNbYnv2NJgh27HgwNXcoiq48zG4ruflPZ11lZ9iVV0SLlll8c0s9I
         OWKnVwBGdUhtphl0W0bGmfpAI+CpVOr9h76MPV408MvUVFzpMNJ7xG9om3Fa2z30QYOr
         hNVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vSNLfDiyEqGUB9MzeIw+lBa69X7C4D0bRhbMeXIfSJB//sPpK5vZA3ALmXjKRNzhWHFOYs0GhpCr0TcWu5Y8qCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfvPbSOiSrni/MpZMqfD70xPliaioc+OSKShVJJaegddxmJXV1
	mvSjoqnJhF5/xM1mSYwMH5hnFizRoVvPHMVCsITuBqj6F+YM+EzvGZ6L
X-Gm-Gg: AfdE7cl70Xlzz9PPeKssa+RcL1tQbzm3LHC4HQqUeNuOGRRxCoQk/OkdVIi+4imlLsR
	UeeDy8LHGduGz0gRw9dE0M4cmktEzqBQR7yqOSDcbg/DZXwlGF+eMTUdR89xrTNFA4W4iy9Bg7O
	7XMvUij7qvKTr12bxr0JMMq4Ok4nWeIwLvVcLP/Hy+h1G9qaQn1uQ2CEHWVfB+88N5bzATXoR7W
	fzkTEEJGJoL1wA9qkbsztlIU5Vj9tynNCuhm4AcyRdpfclURs/SUbwnVBUICAMp6og8dRnwxMDZ
	ji+XlSMCEMrtS3VxT8bLPq3opBD5+mjGHzvm1aW3bHJVOU9Vpdnw5GlLmN2sU9pFXnbKzTihq6e
	592Ta1kCuHEHLbZmGO35UT/Cdfe/MZaYNpJspqIaQs0V2h7A/QCkeeImN4hWSiI6CjWprybk3oU
	lVqhtuXHm8CKlB9IHbwC6l
X-Received: by 2002:a05:600c:3551:b0:493:adc3:cced with SMTP id 5b1f17b1804b1-493d1204c63mr26953345e9.34.1783157676384;
        Sat, 04 Jul 2026 02:34:36 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:36 -0700 (PDT)
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
Subject: [PATCH 02/16] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
Date: Sat,  4 Jul 2026 10:34:12 +0100
Message-ID: <20260704093433.273672-3-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34689-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8A0470743C

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the DSIDPHYCTRL0 initialization value into the hw_info structure as
dphyctrl0_init_val, allowing SoC-specific D-PHY control register
initialization to be defined per compatible. This prepares the driver for
supporting SoCs that require a different initial DSIDPHYCTRL0 value.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0590ade96b91..2128fd16ebc9 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -56,6 +56,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	} cpg_plldsi;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
+	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
 	u8 features;
@@ -493,9 +494,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	}
 
 	/* Initializing DPHY before accessing LINK */
-	dphyctrl0 = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
-		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
-
+	dphyctrl0 = dsi->info->dphyctrl0_init_val;
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
 	usleep_range(20, 30);
 
@@ -1531,6 +1530,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
+			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
 };
-- 
2.43.0


