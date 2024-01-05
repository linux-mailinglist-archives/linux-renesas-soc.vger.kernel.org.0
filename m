Return-Path: <linux-renesas-soc+bounces-1300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15B824FB3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFC5EB23BE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC23D20DD0;
	Fri,  5 Jan 2024 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EfLVdZpJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F8D20DCF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50eac018059so1697303e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443043; x=1705047843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Icu0nhznlhi/9IXXa6Qq8k7wweRMYiE7i3lEY/NKnXs=;
        b=EfLVdZpJF/Ql7p9jgi1HR1PP3yUzH7GSnBqsiWPJAtSrxaPFwAeSNvQYX/INJJOR4d
         P3Zlpr5tT/w70TklUgU6EH0DtT6TNFNrW/7Pply3+SpReiQFajlVrU33MzXZO+snkrrs
         jZFQ6nWrUdc/NCC1CZqW6P9ogEDDiz9L6jDg+LFwFTJ0XoYDpQZswYnYczycgRHEyD+u
         2ibRG1mf56Y+gt1XOCrkQq1CE0HxYA2RocVjapWQtXKxn/mVP7xsI1PETYmUBdoQ2YwQ
         gfsOfis/1Wz4GV3TgMs5mNGpARX889Kq1SWiSDZRCZrNMg8J25odTiwBBZKg8482eITi
         1oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443043; x=1705047843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Icu0nhznlhi/9IXXa6Qq8k7wweRMYiE7i3lEY/NKnXs=;
        b=eBCV8OF8+9G+mHKcZ8JKbIu2e8j/CCDANwbH257ubu4PsbCc+m89SR8afTdVnjX6HF
         CLEZYntzPT/2gDExcysBryd5hqkPhXZKVM0JnALGdDKP7uFf5PBennx3+A29Dj/skuEG
         Git0mMhXtRvYPUrqcvAiO8/GjJ+SvrVTcUk4HIJ6ioMN13H/BYE1yzFUmzZglLluXi9B
         jFndTerJM9izcHxbvsgYeev7clubRXPOZlj6XQ/G1xdqKDybaEyKMd3pCD2lhX+ZQ48r
         75xmaOXiryeSX+Q5GV724/45wv75PUFSi5R/9gSN4KAoi0GgTmKudrWZBO3+SMWLEM0L
         Ax6g==
X-Gm-Message-State: AOJu0YwDNxM/HcnqlWCaMxAf5HOx/ToaSfexqBQ8paHFRS0g/WyBmczR
	qHiKUg2VU3eWg9f7s/V2n3xih/7PdPMCIFAAMNdzh6NM/Wo=
X-Google-Smtp-Source: AGHT+IFbNxdu031AIJAdzx9eC1qpjPGY9bFmMBjIvbwTzr0BKvdbNfCDYiewNW5L0eyCm2ut183STg==
X-Received: by 2002:a05:6512:1281:b0:50e:2742:aa6a with SMTP id u1-20020a056512128100b0050e2742aa6amr1110073lfs.97.1704443042626;
        Fri, 05 Jan 2024 00:24:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:24:02 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v3 00/19] net: ravb: Add suspend to RAM and runtime PM support for RZ/G3S
Date: Fri,  5 Jan 2024 10:23:20 +0200
Message-Id: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
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

This series adds suspend to RAM and runtime PM support for Ethernet
IP available on the RZ/G3S (R9A08G045) SoC.

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

Claudiu Beznea (19):
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
  net: ravb: Keep the reverse order of operations in ravb_close()
  net: ravb: Return cached statistics if the interface is down
  net: ravb: Do not apply RX CSUM settings to hardware if the interface
    is down
  net: ravb: Add runtime PM support

 drivers/net/ethernet/renesas/ravb.h      |   6 +-
 drivers/net/ethernet/renesas/ravb_main.c | 760 +++++++++++------------
 2 files changed, 370 insertions(+), 396 deletions(-)

-- 
2.39.2


