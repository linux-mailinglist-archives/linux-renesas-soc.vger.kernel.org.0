Return-Path: <linux-renesas-soc+bounces-20195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB909B1F9D7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 14:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 023CE4E058B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 12:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176B81FBEA6;
	Sun, 10 Aug 2025 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="G0YrLyEj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CE1684AC
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754828503; cv=none; b=d8ClmchmG0WYES7+X9vXF15Mdt442N7YVfeaAcz+nQpVnPgrbBtnPgY+WH/mN/7W0G/HciKfGAwll/24zOnSnDHBeGCTbUivPzf/oY4p0PliOPTBCX9jGFIAcWkK6VGx6jVKjUAy5WK62m29wAkOgNjWh9t8aLdQQtK2vb+WKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754828503; c=relaxed/simple;
	bh=FKF32B1DbsrgOSP6yeaxp0UqlkMMCckPHJ/HTZ2PyYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kqkA4o5hY4nIyQV1WaMO+Z9J5s+JAmYjXF/LTZLS9rDoCFUrazvmssjajeoncif9d1Wafp8KDaikCQzvoE5cs4C8nM/0Lu3ZAjDFloVm93BL3td5K66Fs281X3dEcBsVmnZ5NLmJaH71CeoYhUvSlkbZEmtDngqqJXJBqRtWRnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=G0YrLyEj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so2137698a12.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754828499; x=1755433299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4RjcnrIZ+W5L3kUceF7GfLbbqAQQYw2hpKEnRdHMMA=;
        b=G0YrLyEj6gNSqmGrDBeb375MqwH6QVilybgJC4h10UPSD9VBoMT4eJ7trvKrff4dEH
         JjbgUc+vRmJNDDQ3dr0m3nr7uM2/PQJIzEHbSZRhmP+jjU/pvzDZB9Qi8Wml69O9cRYX
         3NlZgzTWOoaTnBY6bXvGmN70SEiwJcld3hK3xIJvksmClUQCZ9GxAJPZjdNDg113EDXS
         2xijzAGPFkVWsUh/AZppZ9CnLqEkFicZhNX/hac8cHH0rqxSclwq6FwcK21bsefRY1VH
         GW0UMBVRFPW08Haf8sX2U99h65YWxhIob6cFjKZsz3m1VCbb2w8SuVA4FBI5c2Gks3TQ
         i6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754828499; x=1755433299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4RjcnrIZ+W5L3kUceF7GfLbbqAQQYw2hpKEnRdHMMA=;
        b=afKsvj6u9xgefb6CuRlecXiigbOt4gne2fY80h/H6UKmSBDw4+mnRVuaBqvNkzeXjX
         PmeDu/hfSAjOJYVrvOavXl4Ld1sgXVbXMbXNb+mqp0eGHwdzoMcUakEK0G9RmqpJvk6n
         l3eASkiWBbKJGI9E5nowiDDycrH6677H9c1AZzv+bGwFyq+4xCFf7+CtZ+AdYXoTAuNm
         A05uUUSUdzbzAOon054DZLm7+3YXb8vwMDYSCg3+Umr0jfLd/F9r0NjXx5S63q/fLQU/
         WinXH3FZ/RrDd4S+IBikKSESPhHTayQMauo2n5Nu1CcjkTXZpRG8cocF/ku5TIhy6MGg
         NfHA==
X-Forwarded-Encrypted: i=1; AJvYcCV1nl81wNlGjxYbijtubY5tdirbF63Kf23igM3PHpeq1H+eE8gVlI9myuG4bx5ynbdOEe5fkUHyAaCuhMzMlmx57g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT+Yt5rRbhk7RybTpeXBrVeXxggOg86IEfvWPMI70aODv/Y1ew
	hfKRhhoBiJYddYgIz5FS6UEd3xMeqiEa8ujZndnIQNU9X32gTJdkuUROpWab0QfibxQ=
X-Gm-Gg: ASbGnctoys+vEvJ1ZYhF9go3V56lzu0uT20oDbF/fuV5hqEusOzeDeIMEH6S2HOw7cj
	ocCJMp24aMfxwfTxZ6h9s1+6TS5B7zybu18SM7g5DgoWk01TPd+CDWUa074bW5oBcMSoNmPSn+0
	hqUZgWqTMGDvdtRjn4SnqHXnV5U43Ay++9ZQbaTppPm25pv3sRkz3yr/o/2b9NCgIOAd0nmN6Q1
	gmyUydEZCMpw+FZABYCaQSgj4XLKGqTw8iVHEoBhg1ywYE+3pLFMSjJHwtqHP9ojvjxKcxYPZrG
	re92xb+tCJ5Cn+GDgTik5d4nemKNjMRw9J2pd+sIUvwvHBNP7tbELazuJ3XjecmMGjYfqpMlVTC
	nKS7d2jWqvbhEZ1LPDRoTWMcGlaQ2PFCla7dNj0r1AM1yv/SNOW3+
X-Google-Smtp-Source: AGHT+IFSeAF9Fk04n1puF8WCTjGoIhixSoOG8oLkqqtM+6CY0pS9xTvj6pKvC1KxF2I94fi8T7M8qw==
X-Received: by 2002:a05:6402:2106:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-617e2e5311dmr8217507a12.19.1754828498757;
        Sun, 10 Aug 2025 05:21:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a86758fcsm16611897a12.0.2025.08.10.05.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:21:37 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/4] thermal: renesas: Add support for RZ/G3S
Date: Sun, 10 Aug 2025 15:21:21 +0300
Message-ID: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds thermal support for the Renesas RZ/G3S SoC.

Series is organized as follows:
- patches 1-2/4:	add thermal support for RZ/G3S
- patches 3-4/5:	add device tree support

Merge strategy, if any:
- patches 1-2/4 can go through the thermal tree
- patches 3-4/4 can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v4:
- dropped devres group
- fixed compilation error on arm32
- use div_s64()
- dropped pm_runtime_mark_last_busy()

Changes in v3:
- drop runtime resume/suspend from the temperature reading function;
  this is not needed as the temperature is read with ADC; this is
  confirmed by the HW team
- use dedicated function to open the devres group in probe; in this
  way the thermal probe code is simpler

Changes in v2:
- dropped the already applied patches
- dropped patch 2/6 from v1 as the devres_open_group()/devres_release_group()
  approach was implemented in this version (similar to what was proposed in
  [1])
- collected tags
- added a passive trip point not bound to any cooling device, as proposed
  in the review process
- decreased the trip points temperature
- convert the temperature to mili degree Celsius before applying the
  computation formula to avoid losing precision
- use int variables (instead of unsigned) for temperature computation

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (4):
  dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
  thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add TSU node
  arm64: defconfig: Enable RZ/G3S thermal

 .../thermal/renesas,r9a08g045-tsu.yaml        |  93 ++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  49 +++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 -
 arch/arm64/configs/defconfig                  |   1 +
 drivers/thermal/renesas/Kconfig               |   8 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c       | 272 ++++++++++++++++++
 8 files changed, 430 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

-- 
2.43.0


