Return-Path: <linux-renesas-soc+bounces-7270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB392E84E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 14:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1F01C20DCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 12:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C46915CD6A;
	Thu, 11 Jul 2024 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z1Lm4zyV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589D114F9DA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 12:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701253; cv=none; b=ZmujXdy/oVu2EFrAlQHMBaZQmJVHWVkEIhDTUGSnHcwzVARzeH74OFleRK5PwPwB5IjfRtb8SROqswA4HOVwdp5NiKUHMGPvqZQMpPv7Yz5nquEayxRIzP6d/DesO18ayVHnAKHjjkSNZNdnBCdytkGau4B4gNN0ZUhpkMD1w3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701253; c=relaxed/simple;
	bh=SVNaY8uPYmFpQzt05SCgtnQKzfh+zub5JZo0eT+9Phg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NXkjwOW2xX2ShbadiE5FpV/8uILhkZIPiU93ytrT4sk7VtmNJIW+UaUOeFwyErvCRm6SkgTWmoyDov04s6ExTbRG7GK7ph1otFcLqZlOH+NSx8d0sldllJrBJdXCGF1a0WLFdHGDZegytTSM8dzFEVRhLBarsJ3kuJLLKbUv5pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z1Lm4zyV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42793fc0a6dso5528845e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720701250; x=1721306050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9gF9Nlbjx+3WYbHXvq9fYfuO2GW0NccrZ1QB+XZf7o=;
        b=Z1Lm4zyVSvhDfmJwHgzoAdMhlTeGWvnPlgRXTe568rRUpNKQRjF/3eM0HXjIh94xJl
         ss3epwTRjcPMqB+cVbg7yg/yncI8PiJ6jGH1hv46XGFqTkMWriJuNOYe/l97RIFp1199
         yx4yS1lYe2vsnLM3hOg4Eiebbm5sj1SxHwGvOxaoW52XhPll9Jw3gjcMwqglDSbrQLX1
         FJYOi3KVph5tkOCK0ktt5FLuRRpgDFsi3WO6XFdI3+3MsATQADA+KRSicVw/1NFr7eEU
         hl9d/RpNZmos6qlLXqEri6xa6ekJNDQ9GG47PRFgtThwxQgSOfz9fFAkcM9r8gOhDiPC
         PeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720701250; x=1721306050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9gF9Nlbjx+3WYbHXvq9fYfuO2GW0NccrZ1QB+XZf7o=;
        b=hZCuva1npwfJ4zUScouFC8gJuz6gzOn0q6cG7pgBY6PnPFuleh2p881RQWuGz5syh3
         qKfB2wGMxDsGWNNTmNtaR8eebHt0jpjQHF5Yj/Uc2sI+qF7aNCr8R47L1yC0jX5ElPQ0
         WaBOm9Gpo+zAOlVg2Xe1TsEyvWXY2TkCVoDxCeJWN7Aoye9tSzgAyapNTpZVXaURal3V
         Qctpd0FTOIRzEBlkFNg2ja9Y/XSPaNTpiu31Ml9kSYususWVUYOH5Dsh4OvPQHXjfvVq
         sg3FxQspf5aJU8JGdZeyD2SNVMeR6POojPo0gHZrlSdTaEgPUyxkCWk925acsHX3mZch
         HiCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWHsi1Iw4+5XGxloTF8RgqOP541vKjcEjHajKAct3bZM08CzepkoM6atcYy70Hh/Jz+4n36EPqVlXMP6/s9pnQj9H3wO1hEk1Z04rjCoZSZFw=
X-Gm-Message-State: AOJu0YycO6WjGkYw/M1/FLtVQ/C2LpO69Oy2CH3I2HI65aTEH7xx7evY
	CZC8ZTbkdwkQtrdvAsSnEZ9pFDLUOL3C1kL849J/tDvX+5PaLDG9y7pqfgIUNJY=
X-Google-Smtp-Source: AGHT+IE5OyEhveFcUAtoaVHeQx6Q9QEh5xiYR0uZxQSYMrJpf+ubS8v9LD0epdhy9PvZtkshzAQd/Q==
X-Received: by 2002:a05:600c:17c7:b0:426:654e:16d0 with SMTP id 5b1f17b1804b1-4267018b105mr69388925e9.0.1720701249790;
        Thu, 11 Jul 2024 05:34:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741fa6sm118583955e9.45.2024.07.11.05.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 05:34:09 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/3] dma: Enable DMA support for the Renesas RZ/G3S SoC
Date: Thu, 11 Jul 2024 15:34:02 +0300
Message-Id: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series enables the DMA support for the Renesas RZ/G3S SoC.
It adds DMA clock and reset support, updates the documentation and SoC
dtsi with DMA node.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  clk: renesas: r9a08g045-cpg: Add DMA clocks and resets
  dt-bindings: dma: rz-dmac: Document RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add DMAC node

 .../bindings/dma/renesas,rz-dmac.yaml         |  1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 38 +++++++++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c           |  3 ++
 3 files changed, 42 insertions(+)

-- 
2.39.2


