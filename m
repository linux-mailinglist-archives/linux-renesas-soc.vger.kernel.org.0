Return-Path: <linux-renesas-soc+bounces-10779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 832609E08DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 17:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58AA2BC6903
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 16:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294241D5AC0;
	Mon,  2 Dec 2024 16:30:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B01C2DDE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733157025; cv=none; b=fSpqAY8oFCgu9aLNLelncI2fE7SQ1PpVzMzW1QytsUVGRhd9937vAbYelC4g3B0Z44tOfX8iRuQwUZ81Xz1SE7LvDFymE+KEAjAYdOMz03CuZpxdfOsKFFpWtFndY6LvF15M8F1XzBU6sK8Iz4t1DLmkEKFRet+bD5Gpa2NNML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733157025; c=relaxed/simple;
	bh=2n/5D7/C1BRHXkJ6FiB2gY6t0+aUjQHAT9SgGQJACDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e1ERhC1JyegnfNIIsHqcdh0Go6NZ/bcoiIjLwXmvRi/cPcDUxx0BFtVc9BW4H+OORf1L0UtgkMBS4ywYRjzzTcosbiFxe1xT2VPCTXhSVsj0YvXgocxAQZlOE0DEFZcmtqnWxo8LvRGvecOdMlSC6P0zRYL13QjnApfT4d0jr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by baptiste.telenet-ops.be with cmsmtp
	id jsWE2D00N1yjZj401sWEo4; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007u9-LW;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnL-I4;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
Date: Mon,  2 Dec 2024 17:30:06 +0100
Message-Id: <cover.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds support for the Renesas R-Car V4H ES3.0 (R8A779G3)
SoC on the Renesas White Hawk Single board.  R-Car V4H ES3.0 (R8A779G3)
is an updated version of R-Car V4H (R8A779G0).

I intend to queue these in renesas-devel for v6.14.
Thanks for your comments!

Geert Uytterhoeven (5):
  dt-bindings: soc: renesas: Move R8A779G0 White Hawk up
  dt-bindings: soc: renesas: Document R8A779G3 White Hawk Single
  arm64: dts: renesas: Factor out White Hawk Single board support
  arm64: dts: renesas: Add R8A779G3 SoC support
  arm64: dts: renesas: r8a779g3: Add White Hawk Single support

 .../bindings/soc/renesas/renesas.yaml         | 16 ++---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../renesas/r8a779g2-white-hawk-single.dts    | 62 +------------------
 .../renesas/r8a779g3-white-hawk-single.dts    | 16 +++++
 arch/arm64/boot/dts/renesas/r8a779g3.dtsi     | 12 ++++
 ...hawk-single.dts => white-hawk-single.dtsi} | 11 ++--
 6 files changed, 44 insertions(+), 75 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3.dtsi
 copy arch/arm64/boot/dts/renesas/{r8a779g2-white-hawk-single.dts => white-hawk-single.dtsi} (78%)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

