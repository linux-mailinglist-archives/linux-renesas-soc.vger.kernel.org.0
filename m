Return-Path: <linux-renesas-soc+bounces-31458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIfxIRy052lU/wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 19:30:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 033A743DFCB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 19:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8109B30088A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66C130595C;
	Tue, 21 Apr 2026 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V88MHnj6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A73306D2A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792557; cv=none; b=HK/iAiMdAbEX3a+X89M0g4EMLTDd/6GG93fBXSRfCpg8Z9mQyatMFFSf4ncSDs8OnKGIYVa2XidTxnhSmg18KZ3cho2Rt9KrBBAgqa2gwU004W20tPg5Cz6ICOFW4Ighzu+jYXcevjRtliePRS7kGCifVI6J5KjpcxcQmWkmtlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792557; c=relaxed/simple;
	bh=V5Op4Kb9bUj9/1lrNoPhIDD+MuXNuaLvvGNBQgMKUN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XHgJlDKBGbQzcN2RrupKUbzKjuihbttARgT6/Y0alwNEGXCuVxXaAdQyGYxlq9nib2/EA9yLHUNZDm3SI+hCEvkQKV9CBhBkOseh3QiR2UoNHvH8L6ObpH81IQZ0UK8+AO/6p/xYwNibxJUkwBibnwnQ5Rez6Yos5zmvWf+P+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V88MHnj6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso60865825e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792555; x=1777397355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18zwonTTNGSCTnLCCjEENQ9bQwbO5iLEoVwPTzytlbk=;
        b=V88MHnj62MSvsJPnzYnp/IjswQMVZCajy8prqJUyI6QyGJdOqbSjHiFhY92aXbZe8N
         ZShtGLbUVKi/qn78hUDsqi0/XgdGiTzmAuOp+MBn+AGsRaiEQrRIU8vSnwEau47O6Vc2
         lM0gtkL74H4pvV8cV8CS9o9mjGFvDyZqWnsnwcR+ubqAdFahaCf1EWYKJlk1uoeMcpjS
         9noQG3EqooZlHu1KwtTdwyHIhtxEpuOmu0jp+H0i4wEpD4LqpQWBk3t8gtxNKT9vR3vu
         64n1FNZ4sKtluFYN+G2KkZlEP+8J/XULzrAFxRAxB2hXF2WBRnHB8yZRpJB7E4q6Wbm7
         6X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792555; x=1777397355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18zwonTTNGSCTnLCCjEENQ9bQwbO5iLEoVwPTzytlbk=;
        b=XzKoNPl+lirro81r3ZPIVJrVJcMvmbJRORUhrIEydEdu3tJ8BkDBR/0b83CX0c2yvC
         nPMAVD2BhhU8XRPeMeegu1wtqPv4jbghEKU8+NJS+eNJRent3MQjSb0W5/ZbA7LEsiKN
         UZVkRSO2nF6gwiMpWi1udh1P3DNc4AkpPDo0vg2S+1EDmvudIHAeKLQmMFpgfnpsfKUZ
         oCt51WNuPttbGqbeO07xgArYZTyQ86qbQt1x7d66Y+hGMgJBBkN3h3hJ0zHmiVI61FjP
         81FBbRBeikjdNvCW2es6h44UqdUISeZrbW4WiV0w3vLhoqCIIKJays3kixg5cPr8IY2E
         xYWA==
X-Forwarded-Encrypted: i=1; AFNElJ+5K0f42oaeoMaGpkvJiHgPjMwHCOxc+HX6nEJBHlRFvzDTAoPLk3wzF2TbmPvMRmIzdJNVuFK11RgSujGtdJbRTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBOhTKaU1y0JWpmP8lgbDU4UqD4lMow+KErc9KFCvv6avJspV
	YTg8Lc2pRrUkpYL6GD45vWUlROf4B92TcedMxZtfTYO5uviYrpHwjNVm
X-Gm-Gg: AeBDievTBmq9Ld/6Qw5WYide0Siny5X9mLeU2yizrX7TOqRg4M4zvuEcpbUB5Zxtwjv
	ZMKNwXlDP1Kkc4Y7JXJ1D21gIKq+qd3xrQKwpj6GC9WZ58UHGAJ6qw7yN6/Zxa88goRVrL20Dga
	NzsyuLHgfycS2BNvv68WyDUMsCyOqaOGFx85iqSNltscQEP5IeBKx2kzPXmnJAlvRPH5D4XFFCq
	yp+ttSzDZV0c9Bry2UeZayFaEdE+CX/jFjW1emyiD9zMytav2lLgz7bq1YpkmzgsHj50m9hrbIt
	TgsetoqZbgq3l2BKJMD14wJmnWw6m7Z/xQFlKKak9oEfsMOY/6FAM56Bm1ZIsvv5pZjH065Pfw8
	gh0zrN0uEW2uogu5Ef7KM+uNOSpj3GDVgwm+MORD4HLiA8ZnFDq1L6/7qmI2jmUbvZZYsDa3Kbh
	UgGOG7/t7GuTsdpWi7l/96aSCt9JM4hD99od2vQZI1G2eACyl7syBujjxgulA=
X-Received: by 2002:a05:600c:8908:b0:48a:58e1:6d02 with SMTP id 5b1f17b1804b1-48a58e16eb2mr15879275e9.19.1776792554371;
        Tue, 21 Apr 2026 10:29:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:de57:c37d:677b:c772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a525a0b1asm57445855e9.2.2026.04.21.10.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:29:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] Add support for Renesas RZ/G3L LVDS encoder
Date: Tue, 21 Apr 2026 18:29:02 +0100
Message-ID: <20260421172910.218497-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31458-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 033A743DFCB
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

Biju Das (3):
  dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
  dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder

 .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 285 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 6 files changed, 454 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0


