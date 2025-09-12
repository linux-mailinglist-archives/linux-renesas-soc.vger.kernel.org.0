Return-Path: <linux-renesas-soc+bounces-21822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1965B54DC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 14:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70CFF189AE95
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 12:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A8D30EF67;
	Fri, 12 Sep 2025 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UuT9PLWb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36430C350
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679903; cv=none; b=SU4rPs5eEx31s8UoCggErouFRIlR61St9HMe54DEE6GqzOx732QlTcjF/eA8NNfMznIqXXfKRKWejfVQoczhHrYFbjxGGXcL0xSNA+sc+yPEK0yFpGq425Vt+0/r2Dh/mDU0g2JfYrGGx8aWyxwGTwy3gE5SeQL1jIIcAWpxqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679903; c=relaxed/simple;
	bh=rlU12FG+4sUq0XnXmaxg6zY2V7ONJn4T+IfJgTnkVPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/f4yF3vpTv1egT7JRt623r0y+0Qj2ePPgllWa2YBBuAFefiRKphGy/BOfFu2w9TtEtYf5zZ4hbFtL0MyLcNZ+GNUPdBvVtjmFsYOxqyYk7bPxYenjpRcdTbqX3V9saZulrJSGHdIfdFJh8RA2PYbTJ6lra428cv2J0GPTOHzkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UuT9PLWb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3df726ecff3so1067082f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757679900; x=1758284700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md5nkDmRRh2gMN/cfSkiCbamlknh5oiGopcdy0QJF8Y=;
        b=UuT9PLWb2lfWbAIh0WkT7qwgzoW0KT8KC3XMLU9NE5FRaozLRPm4CS8L6q7a35uSL9
         49+DAdxtYhNJIrCiw6sz3BYnCMkDSu0MIquWtcQAyeAOnLMJF+LNcb0dvIgsKZpYhXs9
         5oq1c5B8AZL9zrdbYBR21Q/Bn9wbOSsKvzA1WbREOC5qmtIDZ3eHZslt/6rKxr9Htf4i
         g7JJrb3SosqooP9y2AuPB+hZdsII1wlGE7kHcYf25imF9A1TmriSUzDLPyC6GDLCKGu6
         8jQbaSkmnJCymmITs7rPIi9serU0ipAcFhuoSMuSm2EKES7uZKHNzpd2e+Y8WVA77jtZ
         hAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679900; x=1758284700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md5nkDmRRh2gMN/cfSkiCbamlknh5oiGopcdy0QJF8Y=;
        b=ZhlM+1wzXXUU+BDHdccASfNXUFIQqu3HVr8atu4fRAANKjvIk0WlgQmbqiPwM0TePn
         KeVWU8rGOqQufRt8oc6OTOQtwU6P8XyjX4qO/8YAap5pEzcl5lAnn59ossGRv+7U0rr2
         7tGd6Fc/WKgR3foZ45EIn1Tmx7FEVIXdjCw9K3J+BZ1xg+ZHwmpqrrjcaglY8FylbEpM
         J2Ujv0/84kS/W9eXvv6zlAVKG5vNcjcj/421YBIuZwxrfFbREPSc3v6urIv42YHWxmGn
         hFbh51peNv3IyUOeKEUAUFXchd0aY8/zJ/+W9RNc9/s9gNw+UnLZVl636pCQRktTR2Tz
         qtzw==
X-Forwarded-Encrypted: i=1; AJvYcCWTfTHY1fC5dv2l8YrW4TdFJp8pH7lGS6+nDWH3kZHw9WOliflwXY3dn4cEQ9sf0hqIquYvSEtT2fJTDCJvGj2O2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5CMxMtto7zru6LjpXMTwa6d6wIfBtDlS5Q6RCVk4rRIWcPvUq
	VliHbuHCeg8sjzBo3jHGukdOrSUx3iG362k5IVekmfxlYDLn/Swk1U9BBcKxizietcc=
X-Gm-Gg: ASbGncvddSN68I5oEBPE3QxLtMTs51bwfRqzpJA66zmWWOyu7e/nlVmm5OA7moUDTx0
	f8qFf+cRkKxbCIRQicDCVYWaAXLJYu1qYApwznx2jq3LzJAxYnCaAKuUpkKaZ20dK6250bGgf6/
	rQPI1hN6mmqNyQabevBoeRSVgd/Z7Ckv8IfVZtTuHxdH+i+0HziawAvkq9M8vfFHgOrRtlhYHoT
	nFpKSPS0+IcaST0BjKosWBRkZAEDBWknZehMQQOzAEQ4T6uRrkZrAgx2pVMMsO+FYm32Mwr0EpK
	RD269jthYoGD49xfjc6CAt0jkkoyRtIingC44P8n0qcJ3oSh3jejlCWxa+k50sqR6GkvoXGPkVS
	PbIJlFFkVrTKuYbqjOgLLNA6ma1z3go2hZGQE25ZtwZMzw7mKTghn
X-Google-Smtp-Source: AGHT+IFeFgkWbvNLPP6zQb3x+mqbY/nkKchmA7T4My9baxdYYpQETFEEocYlizuFZpzNAgPRzsrfUw==
X-Received: by 2002:a05:6000:240b:b0:3e7:6457:ca85 with SMTP id ffacd0b85a97d-3e765781280mr3017656f8f.5.1757679899686;
        Fri, 12 Sep 2025 05:24:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607770c2sm6320091f8f.8.2025.09.12.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:24:59 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v4 6/6] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Fri, 12 Sep 2025 15:24:44 +0300
Message-ID: <20250912122444.3870284-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- made it builtin

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5dcf36e99cd2..ca731843a9ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -230,6 +230,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=y
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0


