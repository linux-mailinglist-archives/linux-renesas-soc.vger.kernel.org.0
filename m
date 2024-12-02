Return-Path: <linux-renesas-soc+bounces-10772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874469E0779
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 16:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C18D4B378D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 13:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA172010F5;
	Mon,  2 Dec 2024 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="3dsDRb1e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A11F1FECA8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733147369; cv=none; b=HfQimUQHebLb+Tn3TZ6c0jb+qswngYq06Vv+zBjLgZW6CCddH2kDuuhasLzns42dqQIovneJPwjKGAb13GI1S4wrHoO04vgbcSQeVrEoP5ubxrakllwF8vVi/A2CdRWf9UR8Bif/DYfBETUmqMgWwIlfDFjTsZ40Aeo8CQF1w5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733147369; c=relaxed/simple;
	bh=cJZy9S1FMCngEJ77urL3TJUprQtUSEK6YQgVA1pcvq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XyPurA5g51819Hs/p0kXzdF8vJQL3mBezIq02JV53Bq+mlNwAT1LytMUZXQML2sGbNu3RZ5m19c6S7Ph8hLTUUFeqBirS07YgEW2kv0XaX1BSqCBpi1pOLxQob/51lRMXj1PH4pHC0T9JAgfFlCgQozQQy+chNfkLqGmJkLaRJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=3dsDRb1e; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffe4569fbeso36821821fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 05:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733147365; x=1733752165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dpiwpXSnfuXnIooq0y/4KC3bfGsvvfydq/7tBkpGdBA=;
        b=3dsDRb1e1tUA9XGpsV6v7d9nykNzFRfdoBNP5STwNb+0YtPt1CsrHwjER8cmGv5mQd
         1lt9UGkD9ESNFolJULXCPoUqk5E6zRljHFJ2k56OMR8zbrKqAbY51nIJBWX+TylYWaIX
         PQQ/gjDfIgFdTMdLl6acp2axZOZv09NNuzUoHg8SwDEYOvjorbXdRUor7bqaK2/8r+Lb
         KT7VKuRyAinyjXxEzxyElxwm5TwRIaTilDsysOUxau1mzom28iQSrrEJN/IaEprqFJwT
         /5jtZSApHtEKY++kV6wSF3VMB1MlkKrjdY/XZcLTUrxNAZotB8ezsQffqc0BgAEnoAXt
         vPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733147365; x=1733752165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpiwpXSnfuXnIooq0y/4KC3bfGsvvfydq/7tBkpGdBA=;
        b=AN1aA6E0FfYvdlHkUJNCB85TYPZdVY6fHqwKTqkywwMjAHACFlbauV4fpHYZB69rtA
         BCXADwovPo0dyH6OD964e2xzM6O9WiSBgZdg50VyFnXvoipJCRUnUkgRebK4ZMzdK61Z
         UT+S5q8Zof9IiEU5Du4GnNTpw+tgovFESP8hZ2ICHq5aHBQjTLCqTv9uP9e6Rutk2Rkc
         UzK35PJ4/020uhKkfAejLmpE493ihd86fWM3qI+u9lUQtr+BWoE/InQtbLoAgUfNi5St
         F8M8pd684WA2Mja66wX7rJEPU5l4LRB3bmE1sMdk7hDxYtjy1CExTYNE82nSUaOlLAOw
         9tZA==
X-Forwarded-Encrypted: i=1; AJvYcCVHYO+YIs8oXbMjWpHIVv4YFzHtJ5tTGUE9VTz2V2shhnbI/9XvPWlZa+C3PbY1EXcPAZTZJ+lD4NneFSvAyPtSdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVkif1dLSI8Y7P74TpuaGJCUJ59jqgfcFfpkcQ8mwGnpu97eXc
	A+xlQu/H+H1e0TW23ui94z7i0vMoUC3g0+ccpxDxofyz3etyWecn+rXf0FIio8jb4tgh5cq1Q1n
	S03Y=
X-Gm-Gg: ASbGncvuRDAtEIg+1lK6xJkOBB59aeLV7JIk3ZkhJZXTGdn60+7mlYS96Wbb8UGvKao
	1E4f1WkB9lSIJZ5O3J6RiFtPlS4gBdabFcN36ghoucH2Dzj+C3xLSTOe5LdH5JzC1I9RtcAiC4W
	NJHKiKsbuec+sT/lADajH5gZQy3DPGiX9jFolqczhzJ3bbLZjBlZlZh+xQF58tkQWiGA7N/VM8B
	cDusJzayznNjL0N8IM76DDwf/T0mZnnxV8+Un/knpzQ3CJFlEloZvmuNlgXlbki
X-Google-Smtp-Source: AGHT+IHMltc1McJoIBtx24nNlj7xLYEfgMGTNoTB0c8hxfeup/9URrE3WWd5lDfPJXd6xm1RQOYP0A==
X-Received: by 2002:a05:651c:154a:b0:2ff:e2c6:e654 with SMTP id 38308e7fff4ca-2ffe2c6e6fbmr57320641fa.19.1733147364585;
        Mon, 02 Dec 2024 05:49:24 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb8f2csm12972661fa.15.2024.12.02.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:49:24 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 0/5] net: renesas: rswitch: several fixes
Date: Mon,  2 Dec 2024 18:48:59 +0500
Message-Id: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several glitches found in the rswitch driver.

Submitting them first, before new functionality currently being
prepared.

Nikita Yushchenko (5):
  net: renesas: rswitch: fix possible early skb release
  net: renesas: rswitch: fix leaked pointer on error path
  net: renesas: rswitch: avoid use-after-put for a device tree node
  net: renesas: rswitch: do not deinit disabled ports
  net: renesas: rswitch: remove speed from gwca structure

 drivers/net/ethernet/renesas/rswitch.c | 14 +++++++-------
 drivers/net/ethernet/renesas/rswitch.h |  1 -
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.39.5


