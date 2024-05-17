Return-Path: <linux-renesas-soc+bounces-5393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D828C8901
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 17:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22598284AC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 15:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9616A325;
	Fri, 17 May 2024 15:05:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1696A332
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715958304; cv=none; b=q+CltsYp0NxNM/atXg89+aeSUXsieC1vp6n5RjEvlLg7Gd+jU1hHYOCBhcS53ZMKj8QikBQYb0GD8brbA8J6fKYyFXC6sFx1cs73DIBK5vXzU2KwBsisCmsHXu6b2+TTyOqijBuo6Z4ZKROfALmh4MYYuMolAzCR21w3qSwPz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715958304; c=relaxed/simple;
	bh=qocAcf+LrxN6XipwQwSEio+j9lBl2rwELi9v33LH2xs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eNfaij8wP7KxXDTP5TCCyRvHWgK40gqQq0tUwkB3iXQeRdlJJY0Np/7StP/ZDyoL3JeFtvR0yzf6jqs6/noJklARPzBFMBXA98mCEZeXMlvFsf2NV7HguciywPX19my84hw+GZUoGT8dvXX254GCvypoqn1H5E4A5+TMil5S9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4VgqnM3nKJz4x1CT
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 16:57:27 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9706:8977:9494:a7c7])
	by xavier.telenet-ops.be with bizsmtp
	id QExK2C00A0bc1Xv01ExKtY; Fri, 17 May 2024 16:57:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7z0U-00BDn8-Cf;
	Fri, 17 May 2024 16:57:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7z1L-00C63E-Cu;
	Fri, 17 May 2024 16:57:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/4] *arm64: Add CAN-FD support for R-Car V4M and Gray Hawk Single
Date: Fri, 17 May 2024 16:57:12 +0200
Message-Id: <cover.1715956819.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series aims to add support for CAN-FD on the R-Car V4M SoC
and the Gray Hawk Single development board.

Unfortunately it does not work: bringing up any CAN interface fails
with:

    rcar_canfd e6660000.can can0: channel 0 communication state failed
    RTNETLINK answers: Connection timed out

This error means that instructing the internal MCU to switch the CAN-FD
channel to operational mode timed out, and the channel is still in reset
mode.

The CAN-FD module on R-Car V4M is very similar to the one on R-Car V4H,
but differ in some hardware parameters, as reflected by the Parameter
Status Information part of the Global IP Version Register.  However,
none of this parameterization should have any impact on the driver, as
the driver does not access any register that is impacted by the
parameterization (except for the number of channels).

Channels 0 and 1 work fine on R-Car V4H.  I have compared all register
writes between V4H and V4M, and dumped and compared the full register
block after a sucessful and failed bring-up of a channel, but there is
no other failure indication in e.g. a status or error flag register...

Thanks for your comments!

Cong Dang (1):
  clk: renesas: r8a779h0: Add CANFD clock

Duy Nguyen (2):
  dt-bindings: can: renesas,rcar-canfd: Document R-Car V4M support
  arm64: dts: renesas: r8a779h0: Add CAN-FD node

Geert Uytterhoeven (1):
  arm64: dts: renesas: gray-hawk-single: Add CAN-FD support

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 22 +++++++---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 40 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 41 +++++++++++++++++++
 drivers/clk/renesas/r8a779h0-cpg-mssr.c       |  1 +
 4 files changed, 98 insertions(+), 6 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

