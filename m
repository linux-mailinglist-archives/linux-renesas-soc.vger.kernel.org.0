Return-Path: <linux-renesas-soc+bounces-4734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F48AAE20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 14:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 174021C20AC8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 12:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C6783A0B;
	Fri, 19 Apr 2024 12:11:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5D882D99
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713528662; cv=none; b=dZZaNqvkoeM9BNrFkmnEpe3uYO6uXLzUl4WjxVBs/4H0WKD1aMrOeG+7XDi4UrT+PBz01W2wXfOOepkqakUU4wWXDpeVsoHfRdTckIIQHdUdGF+QT9EW/CfAbvEb8HkA186lPZRKHdidDnU/NdlXKCI5RMK/Avv1E73Mykakmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713528662; c=relaxed/simple;
	bh=GXioTp5LE2UHPTHxZ2g5Wfgp6DdeN8mLO2cptDuJvFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UP2Valunf50xDzDAFSeImh0O+WdELIWdDvOhiOnDV9QbWDLoE6WDa0CwtqsA1k13An8y+GgSnge0eq5BCkhyc54eSDLdmk+h4oEavZCzZKhNx/FW7ZHCkN0JvUM4lDM3dbphzuX74O/4nvQdmapIxRyBM5qNRFYcSx7LOuKhXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by albert.telenet-ops.be with bizsmtp
	id D0At2C0050SSLxL060At71; Fri, 19 Apr 2024 14:10:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxn4J-00DJLu-Mq;
	Fri, 19 Apr 2024 14:10:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxn4v-00GI7v-6U;
	Fri, 19 Apr 2024 14:10:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0: Add IOMMU support,
Date: Fri, 19 Apr 2024 14:10:50 +0200
Message-Id: <cover.1713526951.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds IOMMU support for the R-Car V4M SoC, by adding
device nodes for all IPMMU instances, and linking all current IOMMU
consumers.  It has been tested on the Gray Hawk Single development board
using Ethernet, MSIOF (SYS-DMAC), and eMMC.

Thanks for your comments!

To be queued in renesas-devel for v6.10.

Geert Uytterhoeven (1):
  arm64: dts: renesas: r8a779h0: Link IOMMU consumers

Thanh Le (1):
  arm64: dts: renesas: r8a779h0: Add IPMMU nodes

 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 114 ++++++++++++++++++++++
 1 file changed, 114 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

