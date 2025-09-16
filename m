Return-Path: <linux-renesas-soc+bounces-21942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3EB59B53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 727DA7A8C9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38DE35CEC9;
	Tue, 16 Sep 2025 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFN2pbFq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88C2350845
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034991; cv=none; b=oz2p7lbw0GXAS8w54Q0fgLzm92R3vlGMWkHOEnOFLeBGuCeGBKjN/NOA5iOgl565xmgAgT1C/cqJZ2WfR5loS3QeSfg4nKdXibRioNPvBwwa3MCxdLKQLC7lMKQnZKFY9UA9XsvNUoEvyOOPnmJgmJ4D45ygjhQRH2UoTqP9ixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034991; c=relaxed/simple;
	bh=p0XHYjWm6PVj5hcDpoyJfwFzpCOsy0hYx3RRzsnxsME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJWU36BvLGFWzK+wMu7GuXpuHq76n5jz+OT9X+AkZZHqn2lwytTiC6/w4opVNdiPl9CAsGT/jI+WPoeOAs4TAKtR2AFRumi7qItQ5W01O1dLhxXckRO5uAchEuq3zae2Dv4eFfsHyRAG9iDpgxbWob518NOM1ZVZPwVIoLKZ+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFN2pbFq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so18486455e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034985; x=1758639785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3K9HF74mxQXiOLLFFTSuE0GixIWTnEsWf8ibJCzoHw=;
        b=DFN2pbFqK62YNH1CqRJaqNGr0TT7JX/c9QwFnT/xpjsWBnvTnjxrVY1AhXOgYQuGzI
         SyF54X2cJ3czf/27KGdFPRNb28X3roR6tJzCCIFaeh8HJn1uAXxr/ZBM66eBRcsR44yE
         ewsLXzZy8Xy9dIbfCMoVTxCelG9+vkeoSMyIIdsG8oaY1ZwMb5nTr2dBmD2dvRKra65a
         OS49FU+ryZaVCfjc19kmeZNdaH2t9kG7ipDG/7XgGsnopqGCdUYUvrdmHa5GBHCjoHBA
         NbFPbBuvved8ltWvIYEfUUYrRQpA75G8wgj753DWt14bj0t5kiNbq+NONphdKhoAjE97
         yP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034985; x=1758639785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3K9HF74mxQXiOLLFFTSuE0GixIWTnEsWf8ibJCzoHw=;
        b=p3ZACid7vzDB3tJ3lG2bh0UCCFt8IQ99/KkPvQ+U8Yn3T3iXYnJkrA0J74ttGZmrcj
         bMzWd+gWZE1aMZWoo+DMYqQJUIPecp/mX3apso+4qA4oKpM7x2XD4nqdln7MAqhZ0IOc
         UN8PeTiIl+KjQ1f/u9hUXvnJX0UMXsfuR0P5vjUcRBySBJr4wretPNZx5VWU4A3JFxrq
         5LAzFf1sg1HPaE4/DkHLRxBCHYt2+a1qdvGI5KtzfIl4EYhF+evu/SaldcbA3Nkeuxpr
         +BJk3raMocciwcFXW5cpWQ4K2nIxK4i26C9CP2BRrKI1eQzMKfYOjp+4awCc0UKR3i8T
         XI/w==
X-Forwarded-Encrypted: i=1; AJvYcCX35/CLRr6DBDOFXfEyirLaYeg5vge6nZV32uiJUD1h+bPxYzpZ+/bnyfJ8rGoC5c+gDb+1zVgDF4Rqf+k05hDoDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRey0xP22U1ulOI1w6fZO4+Aa/WQ7C509pcf5PmtdslfAdOpmH
	VHDNRAQM4BL3gAOsNnq5QFU85tOZ4iuovPEvYx8k5LZfsUGLXtloxCLn
X-Gm-Gg: ASbGncu8Ivvq4IpTMb60UGP9Q+60fgDAbjD6ioP2AYjwH7h2qTZtUvOGi806JWh/JYW
	Z61HSN+FHXZDonV1vkxlnenC0Tkkg4VWc9ggbkfZeGs93BYPWoCUBskruLS3WMHp59qbfkxqm0d
	pAy9GMckgr0ieh+J/tFd4AlkTj1r40YpMvC/PHIfZ6lx1euHZ2U7q/5EZZb7f1GvggJ8m80L24c
	M74Rt9b26w2HtQANjUxvaZsRZZWaOkonGb2I2RTGqveq1oOzny/1pVReCaq9YoF9jVFOnftYGjw
	/uPGnYpnmJZkQacYLJuz0yYfmyKo5fKwUACmBw0/F5VQsZTZ5LHU9OoNeNak1DYqE6165+kbStH
	hRxAE9r42x1CRiAck47qTWOgF0k4XTxv1ZP32T/n+Er8UFGYD3rYpXCDIkdNOl4Pc+D3CKXxD01
	u6HA==
X-Google-Smtp-Source: AGHT+IGjLufNti220Cb2/jo69dHoi79tKr9fu2kHOT12ewBTg4Sxo+8fUT0WB40XsjZIq8dDSZz06g==
X-Received: by 2002:a05:600c:5487:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45f32d49432mr30917625e9.17.1758034984912;
        Tue, 16 Sep 2025 08:03:04 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 9/9] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
Date: Tue, 16 Sep 2025 16:02:45 +0100
Message-ID: <20250916150255.4231-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 69bdb56a3d9e..14356d40f42f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1650,6 +1650,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
+CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-- 
2.43.0


