Return-Path: <linux-renesas-soc+bounces-21676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 021EFB50501
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F029E1C64460
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C968D36CC8C;
	Tue,  9 Sep 2025 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC2rCfQd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A936C071;
	Tue,  9 Sep 2025 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441298; cv=none; b=GkM3MN8T6TYM8Hw8OohWeOd3KN01Lya506I3AYsfaZGXm3aL15itbdyzDRi406/JGxGsO1qVCCaVtJvWhg7rlLdtCV9tAk80NSSfIeB/4cmXECc6N9vIUE1MBanNEuqfHGbQ0jq95GHwa2J4prF6eSDiamXqZNUOQYx24OSD8aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441298; c=relaxed/simple;
	bh=gszacyhMLDZvnMQtMG1AewO0L8TIfVltJqgQSaZWvM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6nWDwqdzpqYlFy86XIBpw5ACfH11WA20KZExgUTqLAvlZlqoKH2SVcTk+1/Natvmv6zpaSuLMcP4yJx3U0lm1Jbn8KHC1VRK7fOUi1kvM0ABCE5r7JGg+w1/IPlve89y7z05z0y7vysfFTUYyOG21W1uoo9bvD+J3Gtl+jYxe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC2rCfQd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso52292915e9.2;
        Tue, 09 Sep 2025 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441294; x=1758046094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxawcVMUmbUvqqPxaNpdk+0HJuQP6lj53yk/T+9Nz1g=;
        b=SC2rCfQd1AgdsR9E1Dg4OeScHH6yNkCc8JNSydZHkKBoHtwNf09iygQuxfzn7tGv5d
         kNlP0gl5hkqHWwi3pXMhPWQaCG92iyHtws5L8FFW68DojbZ96KzvOpdgZ6hq89DIlU11
         JU7h+D0xE59DHFc0lZnHUNO/cenQLI0RaBwsukjKVfWetWiYTIZd79ACMTw83Xvqa+6W
         WCouvehmCojmadMuqY1R84qSzLnVMcP6btyPxYnlPVKSqtmPP9rd9wP3V3KEzQ1o7unC
         MGxVHqMwqEXjRYR0q7bKTp7q/qTNfGFgPJhD1jesHNNrwEbZhNzHPOZUzFXqQf/yNZ2f
         5+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441294; x=1758046094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxawcVMUmbUvqqPxaNpdk+0HJuQP6lj53yk/T+9Nz1g=;
        b=I7YKVJmDInidllI0GWTh87WDQ56BcOCI8DJLdKT0iV+Nr8YKgkUevYJfqAKxoqs9oZ
         diE6BTXnzVlMHwfA2vQKaz/gOWkmBbyqyzysEJAulJdWjiCTkx32ez+uW0KLGHWScqXJ
         OZe+7GUmmneEFRx60XS8SQF+IUy3chauLmxVMZ+asx2+Au8qFh/t5SO7qVqAeZ7rxVnP
         B/gEjWob116H/fu9IRKzbUecmkB0yG7dsib9iJZpUI9Ni2sbTIbPnkiZLT/CQ0WseHtx
         umI2w82RwCQ/UH+HS9KWuKfqsVrhusZ+SKRzQmOjJh879Nm3SheC4HYYQh1Cb5eDMIOb
         OY8g==
X-Forwarded-Encrypted: i=1; AJvYcCWBSuepsFEJVWubnpIuFO+Yvy9ljo77gk7zdy3v4ZZLOatZq+Igoxl3hpMFA7RG+iqJ5AS6pQmUOvzsG01Yof4gol4=@vger.kernel.org, AJvYcCXY4Q8OwDtyeIqahUtUAZ3G1afC7S7vfRbPGXfYN+hu5qa2tv87aOJYO37JjKiU6zc4LxpMkzUU5o0dScA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweR0Nkg1BGkUyMhXnntd4YNhem1oqMA1kRlFuTdOFKLRsUquy7
	9v4dF6WycysSbSS9alULRA4iz5ihY/Mjno9xiTnd61krbmx7NSN/ABG9
X-Gm-Gg: ASbGncsOEONFlP4YXuBIZ4byZpBAyirQPPZBqiANKbVrfWj0GxE8BefGNE5FtW5z8/g
	urW877cqq1Z2FKk3VfF0qNVY+6VGmK5GYaFvGCXz1qmAyEOIxel+1tYXzlzE7Pr1dQK/hUO4PFO
	ZP2Y0gAmaWf9IhpZ1fAFcWNq87uPWSvnWi+OwNrbZQA7LpS+mMaanm9DlCI0J7t0iD99FP/vBDg
	FVSWRWx1aFWe6hOkWqZPbq2BAwNaZxZCYoCw/0ZWF3hAb3UuOsRMyUywNOkNqyjNj4dnE+1zoIU
	gCirWiACnqfuQma/K+D0VDJw4cfZXaVCMt4vrWa0jFaDB+hcrOkyAv0Dm1hbv+B/oQ3BHQFQdkL
	h2WqF8qoXRJBSn4HS+GE6gMMbEfB6msNbeHA0HMU07yNIToCKHXET9PWMchAeA1bHntGFBr2RVV
	YoKA==
X-Google-Smtp-Source: AGHT+IFnbYT8GYyc5eCt+OlLn6Os29oq3eYhN9HwkDz5ihtSMZY4WJbNOfW/8SAxRHklUlK0Uch4SQ==
X-Received: by 2002:a05:600c:3b1a:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45dddecf404mr128077615e9.24.1757441294286;
        Tue, 09 Sep 2025 11:08:14 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:13 -0700 (PDT)
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
Subject: [PATCH v2 11/11] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
Date: Tue,  9 Sep 2025 19:07:56 +0100
Message-ID: <20250909180803.140939-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * No change.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6d9a330e3287..a93dc6202d92 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1649,6 +1649,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
+CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-- 
2.43.0


