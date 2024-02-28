Return-Path: <linux-renesas-soc+bounces-3306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419686A9FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 09:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BC22B25BF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 08:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12122D045;
	Wed, 28 Feb 2024 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lEk+o0Ae"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA82C6B8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2024 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109198; cv=none; b=U7TFyKPnokdHPTIV9Q8LhK4RMG02pQDI9LZSwJPGC3Az19QpwI3gHHWvyPN5Ymf4rnggX5ffOtatnXRaqeYoCoHwLK7Q6eeqX/ArXb7HYATkMwYT8qCDzWs0vU12Nj0ESUbtEmF2SYM2mFohOpBwt1oBJswelvqLXNZFT7ShTrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109198; c=relaxed/simple;
	bh=Ta2sUnIiLlpyDoRPXV3QRmDaVXo8Q8J/r2XiZcnzHvk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mm+uGDEEODJUe0j0zxsz0tVqthg1ZvrblR6s74avTj+aRFfXkt8JVqJXNXiAbk55mQhkIhIEIzxDptld58xADIidETiFWaMFhJHPPOl6eaBGSdV6YWbogZzWU5zYGJS1Fwxq6JmIry9Ka2oZr1o128ORqizrUaozCHmp8Sbbwuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lEk+o0Ae; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so948770a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2024 00:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109194; x=1709713994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBZ2rZoeK1vPw/QA7FLPO8LSa6g3zo2lPvoS2UqE6EQ=;
        b=lEk+o0Aea4mIu9hlU26NzEgOW8jau9AM1UW7WbAOB0Z8DyokZ53GxLH6HPl1tH7MER
         zN9s3UmGZ773L+r9jpphuBoh1/mr1337JOPbp/JdwDMHZhNiaCb3fO+uDEgt9Mgy3D9Q
         +RfNzmIG7me5D9q06+pTpf5zbQftGqlL3SCCDRS7t1VMOikny/1WPwPBcgrvFkipeQve
         HB47++WO9HffQAKhYWRmbF90ITqCLwEQWgn4CyCs5KcF936SldCk/wMvjQkmmDU2/Mjq
         10HD03M2VFlArzyXVfeFYV5DRVEHeGxq0RN137wFC/P3Uthu/tqUX3QDniE6IfSmN4az
         NL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109194; x=1709713994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBZ2rZoeK1vPw/QA7FLPO8LSa6g3zo2lPvoS2UqE6EQ=;
        b=O6tNMu1VxaNU2DEdGaICP2bAIs7cQBjIhTUbPvwIn11ETvIAuuSGAmolsNHwwjmr8R
         T0zSGLBVDvZzjk211+qo4HAgJR7Dt+Zavad9NOp/IuaOnJniDINZm8puf465O2UVVrWW
         WosHCfiHfk+CnCKWwPPR5Yk0dgaw+tYj6f+Us143TSJiPca63mXA2/Y3L24yyyCJRO+p
         Hm8AoB9LoNxM6Hi9tB7C+l+LfdE+BTIqg/NNkqbSBd9uS5BjD65Mg3IbRniwOwgK75Lf
         ZBEFe40pN1sAfyNvHg6j6vQJnUjNCPCoa8ThhD0fPn6naoj5clBmO0G3BIh92zmaT8o6
         kHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0BXF0ABALOLWF8VLwXMgulmfBmBGNpTKZYtR+DPXj9FXvbQt7lPlQ9qclIceNvmLli0Lo+iXe2wv4azwtteTb0hn21tWyT9W2tXEmQ4YBtHk=
X-Gm-Message-State: AOJu0YyLNXKgUswGN26KzQd8CX50AO/0IQ1/46Iyz6Birj8e3B/v3zHj
	bBCesXWqX0FbQQN2TAJ2kyxoZcqQ73x1967FgmolnkIaQeHQrs+QGdPLVQ/BZEY=
X-Google-Smtp-Source: AGHT+IGhtvclnENZE7nyT6n3Bx/9ZK3N1tKvc3crfWvk5MmaQ+FIosvn0afdz6PqVN2A9bDPN9lz9w==
X-Received: by 2002:a17:906:4a17:b0:a43:f924:d65 with SMTP id w23-20020a1709064a1700b00a43f9240d65mr1039966eju.26.1709109194460;
        Wed, 28 Feb 2024 00:33:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:14 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v8 00/10] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Wed, 28 Feb 2024 10:32:43 +0200
Message-Id: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
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
- patch 1/10 makes the driver depend on ARCH_RZG2L || ARCH_R9A09G011
- patch 2/10 makes the driver depend on PM
- patches 3-7/10 adds fixes and cleanups for the watchdog driver
- patch 8/10 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 9/10 adapt for power domain support
- patch 10/10 documents the RZ/G3S support

Thank you,
Claudiu Beznea

Changes in v8:
- added patch 9
- collected tags

Changes in v7:
- updated the dependency on patch 2/9

Changes in v6:
- update patch 2/9 description
- fixed the dependency on COMPILE_TEST previously introduced in patch
  2/9

Changes in v5:
- updated description of patch 2/9
- simplify the code in patch 2/9 by using on a new line:
  depends on PM || COMPILE_TEST

Changes in v4:
- added patch "watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
  ARCH_R9A09G011"
- collected tags

Changes in v3:
- make driver depend on PM not select it
- drop patches already accepted (patches 1, 10, 11 from v2)
- re-arranged the tags in patch 8/8 as they were messed by b4 am/shazam

Changes in v2:
- added patch "watchdog: rzg2l_wdt: Select PM"
- propagate the return status of rzg2l_wdt_start() to it's callers
  in patch "watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()" 
- propagate the return status of rzg2l_wdt_stop() to it's callers
  in patch "watchdog: rzg2l_wdt: Check return status of pm_runtime_put()" 
- removed pm_ptr() from patch "watchdog: rzg2l_wdt: Add suspend/resume support"
- s/G2UL/G2L in patch "dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support"
- collected tags


Claudiu Beznea (10):
  watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
    ARCH_R9A09G011
  watchdog: rzg2l_wdt: Make the driver depend on PM
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert from probe
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  watchdog: rzg2l_wdt: Power on the PM domain in rzg2l_wdt_restart()
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 drivers/watchdog/Kconfig                      |   3 +-
 drivers/watchdog/rzg2l_wdt.c                  | 123 +++++++++++-------
 3 files changed, 76 insertions(+), 51 deletions(-)

-- 
2.39.2


