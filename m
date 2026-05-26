Return-Path: <linux-renesas-soc+bounces-33137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEiwOKBQFWpMUQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:49:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E855D1E91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13B46302F247
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 07:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD63B3CC7D5;
	Tue, 26 May 2026 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0Rw6MvD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454593CBE74
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781673; cv=none; b=T5c3kCYJTMk2acqQL9XP2/Q3EY1s9SDRLDOJVP/P9n+Cqjro4SSZ/6CRUVfciaTl3fWWJ1k9f62h/pEFBNvc6UGMmC6Ap0v9wvvzbZbF3XB1cFR/13pohsY/S+ez8qO36FGFoaLh/WKviD71k5mL8f5zGgghJXuTSii5S50Sock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781673; c=relaxed/simple;
	bh=i+4pp/PAzEFwbg1UY9OaMArCOvc+Luifx6RFueSm9m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkTfPymekt7DgsVgFGbIzLeOMnRa+KICqA7ViZsTEJhlDEW/SO0J9+nzSloeaUKcv4tMGAC1uNCdXxxCvOO34t6bhfM9uUj0CSEGTzAmvQYHX6cdvzHfXPzfBvVe6dbFsowR50KX39aagvO29/xcMK8ndeyrgneXvyyCIc7pQcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0Rw6MvD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so33937655e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779781670; x=1780386470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvPr1W3ZIvvDxqV/H5K1ZKDBHyMogx0/kZuaS8a0a60=;
        b=P0Rw6MvDBsjUnU3cBzKgkeBXhuFxF66dcqZi/IlrjyEofZA7hbgPmXYRMOdkJcJUr9
         Oo7W7N+MA8uYs5wImLNb6BFTYbk1HMhJk8dAKhSKMPji7j9aItLhBhcMOo0QhHgCLuy/
         +9Lu4kfp1LRdoplSOP1k2WKPlK/wBoBWYPkaR2omMFknSddbmQtRDpMq3W0yb23MMz9X
         0CB2w47ybe8XWxw8y5s9d4PSs95KpddgSAVPOSngybJiQIt/RnRwHF7xc32+LL3SdmMo
         vNgpjkWOBus2yNY0+rscefNNV2T6iaphbgxKpN2d7vRlQQbEvOulbNNSC7zB+Krk5K+Q
         DYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781670; x=1780386470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvPr1W3ZIvvDxqV/H5K1ZKDBHyMogx0/kZuaS8a0a60=;
        b=U98Ch5G9Gn4+DDxGe6Vy5NZz9l+otmyorE43VuLE3rkHAQ7W/ZRCVRCENAgoVxcVsh
         NZK081zfjWwW8hcOBY9LiXasyRi1+VaHhvfA3mBPMgh4Zh4JjwJ0Wi360BISX0vLVxOG
         arnVKWt8YlBHZ6yobW9KWlM6s/6TTf/EBAXHTubDCySoQJirykzOHGVLe6h0dkZUhG4D
         r3mbB9neDABBX/9RqhLn1+Vxb2EM8N0gycXhZrFodpWREZBcD/at2hWpq20grrKdr69b
         5Hrs6nZRxN13/8aCp93/6xEWOs1Ft5Ij5xRIe3snKGOpSkO3agINiFkmL3FEgcArT21F
         IDPA==
X-Forwarded-Encrypted: i=1; AFNElJ+SSkrfiJAx/vt+TitwRIHl0fKghOnjrXc1llxJJ0GPXgJx16KOh8y2aKf6hEzj1IBd+q5ljM66MSkW6RbIMnAjDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrz4PgQmMtsvlc1m9eWz1jZe4wg4g59E7B+kYtJdiRUVlFNLql
	4nfh1paSYAf060kic2UgnYe/fDRSEZUuBMniWnh3LSTGvP3HPKbc34l0
X-Gm-Gg: Acq92OEIe22vRozrTyd2lvymFhkK/LyiN/maL/57rWgMb7EJb0/+WktHWCMSvIQ7kzm
	ZghR4gzIMH3aopVAXhCYxpwxa/nEUeCQtJdibZ7RuQ2si8DpVUgMaH+Wf+VxhE/FyiADarnkkGK
	dNrcmFWhp79ylMViLlzuJA+iJZDx/ZbmgDZzjWvFyuZjaUC04F2EU2Vc/8pNX2hW9UscSjxYhWC
	XWTt8o2fNu+1wQn1Vl8zDGavmdP7lP0leBJkHvcVvycjYgGyQcoVXr5cHfCyofY11QOoO/ZrD7a
	BK5BWpgpo1wLynWIVVOEegHid8OoF8KjsjvCGuH/nCFyKN9LyGtX6VAX2V3nMVuLDedn6CVXf5q
	aMb/BRhHmQ8nVnVG8/Udc4gwrDcOIvbd8o8ClKuueMzUK79FUCdTimg0/8Fmcvuejx/ewnsZs9W
	IS0ZWg5TExIhXzyGkhzs6KgTpyAWmUpThExarGTyMpM5WBvhOQ
X-Received: by 2002:a05:600c:4e4b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-49069da61b8mr85910915e9.20.1779781670417;
        Tue, 26 May 2026 00:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c204:f511:e9bc:10b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d63f8sm102848155e9.18.2026.05.26.00.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:47:50 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Add support for Renesas RZ/G3L LVDS encoder
Date: Tue, 26 May 2026 08:47:41 +0100
Message-ID: <20260526074746.20371-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33137-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,pengutronix.de,linux.intel.com,suse.de,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 60E855D1E91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

v2->v3:
 * Collected tags.
v2->v2[1]:
 * Dropped patch#1 as it is accepted.
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
[1] https://lore.kernel.org/all/20260524194457.479681-1-biju.das.jz@bp.renesas.com/
v1->v2:
 * Collected the tags for binding patches.
 * Dropped unused function rzg3l_lvds_is_connected() and removed the 
   corresponding header file rzg3l_lvds.h
 * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
   next_bridge.
 * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
   atomic_enable doesn't fail and for each enable there always will be an
   atomic_disable() call.
 * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
 * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in probe()
 * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspend,
   resume}().

Biju Das (2):
  dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder

 .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 277 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 5 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0


