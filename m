Return-Path: <linux-renesas-soc+bounces-18770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E50AE9A69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 11:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB6CA4A390C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 09:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B8D2627F9;
	Thu, 26 Jun 2025 09:51:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAB9239E79;
	Thu, 26 Jun 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931502; cv=none; b=Btgj9/fpZiWc+Ef+xAlng/ibV4cm7QcoaBgQ2E7X8eOx4ijmAyR+BoqOsdnlcvMfXlzKAhs4r2yNQ/OsrvowrtAhTSgTEVQQ690kNMcdL40iSJ6+AxdkodNRsEo/YCj87Wh476Zz3fJOhhpzT7iYhMZD4kqL0P4uaUgy0ekZObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931502; c=relaxed/simple;
	bh=GAogl0MVLOfOGpNGLd25LIjqf8QgUf7LzfIvUj35LgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4Cme/jAP/MihiAnJtR30StYE8zmiiQoCBEp/kZjM8xpyehxzyW44ehxEXrgDKgb/1W+NeQ0BSDfHoliHOj4Uiv52WaIhVov675DwZ6lL+CIphQj8ZMMb8CEPXWp5/JbGz7iBsBMi8bph3wsfERGtWbmQ69FR1effJSWLy1/kqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DC4C4CEEB;
	Thu, 26 Jun 2025 09:51:40 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] arm64: renesas: Add support for Gray Hawk Single with R-Car V4M-7
Date: Thu, 26 Jun 2025 11:51:31 +0200
Message-ID: <cover.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

        Hi all,

This patch series adds support for the Gray Hawk Single development
board variant equipped with an R-Car V4M-7 SoC.

Changes compared to the internal RFC:
  - Correct board part number.

I plan to queue this in renesas-devel for v6.17.

Thanks for your comments!

Geert Uytterhoeven (3):
  dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single
  arm64: dts: renesas: Factor out Gray Hawk Single board support
  arm64: dts: renesas: r8a779h2: Add Gray Hawk Single support

Tam Nguyen (1):
  arm64: dts: renesas: Add Renesas R8A779H2 SoC support

 .../bindings/soc/renesas/renesas.yaml         |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 ...-hawk-single.dts => gray-hawk-single.dtsi} |  12 +-
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 855 +-----------------
 .../dts/renesas/r8a779h2-gray-hawk-single.dts |  17 +
 arch/arm64/boot/dts/renesas/r8a779h2.dtsi     |  12 +
 6 files changed, 43 insertions(+), 862 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a779h0-gray-hawk-single.dts => gray-hawk-single.dtsi} (98%)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2.dtsi

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

