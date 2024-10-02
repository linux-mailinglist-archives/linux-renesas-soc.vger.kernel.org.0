Return-Path: <linux-renesas-soc+bounces-9295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C0798CDC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 09:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774A21C20F6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 07:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A241714DF;
	Wed,  2 Oct 2024 07:35:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DAA145A19
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Oct 2024 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854519; cv=none; b=ZIrUw05jyaB9PSC6aGUNeHwJfWSiRWv99E6cW5dxGGA31kZCLLQm92ZPydusERO6YnH58IpEieEioBcWBh//oyNBXIDFeozprbZYkor1eNB4u6Fe5+wMBAvmthSctGiKGnoajJ0m97w61mxwD+bd8ZTs1Hz+sjOZTSMC3vTl3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854519; c=relaxed/simple;
	bh=T1TASvHPB5TBEZP95zPqinwhLF589z9m+uCKirPEb78=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ljm2QZjklZ3BP+0qS4XmqnFqMfJ4K24edgre/qo/rZl1w86ltabsceEdEvYV62G1N46DRDYSC0AplezsiSvYFlb+xfEBXlAqAHsyZrLjhW810iHuqoKYINVIpOs85FFBzHJaaqtbFTNEK7fp40ThvfQ3jc/T5mSb+LFPcM74TWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:80d:3d68:c8fe:1932])
	by michel.telenet-ops.be with cmsmtp
	id KKbF2D00Q4Qoffy06KbFwM; Wed, 02 Oct 2024 09:35:16 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svtt5-0016ye-7g;
	Wed, 02 Oct 2024 09:35:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svttD-003taz-EI;
	Wed, 02 Oct 2024 09:35:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] usb: renesas_usbhs: Deprecate renesas,enable-gpio
Date: Wed,  2 Oct 2024 09:35:11 +0200
Message-Id: <cover.1727853953.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The "gpio" suffix for GPIO consumers was deprecated a while ago, in
favor of the "gpios" suffix.  However, there are still several users of
the "renesas,enable-gpio" property, in DT bindings and DT source files.

Hence this series deprecates the old property in the DT bindings, and
converts all users in DTS files to the new property.  No driver changes
are needed, as devm_gpiod_get_optional() as called from usbhs_probe()
tries all suffixes.

The first patch is targeted for the DT or USB tree.
The second patch is targeted for the Renesas DTS tree.

Thanks for your comments!

Geert Uytterhoeven (2):
  dt-bindings: usb: renesas,usbhs: Deprecate renesas,enable-gpio
  ARM: dts: renesas: rcar-gen2: Switch HS-USB to renesas,enable-gpios

 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 4 ++++
 arch/arm/boot/dts/renesas/r8a7790-lager.dts              | 2 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts            | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

