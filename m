Return-Path: <linux-renesas-soc+bounces-15267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B17A78142
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 19:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC78E7A2F7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 17:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B68D20FABC;
	Tue,  1 Apr 2025 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUib5uWT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B120E70B;
	Tue,  1 Apr 2025 17:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527729; cv=none; b=f4crh+aMDapSCOMQbIrm5XFfEN4z4gku2oYETf8oM6/QaoM8jTSr6oPZFxhlG6go1EDES4IBHmPSdB7dmuYwyhXeAbF0Ho7IwUKqryUVE1vxPmxBP4tkHKRTkNlZjuVi24RiQAlyBZmqTxf+He8FX/DkKN74iV/Z2fwQqiUmwBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527729; c=relaxed/simple;
	bh=3BJGiPOJssXwPjxyGxgSDmC7rs1/mCQPLB5hRp+Y5vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqDGGfqofGROR5VE1woS9kZcv9nRHhd5hXN36WyXxOnkS/tRfF107YrKQDDU24tMJdjCLQD9cnkgdJ//R6P+GaW7FqTF41GRlv+t4X7Z1JNBH4vhTlAe7i665ZNWlC8NwVkAZqwJANu+mEfE7q1cRomc3XEL1qLcbGb5eXgrnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUib5uWT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso42629025e9.1;
        Tue, 01 Apr 2025 10:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743527726; x=1744132526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErSbdGhVs8k0qy43FeSn356HONOastjyY7/e5ugVM70=;
        b=eUib5uWTKRWhvS9+uxlhDCHHashFiJxe/uycjBMCs5uF0pymgei1MuG3zYTVygbK6+
         oFrZThy2JHgtM1cLWBZbqrGPAt3crVjhV6CiqpgMgUcdzCdpmH99eOhGNzT5Bylgz+i+
         We9szF5sc3UV0KIJoO3Gw8iUwSZA+6vVGEdqz1Nag5wIZNTnuDiimrtazzc8SYrO0Un+
         3wvt0A1trLxVA/Cp/bC7xfp18egBsFq7sArsMAO+p4jh1sgfLPsfzzJhattZToBOThDG
         vP1eCSbTlDevvc5zTsuNI34xGYl7MLJi8B+g5HYNFQqpdj1a0UfERxS1eZRX2EMOe5NZ
         izSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743527726; x=1744132526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErSbdGhVs8k0qy43FeSn356HONOastjyY7/e5ugVM70=;
        b=mEh4HoS/ZtfCbHIWbxpd9HPa6NOpv9KR3lV95Knc9OvGFle21e5Q7TuAKytP6vh6IT
         cNf+OHc/KudJBBYD1p3d5pqLlHF7hd06cF7e8Pk2IyUYtePQTrG53pdskBue/BWlMQ8I
         pxnfdA2J+iPenTwpszDDuQYAIwOAI3P2kJdR3j4tiTUcsVtN0xSVEW/wIpoGO7duQLZa
         UyuQsfZfskFxFAzoZWltET2ZQ4TER3u90t/sXq7Uo7Qa8qPRV7byaFbufOszrAPIaiKj
         TQ8hpU0ZW2npAIYAzZvJOzmOsIUevh9lS+9aPDStmGMM0Hz8RGNMkEAb84kn+kNUElij
         kpPA==
X-Forwarded-Encrypted: i=1; AJvYcCVzVOmAQAyfe1VY1JWH3GyljTqKZILVcYhhMEQZ4qZ0/QJlwmCU83PXzmxcAMrTbgBikwJafCyD4a9HoVpO@vger.kernel.org, AJvYcCWzU5hHkzfi5y+NSo8WAdz3ku4rHZNkTfqXDCtJ1DXtt8P0AiL+HRtjGPCDRFLXjolN2lvtc0a5I9FJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyapVqC8SuQ8U5J31TM7QvF21q/QhN2qT67Dz9dHfrjjCXUQwTx
	SzOP5d+dorlmFkWVibiFW+L8ZAGZx6WauWUNYASD8m41ZFgTaQKt
X-Gm-Gg: ASbGncvg53sZ1ZKSJmEicC+0ikLyDq9k6sIT1ipT7Q8+orBtXBHVANPXhGthRLm3rHa
	tD6L+bT/efFXK4Um7UX4gE+lazxjCnPgudA1rMmXfzLKBqBWhb67G1+jEU5S6ptX9/qmNHO0IpN
	nk2a7Me3hwLyZsnMesSiDdow/R40H0y4duurBfL+OKYPXDcxHebScOGpexBVxddRHZTIswK8bFg
	3xRnSA8YTCpaNgu8BgFHBa/eD3OAvitmKLfFGUjzqIGinHvd199W9JecbzmOpmn4HbhltPUeU9d
	iKTPFqGbK3lAudpbQ3mSzJWHBS9U8oZaIWxEj9eqcP+ezjz0GEUGOyFuMB3iHqCSCf9law==
X-Google-Smtp-Source: AGHT+IE2cSLb1jVCA2xsQ+K/7WjDcg72n5SZWR3YHJrqrpS+OVsUGpNip6Ni7mXt4MNczrvi8ULp2A==
X-Received: by 2002:a05:600c:3c8a:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43db62bf4e4mr129235865e9.30.1743527726016;
        Tue, 01 Apr 2025 10:15:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f6ce:ff76:f4b6:b6c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfd9bsm162583555e9.20.2025.04.01.10.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:15:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver
Date: Tue,  1 Apr 2025 18:14:32 +0100
Message-ID: <20250401171432.101504-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) USB2PHY Port Reset
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39363e4d95c5..09862547dae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20340,6 +20340,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
+M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+F:	drivers/reset/reset-rzv2h-usb2phy.c
+
 RENESAS RZ/V2M I2C DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.49.0


