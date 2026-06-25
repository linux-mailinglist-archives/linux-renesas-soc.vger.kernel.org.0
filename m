Return-Path: <linux-renesas-soc+bounces-34424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NAsEMDxkPWql2QgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 19:24:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0466C7C1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 19:24:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="jmm/kJqs";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9035F3028F37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 17:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7DC3EB10D;
	Thu, 25 Jun 2026 17:24:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F337CD31
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 17:24:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782408246; cv=none; b=oguko8o/3w2n9TEoN5iWj7VQVYuYd2umwuL2OLwmCXjTEaPQW3KkmjF7yBWciMx3ksH4ekJbOJh6S6Q7v94KnmHJPwGZRBiwLX1uwPATZUsJVljDszLxHe+wncm3qxDCntcN3Z3CaTwWylkZtACcYn+Jcq/QvmUfKMNwsfgRrzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782408246; c=relaxed/simple;
	bh=BnZyledwajI7EV7MoATy0MicsPRLg2sl6XVKHLKTm0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dw7BMtK/XGzX11srq5m9Oobmk4ccwW2LXinBmjnEAeUn0bu5ZeqlmeQU/IlbZN7IZtEu7IsoUgUXXq6+7pgZ+XkcGX9m9ptM76Pv9J8td0hu+EkTT4SeUxlDf5R4Fid2pnvGO1DWBJsVibqkcyR/0cXtlIc9/hMFu+8Tg7wmwmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmm/kJqs; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49249072f03so689555e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782408244; x=1783013044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsMZVPfVRATp7NVDC8FWrCYbdkwciYq6TDikcpY8QOc=;
        b=jmm/kJqsRPR5ShGgY8pOYrBBMqgRzMsd0xNCgkCuyjATrwMxCvX/K9RBWtwqWoGRp5
         cp7RUSIgvKGmEjUjGEW6ryWIILdSPC7nyt8CKfCYbk+F0NhsB+oK+17azM3j2uPYWZCK
         ags3VWxp83jrNwmo+uidgUnFDiXzHA7LmMA2FmnTUOMW61Ye4t0b3obq1GINXeMb7h/R
         FPhUjofqxKAouBKCqhBUfqhIlPqlynzgLZyRKwkKgO/Q5EGu8xrtFn6TmGL7DKmhhO41
         JKPGNPH5tIcZHPjYjydqLJUHrfEoVtb13aqf7sRMxffp7c+ZEQnFwNGEmiUFfSfNfZxo
         Jx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782408244; x=1783013044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsMZVPfVRATp7NVDC8FWrCYbdkwciYq6TDikcpY8QOc=;
        b=TkJHp+jeHAgOEMbVSB5f34zgPd1F97fJ+lHUNlVdjJyV6hRgzF1MwAfXlZfA6qkABr
         G22rE4S9qV+C/nBKhNIGAHE6FFN36wgs/Xmhge4GXSMbTgnKPNh5sP7IN8DS3T8kuCUK
         eq4/lxMWh+d5gTi3YbghnB415lLb27oMa+yXWGC3tG8Sb909Y+QHwfy+agWaCFhctc75
         Ujei9bAGjMm51p4qhX9KAklXDbQotMDFQKPf2Zb8/jzWUh2hAkr3ttHcFPR/iwZXDm5q
         JfFc6t4PE0YkrOdD3UBB9yQ4kz9/M3PcMQ2TY1KKz3zdOyG0dNvRJ7UgmnmrhUVVsxYs
         DC6w==
X-Forwarded-Encrypted: i=1; AFNElJ+IYbre8ab7wmVRcmKDAVS4/XfZ6qBHDB7N/Z5XYTBinfy1+Iv8IkK8y9qU/hx31HMh5RWlk+mdKlHx+TbZTzFt7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvG+JPh+P+AluIoGfW91IFKMy5s3VPm7/Qlr62+hNcvnKbUJOi
	o50RALItF7fIa0QSMHNLqXDJ+adPPzHi/oezDEcUBKZyYZSi6Ks9iOLc
X-Gm-Gg: AfdE7clewGcO8Lk6U+MjWPEdkxfhvKyd5oHKQvpwd9MoGOFDy59R0Ca9hChXdRmqc1d
	hDC2Ha8UuB7LtL2JqtMqc2Q54Bw1PP0/Y5ujFEsvZv1m8Vq8M82fQ2Eq/C8WogR0Q2cqLqyEYGB
	p8TWLdNIJmC5JEM31XZiw3WMfUiPPLV4nl+VZSRSt37di6yO18ulvHeDd0E6QWEmbZ9/wvyuECE
	7eKR7e/Cw/YTEmc/BsSjInIlLJAkB7Mr3/fAmVukvJYiYuq4IOVLENtONupfbiecIV7um1czoIk
	wjP2JnEZ/W8RGsIBMKOXujY33YISmA9aHWLARx8MeZRYq3zM5EqhfkICZiHmUjk6Me45DJZGZ58
	4oeRWcO2kOY4+q7hPSm8VOLwYh/8Oa4ksitBwwCee3vCkIEE4FYQixXeLc5DWATpN5k0PANz+Fi
	z1bA0A/V6fTsSUnOMS5ST12yglkbhqoFhpag4g
X-Received: by 2002:a05:600c:c3ce:20b0:492:62eb:ebe8 with SMTP id 5b1f17b1804b1-4926686638emr41836615e9.16.1782408243598;
        Thu, 25 Jun 2026 10:24:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:6aa7:b2d:3460:b689])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm11167265e9.4.2026.06.25.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 10:24:03 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Add support for Renesas RZ/G3L LVDS encoder
Date: Thu, 25 Jun 2026 18:23:47 +0100
Message-ID: <20260625172359.292631-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34424-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C0466C7C1A

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

v4->v5:
 * Collected the tags.
 * Added Kconfig functional dependency for DRM_RZG2L_DU
 * Dropped DRM_PANEL from DRM_RZG3L_LVDS config
 * Dropped unused headers of_device.h,of_graph.h and drm_panel.h
 * Dropped the unused macro LVDS_CMN_RST_PHY0_SEL_CH0
 * Used plain number for macro LVDS_0_PHY_CH_IO_EN0_MSK
 * Retained the tag as the above changes are trivial.
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
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 282 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 5 files changed, 441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0


