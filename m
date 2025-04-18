Return-Path: <linux-renesas-soc+bounces-16162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83BA93DC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34D43AE6F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E2523E329;
	Fri, 18 Apr 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIfnVy/v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1014E22FE06;
	Fri, 18 Apr 2025 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002036; cv=none; b=aL+F6F3LuaPXg3IWfCv94cfs82gY/86q8XPk0FIfjbI+1AxjSPZRSIc0GpNW23AI7iZ/GosMN/8Od6zqEqyI7S5VIJEITiGT07hOy5cmd6Ze4o6vGBo/nYmzCkIgCw0VOOyAPDNQ+5jLFNXCI52Itr9pdisPrx01xDw2PNTzFtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002036; c=relaxed/simple;
	bh=N+Nx3jB7RrMFtmGqBYjnlhjWMnB5QorEqKiay3RSIHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8uqw/l/Qm3eGOpaM17RsPBMOco9Be73bQvmvVhAsRheiFNBRS4jliZvh1Lp3rPnBi/Jxlt/ZJ3iPU6uIEN2y8IgOTGuuy0htx+FV69axzlSAc+ZWsh1tbi3mHsjGnf/1SOvo6lD37E74Ze/OILiDE8iMatCb/QRnOhJRak2jbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIfnVy/v; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1222346f8f.1;
        Fri, 18 Apr 2025 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002033; x=1745606833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHpUo7IXIaM+PnhEo56Qocrj9Z5PVJ1Od15oQV9Jc3I=;
        b=NIfnVy/vBLX7xE6/xeOfiWlY1ki/jmgY22sNa4D+ih76e9QkaXg2po9zbgNLWAlDit
         5cnYg85SwFSimjaQG1mZ5fi5ymTFYgPaS3nVZRGA3HabZxHoGNnWLMo7jXDObgH2ya6e
         Wcb4wtbF9Sc2amhGKKAWrq4pDyEoi5MvdsEdnffMMPRpHsls72YnbKce2JVtb6ofCfOE
         to4kHiRXY5Obcbx4DeSjkijrfkZDWXyzx7UqgTOn5372XK0uxhQxXVehsJm3s+EqYRjk
         b2QkP7zRhi5mq5Jb87DJT3HMsOLqp8i0cpp4wpM5cEMu8DDKf8ed6ne8DhjaPChj40oG
         b2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002033; x=1745606833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHpUo7IXIaM+PnhEo56Qocrj9Z5PVJ1Od15oQV9Jc3I=;
        b=bYjns2dpEGuk1bQ0/oJEL/fjzqlEGvF2baK49ODL7i71lDMw4wa/Hb6qrWSmFUipst
         YiZXu6yET9hoAZWrRn8gdVZ1Mwz0mV7DnSkmjgpXEAfgOah+l/+Tj+Iw7kh8kc/FOipH
         buENGrfVaLfl6xhkFOVW9P/iSMR+8DH/vURwBWdbdsgmfKxl3ZHuepoWt1YE+ANgL8jx
         u6xcJPjthmzrLLwQnVvwYabgwdUJATLifXVM3OReUZaRe6PX+jf8hwU64pg5XpPkBjCu
         LzPUfzzxPOA7iMqxtGvkx/+SSmB9O2CYEFpAAtnYRVa5Po4kaHB5+qhvCAu2Xy82hSoT
         TXXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF7u6Du4nihCKg0I2PQwSXFggk4JsTveON+DvNRBZbpYnxQzmtodDmJ9sOZkvpN+AxToi4t8NKcgm5@vger.kernel.org, AJvYcCVdchdAwfnN6eUIikkeyos9lhsmScanVWcLILeuJqyNbCP/u8s4PwHpFlAIzk65Mv6u+ren9xy4HLF1FjXIKmIhvvU=@vger.kernel.org, AJvYcCWZ3Rs20qh0h1nj0X8CmTDbeRcDy6NhA9Aj1L3nYT2hFxcs1RBs4qeaQRckXi6Y4TwcThuOPlDqusx6@vger.kernel.org, AJvYcCWZOVxe9gf7Zq1AUH73n+ZGhXSGXhZIPm+cT1+YCbGojHdRyMkZnpNzptsvHPdR3+taDsN33TujEWGCMOOE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FFN2pQbVA7E6j6Dp27D7phwxwfQa6pECpVqGDO3t+ovjHMT0
	gnIc0ya0dHEMm7r2IYboc21BXoG1Cqz/g7nVfF4nVBRO56nVb9iZ
X-Gm-Gg: ASbGnctuMFUcqyiLHinMM/t+uhhXpgxtG0hJMgZpXmxSWdZJm3rlM6LedmulVdINXPH
	397gcpj/X8O1Xng+sOH3yM5Q31lceZwbMCS+I20tcE+bbDW7p3WMdCDnMohd6R0z1I8muE0BA72
	XQnCRWGucPuaiihk3G/ikZ/ZZfQ29vzAGJNeeyiRq5mH27kZUdYy44AQo8eD5ZiDBGqKGvETIcU
	noTQe/c2/fPLgp1DgvZ9dsk8UJFq/uqlHZEvnjjdgYe9teQzv0KDoD98/3638pQhaTflgiK/qkp
	3u0w/SgV/G8Rzix/SCIcLTnneySVs77OxUJ7+9wf2AKWLoaN2YZyrC/SdoKvud5H0/I+GWadhA0
	Z
X-Google-Smtp-Source: AGHT+IHCVe4EPQnJ4ADUnL8Ah64MkBffuhR+DPqTWbDUWGGczJQroDEJedl72/TwinIX/iIxLhx54A==
X-Received: by 2002:a05:6000:228a:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-39efbad5316mr2785862f8f.42.1745002033380;
        Fri, 18 Apr 2025 11:47:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Fri, 18 Apr 2025 19:46:48 +0100
Message-ID: <20250418184658.456398-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


