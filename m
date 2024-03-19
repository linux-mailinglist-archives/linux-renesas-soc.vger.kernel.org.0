Return-Path: <linux-renesas-soc+bounces-3903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0441F880138
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 16:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 903441F23E54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9747A657CF;
	Tue, 19 Mar 2024 15:55:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079C657C3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 15:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710863714; cv=none; b=TGgmzlHg5fOCGxc1u6Ju1Wbu+bny+I9fNv9IQa6yihV1y2xX3OWW2I4OEnhyRqvB98vmttBajtPnJQVJMnem4L5YbsDwiqsNe+MoygqXr9eGqlf+xZd4zjBCVgR75HzGNflI95YO2Fd5RZlzYWP5mzqPFnOKRa4Vr7m5NGUNtCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710863714; c=relaxed/simple;
	bh=QarFxf5EsGCk5fFxeuwNvzbs25LY1jUcUwlSHdB6EQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NL5Xr525/mf8wkEiqffSpUwCZyFUait/5e0bIcnsOA4kFuc0EWHvHQhLR4QftqgnGnMOdj5awiG9vwn9Bx770Rhn3SsbmaXyHPX+X9y8qooL+jXh/5MJk+k83b+kSwxiIoytWxOvnABu782yf8DaFOGJh00JtBVUuJow+6viawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Tzbfx2P8lz4wyDd
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 16:46:17 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id 0fm82C00J0SSLxL01fm8mq; Tue, 19 Mar 2024 16:46:10 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmbev-00468i-Ez;
	Tue, 19 Mar 2024 16:46:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmbfE-000pFS-Aq;
	Tue, 19 Mar 2024 16:46:08 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] dt-bindings: timer: renesas,tmu: Add more SoC families
Date: Tue, 19 Mar 2024 16:46:02 +0100
Message-Id: <cover.1710862701.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series documents support for the Timer Unit (TMU) on the
R-Mobile APE6 SoC, and on various SoCs from the RZ/G1 and R-Car Gen2
family.

Feel free to squash together if deemed more appropriate.

Thanks for your comments!

Geert Uytterhoeven (3):
  dt-bindings: timer: renesas,tmu: Add R-Mobile APE6 support
  dt-bindings: timer: renesas,tmu: Add RZ/G1 support
  dt-bindings: timer: renesas,tmu: Add R-Car Gen2 support

 .../devicetree/bindings/timer/renesas,tmu.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

