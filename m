Return-Path: <linux-renesas-soc+bounces-6726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56E916721
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 14:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD0E1C21969
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 12:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E371552EE;
	Tue, 25 Jun 2024 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PSeuY2kT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E68153506
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317664; cv=none; b=cAa4sQQz3muiT+4FIh486fguliXxrLBHzN3FoP4t0lMUxkHzWNrY4axyH5dWJgfCaDg5J/rxYsjhMYLvO1Et0nTkXU3OS13ATzypy+CeU29ij+fhiLqzK7GUb0CDfHCOd18zuygjUUcEzEG2nHcBDFkkzhp4k6JyGhK6mt9QDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317664; c=relaxed/simple;
	bh=idPQeyWspSOYK9aQfE5d70UuHZFrItY0K6EWba5EaLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LVoEs9gvtbWAGF0c7jWvgcaeL+SgFGyL84qNJmTaAX4kC+FMvRvMHZA0BxIgH0eHOK0Z23/UO5o6A/JTIy86ZIDJSG0v+ulfLH7qfjwPqwqtsc+4qnHOfyk+IQbrDqtPQTRmn6jtnoSprbrZG72DTY6e2KEhTPq8HY9WS4g9KNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PSeuY2kT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso61810861fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317660; x=1719922460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=giiYhFtEnxQIqEEkjgAn3jwXftBpviVw0I+kAsd6PJM=;
        b=PSeuY2kTkVd/DGhrUKY1dxEN1fn7hWeI3FA0u5V/a8q1oVAgC6onFgHS1bzOS3c02o
         5388vhfouSwYpj67sNmhud99ga0iWIhbadN1BtLtZYu5/kBv9tqhBjQRcvJFElp1g9g9
         6aP4YtH1rSIYD8JlY8SM7Hf3QNNz4CgHdO8Y6yp2vonyVLi+G4TLUrRPHlQ9H7ZNtYl0
         mibi1rqc7ssUV7Aon4HcvCWKaDYWC4ad05EAcGSzh1SOJHSqkUSgmvp72uO7FMMTc4Nd
         kvXnPFy4pHzqjUT0z9eG3BHXfOqEbHJWiuKXcv5EjtPBr5PgmgKe3m4ZvdwF7nX7ID+6
         6ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317660; x=1719922460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giiYhFtEnxQIqEEkjgAn3jwXftBpviVw0I+kAsd6PJM=;
        b=gKZR2aMc2r9EfWICrwwIAcwRJsXjpe917fNN4Pc2Ql5r+ITmaAKv3K8mP9PQygPznJ
         WAX89GVPJLxmVF7WyztAzXmUh8SGSf9V2v57OQnkjaKCz+yAVubSWP2PTSWNyVB1rRrM
         DqNJA/wMoFuubFz6Lsd+GhE4S42QuFqE2z1N5zF9Q2c7ZkbqWQj9EzHo3hlqBBzUitst
         lwv5upPkGTF9S0rCBw9mPx6ZKLkTjzdp3pxJYAtFPQFmVgiMj5QbtFmdt8MYyDE0AHQR
         KqCAurrPEeup1kRjivife3S9ZF5nynmTMlujlonfRp3U52JKjjafWB3Zq36mQURN2iGR
         iDAw==
X-Gm-Message-State: AOJu0YwQmsJjRwo3mHh81wTaFp+J1rLBGOTVxKa5CJyVzGd9Z3csMM64
	T6O+hW1YbrFSi/2T3mSQwonECXI6ykglOUkvLrXwzjQ8ZOTBnWBAgYr2ZAIkm5k=
X-Google-Smtp-Source: AGHT+IF3Xj+dQee669e9P0ubfqBuwtjyt2JBWssz1nxN7eVQYZNX6hX5GHpL4DDBTEv9QR0Ta0Bg6w==
X-Received: by 2002:a2e:8513:0:b0:2ec:3ca1:e53e with SMTP id 38308e7fff4ca-2ec595876damr44742311fa.51.1719317659791;
        Tue, 25 Jun 2024 05:14:19 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/12] i2c: riic: Add support for Renesas RZ/G3S
Date: Tue, 25 Jun 2024 15:13:46 +0300
Message-Id: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
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
- patch 01/12      - add clock, reset and PM domain support
- patch 02-03/12   - add some cleanups on RIIC driver
- patch 05/12      - enable runtime autosuspend support on the RIIC driver
- patch 06/12      - add suspend to RAM support on the RIIC driver
- patch 07/12      - prepares for the addition of fast mode plus
- patch 08/12      - updates the I2C documentation for the RZ/G3S SoC
- patch 09/12      - add fast mode plus support on the RIIC driver
- patches 10-12/12 - device tree support

Thank you,
Claudiu Beznea

Changes in v2:
- change the i2c clock names to match the documentation
- update commit description for patch "i2c: riic: Use temporary
  variable for struct device"
- addressed review comments
- dropped renesas,riic-no-fast-mode-plus DT property and associated code

Claudiu Beznea (12):
  clk: renesas: r9a08g045: Add clock, reset and power domain support for
    I2C
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
 drivers/clk/renesas/r9a08g045-cpg.c           |  20 ++
 drivers/i2c/busses/i2c-riic.c                 | 237 ++++++++++++------
 6 files changed, 289 insertions(+), 72 deletions(-)

-- 
2.39.2


