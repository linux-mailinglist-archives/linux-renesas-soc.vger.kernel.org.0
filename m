Return-Path: <linux-renesas-soc+bounces-2094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D484394A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 09:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9DF28111D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 08:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E668633F5;
	Wed, 31 Jan 2024 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rdTH2LtM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177F605D8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690511; cv=none; b=tJflyPdOXIfh0KmLOyObCfghEa0bK1UxWNgsoM48OEMNFT0HpMIND+LbCrpQxhlnU3MQR87xEz7jvP48eX37VzZ3rvHBGFFrB6w1uasNa3JJ6DLbvE0MEWxj96zv//vFgPd2vARpOl61qiU5he9RJcZAweXQWduNJ2kI5YOxjpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690511; c=relaxed/simple;
	bh=iKRXLwTfrqU+PVgGgOqGO2T4SSk0VbOyJ7O4Lzl4WVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aTdJEqTAU7GUU08xXAW9SsCMYhEDeX0dLM/t/I2L/sxS0E55fpNNv5dumH7bE2Efdvu66jT0OsZG38bI7bvosV7r0TMJ/5s4Qm4S63qUopBzB64HkEiBiVh+LXkI7rqVHW+BpJkgFoiH4N7AaogJmC5PSHYQOeOYbeu5Tas9G5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rdTH2LtM; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55ef4a66008so3940947a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706690506; x=1707295306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1524TzWJOECLHteJDyR9DLp3V3fisC4TKq1DpxaWyKw=;
        b=rdTH2LtMovlTU2OPE+C9AK1NLSirmXe40R34WpQX+Q5KfhqNXzjpuzq8OzNVPvoFuw
         dPvevXOxNav9DuSBdc5SufA/gx3FZEtnZRiJIXBoB49T6xCY1YsuMMo1S/zG4YKRqvcS
         u1vi71Rj9Rb0faAIze08l0RTZqYpJ0zVSWNH7CiGtl80WREwcfcmOZx81sbIC/6Vw+Vg
         rnqR6X0sC++FHrbokyOOO/Ot7n9hYjCdARj5FJoTW5tBO7iHQ0UVqiUivOcImphzInjN
         F04ieIOxs8ksl/Oap3+CeecvSA1NHCJKSbDrGBGnrflUShyTghiClMt7XSmno4/wBJ49
         O40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690506; x=1707295306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1524TzWJOECLHteJDyR9DLp3V3fisC4TKq1DpxaWyKw=;
        b=SfJEf+XkCb/ESQd1zhfq2FP+jHGBNxq4R6SQ9UURSCDihxdTNa1ZquiOzIUHRJiU9n
         fwyEotmv3sttmvyiCNDWP67ZzESWztFOGDzM0V39Cg73MZ6i06wsI7e6D8nZLjSwM+7H
         T71ZexOKfH04XWYs1U4NOBDXNMd6WPQ5BDd81TfSypX1d2WPHlCigIcUKswY9W/0qPD0
         y+duutReZe/LyJIqc4IfUCP3x3Xcw2CJmpfY3PfLwG2M0CMgp/UztFN2nnJd5jdtufCu
         dR0GlrZgHzpG5o0Sw14CKEI8Nd2jQMqg7IKWG0nIEOWzDXZkOPYyeJDUA7Rb9X6fpZoR
         Rm/Q==
X-Gm-Message-State: AOJu0YzchinWd02c7V+eFLwuRWIDAyyokUHN8bmADwkIbsXJpIuqrAf8
	WWiPhZ2sDyg4KdpaLtyt2/4pQqTmNPSL9dxe9cSKjeIKcF3OKjT0/71uupB2OxI=
X-Google-Smtp-Source: AGHT+IEGqc5y9PC/J6J9ErYD3JK8SaZx7UhdE7wuVBjIuEL5mo3X27baMFsbr922gsCpNlpqEnJZow==
X-Received: by 2002:a05:6402:1c04:b0:55f:86a0:99ba with SMTP id ck4-20020a0564021c0400b0055f86a099bamr626662edb.28.1706690505971;
        Wed, 31 Jan 2024 00:41:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVl5Q/Ei2bvcvv8xNVcQim5Dj02Pl4QjnlUYe+y66df6tf56svSKkWCWd1P/sjdv0gI4LyPVsSopEmlbd13tygZ/mvkuo68KQPQ+8j8kBSDCMF5cUiKMTvYirtlGF0m64iw6+0IGSVGX69xRzlxVO0Be7DrcFDUza9Re4l0fPxIVNgaklWDkagRF+QHIITCEMnuG1eAIhz1ujTNKIrl4ELdFNlN9rTl9asvyXFRxdb/42bD+SjhDyyM7AqP0PVcYaoiQ0c8oTG2o33pVGjiei3JOswrMw8fm8V7pLLefyw63AG29R2I8JAFBfwCcSzzS8OswTrq3h5Hol+JfTB0AeKftpAipGef9/JBUsmSmwPb3YusdXJvaQ7GD8qpgf2l5kAhQnkR51D4g6TA/m6RvAT6y3ZRIk3yzvzhTnqJJkFdBLejai8=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b0055f02661ae2sm2863630edb.78.2024.01.31.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:41:45 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v5 00/15] net: ravb: Prepare for suspend to RAM and runtime PM support (part 1)
