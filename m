Return-Path: <linux-renesas-soc+bounces-7256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6592E779
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 13:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D0ABB25D03
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809B3156F2D;
	Thu, 11 Jul 2024 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LqcQmOhE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADCB1527A7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698741; cv=none; b=MQzKbCWW9X5M+XIM518Xt66Ex3KEWul1JW+sIZLLl+7WCQHz+h4fL/27ddoQyS3StjifiuzecB22Ss0yxQfqL0lZukr7Fs/sXDxak60sKVCm7nWTNdQmiLo1pRt5EUwL6Pg1skul7T0sK4tncMyxifEin5ABEk/mKf1rrS/E8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698741; c=relaxed/simple;
	bh=zWdcfiTIyyPAuOM52fLQggpwTWoly0MTLKNObUuKJ2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LbURx1dsdgKRJo9u12kPnJwvpLf9KUuowi9YahjFVcsdOVxqkq0yYT4H+6GPxoMoynyXmBJzX15Pfz6dJ/bEaayt7curG07+Nj6sh3mjsupIcxylY6UR8I3bArvLcdcGxtaM/3y1i3cXOPklozFzi8psHRohNSaWydrNsflF9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LqcQmOhE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42679f33fefso5214975e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698737; x=1721303537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AReyoq8j0UYL28c9GONhdzqknSDiTsmJyCU02ojVz8Q=;
        b=LqcQmOhEfI5QUc9UptUSejeuVDJRCIz1fjVx6RV8WwHxv8MnpGnrKd1OKq6AQNu1Js
         uio/9+8cY9W3mrvVVpw/pvrRngYUBeQi+xwv6qTOy/9/Irg4SFeTWPIPuW/q5n7KLTgZ
         HA3EezxzPXrHzlfqZnUjddNbzVWXq56RJ8vAOZDcjMMtjFbsS1y992sJ9ns4Lbgakcab
         xOaNu/Ur9dvyikbqJRCSWUNWCTI97izwyT5s458L/0bahC5LEbV0XT7arN9/8X3zg7g+
         HSZ+2aRt2JB63nSuKParW6WV3j+nv/F+7lTstcbwubvkWquE+qvjRIsv53IKvq6mjoQB
         2zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698737; x=1721303537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AReyoq8j0UYL28c9GONhdzqknSDiTsmJyCU02ojVz8Q=;
        b=RC8RbffMgIeBaGgY8LJDKthk52rytWPHztj2HOFC0AEq2qtn6p1cHxnKIlyYVNx8PE
         sKOQw3adb/n5x11daycFm5dElOapjKRUzSLomrzI9kzqqCoALuGd8CsQGRqSEr2WdGus
         UZOneiahlvRxIwM2aLFH/QL4zs3QOMFwAGHesclJfPRnDGhPxWBsmXLbwxx2OktI1y0S
         zxh6BXOWbY8dc0TE7pM7ID2YssKgtwgStTN5wFExj6oNGy1zo1PEJelwy7QvLA3m2WZm
         tyf8+sukm9QP7bBujtFlwh/mleauMJbm1kGdhjucAX8yJmcKeN2y4D3V99QWQEMGfPdS
         wTwA==
X-Gm-Message-State: AOJu0Yx4Bizdq6VJHBUaiwvYqkKsettctnw04b2l9oUTY2rNqkupFrwS
	d0owYofHobKltcSyrQKmrTPsy0D400p9Dwi6g8djlUUEfuNaq0vaJcLo8cq4VTY=
X-Google-Smtp-Source: AGHT+IGdLSdp5aZa1rJO1UP5f+gQwkUgUvwswdqEDXPCExjrog+7nUhfU+Oi8UbcqLZhvZJFGluzTg==
X-Received: by 2002:a05:600c:54e6:b0:426:5b22:4d61 with SMTP id 5b1f17b1804b1-426707e355dmr56946085e9.22.1720698737418;
        Thu, 11 Jul 2024 04:52:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 00/11] i2c: riic: Add support for Renesas RZ/G3S
Date: Thu, 11 Jul 2024 14:51:56 +0300
Message-Id: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds I2C support for the Renesas RZ/G3S SoC.

Series is split as follows:
- patch 01-03/12   - add some cleanups on RIIC driver
- patch 04/12      - enable runtime autosuspend support on the RIIC driver
- patch 05/12      - add suspend to RAM support on the RIIC driver
- patch 06/12      - prepares for the addition of fast mode plus
- patch 07/12      - updates the I2C documentation for the RZ/G3S SoC
- patch 08/12      - add fast mode plus support on the RIIC driver
- patches 09-11/11 - device tree support

Thank you,
Claudiu Beznea

Changes in v3:
- dropped patch "clk: renesas: r9a08g045: Add clock, reset and power
  domain support for I2C" as it was already integrated
- addressed review comments

Changes in v2:
- change the i2c clock names to match the documentation
- update commit description for patch "i2c: riic: Use temporary
  variable for struct device"
- addressed review comments
- dropped renesas,riic-no-fast-mode-plus DT property and associated code

Claudiu Beznea (11):
  i2c: riic: Use temporary variable for struct device
  i2c: riic: Call pm_runtime_get_sync() when need to access registers
  i2c: riic: Use pm_runtime_resume_and_get()
  i2c: riic: Enable runtime PM autosuspend support
  i2c: riic: Add suspend/resume support
  i2c: riic: Define individual arrays to describe the register offsets
  dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
  i2c: riic: Add support for fast mode plus
  arm64: dts: renesas: r9a08g045: Add I2C nodes
  arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
  arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node

 .../devicetree/bindings/i2c/renesas,riic.yaml |   4 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  88 +++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   7 +
 drivers/i2c/busses/i2c-riic.c                 | 220 ++++++++++++------
 5 files changed, 255 insertions(+), 69 deletions(-)

-- 
2.39.2


