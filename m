Return-Path: <linux-renesas-soc+bounces-17041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0CAB556E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 14:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCF31172F19
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 12:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2736228DF1F;
	Tue, 13 May 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnMTbRlx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE0328DB63;
	Tue, 13 May 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141150; cv=none; b=Yis6tG0TF6tAQgnpocPYKWzoH6tUIIJIQ1vOS7V0PLJfirBfm4Pkd9impqWSBzpO/VQFn4tc8YERWqpJ94tUDn35UfFhr9n/3We13ie98myMmL1GmVJesSRqQKFMxyg+gPB994ltjnPXxrJhwtjKX+DmIsd/kb3K5BoQJM+h+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141150; c=relaxed/simple;
	bh=tf0jFY/TSrmrdAxa/ShEqbM7ixHECcRUaxvLEZ8CbZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBYz3QU1eey/+iskJfyW6+y1/zFvhiioqdCs7i2gsKODTCR4FX5McSFbmyQQ0E7NHf06QMgSOZ34lZ/B+vix7UUaCFsfx/OFTsMxRnDBmpxmEAPCCL/M4/bvWmlr6EmlrgztaPuvEuB/PVpoDrYzKxLfwp3fL97ZcIZdmkny78U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnMTbRlx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso37276135e9.2;
        Tue, 13 May 2025 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747141147; x=1747745947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4KUE5PwbLuRO17xX3E9IBzNHOEezC89N05pYrN0JM8=;
        b=fnMTbRlx8bTPdreE382AWav+mNFaUnzQcphLA9Mitg/diSexZA6y5pi5eCRO7O4TEP
         G2tXqcC/DVL3dHVckqCVLeCBWenLEHxCMOkI1kuVa9xx2x/sazQ5bKhfed63d70cLt1h
         j4c1AjmxWszzn/QOKctnGgV4tHhWpFHYDUiaSBMjaWBznWcZt0lO/c0JfCcdcdE7suqd
         utAC7Npo8leX1ltVjxXHMvkmPjXeUzbZaLO5t2xXz3hvEZuGA5hbqBoUWthpnwcOjF8F
         FXsssf1yYtTK3dIX0NCxIrdNZlA9l0EUSIJOUlW1QtQN32lKvE01WS1r7nqshNxREFht
         8+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141147; x=1747745947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4KUE5PwbLuRO17xX3E9IBzNHOEezC89N05pYrN0JM8=;
        b=Uw0iH+67wguhq0yZbWRM3TiUe7ZJLQO/EbHk+ogTrj2DGYtvDpxPlIxQkGziE0ujOP
         rReCNN/jciEQI7YTRz8K0VUFDnR018WS8jXZksVCozBZAlBMBxxnq+syS3Tn10R1yi9a
         1LJktBbAo/jmS7c4Kddez473vZcWuQm4lUWLmxrMI5qCT7gl3j1K8FjUDxaQIXJxlUD5
         PSpLpDw2c1jqZkZwdpZZrJBgYAQiteMD7lp972dJHRwCJTnNxlrsZywPFoUI78mTWJrp
         UaUBzoycrODKMay9JcWNKJGqJ2tM9DMp+iPjl2HfR0PK4lGo/+LEjKQcP6NqJ/Kd4n5P
         +6Og==
X-Forwarded-Encrypted: i=1; AJvYcCVEtsbNnEiaTdCeKmHJJfEfqRoPk62ZbblGXtdx7Us4uY3BIoqCPo+5TVkctWd1/GLUOwKwXeNuZMvSgT0=@vger.kernel.org, AJvYcCX2kkcgfGDfcpBxYq9CwZ2rUFz8ltQkHvbxP/d5iJwuC6usYr2WLdjApNXxgIr2vCWBkZr5ZVDa1jiYfu6qFEbKetk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEbn83cnolSxi1lYeasjKWjHdrkBdFYWfuDppzr4DELCSoCT+
	bJ2VESSAny/FhHje/0rJgCSO23sHFAQTNzLqYzVTAi91rCPXkLiqf1hD2nlv
X-Gm-Gg: ASbGncuDhawaulTMgR0NdB2CpsXy17FusmY4jniM/7Eb0PN6S2LpVjX/FbHERqzqd7R
	KrCfkJsIS20T0/KbPThVROjjuhQZH47+EW3f+jnCjZSAM1qp7sTsLzMNBaCkN5OMMZlxd82csae
	jkx9QNhOl7fMwUDr+7IZUJTts/rRMtM/8xbUl2bXxXexjsuX57EGQY5EepG24+WXpgTRT+4Sxva
	duSPPzfnspxrP7f6xr5xeaacbNpkfWVgRHs8cvCaCvebESQ4YzQzytZ9TPk2aziKArMvMCpxwlO
	jtQT1TpQcSVsdJ2XmAisUFE23xRe7tNqCojMm1ai8B/xQkxzBeLHmwSeYfwUswiVR/UVzWADUd7
	gOvkXw/xyNEIjR21deakc
X-Google-Smtp-Source: AGHT+IGrGbY/B7j0dC6au6j3G/+LoFZKy9rhzDsTGCOWgRKsnjHyUXuPtdByxPNlg8XArd2DgLvsrw==
X-Received: by 2002:a05:600c:8212:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-442d6de0e29mr175513075e9.31.1747141146338;
        Tue, 13 May 2025 05:59:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeca5sm215741905e9.26.2025.05.13.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:59:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller reset driver
Date: Tue, 13 May 2025 13:58:58 +0100
Message-ID: <20250513125858.251064-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the `CONFIG_RESET_RZV2H_USB2PHY` option in the arm64 defconfig to
support the USB2 PHY controller reset driver on the Renesas RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 38d1c2ff3aa9..457dc12f35d7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1550,6 +1550,7 @@ CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_RESET_RZV2H_USB2PHY=m
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
-- 
2.49.0


