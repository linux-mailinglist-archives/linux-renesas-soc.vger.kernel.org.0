Return-Path: <linux-renesas-soc+bounces-14770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9AA6DC46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 14:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259DE16DE92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074AC25FA32;
	Mon, 24 Mar 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M6drabyy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94225F99B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824639; cv=none; b=PTAWWqa3cPQKCn+aCL0DlfTUfaQawnZFrnPLHIUQpL2DzHtkOT1hBQRHw6XooA1AVRpCij86t2QYzEt/GnJoK+j2DlCdDZcH67ObnKH276Axc+PFRcVBjG5p9KMFm97rkngBj73xLuWB0yLY29fbJzwIxpp0lo8VQZcm6jJv05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824639; c=relaxed/simple;
	bh=MoEp5ZcQhE/r7CJZd5xBLtT4vzDpLgktl1nQu8ou+Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1xwuzJgdZhw4wR0eGGooLPzSzxuOQxhWS1pTZQcIlzlsyXC7OUfC+gDQWVMfiD7A+jVepdfMro+ALKtX+KFquISsoB8BIQMNqPm23M+AoC08AcEWgMzAbt8beMrWn/xNuArUMPqvWqcmHReLZAg+kpY0O3jd5aTL1Ad3hQpT1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M6drabyy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso32937495e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824636; x=1743429436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZXYQlywBGjxUCQ5Y1L04Uo3ant2KBX+A6aBOQRIOrE=;
        b=M6drabyyi/z01OwSHdmg7VKp4cLSJuykKmkO1o2xwiMWEeMwSRQHzdq9GBW2pLnkeb
         0wDrhkAL7RRJ2Yecwz7LjUirkPLcv/4u22jgwreT5giFHDAjmymUn2H+crVBpzYTT9Rd
         evOUDLeyPvg3VDXucjtXN+IW7j1Jw46wFckgE/2Bt2GD+t/LXXo6NOHT6WRRyprwEYDJ
         UgkmqMKYz0/sgDFCM4k24jjJfvbK8/4mo3wICsVHe7efVAEGH/JxzD9wPw8chmOHIw60
         13rXfkaPfmrNCCSXEAwg154H3Oj770VFbDDnRkJFpBIpQsYfngVjr3NIf1i/yjbAlnmF
         20gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824636; x=1743429436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZXYQlywBGjxUCQ5Y1L04Uo3ant2KBX+A6aBOQRIOrE=;
        b=se9X7mD1jlBeXKyISpsC8/8BFzdMWcRSxxn+6d40H6UqDkuG9WEoMeOirWZ5it8mcr
         kZBxFBHsyUAxFk3eAz+Qy3crB8ZaBzCPaVlA8KktLtDxb/zCHwSRG3d/xRH7MbfjMYru
         QSkiGnuJNDNx/AQa0bqHUkkjWY5HywxrUv+KYdKN7BXARBktE7sjWaauA0yMcyDnMbCp
         J6SApA51kG2mBkpJh6UlDvFCVr/brHbg4zxzrWIClqRm58O3YyzpzW26M7Rvw0072MEg
         uCdca4dqrqV43TcSXl0b+7dJWrORSX5gSktue3PGWw6H601oxhM9UMGJZSY2rnH6yfnU
         Ttlw==
X-Forwarded-Encrypted: i=1; AJvYcCXTWKekhLGDD5sUlgfGyrq9iJKJybrzDFfP9Izo/QM2W6fkbHFleFgRpTUMDgQlijTqmv2XwQk0sM8h+qYhB3oLUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Z9EjTw6xH4XDfA3PODCfjFfVawp2TWK4CfikW5QyH6Kp5XGb
	dPMgcQsb4kqMUmHGh8ojhKjeWfcpcUWTz2KdeXN9xQaUW2Lmh4T0GphkajL++18=
X-Gm-Gg: ASbGnct3nuISGJBo8MV35TQorrJbwY/tcDon9Ozk3sXYJY9Wgbf2UdgF1R0JY5iku5i
	pKPTaTC7EB79QxYg3WRWeeLO6e9xrQqyR97shz9O5TR9TsTaWKoOzywAaExPQ+X6t2EGbU4M8UN
	X5PKuPTE8Nii4sSJcUZR5uQt0rbkaEq0UCT6QmFkIghKaRZIAGQXY5YGI7G5WYgp6qumb3ohfqu
	g4/SI4AEyBBFIIzbNvRVBHAQpgFs2CwJ/r8k+Y3Vti9lvUskZ1a4iKgUQHAPSZYbjablMcwPjEm
	Yf3syPS3OSrZUqrjxuDMuxChnIGNa5iygnJtXfFoMRlpghmm8LcfXEex5Elv8RECCDTEpWGYjw=
	=
X-Google-Smtp-Source: AGHT+IHDKpLBvO3q5uFPvr/70DmnnwzOfgKjpHIucZu6pM8ksgy7yC5qAGJIQYpLCs15vezBXQWNUw==
X-Received: by 2002:a05:6000:210b:b0:390:df02:47f0 with SMTP id ffacd0b85a97d-3997f9336fdmr7677171f8f.42.1742824636553;
        Mon, 24 Mar 2025 06:57:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:16 -0700 (PDT)
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
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 4/4] arm64: defconfig: Enable RZ/G3S thermal
Date: Mon, 24 Mar 2025 15:57:01 +0200
Message-ID: <20250324135701.179827-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..79e566f0d47f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -715,6 +715,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


