Return-Path: <linux-renesas-soc+bounces-11820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93579A00C42
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 17:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C71616457B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 16:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9662A1FCD04;
	Fri,  3 Jan 2025 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dEQYtl93"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0774E1FCCF2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922324; cv=none; b=jxJ/0xBHZIomne2Xx9Xfud+wgY2AsrLP67dHO1ESalWvwriUOT/lMlTk7onEbVt5Y6WhQOaSmVf+hIkoBFLnqJ6nsnddLIIG8Xh+PTX/K5e08KYe4nLz9GfzVZSImvNBg2KDQFg/vaIepwbc7iDpDkY/7r0F7o4YtGK7JFZ+fOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922324; c=relaxed/simple;
	bh=ElJIj15I7VDEmOYeFsm2GgBst4b8C7b3V/BjoymFWVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gA5c/uHBEqKl1lLIbDTVXxl8ZsbYnXeMSaBkTIKvM63oxA7+mgq7qJZGawd55YY2kJlzjDRt74dMBSHlUbpmYRDx1LwLKQinfyRP6J6jcEes75E/jsrBlLEoEvwJGxOrYw6tq/jJ4weHQnK2GMbzc0vwjqGeinosTk54GhbnQeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dEQYtl93; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso352796066b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922320; x=1736527120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8obrWVZsJoXmrid0pqmVf5t2hFsLjtOlv8BcTL5IH0U=;
        b=dEQYtl93Df3LWWZvuu5qW2QRtK6fz0b649Scup7lS23/SuQ9/KQDOgPN7ppr1aenF4
         q63qwk7oxnvuPpshdbbfQBsnOPWstop+STH848gnsTIChZgs7WPuo0zdLCkMA3uStnAS
         Vbgr0oCnJlvnaWbGknRBenUL2jFQIYe9jkLMzq8XcmEQHpiBe9Wu0DHc/GalexKHJSrj
         FAFPXpjVMUaRJXki7CvVVxhjHwob84XazPeQI2ly5Tqidrm8uljlEjLdxcIXw4vrFaKu
         JkEjSFQtPYRZFdAA81pzamLW/j/7zFSXM5w812OzwOJ8MhCU8Fx3EgwepehiBHIyuZqt
         6+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922320; x=1736527120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8obrWVZsJoXmrid0pqmVf5t2hFsLjtOlv8BcTL5IH0U=;
        b=UKJ3dkoLXoWpZt4h5bWjcq2rJEysPadlKvuaOQYQMm55FRG/FtWyb7Ez4oBSJwYfhz
         l3aCGhbUoSkiN5JP/aM3BbHkwz/aqYfiMvc6SRBBBOJD2ekYmp59CTr+CSEj6uTXd4AS
         APDETwJJ8IEEuJ57BrSJWlvdSF6gbIvKGq93VGD6COfdx+W/j8RAEHxGaqmwLSM3tteQ
         lrfvyzZXm4ChaMesZEv/Wj6FXWG77aXkZh7UlA3owkdEdEWvlngsi+kkUmTWGvX/Pw/+
         KXsbOM/drmqRXqtWeoL2VAz6K9BvgpK4yzhOO4xB/aYPAlAkyCt+WG08RtHbzOPNu10S
         jE3w==
X-Forwarded-Encrypted: i=1; AJvYcCUWTUBBO9rLJYZrojIDdLDJF3auhhDH0bR6onoWi9CO8KPR667KA52/yBXI7UxohR2kmbBMZLNwOtm5XFTOHFdtUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysaPUP75zVOwXdzaXFLOaG4gJKATjcNTlZ6gh7kYbKGiUUOKGy
	U859yYfo1y9lEBA6wcmOQpecBb7O2qjgVbKxs7Y3lpgiL9mg3YHirwSt136OerY=
X-Gm-Gg: ASbGncuXfkQ9I124S5FEeuyS/5E6cfDTvO3yS+IyUUEc42ladk/cDCGZBWhQfpeTFFx
	ATUHm4p8ERjxunhehK1yh0b2em7q/gWgV7d3KclujQVnt54d82XLZhSPvpTqyvJLG1K/47El/Lc
	oKp/Y9BtF3zsuYUvDmMwWH+pxwTziQg4/uFtVQg9I1ymyC80QR1aKyB0O/eOmKA/xSfyqTM4v9v
	418RgIA4+UPlwczei+0TWRqe5vJWAtZ7lLj3Ub7rlqNusUxnOnhIBVDphavY3S1BMNZoijyBnSx
	W1z/9hWbVtA=
X-Google-Smtp-Source: AGHT+IH+DUY6nprcntI+5aClJEE8pz4wAhTYG8dCJD+t8yU/xxOBpHwSJqf9myK1PfsCCnfBeBYRqg==
X-Received: by 2002:a17:907:1b96:b0:aae:83c6:c67e with SMTP id a640c23a62f3a-aae83c6c8f5mr3028524366b.55.1735922320359;
        Fri, 03 Jan 2025 08:38:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:39 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 6/6] arm64: defconfig: Enable RZ/G3S thermal
Date: Fri,  3 Jan 2025 18:38:05 +0200
Message-ID: <20250103163805.1775705-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b658..576a544b8c79 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -706,6 +706,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


