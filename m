Return-Path: <linux-renesas-soc+bounces-16033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44CA8A87F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551991896E2F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D318725290D;
	Tue, 15 Apr 2025 19:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjun66OB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E723209;
	Tue, 15 Apr 2025 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746699; cv=none; b=tYyb9ZgUopMKKGUo52/IhBoJRWYGMKv2kb74RMx6lGAExlo5n4esNyIU74OV0HcrLl2W4Ve9ElWmDxEQcXy9DCcAnFC4i1N8z4PHyRin7CyRYw2kbZujK2QJDRTBVXB2OKfqrGFrGkUIEJK9XfbJtsYd3OEJoQKvTaLlnMw0TDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746699; c=relaxed/simple;
	bh=V0nRazvic6zQK6oczCfT44BRsWeJTyKRfajIM079CY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/5wdI/PF8K86m7d9kr5BNlaLIOAVsAZZSs/d5fZZJvW//w/YnHJjirWmueCtryWh5DrkiBlLHjWCo8zRqdHZEDrluFp5XxZa/bPzBh0WrAjP81/qLPwuYeCDoil/zptRUAJTKtI0FZ5MaOVWuWkg8F/P6CweQHr5sxBY975i8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjun66OB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3767204f8f.0;
        Tue, 15 Apr 2025 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744746696; x=1745351496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOPLX6FvWgZ/DgOAhmcsnleBRAoFzHewqjNAL903fbo=;
        b=Yjun66OBycy62mtw5IXUTgC4ARHDtqeJ9Pkhz51NkrneCmYzZBzP5nGNNCVzweGdZD
         u8RC4sFLZrWVnB8AfWaoLG/K6Il6VGy0yYkeF8yK08lh797y7o+yQAi7/10Zt4Buqrp7
         tXH+zJB9aUqd0k4LxkmlUP+EsuudpBDMJi9Wmj1x6MI43jU0Ldr448V4EyTXz/ItCBU3
         t0PkpBfW5TvhiXvwG0kAdldM2CwjhtrBWojgUAUcIOwf9i/unO6Ah+PgEazJGwlu9CD+
         1oK6orYIx50Du3o7O9nD2lT9rbTp7QhOe+VKcsrN5mD0hz6mmIzga4y7nmmpgpCXQ3U0
         hMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744746696; x=1745351496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOPLX6FvWgZ/DgOAhmcsnleBRAoFzHewqjNAL903fbo=;
        b=pHMF8sXPxCo4MdfxXkwteuoKyu7nLr7Rt4bRiiZKIiaShKdm/UJP6yuGMWbY/DOCfu
         dZBog4LMk55u9wRs2BoSk08Y5Kq5S7rSwVDFxWITWZHrqokEMRhITuyEI0/BAMZcvMM+
         KP5aNFbWcL8cmXjDCDmNPAlvnanJYALCIfiaxz4JggexG7qG3/JnB6QcHE1+t4lxxHgw
         r60s8xszqDH3CIIHiFB9nvEmufW/ocX5ZGbKEdp7ywYbPvl4HyqNL/YXQ50RTgF5oxFN
         Rre7Ugv3K3tXDJ71u4mPQgFHotcinw16zUW9VGoNHWocwfMXgk1KhR7xrQxdBMt3wUtp
         THrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+V4Ei6SI2rqrpmwQM8jwQ4l5OYVkM6AN/MzF4x9CeShWFi4wL38WMD8ZyTX9OWep5KGskTZlUzaWeIzts@vger.kernel.org, AJvYcCXmqgjlWGH6Oit4jn/hPjL2qUWEo97c0+b7nJ2JjrgHYiK4qfKqAHeN0gAeaElcF+YRwadNB5hKUcsG@vger.kernel.org
X-Gm-Message-State: AOJu0YyTL/YtNi5+DmuTXWQdgTK08U1LqwjHx96m7L0XYpJJMbCIes3S
	xmxYzK9adkYLhaM0OqJC5hzwEpSPObA0FMxe7gNqQRW9Zj4xyUFm
X-Gm-Gg: ASbGncuieCP3tkcUaqC8DYjfRBpmdFMyUxtO15aOpfFJ9y2fzM39L+mOQzy9EDKmv+Y
	RnURhVqj8GtKIWzjP/2WYQmOC7mIZve5l95u12979hP/VwrRpv/rB4fn+PMN/EVF7Ds+WIkpOq+
	4/L+zNjzvNbESxSvVweualcV8PQCo4JLzNZFru7WhNsJwEgA+GjI7IFNYo+cqSrv9jokzeUV5Zi
	OLRxDggQ+SN5byuEUEZZXeeSkkpTozkivhnTND7jNt3zDzxAavsNAA28ORPm7lKqR+F1/LDalcy
	G9iijROADJs4q+XvZF4d2Vy2rz54NaZH4ynT/MjssK614lXMOmNckNz4mgzLmHZL
X-Google-Smtp-Source: AGHT+IFDLfYxrLB7ZGnCV9FZdtLOxXHxV7bBUEIx9+S7ONVpCsaOYNlCZx45VfOuyMPzxymkWWHmHQ==
X-Received: by 2002:a05:6000:4014:b0:391:47d8:de3d with SMTP id ffacd0b85a97d-39ee2737bd9mr650244f8f.16.1744746695916;
        Tue, 15 Apr 2025 12:51:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404451c67dsm14169335e9.3.2025.04.15.12.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:51:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/3] Add USB2PHY Port Reset Control driver for Renesas RZ/V2H(P) SoC
Date: Tue, 15 Apr 2025 20:51:28 +0100
Message-ID: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the USB2PHY Port Reset control driver
for the Renesas RZ/V2H(P) SoC. The changes include documenting the USB2PHY
Port Reset control bindings and adding the driver.

v4->v5
- Added Reviewed-by tag from Biju Das for patch 2/3
- Dropped NULL check for of_device_get_match_data() in probe()
- Dropped dev_set_drvdata() in probe()

v3->v4
- Added Reviewed-by tag from Krzysztof Kozlowski for patch 1/3
- Updated commit message for patch 1/3 as per review comments

v2->v3
- Dropped Acks from Conor and Fabrizio, due to below changes
- Renamed binding renesas,rzv2h-usb2phy-ctrl.yaml to
  renesas,rzv2h-usb2phy-reset.yaml
- Renamed node name in example to reset-controller
- Renamed function names in reset-rzv2h-usb2phy.c
- Kept the reset line in asserted state during probe
- Added comment for rzv2h_init_vals[]
- Added entry in MAINTAINERS file

v1->v2
- Dropped binding postfix in subject line for patch 1/2
- Moved acquiring the ctrl2 pin in deassert callback
- Updated ctrl_status_bits

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
  reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
  MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver

 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |  56 +++++
 MAINTAINERS                                   |   8 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 236 ++++++++++++++++++
 5 files changed, 308 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c


base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
-- 
2.49.0


