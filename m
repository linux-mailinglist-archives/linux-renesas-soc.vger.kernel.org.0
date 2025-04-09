Return-Path: <linux-renesas-soc+bounces-15612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BAA81A08
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C240444F14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7235F2C190;
	Wed,  9 Apr 2025 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="snBe5LYY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1CE26AF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159707; cv=none; b=CYtVG1G/vlCcRvbskh1iT7YWRExN8x+dHt6ixl2EZopLQmPwAL472ebdJ3ryZ5c8vcKlrsT5xWnpXoCG8zBOiBhIPlHh8oHO3G50CKFHQdZaA34hgxn71wYw6TResmQEvrOjfLyW/4hB9x4Nk8V+5eSqwJ0b2w9orp7FIoYmj/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159707; c=relaxed/simple;
	bh=qe4we8joG1QieQ2+nTZeLUahqFK2L2/tEksQ6sBpGG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QN59tFdTxE9tFc/4SFSirm88y5apesb3fSWHPabNXFu6HUJPxXqvIuevaPeiUDycf8OLvjVZJBVRSL3ZiA08eb4sUNlX17E54unCGxofKBosWQEDu7qYXkDjRw8XNT/d+KDg0ZU2RHoyyK3Lx9PPU9ga+Vnr3eyfwbtwdfvHOVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=snBe5LYY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DA2682E;
	Wed,  9 Apr 2025 02:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159586;
	bh=qe4we8joG1QieQ2+nTZeLUahqFK2L2/tEksQ6sBpGG0=;
	h=From:To:Cc:Subject:Date:From;
	b=snBe5LYYs3OPF/rHATbwt/J9yfEvylqbak/85YbN5/zxD87Y4kvz5jSDKgdqj1Jmp
	 Mm5l1rFJGM3rpDKZVVmMIVdAKkqE2k5Dj3Y+9rqEaAkN2QklsP45PRB8P4+NrmYyWc
	 OQm8/HdBaDVmy+vRK8jqGzt8wAPlryVYWo8nt31Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 00/16] Add color space conversion test
Date: Wed,  9 Apr 2025 03:47:42 +0300
Message-ID: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds a color space conversion test to the vsp-tests
suite. The aim is to test the "[PATCH 0/6] media: renesas: vsp1: Add
colorspace support" series that I have just posted to the linux-media
mailing list ([1]).

After a small white space cleanup (01/16), the series starts with
converting the vsp-tests suit from make to meson, to facilitate
cross-compilation. Patch 03/16 is another small cleanup that renames a
file to give it the correct extension.

The next 6 patches improve the gen-image application to properly handle
the color space conversion, implementing a pixel-perfect emulation of
the corresponding VSP hardware block. The series then moves on to
improving and expanding vsp-lib. Patch 10/16 helped me debug issues by
saving RPF input frames upon error for inspection. Patches 11/16 to
14/16 expand the library to support RGB <-> YUV conversion in pipelines.

The last two patches add a color space conversion test. Patch 15/16
introduces the new RGB <-> YUV test, without the ability to specify
color space parameters, and patch 16/16 then adds the color space
parameters.

The test requires updates to media-ctl and yavta to support setting
colorspace on video capture devices and on subdev source pads. The
corresponding patches have been posted to [2] and [3] respectively, I
expect them to be merged soon.

[1] https://lore.kernel.org/linux-media/20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com/T/#t
[2] https://lore.kernel.org/linux-media/20250408161051.10472-1-laurent.pinchart@ideasonboard.com/T/#u
[3] https://lore.kernel.org/linux-media/20250408233323.7650-1-laurent.pinchart@ideasonboard.com/T/#t

Laurent Pinchart (16):
  gen-lut.py: Replace tabs with spaces
  Convert from make to meson
  Use correct .ppm extension for PPM images
  gen-image: Round sub-sampled chroma towards zero
  gen-image: Update the RGB to YCbCr conversion to match VSP hardware
  gen-image: Split struct params into CSC and packing parameters
  gen-image: Centralize format conversion code
  gen-image: Don't copy CSC conversion matrix
  gen-image: Add support for YUV to RGB conversion
  vsp-lib: Save RPF input frames upon error
  vsp-lib: Support specifying pipeline internal format for RPF -> WPF
  vsp-lib: Centralize pad format setting in function
  vsp-lib: Use canonical media bus code names
  vsp-lib: Add support for color space
  tests: Add WPF RGB to YUV conversion test
  tests: Add color space support to RGB <-> YUV conversion test

 data/frames/.gitignore => .gitignore          |   2 +-
 Makefile                                      |  14 -
 README                                        |   8 +-
 data/Makefile                                 |  14 -
 data/frames/Makefile                          |  17 -
 ...pnm.gz => frame-reference-1024x768.ppm.gz} | Bin
 data/frames/gen-lut.py                        | 122 ++--
 data/frames/meson.build                       |  28 +
 src/.gitignore => data/meson.build            |   4 +-
 meson.build                                   |  36 ++
 scripts/Makefile                              |  10 -
 scripts/bin2png.sh                            |   8 +-
 scripts/meson.build                           |  11 +
 scripts/vsp-lib.sh                            | 279 +++++---
 src/Makefile                                  |  29 -
 src/gen-image.c                               | 599 +++++++++++-------
 src/meson.build                               |  21 +
 tests/Makefile                                |  10 -
 tests/meson.build                             |  35 +
 tests/vsp-unit-test-0028.sh                   |  54 ++
 20 files changed, 819 insertions(+), 482 deletions(-)
 rename data/frames/.gitignore => .gitignore (81%)
 delete mode 100644 Makefile
 delete mode 100644 data/Makefile
 delete mode 100644 data/frames/Makefile
 rename data/frames/{frame-reference-1024x768.pnm.gz => frame-reference-1024x768.ppm.gz} (100%)
 create mode 100644 data/frames/meson.build
 rename src/.gitignore => data/meson.build (57%)
 create mode 100644 meson.build
 delete mode 100644 scripts/Makefile
 create mode 100644 scripts/meson.build
 delete mode 100644 src/Makefile
 create mode 100644 src/meson.build
 delete mode 100644 tests/Makefile
 create mode 100644 tests/meson.build
 create mode 100755 tests/vsp-unit-test-0028.sh


base-commit: 3c1560e02df0f4910df36dcd146963ef16006040
-- 
Regards,

Laurent Pinchart


