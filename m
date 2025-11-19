Return-Path: <linux-renesas-soc+bounces-24829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E3EC6F799
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B5D374F0B65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3846B3AA1AA;
	Wed, 19 Nov 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bPqUCbMN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422973A9C10
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562958; cv=none; b=RzKlsWTeXs44K8+IK0/RCcqP7KMow5N6bAvHW0bZuv1mliDYY96k6X1tTVyX86u833uiw/bqkaib1PJ+O+X5DTT+TUxYDnWYsO5l2fbuNcsEwz96yJBR/B3h+lWorNlv6gFpxf8/ofXPpwnKktjY8iBrF5XKvQnYDKeA6z7jvB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562958; c=relaxed/simple;
	bh=GxxNnKqOhhteuHOBQbAn6ykS5DynDGw/557Fxfc/0MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLiyXWvy+jJmTJSF7vZQ8R9jQOMugDsnNbJH8erUsaiZir+veIoUZTJczJ6xgbHL8KwShOAlwhnXnUOTVh6nlFHa4N5VS5gYjRJPWNLLFCLA7Ogsd7R1BJpQpGZayXO/GuvJt9YfO48cpBQkCPKHhNI/GEI4wLtUuIG59Jq1f3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bPqUCbMN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a1c28778so43425715e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763562954; x=1764167754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE8+3pdeBgHj1yFTM9VT3Mx7PcWOCuB8Xgf4pUk7jgQ=;
        b=bPqUCbMNu+n/VTE/gI8v9H9621pt7VydXpcpFX1VcbE5fCRXAHJd9K2lv09NvIQ0WU
         1z8LOg8d4mXR/X23Ki0D0PEQw6rbikm6/qv96guleehIfiZ8Up+OJkLALModhiDwHZ5m
         xHxFjL5ge64gnkDk9Be81JZ0h52Y2bxRCpcP7Z/fFP8ZsOjPyWvRGVZB+m1nyG7ZWBRu
         wVd/5ywQZbY0nN22f+CHYBW2lEUnJG8fr4cPzsoFKnkwXcT4ZDt1NkmklEcwi9JA6qmV
         dzRMCubbh+g+An8RJEKA9XxPxtuZEzTspxVw2W1K5+zPjDFlKhuEph9Be48q+8jXW/1K
         L0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562954; x=1764167754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YE8+3pdeBgHj1yFTM9VT3Mx7PcWOCuB8Xgf4pUk7jgQ=;
        b=ZvE68rrhIpHC4P8JB+5CDzl3t2sFNhG7UAljWn8bwjEaUbp3EWRfeOSOmgqXnh6PO5
         3nX1EPJUln/woM3FNeG6lHr4OM+r8iZxL91FC7VIoTaTX99SnH7yCDcSK4XnEnMHzf90
         csAeETimi0XOP9EirkuGyni1txEVHsv0JsrD7szYDOsu3qE8smF2sU383OPDOIW2j15q
         be0v9NJqaYl5lr74EYMjkNUdp0kXoC15j8062GHz9NLx1UA3rsm55OmhZ2uf1dgczKdk
         eHs4A4C/gTmDGMnA00xKl6ORd0CGwkCdeYDHSuNNIvWi7utPwwdxr6ekkBIygqKTNygi
         KTcg==
X-Forwarded-Encrypted: i=1; AJvYcCWf0UaFiSx5Pu0aXXI/kxrOwiKnUoHKYK3UcX4pkz1RLmiNKRsXDQMtwNvEUAo9vE/yM8XtQom+pw3/vR/uiiOZRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxotPqFFSA7pbIfAMlCPyqvCoF6XV9XUlmpG/kjPJz3t/m5ldI1
	46GLV63WJwLZxSFC9epyLN07BiNpeq1Ta7Cx03I1peJqKn2Y2Z5jWCIUgBryQRjxZ7A=
X-Gm-Gg: ASbGnctC3PKKj+hIP/L87RtdoVhWxle0HbEqyCehFR2Nw/MEchlBnUcWPLHZNRVQU1C
	Xyg4P8V3ZFJvC/+flFz3GVgqrY0L2S6gQkMSqSLvpcyCUHRpxDnszHZb+F9cYOwq1nvwWUhn8qo
	hp4I60eQDHzjn/nKHbjw3vlwsR4sTd6VQg9FVTvVKdxJFgj72IMFpqSZyY3sc+ARbxOgdhNkJ9f
	JnT5RwAk+BIm1WeVMVoRElQeSR7IrqaNWGOh9kqdRhLGq6crg/P8cFQhNXweC284SKrwzL9n5q1
	bJu3StWmfJCwyEfGaL5lneGQuLU9yFVsE7nlmJ7a/PogxkVhJJJL4kP81dNaWF8mas2YA1sbsOt
	9ykGYH5eIFqr72vBWbLcitqPLj+k+s/2UaIVfdsjv6fdN2BihPmmQhPqL9Z3cOifWBuJSpQgXSd
	LPVCpab34MZ3cYvxLMgZ8wMpLW4jws8vc+Kn/U3VxuaMM4Egmv3Aw=
X-Google-Smtp-Source: AGHT+IEd2Ccf5fjluRhtVp52Y5wk7ZOl2KQ0o3HpW4E+mTPRtKka6q7IqCIxDBj/nihRBjkex/U8QA==
X-Received: by 2002:a05:6000:2585:b0:426:ee08:8ea9 with SMTP id ffacd0b85a97d-42b593901d2mr20461307f8f.44.1763562954457;
        Wed, 19 Nov 2025 06:35:54 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm39973399f8f.26.2025.11.19.06.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:35:53 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v8 6/6] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Wed, 19 Nov 2025 16:35:23 +0200
Message-ID: <20251119143523.977085-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- rebased on top of v6.18-rc1

Changes in v6:
- collected tags

Changes in v5:
- dropped Tb tag

Changes in v4:
- made it builtin

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..54fd09317edf 100644
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


