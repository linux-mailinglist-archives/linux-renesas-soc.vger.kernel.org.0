Return-Path: <linux-renesas-soc+bounces-10346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC99BE680
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 13:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D94C1C21E0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 12:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E3B1DE3B8;
	Wed,  6 Nov 2024 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="d+xT45VX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9630F1DE4E9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894492; cv=none; b=nB041WN4Wj3gj/pa4Oi+PX9B5zggE++QqqIFJCFOpKC0mAg108hq78AbKGwczXFHQKAvNTQQrjkYdFaAZ4/ngzXobkR5EntUZzaf8TZbsWsgIFp7i2CIgYwLZfsE8eMtQWcPa4AM3YBib8lOmyQZL7HDWOsyE+plOHMLuX0FF/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894492; c=relaxed/simple;
	bh=PQUaNmhCftixjcjPvmM5IEF5VOVSnPAEw/w/dSs0lYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TCbWh8NU8CF1hNs+nB2+e8K5GMeUDzj7V7QW9FagU080/ik5yVm4FmkR5Fsqy0j2/5vS6WsRdIB6YE2f+LlFG2gGuBEloiT3B812qqjCWCQBm4QWsAzlsh2ZsC/qIx4sZkH6D5dblLzndRAyeMoxW3mDH2r9lah7QbrmlqKgwhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=d+xT45VX; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99ea294480so475679566b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 04:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730894489; x=1731499289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4OdoU3Lr3nA667dN5ioAfPSrG7GOf/Q3AS1dKLXo78=;
        b=d+xT45VXfxcxvBdFkWafFk1XXwyV4uB83uiH/5DhKkP2IWtd2cTe7OBUBgpF5VSLif
         qFkyPFWeVxexY08jCCPJ2pSaTo/JvaaBTtrCZ7WJD/c8F9O8vRoRr7TfJwCWG/KM6r0H
         BhVCRV/t7fEqzGgZO31wVRQvHU7ovQE90fPBtRt3U+JjRZig28EZEn6BgZ87yqgxt2kQ
         mGNzgeOQ5ube/FWyB9IPXBWTj/foB9AbGxxmcs9xlxmmjAS5udLe930PSWGMQRIor2PV
         OyYTCl5sM8cNxbVW3NoBcdFSofgjioks8v0EwNPfsUf9QPtHGBJAJkB6BG8v7PA6IvXb
         FgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894489; x=1731499289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4OdoU3Lr3nA667dN5ioAfPSrG7GOf/Q3AS1dKLXo78=;
        b=aa0qOMJdTnyMpAUK+QwKo009sEo1bCUIIPWtrmhx2kMjIqh3V9TsQHF84vdokJOqGO
         XS+HE3Mccb20HdWBlX+HLs4MhY86SgcmJr85dOiMlSkdcKvSS4HTng07Y8XTJ1+BSUhP
         4I3qfw4s8kzeiNuTq5rjebNEI38jN+Gi2Zg5uDgqXRg0m4qCzzJ3RFopQKZiAWP0a3Lb
         //vr/vHuCMzRyzez40ARyWdR9I9n/wE1UqnG+3+hEO3QoSrV4JSP07bTynJsx9jw/rt6
         +0o5zxIN3pvXyobHKuoESbA8aOCBrvbuZqRIyViukdQD0+BG5jwOTYMfoHXEqYVUsSfg
         +4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWENkaT+Wd9jFDwkqIaCNDXWKIeUWViUXDaZbQ0PsgTn4UpvFYvyn0Fd7yzlt1jlwRGfw4j0zAIuuTsctv8Gt5KXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OzLIioPn3vlJlPsSwUUaoCdRYdMckTX1+FBCl1gz/wfFgbtY
	K5RzgHV468Ci/W1x+rdY91kTWgtT+JefODAyi5LXwSIkm6j+BmhzJqMqKVio2Pc=
X-Google-Smtp-Source: AGHT+IEMBnLm3/r2LARk7JIsFb0z++ZbjgxFeX0AqX0aEeTorNzBh5pVrmLo1R/U4UFfsHZpRWOlUg==
X-Received: by 2002:a05:6402:5215:b0:5ce:e5c9:4491 with SMTP id 4fb4d7f45d1cf-5cee5c9455cmr7256569a12.15.1730894488782;
        Wed, 06 Nov 2024 04:01:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6afe528sm2697984a12.55.2024.11.06.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:01:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/9] Add support for the rest of Renesas RZ/G3S serial interfaces
Date: Wed,  6 Nov 2024 14:01:09 +0200
Message-Id: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
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

The Renesas RZ/G3S SoC has 6 serial interfaces. One of them is used
as debug console (and it is already enabled in the current code base).
Series adds support for the remaining ones.

Patches:
-    01/09 - adds clock, reset and power domain support for the serial
             interfaces
- 02-03/09 - serial driver fixes patches identified while adding RZ/G3S
             support
-    04/09 - extends suspend to RAM support on the serial driver for
             the RZ/G3S SoC
- 05-09/09 - add device tree support

Merge strategy, if any:
- patch 01/09 can go through Renesas tree
- patches 02-04/09 can go through serial tree
- patches 05-09/09 can go through Renesas tree

Thank you,
Claudiu Beznea


Claudiu Beznea (9):
  clk: renesas: r9a08g045: Add clock, reset and power domain for the
    remaining SCIFs
  serial: sh-sci: Check if TX data was written to device in .tx_empty()
  serial: sh-sci: Clean sci_ports[0] after at earlycon exit
  serial: sh-sci: Update the suspend/resume support
  arm64: dts: renesas: r9a08g045: Add the remaining SCIF interfaces
  arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
  arm64: dts: renesas: rzg3s-smarc-switches: Add a header to describe
    different switches
  arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
  arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1

 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 90 ++++++++++++++++++
 .../dts/renesas/r9a08g045s33-smarc-pmod.dtso  | 48 ++++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 25 +----
 .../boot/dts/renesas/rzg3s-smarc-switches.h   | 32 +++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 25 ++++-
 drivers/clk/renesas/r9a08g045-cpg.c           | 20 ++++
 drivers/tty/serial/sh-sci.c                   | 92 +++++++++++++++++--
 8 files changed, 301 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h

-- 
2.39.2


