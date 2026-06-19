Return-Path: <linux-renesas-soc+bounces-34237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id efROC7kVNWo1mwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 12:11:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B686A522C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 12:11:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NObtACIC;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 775273009B16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB38370AE2;
	Fri, 19 Jun 2026 10:10:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8D0369D57
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 10:10:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863837; cv=none; b=nCVsj0p11NHO7eMOT2opuO+RqEu2gc+IDIndjAwgxuUKHDvV8+uvu+ypQ3cHF0op2Bi1PJFSmrzPmjWUnAzUbyXny80iB8txwXuqkLPtwIWgVYksK6Qn+sMVQMi68jasRRJCPptM05v9eVmkynOyO1gigZQoBHnxuV3h4cxYaBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863837; c=relaxed/simple;
	bh=XEj7Qd+j2mrxj3zwZ3sDbNuqdCspD8yz8XPgs8fPcdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/XN+vpZ+ly6x6kED7gV/ipt3kHje2/2HbEsWqh1H45xoPdnYmGf+ImJJk6D6ZOf36lDneCIaK2T62EhfZpcZduU/mVfFCcUw5Rxm665qNa4fY6gawiwEUlwsRE7+mzG+G2OCrs+iwdPSvque3WPbye5cNCuAb66wfnO+hw7MLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NObtACIC; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ac357c55so18806175e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863829; x=1782468629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7PzdOlm6ppimpgT1Ue/GK7k7tsgiFLY2bjtHZ0QZ2U=;
        b=NObtACICqd+vkEo990A1QRbAlXwXgWqYRAymU/yULZQ01iULN6pLtYoQU2NWUkpRBS
         hXmpVw1CbP4SswSphg0rB3UKMPg1l/CZQ+jkqlCofKIdBm5UAuHKdyKfSgZLeBtqZMVo
         d1vav1fCMOfegguMF5HBZf2heoKp0q4RLagC0K2mbUYuS4inEMWqQ/Q9IET/q1ctzvSJ
         BNbn29h2DO3p6+EHwh1jALGVqOi1qfIsj0AFL+QjwEMumXCHKLN652z0I6v2vcmgL5JX
         e6MzJrc33lklFGPy0s+1KNkS+wCsLuhhuaWg1VaB4z8amRyZhpQpirbs8orLHEu7rY0j
         M/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863829; x=1782468629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7PzdOlm6ppimpgT1Ue/GK7k7tsgiFLY2bjtHZ0QZ2U=;
        b=nFfLAuDkJJOzZqEtvwcL35k+UWdWnADceDECwJCAdOAe7oC5tYoHRaEtIJBHr7QXc6
         JAng3wmtrzBc+XEjUU4PL05VBtxI4EBkc6yTIWk9MFiWN6PVERFEfw5JwKMMS0FaR3dp
         ZEfz0b3+x06QcxAmC9/BTwRLtm/pPRnr5T5XkimpddXFzTznmXz7j7iSxa3el9Rz1Qlr
         oZJwKJMs02bXOaiJzIhLGdxGt7ZcEQg9C6efiAN8CeNLdQhLyxoVxBIshXW0lEVydvqP
         eOIBT/nExszIxZS7qNLOoy2dQSYwfVT19No/PD/khJaIplDcuuBFYnzY0vTSedQtSfsq
         HvhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/phrhOYt0fYKDoO27iWd89ZUx6N0mG4a4gsYqBoiTzNjHaNEuoupMoNW04qhn7CkjYk2xHCSI5u1iwIbpiT4UlNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27LHe5AbpJZAtummF3QIXEbu4hZNad2F2YzDoPQIHhW6AFO6g
	BiZPS+5WALqdJsIGHL3/x0iv7ABCjaCJmNZwZqetLpSeDXEPfWAxuRIV
X-Gm-Gg: AfdE7cl7pmDjQpaxHylxP1xNhZUF8lDaYv0v512bfFsQKseBc03iiUVqGBMTFHuLQwf
	PxnpmI7piCw/AhulAvhXjl5LY0VAUZDE4gNpqhaX+uRNnuGLlUb1MTCIyRGz5w2Ky7xqDYm9G+M
	Czw0BfRBGVV77xFuDpcuwI/GBzAF928IPmXOSZgWpuZ4ZxFVIEStrXvbg990x1dRst5GOEF2t4z
	EYNehYtGzAKOKeK9qZGaapnmMByHst2/7YrJPkSt9ot0m4Zr4w4YbrRlUejlyBf7h/UUOHuevkL
	pVPxYGOZxDJSl50wOKhaciNkeJl1O2g9altZMyOuVR4jZOcxaviC8axFivGANDmXjZ2A+GODGVo
	OpKs3b2CR/+DhQxMsrekz5PvvOK8/K1vAItD9ebCX+RYnP5W5RJFVBtAZGVK1RSiuzOy6nRSjv2
	F8p+TFhr8CGRkUoNs3gA==
X-Received: by 2002:a05:600d:6451:20b0:490:a646:9d77 with SMTP id 5b1f17b1804b1-49240dfe0a5mr34801065e9.6.1781863828461;
        Fri, 19 Jun 2026 03:10:28 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:435:f63f:6fb:bfa4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcdd08esm34577555e9.0.2026.06.19.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:10:28 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add support for Renesas RZ/G3L LVDS encoder
Date: Fri, 19 Jun 2026 11:10:15 +0100
Message-ID: <20260619101026.323633-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34237-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:tommaso.merciai.xr@bp.renesas.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,pengutronix.de,linux.intel.com,suse.de,glider.be];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8B686A522C

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

This patch series depend upon [1]

[1]
 https://lore.kernel.org/all/20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org/

v3->v4:
 * Reworked bindings, dropping parent node containing simple-mfd and
   syson.
 * Dropped the tags
 * Dropped the header files clk.h and syscon.h
 * Dropped next_bridge check in attach().
 * Dropped syscon for getting regmap.
 * Replaced the below macros to match the hardware manual:
	LVDS_0_CTL_FMT_SEL_MSK->LVDS_0_CTL_FMT_SEL0_MSK
	LVDS_0_PHY_CH_IO_EN_MSK->LVDS_0_PHY_CH_IO_EN0_MSK
	Replaced LVDS_0_PHY_CH_IO_EN->LVDS_0_PHY_CH_IO_EN0
 * Replaced atomic_reset()->atomic_create_state().
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

 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 ++++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 285 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 5 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0


