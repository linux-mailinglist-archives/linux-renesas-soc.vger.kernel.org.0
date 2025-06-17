Return-Path: <linux-renesas-soc+bounces-18450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A9ADCDFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54C60188D79E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14C52EA498;
	Tue, 17 Jun 2025 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2nK/EcW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6532E975D;
	Tue, 17 Jun 2025 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167918; cv=none; b=E3g5JjKUoVQhAy5cVte5cBIDg0AZArRrH95XpOHaGkTP2IwADq/CxWylqE4dVcSlD+2tl9+uwF8f2XFKCWQ6Fwa0WGGXf/80ld/hzCk4uEuOeFiv1KEHAgIdPxgcVpNBbFMNX6xi8fRs0eno66/C3noShFosbs0NKASue9ZtC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167918; c=relaxed/simple;
	bh=BzxjO2z1leHYDjty4qWmrq5BBlFSqcT0qYJbbm0j/og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jodBwChpKerVHrrwShxUXzZOMoBwtMorvHIfxbNrwnlx3QRv5c0DQL7DDPij5T+oBODe2fztloZyQE2RwBRUdv407J5xRULJYCfCnCOXN+0iHx6f0Y1dZq8mTSoZyNSWXijmzdgbB8+NRSKhqs4NsaT5VEvGQlk5BdoO7xpQSHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2nK/EcW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d7b50815so48657655e9.2;
        Tue, 17 Jun 2025 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167915; x=1750772715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV8mc/E0A+rPFjLDN5GDkaclgYEmX3SItNdHdGCGzKo=;
        b=N2nK/EcWsdaGWB+mSGXsZT84fhaVHiWVhRGhB8o0HieDNTcM+w7Z/KHGs5erxbb8Db
         c0FVpDYRNtYbahNYW8TqzR/I4sdOwG1TJUrZGGAfTRE6oREm8jYfzWogZ7MNmaXEwlq+
         oNlLFMXKw5YZ/2+Ne7yyRwo4qfScKM9PAr/DlC8B8ynHFgtc6S5jErT00I9YszRB+Ikm
         j3HrGLLMUQax7At51kyyxLMhGl4QukEOIZoC3ey7kZ+4cV4wtv81khM+aKowpbZEuup+
         tJhLr/Wrqu1PGZTpWpju4q0osb8PvPM1ZcNjWgG8asC4VUXnnMabV7KJnOKRAHFZ0ABJ
         jkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167915; x=1750772715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV8mc/E0A+rPFjLDN5GDkaclgYEmX3SItNdHdGCGzKo=;
        b=gp8k27n44+Ft+bHbJM1M0nCvlmGyTlfMFOHmpX4zdjx7hbdJX//VLbXv4m+S7L0V/s
         w7EPbR92Ka/zT5RvwWs2OAkE35gZbTa+kARpgjKzZeXLw2q57t6L+VXKi6aObI3m8Sey
         Em7q7kCPbhzr1bKTgrIk5qF0aeZ5y3oqdRpRBWgo2ItuyZL/77Wfr/Qll4WiML4t0ZbP
         GNkAipwkpvBli7Q646hPiiw4UX4pa0tJoMvACnc9XHLFzfnuVW3bsmZwRfQj3qHWNQI0
         l68XxBWXz8DR1pSbOHUcQNxUSMRYIA74EWlY6jnUBpAsUPsKjuk+aomL+NKfrkHoLX0D
         E4OA==
X-Forwarded-Encrypted: i=1; AJvYcCUBh0QLXaWTDU8fYGhQpwXACTmq0vS5gjk7KbQP1Py+0cKJKr0mFNz0ihzDTuzmwzIqxDfh40QI3/HzNcT1@vger.kernel.org, AJvYcCV+jhmNzmvVf5p7rFrM5UZcznEpiN76j2T3cST4VjCsR9eLWBSLnsD3p8j605egtW75VmdHRiNnB7JC@vger.kernel.org, AJvYcCVPY0Yt/F0Qj5XTKTdpUKHVmPnyt/WAK8RfDd0rkJVn5nkyIfw9HbsqkZtre/I5EZD5aEnTB3r7K//h/AQB@vger.kernel.org, AJvYcCWcBbPx/rI21HDo3zqSayYLyXfLCGG04yJhRbPoBm7Q+AFNPd0pE5MSFYmY8PzqCl2HYh+yHPbfEr7ZXO20iKx15nc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys64j6gkfpTqu3e2L/c9ixlp+TzdI+ao1OqHWHWFVKalXorDEv
	ZmaUtqnPOmzz+NdYce9jhG4b30p/jTydsQQysVDyz4sL1YlPx6AXv6wN
X-Gm-Gg: ASbGncsjszgkVcxigER27WvYM6u+0kRusHpDaLFt4V4PXNqdYbfQuSl/rO2AXRrKrF9
	3HJ8FPyKBTyBnKLsCcaRcrSPkyna5kuah8oNdjC+CHcPHEBS6e3BFPfB8OJ9QPdyWAgD75BzZ+b
	VUveUI0d5AHnXMxOelqrMw0rig3Lw2I5HRZCEiRwdiaS7a5v51mZsCCkQHYGtzbCl6LRHnNulMs
	e70oFWbZA7rMzAYdNccT+k7+GjvN3RpfuiwRmXi/E09kme3lRd6eiqQ8zsMI8e2RNswk8dwpcxJ
	buh/F7PIAZ7obnZ79CLnFu5U49sdnPRAA6EvHX+Gg/kTadeJF/1mcReQ3LgYdYXERBfYtLiblji
	yzI/uYCGKDWM=
X-Google-Smtp-Source: AGHT+IGoVGmy+0cBQSC3INJh3nwC+DMd3BPjaS1S/WZ+Jo80+/MgZyl3Q2iBu4iR7criuZ+EScQZJQ==
X-Received: by 2002:a05:600c:8b8b:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-4533cae9345mr155234975e9.13.1750167914854;
        Tue, 17 Jun 2025 06:45:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Tue, 17 Jun 2025 14:45:04 +0100
Message-ID: <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96e21d458867..937ec08cb859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -495,6 +495,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RSCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.49.0


