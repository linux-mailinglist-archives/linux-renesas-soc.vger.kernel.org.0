Return-Path: <linux-renesas-soc+bounces-9777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7D99F7B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F16312830B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6E21F5844;
	Tue, 15 Oct 2024 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDn06Xvy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42A1F80AC;
	Tue, 15 Oct 2024 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022550; cv=none; b=V3LRW/dRiED7I/AT3RTLkP6SwHPteed7BJmGrQfKe7c5tDCzt+IxRnnmQCJcaDs6BFJ6qGmtQGeQkk9KyByytYEE63p3MpBVXILme+tOt9tU0NPA21FVp3z+UA0/Db+ki/gwWI3TuiyI7wi6D8MEEz9OJusETMM8xGoqg/la9n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022550; c=relaxed/simple;
	bh=8VBeWVKKPhZxp/1RAoSYZgkxrqQ3XB/67KyW/0qkUn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWO5kHa0sxtLfjGbXigh3n6evKtIsN4Y7226EOsAz3ModOvakMQ/FAF1q6RKpOXrcLgL0d4YiCrShAQ+QxdUYAB0oThfgZ2cihNoKs9gbKLtM99bQ2JFd0+sXpTD585JRVaagQXh3fK7pQsVqt0BvGNuEvOezuhSWhIBj3SOjII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDn06Xvy; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2051319b3a.1;
        Tue, 15 Oct 2024 13:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022545; x=1729627345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVkMpy+OzbPh07o5QjDw0zjYuypZoKV5IAx0dihkBl8=;
        b=jDn06XvyrLs1cxjLOOGuaRcMOPy7yZsyoTBmXQf2erhSchS8ZWBtmpTBh19PVewN6I
         gkKayZu5RyNGuDZjbP93BZXBwE6tU3zTLXqSWTPC+o53RBbdNuEurZ/2hfc8l2Ybr9Fx
         0RD5WdT73iJB3N4hxdyUimfHCqqsllsXRBhyy2txmAVr4s/2PYHIj2mtI8OEEpQOuE6e
         a079hcYGTuu4g2nREiFz1zs5oNuO4YAs7PP8pnZqNOp0iaW4BRuU6dvuXfEScsuTrowS
         5Ir2+bwJY7B/nijvth2u91kXdglhu7lPiYr+fCcAwZAzeoxZEVjqcExwcd5B4mIbgBx0
         bsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022545; x=1729627345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVkMpy+OzbPh07o5QjDw0zjYuypZoKV5IAx0dihkBl8=;
        b=tvHXctMmOoCY33r7jtRzTUqQQD9Af05j7HzSERnTzSmGjCW9IGzkTgMQXqrC+LDqq3
         XjgSME+HTfXluEggNQbGMuWf94W08tIUvepMU7DkOvubW3f+F+erdsJH0F4XNw3LSR9v
         Tx6Mkut1jM2cDB6VB7M+Zi0txGNjbgCm7qcAwq6FQGDO3RiaEbzuhmaLCJlmiureWa+w
         VY8BqCu+ZbvN+NlNYEAf//oz10+NG8TqpjG4JDpZjvlm0srb3mucUT4otLHytoHiTEcy
         6AD9r05zjGffi0EP4yYNIKFXztYkxexyw4n6YfofNSbwqyRKHSBov8KKV73Q1iSOI1g1
         6nzw==
X-Forwarded-Encrypted: i=1; AJvYcCUP0tRq6Lc4sR9/tkHpKFcDB1fFTTyvwTWP3LgiSfp/Z05E5ZtmFngyPhso87GzccEvK1wVr3D5e4BFyuw=@vger.kernel.org, AJvYcCVlOBmIV+djIqixROlgS5xAJj558gDXAnfnq02nTr0ONnWra9ySMm6mTKzMvuhE1cjoffJCIcpSOQTT2LtZK6p2lEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YykhootAj3Bg6CkRNx/zA93VNFZzmpKikn0aBt5pwFXlU/R9mev
	Dm5/YE5jKf/86Mo+v4azNz9Rdj5yF292aAViTfZe/3MUYcuEUz16vsnLoYX/
X-Google-Smtp-Source: AGHT+IFlSkM7o6tTpCGEOEw+CNZDN+Rz6Mofjwy/53XVFkCoi66kJoaXqwdeLEM88EaqhR4URcxKlw==
X-Received: by 2002:a05:6a20:c997:b0:1d6:fe5e:176e with SMTP id adf61e73a8af0-1d8c96c2fa0mr17088299637.46.1729022545229;
        Tue, 15 Oct 2024 13:02:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCHv7 net-next 0/6] ibm: emac: more cleanups
Date: Tue, 15 Oct 2024 13:02:14 -0700
Message-ID: <20241015200222.12452-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on Cisco MX60W.

v2: fixed build errors. Also added extra commits to clean the driver up
further.
v3: Added tested message. Removed bad alloc_netdev_dummy commit.
v4: removed modules changes from patchset. Added fix for if MAC not
found.
v5: added of_find_matching_node commit.
v6: resend after net-next merge.
v7: removed of_find_matching_node commit. Adjusted mutex_init patch.

Rosen Penev (6):
  net: ibm: emac: use netif_receive_skb_list
  net: ibm: emac: remove custom init/exit functions
  net: ibm: emac: use devm_platform_ioremap_resource
  net: ibm: emac: use platform_get_irq
  net: ibm: emac: use devm for mutex_init
  net: ibm: emac: generate random MAC if not found

 drivers/net/ethernet/ibm/emac/core.c  | 81 ++++++++-------------------
 drivers/net/ethernet/ibm/emac/mal.c   | 10 +---
 drivers/net/ethernet/ibm/emac/mal.h   |  4 --
 drivers/net/ethernet/ibm/emac/rgmii.c | 10 +---
 drivers/net/ethernet/ibm/emac/rgmii.h |  4 --
 drivers/net/ethernet/ibm/emac/tah.c   | 10 +---
 drivers/net/ethernet/ibm/emac/tah.h   |  4 --
 drivers/net/ethernet/ibm/emac/zmii.c  | 10 +---
 drivers/net/ethernet/ibm/emac/zmii.h  |  4 --
 9 files changed, 27 insertions(+), 110 deletions(-)

-- 
2.47.0


