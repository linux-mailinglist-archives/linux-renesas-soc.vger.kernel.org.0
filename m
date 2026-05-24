Return-Path: <linux-renesas-soc+bounces-33058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG9aNEZVE2re+gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:45:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0935C3D72
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CAF13001066
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 19:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434A6318EF4;
	Sun, 24 May 2026 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OL1Q9+fl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBA30C34A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651904; cv=none; b=bPzWXPdKMTAxHIpLP2ODYgk50R9hgeBvVb866R0jMyngHAxrO65qpxaKXEBsucoZgoY2RtAy78u05yEWTUc0x11yhFFd+PD/kBALED8cQ8KPFTSilkilVaqF+8O83bq5Sz/055ZxYy5KdIfmfdaVnwDJHlVSpFKOd09def7mod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651904; c=relaxed/simple;
	bh=VHJdmXIvUpWwCeBmW1hqX+xjDz63irSbS7pW8W3Xxj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KjtmIsiMoA4x/7MqQlm8noPSU26OKw2WRR+p0mT4NPy7DORQm6Y/mmq/vbpoUoF8zBa6cD3nspmin9ejjCEZvEsl4eZoilKyzQJPAyppZtvap5vlUfQr5lk1hboPPLOsFhqbmIuSlJqAwHForAhZjK6OCXr2pziglfRhEv8FGs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OL1Q9+fl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso16436475e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651900; x=1780256700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j/qe6eXcru11RESfUWXlWO5BzYgzjlHFDTWv1yJEsy8=;
        b=OL1Q9+fl/6pqwHIvmoGv7LxGPMIMbCyrLB7KDKRK26KQgYoSWHVl4GvMG28kscAB8l
         FVrDEEJnsU+sj1JK17ofpA0bCaOsaPxWcivvjxLPcJIPiYFxQ+7KByNJ4AvJ4xxPvsnT
         15oP642LYvxtQkJfsewpmF2GHDjjShu0lx8VqUzHgMyQCKv9tiSr2j68sMxXle0tleB8
         BpBuhSRWY/jSBEvSOP238Z8IrdGyqJG36wJDy4K0X4tqAXUEEgcKTyWTtOa7qj2rDrsa
         t0pQ0SVDuCA9j5u1YSzmkaHr51jQ0wcdVvlVEUqQKZIJlRk0T1wi1vzN+dx3YbOSow5P
         1oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651900; x=1780256700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/qe6eXcru11RESfUWXlWO5BzYgzjlHFDTWv1yJEsy8=;
        b=XVOacMTp1j5YqHXkvecpziPYVzjlUYfP/8q2Pc3zt+4DJJiosPIIgpKXwrkSqwrOsn
         bpLW4cM8b3i2f8reRJIyyrRm+q0LF2qayKFmT/aS8how3USo1MRP6Af1ysGMgzYb1xV4
         wz/DyBcT4PPMWXWMDPIt8UzN3XVqaUOzaRxK6c/srjpvl64+klWlwb2cXGfyYnYfs6sw
         aZhJCaAIiRpEU+RCWSIr2NJjK9oVa0Ruc1SUfdeM0emWbNziTLZPVFGVo6fSCTDKH4kd
         LEDx03voCzCh+J3UK8097hs6RfDM+Rr+RUd5Qbr+QYkVMt816sB8MhhiC79ZNKZQH50j
         O19Q==
X-Forwarded-Encrypted: i=1; AFNElJ/QrI8oeb/bgVmkCs74yW6kVGW/gwUhAF5pYA45bWTbWhhFLIWl1cePKoHm/HHn/GBeUg66RGVKRaD9DKMxB5xFbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYQ9PEyST8aBF2oT2AnQE5CdKx/gXSF/aFk7LFmUMIj5HcL7LM
	up/mpmoX+cS/J4v2r5hXdWadM6QqzcrkUFGj3yK9rsgMtrIfTv/72WvC
X-Gm-Gg: Acq92OHhbaPp7h1mFsQ6vZ/wybfkxoyN/nwTeTQkCR+HbRTPs1C5CNTGcoEMcjrBm/e
	8lEdnkc0+xK/0pAbcQX+RfoiPOMNyxklP+EOHazAHZu9Xe0JCIO+DWDiNLT2YoYMKVg6cl7+Q3s
	244zkDac+0ZQqr+AjrKJo6MSmrY5CZluHDGJqtU52q5L6WJSLN5hKZjqvCgMU9otM9UZ/PJecIf
	lQnU/CBwrhtDzD5JcNG+0zcZKZzviHJOhbcCgH3/C1fxvPCkIDKzxcy4h/E+kbM6A6lWKVTsZTz
	k8NWAPDLnZ9FtXZ+qa8uXriOlElYBRyDcQbCwH2408ITVlCDNAipBgl0pIdG3dydOTeeDPVHYuT
	+PX6HYKmzfai1qVjxFK7DPs7ytCOFpBk7OBm8ekmjiSiwftuUgZEwOuk1F8FjGrI0Gyd5MxLqEf
	hdD7pRQtbA15+OEBgZiztqS6jLusRkSR79Zr/Owgye3g==
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-490424ad9abmr182880265e9.12.1779651899732;
        Sun, 24 May 2026 12:44:59 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042cde62csm68224515e9.32.2026.05.24.12.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:44:59 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add support for Renesas RZ/G3L LVDS encoder
Date: Sun, 24 May 2026 20:44:49 +0100
Message-ID: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33058-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DA0935C3D72
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
 * Dropped patch#1 as it is accepted.
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
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


