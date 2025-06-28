Return-Path: <linux-renesas-soc+bounces-18873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9601EAEC6D7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 13:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B32E97A3D32
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 11:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B768F24729D;
	Sat, 28 Jun 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug6dxk4b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB45246BA4;
	Sat, 28 Jun 2025 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111841; cv=none; b=flqOonyhIYX+q0KEoXc/dqKAWgyeHGE/aksd4Vbu1qKngHCH7AXGShJNhUsmBlV5nj/7uX5Fo2A9SeqfL1kytm7CzNmq59UUpzEeTFHNuXfwu/1Ao+Gg2Zdy1PUiB5MBIVo8qHZOFM0B8r0tVV8qM+i7TIF1qZas+jS+3rthFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111841; c=relaxed/simple;
	bh=YHr9KQZ36tnOrljfTYaKkQ5vvsqhvuB3RzhIQ28/jIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkSaYgeLQm+K+mhVvoE7KoltIvRtNVWvkoyO9FIROkravLBfIwK0Zb+t/zgk4PY4Lsli9626B2rxxDWDXMEfqkISBCDNnvnrgUZMO5sgV2MDVy0vvJTjFeDuF04AJ6F8v+FCRgY10d08+ATNLD1Ye85aSAuAmrLXKk/WSLZvH18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug6dxk4b; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so5214095e9.3;
        Sat, 28 Jun 2025 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751111837; x=1751716637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPMIEYMa2kEoPCHLXqmno8367qeo8AfLkc360n37laQ=;
        b=Ug6dxk4b2rhUOckvjpw+AIpPSykYM2lK/DjFfEvdQZvaMCK7dGsxZUrTPur/OUQOre
         doLeTe8KJ2bAkKPJm/d/2KF8PR4gR+4qyiEC6P/CJfPtiMLp1YF4SfImTu2bTEtcxtlg
         0sNBDHor80BaxvVhf53Bs8eRIYW0ByRUIJuYySf6r3BhsjZ/8uP6uRPYmTL0BGaS2/H5
         pXyvqX81QAHzBtzJcjtWddIhmFKLUXDyg0hMwgb1vWvO5TPVlWjXPDuMW9N/XT1splyh
         z94JtuEampH5idZvfvq63OmVEGB6ZC4UeYKuTmf9QpEwkZFBRL4/1BD0/d479Dxao+pT
         46Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751111837; x=1751716637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPMIEYMa2kEoPCHLXqmno8367qeo8AfLkc360n37laQ=;
        b=HFlsMG1OI4V7dSD383SRVU0FLVqcG2K3Dp3U8bHOC/T/FOYxnXii4jdICYReSgMNwS
         jWx2iPqA/9PMjw7G4K2WLhFKJO7LxkCEguztEM71XCuvIwaAMwFVLeLackTiK9h+VSxf
         hp1mg2ePu/ndhe1NcBaDkgw2yLKE7qU9R3UcFiZ+LSh0YnpfV20SscrV9F8Qm74PETNi
         DVgtoaZkd3uMwT/ULpYYXzOSyS0Y2cR95F9X0sYMBujN1ZJBePiCBVwOlmD2gEUx1VB6
         MaN0RBEn4bwBluwh6ZeAXCeHrlF61UzipwETKYnSquOVTTC/0pRhC1KxpLWTgAeMDztH
         5gNg==
X-Forwarded-Encrypted: i=1; AJvYcCV84jzj6kWrG4SLg5ern8jaSUmAN//xp7Ovw7vdIAradsquczG0CUEXJ68v5DBW4TJTo5UM5GhhI3a5msWbvU7eREY=@vger.kernel.org, AJvYcCVTKUA4l8Mob3t/K3PAgoY5RwRE3CSIicSfU3ONg37dKp2tu2/DAqLIRZg3HBzAR8uFgFDoIb8GLmMvS5hQ@vger.kernel.org, AJvYcCWiqhv4wXvTwdmX2+iCnT6RFyI3jk7CzDPc6DFdZAAxtcUN3YrLFmR6LmPp0NP1w7/SkBXZT3ON0Esq@vger.kernel.org
X-Gm-Message-State: AOJu0YwepDWxQHfv4ZcRWjC/2T8fZA2y5zeMDHJKkR+kQEreeXGcjXKc
	/ABfAogp/I/gi4a+TVDVgCvAbI5pZhPFqCmnMPDLGS0GhwX1OCR4EDp/
X-Gm-Gg: ASbGncscF/SqKVuAREMxEWhyBD/256Bqo/dbAV1gpvUmPkdMJw4LXdzSVktwM+QQGdu
	0QkyBf7G5732hVPCEjhBvX4ca7dHdJPsn03meHta5dSVDmgnHeeitjy0DPwD+mtmZqdhA/qWCHg
	Ittl9i6zHPCJElye8WRy1/XQfe9ItYiTpvV+o9WQG3YvDT4T4SuaKG5LMRo/fnKgl9OoBYUzkyj
	Lwxi3LFdY4lnGIqH2PsdIq8vEYn0CSmWxGbEs7/QEnVh4OmHQ7fmgFsDrwvg+hGu4+adJ9KfcSg
	cEL2/kcfUcYrEuFyKIo7R/DODt9AtmRDv1EzZF+krOF2YyuxVrQvVDQNc61P2ueJhP9UoClNwBD
	2eAQDidCnYeOm3POzLEp3
X-Google-Smtp-Source: AGHT+IHoChtp6SjTFN3Z1VDBHHWF09zXheAAeIjJYUUZxoCzhG4BiT10G28vVCaIMNjCNOgGZl4k7w==
X-Received: by 2002:a05:600c:c11a:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-4538f217b59mr46273815e9.6.1751111836825;
        Sat, 28 Jun 2025 04:57:16 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dca0:b0f1:f055:ea37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7310sm5247818f8f.18.2025.06.28.04.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 04:57:16 -0700 (PDT)
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
Subject: [PATCH v13 0/5] Add RSCI driver for Renesas RZ/T2H SoC
Date: Sat, 28 Jun 2025 12:57:10 +0100
Message-ID: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

 .../bindings/serial/renesas,rsci.yaml         |  21 +-
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rsci.c                     | 477 ++++++++++++++++++
 drivers/tty/serial/rsci.h                     |  10 +
 drivers/tty/serial/sh-sci-common.h            |   8 +
 drivers/tty/serial/sh-sci.c                   | 212 +++++---
 7 files changed, 646 insertions(+), 90 deletions(-)
 create mode 100644 drivers/tty/serial/rsci.c
 create mode 100644 drivers/tty/serial/rsci.h

-- 
2.49.0


