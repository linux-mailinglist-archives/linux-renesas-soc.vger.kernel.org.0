Return-Path: <linux-renesas-soc+bounces-10392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB99C19CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D63481F240B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6471E2319;
	Fri,  8 Nov 2024 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V2JzjlHe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968901E130B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060329; cv=none; b=bfyYEijBJ/pXjIPGFHauPKxJYBDZKH3m5TMc1kqHFH8UB2s1csm7zlZjVEIHn39bNrYR1IhPF22bF4IJZJWyHeD1mEeQllE10qdK7abnd7++n9dGhJJ2zpgwvMtqM+dlnuRFZGP03jsSSRjujwKoUcwzMZel9nfAiz5Pa+yPxpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060329; c=relaxed/simple;
	bh=MoiEayfj/UT4sKXcIMbQM1ehNea+yL0fmJc/mIJizOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kIah6J5Y33vddScZfmv7x0IspqOqf58912Q3uqZEygIdq8PfmKS9L6EvqfOD+DHkZ+0B0XEG/ZmOyH+tpLWGFGMHdq57Mf0BZEcTQFiM8Td37TV6ttTanz2Y2oKgEFqfbKOM0rcmd+/VyxnKyIzuwy0LGYm6OQLxSAnOqGkyuxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V2JzjlHe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso1408225a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731060324; x=1731665124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAL+kPG7hjMLlYG3CXYUDbVL7KyCjm02rxkbC7MtBh8=;
        b=V2JzjlHeXAIkJraCy7xNnDKYVdjf4omzERSJmJ4rHqk977pqA26q8NKNnnEGKGdoKy
         Vzarlfb8qTfR0Q7557n9xRQbIwxm+tRQTkgrN1ZEwHxS7hW/n+F6OLtPZkEp49VY6FZS
         JMr+/Cd/EziTGyubF90TOHv1olVLokRjO3Wp9QvCFMz6ZC8lf3YRozSw8DYYn8N6ePVv
         3gjBMkJ3pLwyAVLE3Da4grqJ2oxxuG/AEyOyYPdQNApPVY0kUtENOtg23ghB7EhenqCQ
         gPA1x3ITy6KowQA9qFwqkg95K2pU5FHgJHSjC0EtWr+EG9a0W+SI0KWbvj+XA/SezW56
         v12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060324; x=1731665124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAL+kPG7hjMLlYG3CXYUDbVL7KyCjm02rxkbC7MtBh8=;
        b=LHSDpMY/gv7Yc6HmRrcwrE1fTKg2v+DGaW6Fe/gJ3mGVLlDmSu5hfn2LTh2c9NHtvl
         vRmL17EP+xsjA84jiQBZg7Zp3EAMwd2oM4llX+5QDqZGMlCBkTm7LQo9F+02eM6zKSSp
         BsW4wn8HnWbcpz5A728ZCgOZXOE8nJg2/VbrLB3SQRL+STBb7I79sCxZl3IAfRAEjk+7
         dmYhZutpCOmWPBrVty7P43mhqLu7van34L1mCmtloqx8kY2z0Gzzh1p/iY+LANlbmpa4
         CClmgJQKvdq7e/xfEXlMmn018aHo80TXv6TMFNQl1rhVsTzvZ0LOTyepcqV5N8B4YW+X
         IVbA==
X-Gm-Message-State: AOJu0YzWLnwA/M511Lh5xGqIXJb+A6i2OlFQx9ewn8+RCsaz8K3zW0a8
	1jC8VMRNNGEkkp8zKuDrlEWn14slqJLImw53env3QDlfaYBj8d5tW78xkGA9MMw=
X-Google-Smtp-Source: AGHT+IG2NrO+sM70OPw1AksJyK2vMcksl4JvBsYJxXbdWHnFOrPxekQAQy53PSFcnZw9polXCbL+5A==
X-Received: by 2002:a05:6402:274b:b0:5ce:dd82:1b15 with SMTP id 4fb4d7f45d1cf-5cf097371f0mr2586609a12.14.1731060323636;
        Fri, 08 Nov 2024 02:05:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f0bdsm1775959a12.56.2024.11.08.02.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:05:23 -0800 (PST)
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
	g.liakhovetski@gmx.de,
	lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/8] Add support for the rest of Renesas RZ/G3S serial interfaces
Date: Fri,  8 Nov 2024 12:05:05 +0200
Message-Id: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
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
-    01/08 - adds clock, reset and power domain support for the serial
             interfaces
-    02/08 - serial driver fix patch identified while adding RZ/G3S
             support
-    03/08 - extends suspend to RAM support on the serial driver for
             the RZ/G3S SoC
- 04-08/08 - add device tree support

Merge strategy, if any:
- patch 01/08 can go through Renesas tree
- patches 02-03/08 can go through serial tree
- patches 04-08/08 can go through Renesas tree

Thank you,
Claudiu Beznea

Changes in v2:
- drop patch "serial: sh-sci: Clean sci_ports[0] after at earlycon exit"
  from v1 as it was already applied
- used bool instead of atomic_t in patch
  "serial: sh-sci: Check if TX data was written to device in .tx_empty()"

Claudiu Beznea (8):
  clk: renesas: r9a08g045: Add clock, reset and power domain for the
    remaining SCIFs
  serial: sh-sci: Check if TX data was written to device in .tx_empty()
  serial: sh-sci: Update the suspend/resume support
  arm64: dts: renesas: r9a08g045: Add the remaining SCIF interfaces
  arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
  arm64: dts: renesas: rzg3s-smarc-switches: Add a header to describe
    different switches
  arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
  arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1

 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 90 +++++++++++++++++++
 .../dts/renesas/r9a08g045s33-smarc-pmod.dtso  | 48 ++++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 25 +-----
 .../boot/dts/renesas/rzg3s-smarc-switches.h   | 32 +++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 25 +++++-
 drivers/clk/renesas/r9a08g045-cpg.c           | 20 +++++
 drivers/tty/serial/sh-sci.c                   | 64 +++++++++++--
 8 files changed, 273 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h

-- 
2.39.2


