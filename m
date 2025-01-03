Return-Path: <linux-renesas-soc+bounces-11815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C74AA00C29
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 17:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71202161A48
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 16:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827F41F9F74;
	Fri,  3 Jan 2025 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZtVRxumZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA021FBEA6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922313; cv=none; b=igMMAEUTZynxuBj+9pe2W/Py9G7Ey0Ncm5gAdkTsBDhT4iRLCpXYQwxivpgKhgPl2qA2JfkuZa/cA7AvybkvjNnRVPLC8WiAyx6ESWoIH+01j6pzfsdmRqDt2BbVuYDY+b/D23aehX9+16C4YyAccxPAlHmeD0xPk0ptm0gKtN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922313; c=relaxed/simple;
	bh=yivWCk87L5Kn1vLLCLSBD23i/m0z9LXbY0astKk0t14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hugaZ9EOvNgM/wZSul01Mhh1IC0rkzCKMxiTvqkV6F1N5yIxlkpKMizV4kuKNjxdtiVnB5KtKLBNimsiCIZiPYGT2ei8b/dlQvxcocaNNgiFN4TI3q03Rfu3wxKHtfo2DZ999FerDm+7bJPTG7paJFhFdu0WoGkAWyA+oS2auOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZtVRxumZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so1966672466b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 08:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922308; x=1736527108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z12n6pwBuO+Lp/RU6Y/RGTOaXGSjqsnsbDrc/bXr6NI=;
        b=ZtVRxumZi6oAhVXSSG6Z9GCRYi7LXtt+pArtl/iylPnSZQtPviVxWoDbiUNgXEHAWj
         BesXaS3E2LRXKY7r/lp+9inSCoN4ZdJi1IJb25/dUWYY9LJHEf6pYoumM3kplxK8zPQ7
         98ccXllrKaXDCpelj8IRmDNg2cr9XcAE36Jn+mB0+7BVJa0BE+7GHo7fpedpx0mU9plh
         j2nilDpNY/hOTaJh0d7G82Jmaf6T5FdOEw/NhmzvwJP9/vYXK8YIsGY/zLh5Y6+q8bql
         YkQl8J+Y7zaBfna2NkQL5+2oVjoZFf+HlAKHDiqwMK2Xzw7bwYKrh4/Ks6VloIHwNwtn
         2peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922308; x=1736527108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z12n6pwBuO+Lp/RU6Y/RGTOaXGSjqsnsbDrc/bXr6NI=;
        b=D+EznnnghQA3xPxEGrfejrld2PqOF/iV4PwPhZ4kphv8HEDtOGbGxk02f8g+maaBrd
         NkaKBXLfhh6si8ueqCCQk7DMhWx/epqmtBSi7DT8HNSy+0BZ/V5r9cEy8UYP/sPRIAdM
         M4HnI+d8UghOfyC4YFEWTDdSwBe4ycKvgbskwmmGghBb4PhOBBIhJTGnUasKF6MucuOt
         hD90LfkLwovB905B1lsGQgc2ONjbHrQPjtWjfipCR6I4rFe4V8RhPRz36bxmVnsdqHH6
         1OsBwKQQvNeVaGPJPail+OdTwGWm7Z3CGo37iuEno0aG7VW6cPtYmHHvNqcS8SB8bcmB
         dj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW6C0jrymSq2GhUKggSEaDgyWXkh+ngl2GfbiRUE5220VJZPZ27dQB2RMRtUc+kIIxLF6yPBPsbGNUqStA1clilg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzppVZANF7D41oHiiBMyIKT2qf2sVTSayHE9oSa61QKcKlHEmDD
	t7iDbsC4NNInnsEYpgyr+r55T262Z4Gg6S1wYmj8iIuQ+IbKRhs3uto+54D3QZA=
X-Gm-Gg: ASbGnctjUBrEWXfCS/kVYD+OabnDa6X0bSQ9gQYuUBpO8sxIr2E+IVcpibuW3w0CjZG
	5Us5z15XFDxpG7hZP6jU84TiKln8VwpvHhjFhTqn/37dQ+DPM8R7Owk01wq9y5bcwAuFRtpGHGT
	OFQGq0GMfGpmo4VDguSU/y2UHfuiY328Jr/1G7GTtnEc1noNgWAFdtVXAcdb72/BTvaefPRaGGR
	k3yC0o9++bw/JHaIFCgHh3pTYh1wC5WAL/Owa5MZ1DlIZAI8oBoKOQamvF0PQ1Wk/Z+K7Z9mIvw
	0C/nudfIS3U=
X-Google-Smtp-Source: AGHT+IHvB3jSYSwVEdM8kpizh++WgojhHChTKlXDXhzjvg/G2jGnSPtOR2X4YibeMuE1jT2+Wk3xTg==
X-Received: by 2002:a17:907:7dab:b0:aa6:98c9:aadc with SMTP id a640c23a62f3a-aac2d45fb01mr4593376466b.31.1735922308221;
        Fri, 03 Jan 2025 08:38:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/6] thermal: renesas: Add support for RZ/G3S
Date: Fri,  3 Jan 2025 18:37:59 +0200
Message-ID: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds thermal support for the Renesas RZ/G3S SoC.

Series is organized as follows:
- patch 1/6:		adds clock, resets and power domain support for
			the thermal sensor unit (TSU)
- patch 2/6:		adds support for non-devres thermal zone
			register/unregister 
- patches 3-4/6:	add thermal support for RZ/G3S
- patches 5-6/6:	add device tree support

Merge strategy, if any:
- patch 1/6 can go through the Renesas tree
- patches 2-4/6 can go through the thermal tree
- patches 5-6/6 can go through the Renesas tree

Ulf,

I've added you to this thread as well due to patch 2/6 that has a similar
root cause as [1].

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20250103140042.1619703-2-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (6):
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the TSU IP
  thermal: of: Export non-devres helper to register/unregister thermal
    zone
  dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
  thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add TSU node
  arm64: defconfig: Enable RZ/G3S thermal

 .../thermal/renesas,r9a08g045-tsu.yaml        |  93 ++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  43 ++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 -
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   4 +
 drivers/thermal/renesas/Kconfig               |   8 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c       | 301 ++++++++++++++++++
 drivers/thermal/thermal_of.c                  |   8 +-
 include/linux/thermal.h                       |  14 +
 11 files changed, 476 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

-- 
2.43.0


