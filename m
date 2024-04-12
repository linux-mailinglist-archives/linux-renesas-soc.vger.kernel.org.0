Return-Path: <linux-renesas-soc+bounces-4546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941DA8A2CD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 12:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5B351C21D0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 10:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170BC502B0;
	Fri, 12 Apr 2024 10:49:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2E43AD5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918948; cv=none; b=NpRxL33D8mK6z3wGWFGLm3BC0DSLwD+c7yv5aENHfEv2s6pv74ZoP1FMYXMSdxSbbh+sz9Y/DDttGZ4VrJ9d2UY/21XP0goFlwMYMy/StEvIn0u2RUYm0e8Wiw7o3G1lObs+xIk64usPlLQy4cxxauLyQGDmbfN0KIYOI40tHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918948; c=relaxed/simple;
	bh=c7uGBSgj4i54t4cuUVmXTwG47NlFc+8aGQoUG+2Uv9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z+lVYbrGo8VdeZiMvD3p74vN3dy1C1pMzBN9x4PAkz9kF+TTAPlynPcLa6oAcdDfk4UEJaS+H5n+lJZBoLizSIoWrxlcacaTvcBQjUQ437Zjj7zLo+KjX6PdY8UA4xhwdrQVBwcydZqD4O4CRt7goSO4YuOUH+zdHP12rZzchCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id AAox2C00G0SSLxL01AoxX9; Fri, 12 Apr 2024 12:48:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESF-00GpBe-KB;
	Fri, 12 Apr 2024 12:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDjV-004eRm-Vf;
	Fri, 12 Apr 2024 12:02:10 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Fixes for v6.9
Date: Fri, 12 Apr 2024 12:02:07 +0200
Message-Id: <cover.1712915891.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-fixes-for-v6.9-tag1

for you to fetch changes up to aa43c15a790cf083a6e6a7c531cffd27a5e1fd4f:

  pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration (2024-03-26 09:42:37 +0100)

----------------------------------------------------------------
pinctrl: renesas: Fixes for v6.9

  - Fix a dtbs_check warning on RZ/G3S,
  - Fix a lockdep warning on RZ/G2L.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration

Lad Prabhakar (1):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow 'input' and 'output-enable' properties

 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  2 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c                       | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

