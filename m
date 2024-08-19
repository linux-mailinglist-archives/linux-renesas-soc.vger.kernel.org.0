Return-Path: <linux-renesas-soc+bounces-7880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C995684B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 12:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7942B22BD8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 10:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0854F160883;
	Mon, 19 Aug 2024 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cezkf42g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC6160873
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063046; cv=none; b=QgEUSFGWZv7SCEm+QqTDU0hp4pq5dcnjxW4EIKvrl38rno3BQE/5Lu6Ikmu7KB1K12yrEww96v5zS7oNcYzOup/0A8YQvwSAbKoHanuG1fdSDJWivWflwLHi1jQejHQ4RXY0DWDKgSHzz5Jx47VHHSeDfYFUlUkukV+hevOUkOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063046; c=relaxed/simple;
	bh=dmc0y/kWfY6Cc8jLZorl5FTPhvTODwkyztEgSx9S+Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hwimeIpzhfSsmSmd7irOwESrdv+sJzUkjMypcd6z0cLxn2ku4Tdn/WX9JaS2rAyQShL448WYWpf+ZD4WhAAuFT9QJyM8szdKIUj7gfKZ15o2pHmEtEzl2Q+/pDbx7cPG08rP5R1+WPyp0jkb2HMRqLExwDMZY6phhgAoIXtULQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cezkf42g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37182eee02dso2120843f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 03:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063042; x=1724667842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDAZtsT6d3mahbQ02zCEF4gWDXuIPAzZhJkrRtcP+C4=;
        b=cezkf42gNGJJah5vY0Bu+h0suotzcr0Vkn3qxp3Cp91zohPfaqULumvO1Dkq9YGRTZ
         RbjtKFBsV0D1WDs4hovo1DirBFq91z6Bq0pHR8beYIqrBKllJ0hW1+l2cgUGka+1jCFs
         rUv7O5KmDMF3uv+Dw4SKmdsdhaLsC1s+ptAyrCXHLtqjeh8X5krI9ciqEqCCqwPmfFC2
         8ChJNLg+RJI+2Gkzp+kg3VQsteWx8o3W3P1ICSevO/BGAY3SwxJ0mYW396ly1InoNvPL
         QExFa62bV4WcWx4mi4qlqqXzoLBYLX+0hHeLdL6AQAIy6KTRpIZaiNn5wPrhXjFGagmm
         sEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063042; x=1724667842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDAZtsT6d3mahbQ02zCEF4gWDXuIPAzZhJkrRtcP+C4=;
        b=mqgO/B03SP8kYltFybOkFPLIrcZfZC83JfcxZFmapOC5hCWNAofor8kkZ6Y0XwIgfD
         NhNzuEsr48oHO8J+pAmV9Q5lIwsfwB0RzMi19DLOfjA+idLhVJoKIOa3HYcqqX69bDGH
         JOQUDGprQu3VW9tOGOIE1If9CnAWa9g2UtxUY+8k332UvlYNqUWbuIFYyP5iDUIVbjuH
         fuGOmX/Wkpbekxwjxq5mlvz4OLEecVEoEnYRuWb03JCMAnPGua44PjChzRNZmSMLmUdY
         /fM8+T8mKq2EUEP/+HN6FFwWCT+gzjM9RZjIniiPLmbw2HrNqydT/tLXnprwSwNBIsig
         KoIA==
X-Gm-Message-State: AOJu0Ywn9vRppvSKx8CzPoAQB4gPxCk5Fda8THzJRtys+ObLm4SkVGID
	a5O3gUwxLIJx1l7ROP2JCVxXEAzTk4h0WXbWWvAHh+c15Bq62I3B8wMtTWiKt3o=
X-Google-Smtp-Source: AGHT+IHhgJykbmREGclvTsJOq15gSZSew6esBvPJJgp2rqvyLR0+ob6kzyl5jQLdhetgliiq2P096A==
X-Received: by 2002:a5d:6305:0:b0:36b:b174:5256 with SMTP id ffacd0b85a97d-37186bbd0d0mr9221544f8f.6.1724063041873;
        Mon, 19 Aug 2024 03:24:01 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:01 -0700 (PDT)
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
Subject: [PATCH v4 00/11] i2c: riic: Add support for Renesas RZ/G3S
Date: Mon, 19 Aug 2024 13:23:37 +0300
Message-Id: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- collected tags
- addressed review comments

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
 drivers/i2c/busses/i2c-riic.c                 | 221 ++++++++++++------
 5 files changed, 256 insertions(+), 69 deletions(-)

-- 
2.39.2