Date: Wed, 31 Jan 2024 10:41:18 +0200
Message-Id: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
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

This series prepares ravb driver for runtime PM support and adjust the
already existing suspend to RAM code to work for RZ/G3S (R9A08G045) SoC.

As there are IP versions that switch to module standby when disabling
the clocks, and because of module standby IP switches to reset and
the register content is lost, to be able to have runtime PM supported
for all IP variants, the configuration operations were moved all to
ravb_open()/ravb_close() letting the ravb_probe() and ravb_remove()
to deal with resource parsing and allocation/free.

The ethtool and IOCTL APIs that could have been run asyncronously
were adapted to return if the interface is down. As explained in
each individual commits description, this should be harmless.

Along with it, the series contains preparatory cleanups.

The series has been tested on the boards with the following device trees:
- r8a7742-iwg21d-q7.dts
- r8a774a1-hihope-rzg2m-ex.dts 
- r9a07g043u11-smarc-rzg2ul.dts
- r9a07g054l2-smarc-rzv2l.dts
- r9a07g044l2-smarc-rzg2l.dts

Thank you,
Claudiu Beznea

Changes in v5:
- collected tags
- fixed typos in patches description
- improved description for patch 07/15
- collected tags

Changes in v4:
- changed cover letter title and keep on 15 patches in series to cope
  with requirement at [1]
- add dependency on RESET_CONTROLLER in patch "net: ravb: Make reset
  controller support mandatory"
- use pm_runtime_active() in patch "net: ravb: Move the IRQs get and
  request in the probe function"
- set config more before reading the mac address in patch "net: ravb: Set
  config mode in ndo_open and reset mode in ndo_close"
- collected tags
  
[1] https://www.kernel.org/doc/html/v6.6/process/maintainer-netdev.html#tl-dr

Changes in v3:
- collected tags
- addressed review comments
- squashed patch 17/21 ("net: ravb: Keep clock request operations grouped
  together") from v2 in patch 07/19 ("net: ravb: Move reference clock
  enable/disable on runtime PM APIs") from v3
- check for ndev->flags & IFF_UP in patch 17/19 and 18/19 instead of
  checking netif_running()
- dropped patch 19/21 ("net: ravb: Do not set promiscuous mode if the
  interface is down") as the changes there are not necessary as
  ndev->flags & IFF_UP is already checked at the beginning of
  __dev_set_rx_mode()
- remove code from ravb_open() introduced by patch 20/21
  ("net: ravb: Do not apply RX CSUM settings to hardware if the interface
  is down") from v2 as this is not necessary; driver already takes
  care of this in ravb_emac_init_rcar()

Changes in v2:
- rework the driver (mainly, ravb_open() contains now only resource
  allocation and parsing leaving the settings to ravb_open(); ravb_remove()
  has been adapted accordingly) to be able to use runtime PM for all
  IP variants; due to this number of patches increased
- adjust previous series to review comments
- collected tags
- populated driver's own runtime PM ops with enable/disable of reference
  clock

Claudiu Beznea (15):
  net: ravb: Let IP-specific receive function to interrogate descriptors
  net: ravb: Rely on PM domain to enable gptp_clk
  net: ravb: Make reset controller support mandatory
  net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and
    pm_ptr()
  net: ravb: Use tabs instead of spaces
  net: ravb: Assert/de-assert reset on suspend/resume
  net: ravb: Move reference clock enable/disable on runtime PM APIs
  net: ravb: Move the IRQs getting/requesting in the probe() method
  net: ravb: Split GTI computation and set operations
  net: ravb: Move delay mode set in the driver's ndo_open API
  net: ravb: Move DBAT configuration to the driver's ndo_open API
  net: ravb: Move PTP initialization in the driver's ndo_open API for
    ccc_gac platorms
  net: ravb: Set config mode in ndo_open and reset mode in ndo_close
  net: ravb: Simplify ravb_suspend()
  net: ravb: Simplify ravb_resume()

 drivers/net/ethernet/renesas/Kconfig     |   1 +
 drivers/net/ethernet/renesas/ravb.h      |   6 +-
 drivers/net/ethernet/renesas/ravb_main.c | 738 +++++++++++------------
 3 files changed, 352 insertions(+), 393 deletions(-)

-- 
2.39.2


