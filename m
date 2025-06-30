Return-Path: <linux-renesas-soc+bounces-18935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B3AEE816
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 22:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C98D7A2F16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 20:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896F022488B;
	Mon, 30 Jun 2025 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RegCB9Be"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D1F17BD3;
	Mon, 30 Jun 2025 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315009; cv=none; b=bqY04OgUIrrjM9VQbhJ+V0cgAXx87LcJuYtvQ2o8ShXDEShB/mtqUUSOpS66AwH/yugv0m+F9/AJenekid6OUVxTtUedEa+IhLcrk5cKt/VbaeW9k8lgSVT5AGCQRcDVg9xc3I1N4uGXd0MJZc81j1SbvVB6Y7DZlyvO69fW3R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315009; c=relaxed/simple;
	bh=0Zna5OeI4/pYz2IVZehR4olgjeXgWdFnPu+MsOPUKyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cb20Tcwll/5T7gYhdw8pre/vzJ3IHBSH90zpKAwvXTNKAwRRzTGx53AhpHTAa4jHCXJ/qp6tyYNc+JrmvHGU5WERFZ8haOr1xiA6GYub0PkVpYamDX+OWkj4Y9yVHhH6ZdRJUIVMdt6+uomAt7JTL5Iv8mB+Hhul5W7lSDd492U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RegCB9Be; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2511705f8f.1;
        Mon, 30 Jun 2025 13:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751315006; x=1751919806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJs33trCtM4FO+BRynBQSLIFoFQoDytGB9w8reb9K60=;
        b=RegCB9Be0WsepuyCciv03zmF+6UzvCcqDMAS392nb84sYei5rcm07Neb9s3MdJvNe8
         qkKe2C3nU8QjwJNF//S0ti61bsGp6KtIq1lEf/r57XZ5ZTtAQIiC7QW5w7gxjCHd3uO+
         N/stAnnB/OCRzY+MfrMSL64R6zpJvOF4VCCv9DuNTyukPtTyEyAcJAqvNspd9fVAkOCW
         HKGxvYjRhv/HR+LLNNMbq9OJ4qGItigB5pcmPnM2rwblyV3EZFt0AV9WJ2kKFtBF2R6m
         98KDFZqy8z7YMrxI74taEHtVl7zGb8WKxHAjOlIFrjqIpFaI27gvOeIWQ4JfDZSkOwUJ
         0LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751315006; x=1751919806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJs33trCtM4FO+BRynBQSLIFoFQoDytGB9w8reb9K60=;
        b=RAhPBtxxHtCzTFLsgZn0jahNEp2q4YWeyPStPxjwTPKGAusTQroOcP4O9GEKc74qVO
         sOB4fUTRaJ1ohZIf8YFdn0cX+/A7SozRpBFUBP+tT5Hx9OkOfjzSMCCIyZdQAMDjvHWH
         0CiViB4DvV1uQl9ZDHsNykwW752RE/Lob+5iejRzeMi3TTa1uytXVc4YcWWevSYEumTP
         EzhTW8xiQQa/eGrxSDzuqBpnyDoxezIODW9Mwaw+tSWlyzOn5TLKInBXeD48pjASSoqQ
         iwCKNwbSJIK1nYwgGB8wQ8dgtonyhRBKY7eRiy4V/h2j6QSsM2qFBWFXTTN+xx+pttto
         GgcA==
X-Forwarded-Encrypted: i=1; AJvYcCW1iF0nQIWuorqOm+1s+05Z6NbbKKjpwvriJHwO9TOv5exTmYigPT43GF+NRyCMKhQOxDlU9srhks9pE3TAOXLmuYU=@vger.kernel.org, AJvYcCWsyISb8/RKkMxlnaSjb1LRCU9bCiA4ufXR00Z5+MtHcD7kVGf5O6wcWfnJgX+i2ivlRzsQ/VgvKQFj@vger.kernel.org, AJvYcCWxEtWRk2/nE4lw8b78VMG6gNMXatzLMOhp7xmuKFCi9fzJa8jvBvL6hlJKqPrNH5sWFQeUXpTCK8HgESg1@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0JLk75TIxa7/VSq7RhRxF4hbCkQQ3LvZ7Uu7UwFkgt/quRpk
	ltOtAAAOgmbna5IEjB/PAEuBpI9kiW58RFGlmsqwtutOqHITyEG6vxm7
