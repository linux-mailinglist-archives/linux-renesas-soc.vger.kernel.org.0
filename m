Return-Path: <linux-renesas-soc+bounces-307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 782737FB385
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1101F20D67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 08:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FC215E80;
	Tue, 28 Nov 2023 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U+csMIZu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E44C1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 00:04:43 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c8879a1570so65770571fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 00:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701158682; x=1701763482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GaCi7MNIPGT9+tD1rM21toDEAvF+iDVLhsRo7ZOX2i4=;
        b=U+csMIZujBDPysW/zmszUJjRh4s0vrfg9Kx/9rW/o3+h46v4hR0riLxhqHDAOfn/5x
         z+5usbueUC0ZqL5CfKctquJoMOJaKzBjEJlaXEVxwJSQtWu7MQX87TMi9kz4e32Yshn1
         zBQnWxR98fPJsJ/omGh5cEcF7QeJJ+Si4YbQQM/ZA8CBc6NsWmY/mztGuo3LV6dkHgCL
         Gw3nTKzYiwaXEYxTIjm71J+ZW7nOHppzwQOjYCTDujOfyMG7lGEpBsJTSkn0ZtH6hBqp
         M5hKvljo9Xxh6e2pq75egmc8Z4RSLiJ7fF5tnux+doCNwcCZ0zPi1zKZT6RGmQ83ZBxm
         9OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701158682; x=1701763482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaCi7MNIPGT9+tD1rM21toDEAvF+iDVLhsRo7ZOX2i4=;
        b=Yjn5atYnPWUU0LwxUbCV92iad4jNv8m6T1S3GziWXWS5vvcBtRuVbPwQ7MJT6Iq52C
         ijgdW44cWvki2SA7+dzdk2SUKJElI+E6UqrC5Eq56Dk80e4ssUsxVRxs8aAlbwFaTZ/Z
         3hOUX1pLzFTvzXyng9kRK1f3m29xRmb0Tsqc7dG06c7IGV4L+AMgWpTBPgLYzXI86Vfx
         x5L1/jz7sVXWXmESSIJ5sDRg1VOHG/DXTwIPqLf8D3SqLvfZm1JMCcFUnmksoRGkdOcD
         fIn/7y2ExnFCYWOix9UY6onoV8LG1by5OsT29AJ0+KeHPW/BdIsglEVp3Gj7sjLa0Ucr
         f5xg==
X-Gm-Message-State: AOJu0Yzbv5nGBIYMSfMy7hkucM8E+OQnA2/7nU7tNnj4ElWKaLyTe5dV
	AsFFgWylAxLwH9jWLo+SP4gpGg==
X-Google-Smtp-Source: AGHT+IFupqCloqdm4FE8Tx5uAcS4dvEx98WbGIFZN7Av0v5UdK2HaqKN22m3rm9Y1YXwBSX0CyEHVw==
X-Received: by 2002:a2e:9c92:0:b0:2c0:21b6:e82e with SMTP id x18-20020a2e9c92000000b002c021b6e82emr9739886lji.4.1701158681562;
        Tue, 28 Nov 2023 00:04:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c4ed200b0040b4ccdcffbsm1127534wmq.2.2023.11.28.00.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:04:41 -0800 (PST)
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
	renesas@sang-engineering.com,
	robh@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] net: ravb: Fixes for the ravb driver
Date: Tue, 28 Nov 2023 10:04:33 +0200
Message-Id: <20231128080439.852467-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds some fixes for ravb driver. Patches in this series
were initilly part of series at [1].

Changes in v2:
- in description of patch 1/6 documented the addition of
  out_free_netdev goto label
- collected tags
- s/out_runtime_disable/out_rpm_disable in patch 2/6
- fixed typos in description of patch 6/6

Changes since [1]:
- addressed review comments
- added patch 6/6

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (6):
  net: ravb: Check return value of reset_control_deassert()
  net: ravb: Use pm_runtime_resume_and_get()
  net: ravb: Make write access to CXR35 first before accessing other
    EMAC registers
  net: ravb: Start TX queues after HW initialization succeeded
  net: ravb: Stop DMA in case of failures on ravb_open()
  net: ravb: Keep reverse order of operations in ravb_remove()

 drivers/net/ethernet/renesas/ravb_main.c | 58 ++++++++++++++----------
 1 file changed, 35 insertions(+), 23 deletions(-)

-- 
2.39.2


