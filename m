Return-Path: <linux-renesas-soc+bounces-1626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0983614C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 12:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6DBCB22FA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 11:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9513B197;
	Mon, 22 Jan 2024 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aqNLgk52"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996F3B18D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921903; cv=none; b=QlW2QTyrpZaBCUcTep2kpzgrXKfvNug86eiEtUM7bNVAc43TOpOjRCB0cdfQb32iQh4fW2y659ABWklocB91PqroucoXrgOSlnap9ADOQDZSzAVkVKyg42spkl0/qjgoM7hpL0w9mLhXXkKuvqtJLV5d9xY9IgSMhaUs6uu+L7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921903; c=relaxed/simple;
	bh=UxyTRYJrjqQ5DKtv4x7xt8N6ofKWsaiz0ZFqC7P9iQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SI770tgAjAEIlvPxuLgbXV+DvmOyMupyFvFf+FtqA1gZa9jQG4vVCAXJ3WZgh/Y0KsN6DMGDeSLxtVjV84nnNO6oR84fBuooVXxDw2JHh9SdypUnVqC5+/nbB6hSHuStktpNMuSRrP18eUXnqhrV3C6toXDcoSRIPsYFpv9Z4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aqNLgk52; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a44bb66d3so3247258a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921899; x=1706526699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+NuF+IrheqV39DhurkeC/NdqjCC1Krg29+Aw27A90o=;
        b=aqNLgk5275sDX48SHiN/znMn0nYhbuic4/hP5/FA/YaBtKuZ4/P3q/fT6ZwvhH1W65
         rfJTwX0UwvOl6iedQ2JoKWw+THqznadPcRevqKCXVp2sM6lLGAAgiAl4gsp2ieDWfSZ4
         OpsuDDBjks/qq8E/q+1NlJws5QX92jzKFhcMPfCUZVPulSXb/cSr8gMi8PhNyBBhFVXE
         gjWD+gEGkYqdsQjPPYn5sTRB9uxbc3hWF5AJoVGdhFYnPuSc2gfiC0w99HRzuDCrHCIJ
         oxqhSgZYK1ZT5IL+Ho68Si0XmB9tBjZYiv5txVqL3JttSqTAnjonY25tFEDDKxAFveeN
         LTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921899; x=1706526699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+NuF+IrheqV39DhurkeC/NdqjCC1Krg29+Aw27A90o=;
        b=CjztbceDZGRfYZzuLRNnCUuB6xNSMJyPNcNsUrWcn58BCBu7pTuIQFxalfBCDr7ph9
         3QJQv4RDC54x6U+ghj0O1bmZjO+NNed1CiwfzqgD1WigFcr4i+Iujxj851BjgBhgUXep
         ZomyJci2Va9yls22bgGUTiUykz9/TAMw8/UQ5iXoSeEx1qAKou9xYvp8K6dksm6iUOVV
         Kl3HJAXFDLTXyTXy45j2TML4xGUEUUwYCbUAt4vK0dbt0VG5rNaF1+FYoa2u9Hoe2Imc
         gyrSzGvx+syHkkKhcOsjz1IYoDGFM4Yz6Qicv4SX9txBtPGE7ATmdeGEtJyfnLKlK8j5
         63kQ==
X-Gm-Message-State: AOJu0Yzv1I2IeYNEPFmH/TO2vg/5VXg7Ze+0yw0vjdDl74GyZqdvrWsN
	er1BndJ13CqpQ4CMcFb8nIu3n3BSx4IEUov6dw7xj/ovRGfdNRGZhTAw2GL21As=
X-Google-Smtp-Source: AGHT+IHTI3lS82Shzhgaq78IcSLYXJWf0bXqAjyhj0u6OR9ZSFyNceOlihdHtJoisQ6VBe9RQdQutw==
X-Received: by 2002:aa7:c618:0:b0:55a:8430:834d with SMTP id h24-20020aa7c618000000b0055a8430834dmr1650512edq.65.1705921898698;
        Mon, 22 Jan 2024 03:11:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/10] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Mon, 22 Jan 2024 13:11:05 +0200
Message-Id: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.

Patches do the following:
- patch 1/10 adds clock and reset support for watchdog
- patches 2-6/10 adds fixes and cleanup for the watchdog driver
- patch 7/10 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 8/10 documents the RZ/G3S support
- patches 9-10/10 add device tree support

It is expected that the clock and device tree support will go through
Geert's tree while the rest of the patches through the watchdog tree.

Thank you,
Claudiu Beznea

Claudiu Beznea (10):
  clk: renesas: r9a08g045: Add clock and reset support for watchdog
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
  arm64: dts: renesas: r9a08g045: Add watchdog node
  arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  14 +++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   5 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   3 +
 drivers/watchdog/rzg2l_wdt.c                  | 100 ++++++++++--------
 5 files changed, 76 insertions(+), 47 deletions(-)

-- 
2.39.2