X-Gm-Gg: ASbGncscRfmFL/4V/dgch5X3KJvFwMzd3vqJkiNODoQxjBUsycrNeX8cPCaUmDlzx9o
	Ayo6JEbuLOhWk9JZAYK+81BfWxL48htXzBKqnXkzgMiGbjF/RLzEZ7n9d/5JBKxT2sld7Ia/UW4
	ZiD1SHpOS7OfBTuo3E/nQsbk9wVwgzHotEslKG3dKpr/+l/CKm8UQZYGYvhxEccjigjn6gg2S3G
	Se3/tgQtqH9D66EZJC86F48U90svgD6JXxGzbIlD+39QVN8NXZu+lePei3nZfRuhTjpIuQ4c9fl
	RPdeSc1HJ/OZ2IS1KDv1Xr2x9q23PLnWsgodj5d/AsJD1U8uCW4R7heshw6UirpEovAdJ9BshwP
	m3NG6URQL4nU=
X-Google-Smtp-Source: AGHT+IE5/W8Gf1/21JSZa4TvDeD7KT2eI7tMaNWTTrnHLcG5flQAyc+E9OrKK+YlRfdFzx8BJ3kdaA==
X-Received: by 2002:a5d:5487:0:b0:3a5:2cf3:d6af with SMTP id ffacd0b85a97d-3a900949a6fmr11756548f8f.45.1751315005646;
        Mon, 30 Jun 2025 13:23:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a065:f77f:7ac4:1c25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5b7fsm148523195e9.10.2025.06.30.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:23:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v14 0/5] Add RSCI driver for Renesas RZ/T2H SoC
Date: Mon, 30 Jun 2025 21:23:18 +0100
Message-ID: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas RSCI (Renesas Serial
Communication Interface) driver for the RZ/T2H SoC. The RSCI is a serial
communication interface that provides UART functionality and is used in
various Renesas SoCs.

The series includes the following changes:
1. Device Tree Bindings
2. RSCI Driver Implementation
3. SH-SCI Driver Modifications
4. Maintainer Updates

v13->v14:
- Rebased on latest linux-next.
- Switched to using `EXPORT_SYMBOL_NS_GPL` for all exported
  symbols in the sh-sci driver to allow RSCI driver to use SH-SCI symbols.
- Added MODULE_IMPORT_NS for SH_SCI to allow RSCI driver to use SH-SCI
  symbols.
- Dropped using `R9A09G077_CLK_PCLKM` macro in DT binding

v12->v13:
- Rebased on latest linux-next.
- Updated commit message for patch 1/5 to clarify the ABI change.
- Used `R9A09G077_CLK_PCLKM` macro for core clock.
- Dropped the defconfig patch as it is already in the queue.
- Added reviewed-by and acked-by tags to relevant patches.

v11->v12:
- Rebased on latest linux-next.
- Added defconfig patch to enable RSCI driver.
- Added RZ/N2H support to the dt-bindings
- Used port ops callbacks in sci_shutdown() to allow RSCI driver
  to reuse the core shutdown logic.
- Added reviewed-by tags.

v10->v11:
- Rebased on latest linux-next.
- Added a new patch to update the dt-bindings maintainer entry.
- Added a new patch to use port ops callbacks.
- Implemented shutdown_complete callback
- Added reviewed-by tags

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: serial: rsci: Update maintainer entry
  serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in
    sci_shutdown()

Thierry Bultel (3):
  dt-bindings: serial: renesas,rsci: Add optional secondary clock input
  serial: sh-sci: Use private port ID
  serial: sh-sci: Add support for RZ/T2H SCI

 .../bindings/serial/renesas,rsci.yaml         |  19 +-
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rsci.c                     | 480 ++++++++++++++++++
 drivers/tty/serial/rsci.h                     |  10 +
 drivers/tty/serial/sh-sci-common.h            |   8 +
 drivers/tty/serial/sh-sci.c                   | 212 +++++---
 7 files changed, 648 insertions(+), 89 deletions(-)
 create mode 100644 drivers/tty/serial/rsci.c
 create mode 100644 drivers/tty/serial/rsci.h

-- 
2.49.0


