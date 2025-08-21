Return-Path: <linux-renesas-soc+bounces-20828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F07B2F07B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F5AA1CC4DAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDB52E9ECC;
	Thu, 21 Aug 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="f7Qa674Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE724DCF9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763433; cv=none; b=SlDnEWxJ9VYKy1DnKXIi1ogQuoW+6f3RtnYugbRBsXMGKaH1QCEEauCozCl++nf97Gan1XXvRRRxTgMTYEs0DRjqX2htDuUjkTIlhjSkqzjCjvHzoXVZ6Ve5HVkWH9rbING41E8uFimH8tgfekrdmR+vOXAoU6dEjbLO82FOuOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763433; c=relaxed/simple;
	bh=BkUjAzazCdrdco3Umhau/Xuq5nuzBQH/yodQbE/M+BY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RnELesHsMiSvETpaijWGzN1BFw2x5c9IYTDVLvMtF4FiePnvGP3L/ku6VZnJpRJVk2dzx5YycPhS00P6zmtCgq6atSMWLeagvGuZX+RCtoSBVL3KuaLL3I7jTKlOO/hcJIqdTrpOk4icDMD8x7lpUWlfLw7BoaQgP4bQF5pAV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=f7Qa674Z; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so3538245e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755763430; x=1756368230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPH4Dt9LC8zmN5YywximTfS/LxGtIse3pZkHAnoKBEk=;
        b=f7Qa674ZsqtyHtXxNt1JKOnNJCL3M6IKA3Mh7jiyKjGh/g1E2LhMd9yADGzcn4gmMO
         jI0yPDYpFDitcsRZ2MZXiS8uri6J0qARmJL0DMWOWkwatbWz2aDjTeD4zilKMvt4BpME
         uV8BVqeFdmr9RNYrqT3oHBb7KtWauTCYO9I9uHMzd1gUTmSpqM/jorNVnmyUVJvzyoMb
         SF7gqLqaczPNJ4gGdfLAyDu8TupSQDNlYd9mMPVZH7h1bMHcjyWnwG6cOI3PeXOtXTkz
         alnLLLavwtL6EQGjhj5dSUDbfH6M873mAolfjpMQgcatQ6T1m+oR8S2+dFrBiavamNYy
         i3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763430; x=1756368230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPH4Dt9LC8zmN5YywximTfS/LxGtIse3pZkHAnoKBEk=;
        b=d5BFxP8pJIjvy2fIdXgdd1Xn3imP/+AsNh9eeWRWSsnrD99t8jbPX/C0khUnW9so3s
         xupAHlVmtM9HkMzkA+6NYLlZ1h7n4UXFkpW+gT8LFL0RtQqPp+qwccibmOa6OAO2MouL
         hCrNIMRQuylm52ypANzmDnFc1jz9UO8cKNV60IFTuz8fhaJfuJeJRkBmoryYUci8yMYc
         MYHui6VzqnjlM3w8zjd2QoFdNVqIqPmcKqqisFA4e+CwbZqnKwWpJx5pVolL8cnfzq8Z
         Nvs6G06kMsGA4cLgsYoT0UkxdtnIJtPjymw6BD3gjOBj7INoPQAk+vwyus8YSjLmyguK
         rwVA==
X-Forwarded-Encrypted: i=1; AJvYcCUxsLBGmNl7oUxVZkdjVAfoY5o/mr4QDXLNgDK+4nLtCMCewxHhSmI2Vb+QZ2dMigcPX3La//8GY9Q1ci9DxhNaDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnYbBbBEaPa3rc8L8GEDnTqVFUmlSvzQmDv7DhZM5MbuWCp+t
	YzwxnZTU7G4egrWMthlWyPeTl+1YjQuyBA1szdr15TE+FSybwvsiHt7bYF9tugVl/7k=
X-Gm-Gg: ASbGncu+33DwT1N1vZ9DrEd4jsVeKsCUAdT3iSvf1nAbHRO+znUEIGqqx6kGeAMcTLG
	rq/ZMSijfi52Co0JxfogabP4P0Waj6ycENvgA1K6xfwbERakr36op1vqrrt+c21lBYZinMlUcjg
	wnqyZ4YAlPzVlwjrGyhnIPGy9zFXSE7VPpijxDVZ0n3hYTNIGsXZL3yITS3b83/4fDoEPVOSxeE
	oE1dDiZqD/XbAYwmLdUgpO1s1DRFR1AcmjvtYBwtKGkHIcJ8Q0BlpIgl5bypPAkt5gOkzZhB/V5
	BPoKdy064twRMi7BaoSd/1ggYFGk63wZzXMemruYf+eWQhYk8mVdFozREBMHISn/p06XHCEQnAc
	6Jn9DGFS7yvrsyk7aWcT8yM8Fw83aWz/y+zG18GafR7/Rq3dQUXo=
X-Google-Smtp-Source: AGHT+IHHm8Lchn2zvhRJUg1fgGzuxGz8KFFfOq4sSoyn5I0S9lKsbcJu4rnRhc/hWeaHsuyWmyDFzw==
X-Received: by 2002:a05:600c:3b19:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45b4d84e6f0mr14634375e9.31.1755763430131;
        Thu, 21 Aug 2025 01:03:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dc155b8sm17356225e9.19.2025.08.21.01.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:03:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	linux@armlinux.org.uk
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after resume
Date: Thu, 21 Aug 2025 11:03:30 +0300
Message-ID: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
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

This series disables clocks that remain unused after resume.
This is necessary when the resume process is done with the help of the
bootloader, as the bootloader enables various clocks when returning from
resume.

On the RZ/G3S SoC (where this series was tested), the bootloader enables
the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
1 is unused) and the clocks for a serial IP (unused by Linux).

Testing was done on the RZ/G3S SMARC Carrier II board.

Thank you,
Claudiu Benea

Claudiu Beznea (2):
  clk: Export clk_disable_unused()
  clk: renesas: rzg2l: Register PM notifier to disable unused clocks

 drivers/clk/clk.c               |  9 +++++----
 drivers/clk/renesas/rzg2l-cpg.c | 24 ++++++++++++++++++++++++
 include/linux/clk.h             | 12 ++++++++++++
 3 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.43.0


