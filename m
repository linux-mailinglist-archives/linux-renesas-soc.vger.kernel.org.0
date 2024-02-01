Return-Path: <linux-renesas-soc+bounces-2214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D68459BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBBD128241F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF2D5D465;
	Thu,  1 Feb 2024 14:14:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA05336D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796881; cv=none; b=ES8tQRjupcEHwYKBachNlake+ng7VDnKwv7Ewqn1qOauuz65ul6KTwtSDGiILn/bSNcrndcpaeUpW0LwrbQ310BNzUVFP52o1XgK2tAelVbjkWWlLi73fGf0Aq6MoUB9/WmC3OYXAqTbwpm0UbPZW5wy2eZph/n528H9r/Uuvdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796881; c=relaxed/simple;
	bh=M3+rHy2AvNp1du11yORHQQdphOQ9nwMsArmaun+yQI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hOz9/gX9/s+npj3jVfqw+hgR5Soer/LASwa04Ye5W6iI28U1Dlt7JNhdWEsFzJlzw3IGT37nRiXCRzCcDZDrfVHa2tURYAD+YwRUZG4NxUBj4ZAHWrv8NF6rRhmEBzA8en7xeKHfNAcnNcjGoLJKuJpR0ddYHzVnUvffd35AutI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by michel.telenet-ops.be with bizsmtp
	id hqEd2B00J4efzLr06qEdch; Thu, 01 Feb 2024 15:14:37 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXp2-00Gv44-AP;
	Thu, 01 Feb 2024 15:14:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXpt-00AXZJ-9X;
	Thu, 01 Feb 2024 15:14:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0/gray-hawk-single: Add I2C and EEPROM support
Date: Thu,  1 Feb 2024 15:14:32 +0100
Message-Id: <cover.1706796660.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds I2C support for the Renesas R-Car V4M (R8A779H0)
Soc, and I2C0 and board ID EEPROM support for the Gray Hawk Single
development board.

I intend to queue this in renesas-devel for v6.9.

Thanks for your comments!

Geert Uytterhoeven (1):
  arm64: dts: renesas: gray-hawk-single: Add I2C0 and EEPROMs

Hai Pham (1):
  arm64: dts: renesas: r8a779h0: Add I2C nodes

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 41 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 56 +++++++++++++++++++
 2 files changed, 97 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

