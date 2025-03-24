Return-Path: <linux-renesas-soc+bounces-14766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3CA6DC3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 14:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BCB23AAFC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B010B25F7B5;
	Mon, 24 Mar 2025 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LdnvjBV+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741225E82C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824633; cv=none; b=Ff5BJ+DCaV5By4YIHqdIpAPB8//Md7jtg1J64O5DMXtRzs6TQxz2TNiI4oa8AG3VZkjG9G+NrxjaXgb62kyWCGor+Vhz1ymlh2Q4TRTLd/9Hbgnle/OPRS9eafqckKyfnBPqFznbZg5BRRjwJlkdchoC6xAEf7xsPCaArbpVCYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824633; c=relaxed/simple;
	bh=MPO6jCCozjhYMoPt4y+gKPOuX7ez+gZqkKwymGwFc0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uKMgnkJnum3DzAsdn1hctwxAJs/G5brSDqsyeBLyyKpwW3MfJZkvMXZwwg0zZxmvi3KZqEVqjdbU465hhBKJiOp8t8q/QSgZkJv3uV5BjxI1rPp5+Guv0+ECxFckM3FRoOBIgs27mmvNY/vLE1jY3kFMFOX9xzManHaV9SYnnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LdnvjBV+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf680d351so32179255e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824629; x=1743429429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geHsdT1vrdpFfM6YFLK2c0Yi2DY1fN5x5Y+Dw80cp/o=;
        b=LdnvjBV+8Eaye8ho5RjmMoedW57GovKqz7vx45WSQPkXG0yau3B7sA8P3xg6+X7bUC
         UaR8J6UYHxcgTN3Y2e6mad1yF5zV/upEiMnA1slqtErekQzAL458hzSXEiZmsWEk9oc0
         aXQnpjXcQlLLqSITTRhjEcggyjxxvjK6nfVs/qRt82JxcsSm0HCqo+ugkA1aSALB2d0N
         kHf5YDBXhaAB/DMT8K/haBwA+h3ZSiIsqxSztQzcEUqh9h3NdZaHoukIi+Q/E36pXCXU
         +Gqxg5u/nS/H7IoGddCW8NKiYtrnQ3iTjsm9ruWzP1slCJFUAZdIJBorqECIDK9j8asJ
         +igA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824629; x=1743429429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geHsdT1vrdpFfM6YFLK2c0Yi2DY1fN5x5Y+Dw80cp/o=;
        b=te9Y9SwYfOZkMP36pIMjYv6Dxsd+gC0jMaqYoOCWXDATBa9D4gk8jxZd6D9OyFfoX9
         nJW9PsHqj9//QdCfPUFxwj1vsRQE9eWTfPi/Bwin4GPrYHzN+c2NHzGkVOKEi88xuWbH
         i1Ef86fWv27uGO35DhwpXPmi2S+1jdYmmjfunVx1wOzcC85qyI5buxWamyyRYUTAwEqK
         KRkhTrYRr73Mld+P2YuntHsr1u8FHqSAEUbrEIaP4Zx0jUOhj5N9YAkxUauV5xu/xHWj
         p4sGmHGy13CI5aaLFTwFPuIXmXv7ZIJSwHnpgqmYwB1SsgQTwc/1XvVZ3cPrNXAfP2vI
         xloQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqpM+eFSMaS/Rpkeq3Z7cMwzZtdapSfrtOKyp/rC33EshtHbMmAsWy1+7YonXWp+QgTuRr9KqIFnD6X8DBHgIC5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLOCVrgjJhProtGTNOQS+VuZMpkyLkWifbIjnyQcsbFjxVN9kv
	QE6Vk+eXrHf/TiQ/e7s4bVkkqDDVFlW5dzLf2UCoxDrm0/Iq50Jr5/wLRSxwggc=
X-Gm-Gg: ASbGncv5g4/nMHtqUKqs/Y49vVfw9F43w2sFkJPKvoF+5hoIHpZgiaQmJwuSnuxS+JF
	I+o+aSLpPZqEGsTRUcIgLF5TMm7cmCT4Wse4SGKPeHHpFRh3FQXr962NzONjRrinycKCSegX+jW
	b+QlynAc6CkR87KBbPw3TjBAKGpMzLErEnivRy+3f9XlT479xU9kQIC4/lf9WcR9IQ+fpAcM84+
	HzXMBRdYUw1mg4knE6cSl94KyaufQOIMhkhdzfu8lPu0sA8lIQPrSBEGQdZ5nuOsAT0g746r6Tq
	adeRa3e/w/KRGJijejXXLk6HNn5fjqFV7g/xTnpxQa7OXVmJ3Ze6vPseNSCm8MIcGHhbIEzfDw=
	=
X-Google-Smtp-Source: AGHT+IGkbsgJvhaLoKe9hCL01Phvk9cQWomrPl7igNBxsiltgQYpsqqfKtqy6vBzpm7mTH5vwHyozg==
X-Received: by 2002:a5d:64a8:0:b0:390:ff84:532b with SMTP id ffacd0b85a97d-3997955cc22mr13735349f8f.7.1742824629087;
        Mon, 24 Mar 2025 06:57:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:08 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/4] thermal: renesas: Add support for RZ/G3S
Date: Mon, 24 Mar 2025 15:56:57 +0200
Message-ID: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  49 ++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 -
 arch/arm64/configs/defconfig                  |   1 +
 drivers/thermal/renesas/Kconfig               |   8 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c       | 313 ++++++++++++++++++
 8 files changed, 471 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

-- 
2.43.0


