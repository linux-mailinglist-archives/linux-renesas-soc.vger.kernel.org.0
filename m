Return-Path: <linux-renesas-soc+bounces-1040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B2812F16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22BD1F21A91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CE2405C8;
	Thu, 14 Dec 2023 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YClowM5g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77262BD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:20 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a1fae88e66eso479015166b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554379; x=1703159179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wI8+H4p3gXo6sNGaNjoTSF+Q/iC1fKKCJVvei1Hpns0=;
        b=YClowM5gat4G0UPXTVNq3dtczLX1nn48rsdMyvmtBOdor4zbK+NVbxpPkf2MICDpBk
         xFSdLgP5kLZZu4/8NuqrlH+EeTyM9blLwWOSaZ49Z7GE+nd7JT2ZJYEGDyDfzMmQKJDk
         1yrbplVt+mDfjoC/vmGW1Ts2aSD2fwAX0IIZpE9UZxMZ7ssjU+jGWEQcjRUUK6cPZXsl
         01U0s3yz1QkzihzMBCIftyaEGb1zkYh4rYnrLbiHe7QPMhnkY8sj7j40uyXwOWkgvohJ
         I0Vk16p2Lc/FehsMinZXdGOP9On4Q8eVt9hngBk6zuzJIDrZJQw1Bow9CVGDcDgsSEtH
         6QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554379; x=1703159179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wI8+H4p3gXo6sNGaNjoTSF+Q/iC1fKKCJVvei1Hpns0=;
        b=Ur0WZv1JYpItYTlm9YjNSTNfnqw/Bw5BDyjZCDq5oid/lzWF42oMUFv4zcRqFCAoJC
         Bzn/XfGbwGH5uTGd90huZFwgX+P2yDELZyvEquJUa13BczDvZJ48X1VthfgzI+UkIak+
         4oROaDmqMdl0xG4F3j0/EVLOYUe+an8qIeaVV/3cSvZ8ZIU04yMKxyHj+5dtdbjvrNsZ
         YA6Z0Ndm/vYIBrADkf5ykW+UmENKvbZeeuwwK4wrIJYlB1whbs38leuAQDelYGhE2Ms0
         x4+iltisxdTYYlgwIy83oYdFyrvW31xianxT/kzfh8hPebFU7m7wWD5H7suBwfrfDNLQ
         ln5g==
X-Gm-Message-State: AOJu0YzTK18suyqO7N3pDY812T4me2yc3382ciMzvvt4Xuot/0jacw5t
	3X03VSbkns4tdHqZZ9aFm+hvyg==
X-Google-Smtp-Source: AGHT+IFhzDg1WmSkfhqgcEgeoj0jHK49rcTX+RPhQoW7pVY6ATCQ4AKf7NX10muW/EEaW5wGDEKQNQ==
X-Received: by 2002:a17:907:86a0:b0:a1c:795b:405a with SMTP id qa32-20020a17090786a000b00a1c795b405amr5787566ejc.109.1702554378627;
        Thu, 14 Dec 2023 03:46:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:18 -0800 (PST)
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
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v2 00/21] net: ravb: Add suspend to RAM and runtime PM support for RZ/G3S
Date: Thu, 14 Dec 2023 13:45:39 +0200
Message-Id: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
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

Patches are based on series at [1].

Thank you,
Claudiu Beznea

Changes in v2:
- rework the driver (mainly, ravb_open() contains now only resource
  allocation and parsing leaving the settings to ravb_open(); ravb_remove()
  has been adapted accordingly) to be able to use runtime PM for all
  IP variants; due to this number of patches increased
- adjust previous series to review comments
- collected tags
- populated driver's own runtime PM ops with enable/disable of reference
  clock

[1] https://lore.kernel.org/all/20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (21):
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
  net: ravb: Move ptp initialization in the driver's ndo_open API for
    ccc_gac platorms
  net: ravb: Set config mode in ndo_open and reset mode in ndo_close
  net: ravb: Simplify ravb_suspend()
  net: ravb: Simplify ravb_resume()
  net: ravb: Keep the reverse order of operations in ravb_close()
  net: ravb: Keep clock request operations grouped together
  net: ravb: Return cached statistics if the interface is down
  net: ravb: Do not set promiscuous mode if the interface is down
  net: ravb: Do not apply RX CSUM settings to hardware if the interface
    is down
  net: ravb: Add runtime PM support

 drivers/net/ethernet/renesas/ravb.h      |   2 +
 drivers/net/ethernet/renesas/ravb_main.c | 783 ++++++++++++-----------
 2 files changed, 417 insertions(+), 368 deletions(-)

-- 
2.39.2


