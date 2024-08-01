Return-Path: <linux-renesas-soc+bounces-7681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FB944D81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB0B528226C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2091A38C1;
	Thu,  1 Aug 2024 13:54:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AE184549
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Aug 2024 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722520489; cv=none; b=jfOYHlz0YlsuV7y/enD6zIGCmcclGEf/kfvRXDueHDoXmqJ5d3PWhm6YzijfL2TjJaxljeEC7A2Lfnp52ZAJAG3Zt8dS6i9qk9er+piHutrKLipVRkxrwuPf90bcP3PrJlvYzXgl4tFzlD+7YvBFPwIz8RXc8hXTaKcWDEWYd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722520489; c=relaxed/simple;
	bh=WzgXysNvC8E4Wy8RZggufH7byUp2pV4OsqAawE4Tk5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iVYhb1OJrjGsUiL2JWwYZ8tSOkYbubNSToOGNpg/UZ8tOnJEmgr3WRZEbgkyMZNX8zRwhsjoy/U+/RWtz4bANKkllkx/YdNwUK3asnrfGN6w4v6UbdaVVvW21ObR91AF6pG9TYih3DZ63VMX2LeR7+ES4pNI108xjNwEyPwLqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fff7:d11a:41d8:a195])
	by andre.telenet-ops.be with bizsmtp
	id uduh2C0075XJrhx01duhqL; Thu, 01 Aug 2024 15:54:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWG0-004S9u-UX;
	Thu, 01 Aug 2024 15:54:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWGP-00HOE0-3O;
	Thu, 01 Aug 2024 15:54:41 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm64: dts: renesas: Add CAN-FD support for R-Car V4M and Gray Hawk Single
Date: Thu,  1 Aug 2024 15:54:34 +0200
Message-Id: <cover.1722519717.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds support for CAN-FD on the R-Car V4M SoC and the
Gray Hawk Single development board.

The CAN-FD module on R-Car V4M is very similar to the one on R-Car V4H,
but differs in some hardware parameters, as reflected by the Parameter
Status Information part of the Global IP Version Register.  However,
none of this parameterization should have any impact on the driver, as
the driver does not access any register that is impacted by the
parameterization (except for the number of channels).

Just like on R-Car V4H and on the White Hawk development board, channels
0 and 1 work fine, while channel 2 does not seem to work at all, and
channel 3 works for transmit only.  Hence this patch keeps channels 2
and 3 disabled.

Changes compared to v1[1]:
  - Spun off clock and DT binding patches,
  - Add missing pinctrl-names,
  - Correct TJR1443AT Enable GPIO,
  - Reword now channels 0 and 1 work.

I plan to queue this is renesas-devel for v6.12.

Thanks for your comments!

[1] https://lore.kernel.org/cover.1715956819.git.geert+renesas@glider.be

Duy Nguyen (1):
  arm64: dts: renesas: r8a779h0: Add CAN-FD node

Geert Uytterhoeven (1):
  arm64: dts: renesas: gray-hawk-single: Add CAN-FD support

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 41 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 41 +++++++++++++++++++
 2 files changed, 82 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

