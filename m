Return-Path: <linux-renesas-soc+bounces-1704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B33838F17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE51D1C23DE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7C15F564;
	Tue, 23 Jan 2024 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jUXCPW+z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083585F541
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014777; cv=none; b=ocn2E0J0VsM1yiYWjUwuE5PuVD5G2+uKO69ZU9e5H8eNgSQzrCv6H7sHObxILs0e0cxJuxjfwX2o2Q5oCYt42l6LavwGAZNiDHRxQnvJx9Q/Kh3dRgAhMEpjmvyuCKrTtR8/gh3ZC2eoxDXn4baPtcGkWyCxpDU324fJmCpddbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014777; c=relaxed/simple;
	bh=Jz8kZzB2H2602ULXRUMwCZByqfrvauZa0dgw0w7Ggz0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d34XWb4YuOa2qa9Q3RwcpTehOy0ub9wHGmbkIAjqU75AvcFg702XFqq4QeIqdWHGMuSn0aRryfdYPl03pOFUt927qoaXLBK9fx5jxVwtkKvS6IBSuMN0LU/+zD5iAmcslf9lgmM783VfeGq7bu5CrNe3Xilwd3uVdxmuwNiEnv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jUXCPW+z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e7065b692so46616625e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014772; x=1706619572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cQHkYbac2Sl4VM3IelnZJJZvNleCCL30OPSnoeaFEVU=;
        b=jUXCPW+zHk5+mtGu+QhVTrzAzK8HxD2t/VKCfIIFjCdVXRCRTYLMuQAAbzldlH3vZ/
         j4Fqmx2lQq9/PkGynKPI2GHtUDP1r84daeimkyjxvr3X0BE0SZ5lwYifyEpe9wWSVgnP
         Z903z6ZYMqGoBw+3GzcyBy+G8+tT+7ByNx3LaaUd0ei9d8ztHJO7/PLB2ka0spiCVxWg
         kgL/TutfPbAXQ5Iqzp/Of1CgLQn1fHQq5QvM9KL1jtXySJhyzQZ8YOWZ0NywEMkklNKz
         BIR9ppvZTcKwbSV/pFJIKNnUVQgNw9BIV+rnVCQ961duhFz5ptgf6tGMuKBEVTp6GJBz
         x5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014772; x=1706619572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQHkYbac2Sl4VM3IelnZJJZvNleCCL30OPSnoeaFEVU=;
        b=mU+FKAui06Dv6u/5w+7WthX/xrrt78cDSENIs1WsCD6LlMMh3BU/XBzlCp9wQD7ji9
         Rn85+UV3vmdSavfYDJH1KUGFgN8vG7e/XvP5h4AZLnm1WfGiR+JGaBoCmkbI/Yjd/Yq/
         RyHjVHU9ZAEpPLfqKxHZ22cm4+ezFPwAYOdVzumkA0jaEB+M6Apzw6gTib50fVcvbBgE
         y8A2YHS3l8rIElbVwlwZRRviRlCWuBxdKShXgr2UFPA63yTru2UekYmNNUOrw+aKIlyB
         FHVDDU2ixjicjZU5/aayw0VFI0tSfeVn9LYNb9cwFxFTTOk3MvPQZ7ajUUqrr8+EFlPr
         shSA==
X-Gm-Message-State: AOJu0YzjCMoMvWrIYbyxlL4yabW1c/4LQd3MkXpk+tvVwCU8VsmfFF6b
	G8U8W7eA2VB29R2cFFCpRLjg0w20Qt/8j8xLH4zDhe+x9k2G2yrf5t5rs8f7x9s=
X-Google-Smtp-Source: AGHT+IGZdgUVcGTlfgZa+LX56jx28y3p4G14/Sy97ErHNhwRxfUG+DlWEVKN3hLT1s78mGgYYkTmZg==
X-Received: by 2002:a7b:c397:0:b0:40e:4d77:dbf7 with SMTP id s23-20020a7bc397000000b0040e4d77dbf7mr109418wmj.163.1706014772033;
        Tue, 23 Jan 2024 04:59:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:31 -0800 (PST)
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
Subject: [PATCH net-next v4 00/15] net: ravb: Prepare for suspend to RAM and runtime PM support (part 1)
Date: Tue, 23 Jan 2024 14:58:14 +0200
Message-Id: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
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
  net: ravb: Move the IRQs get and request in the probe function
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


