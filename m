Return-Path: <linux-renesas-soc+bounces-9778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195FF99F7BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19AAFB22301
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49071F76B4;
	Tue, 15 Oct 2024 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kz87yrYP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ED21B6CF4;
	Tue, 15 Oct 2024 20:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022550; cv=none; b=BuG+CfuwkzR1ZXFk/NhUH9cwhlISSf6YWhZmMcL0siU5KL42mkC7521zb3N2fXS1cfkFrVoF2Na8BCpluXnxfTLIsoIeoEyTxGpSmQBlaIuWkzAO/kXjICLTPbEnYEGGIshh6ccks1xE+7v6lBsYuLGY7pXZZ++Na7TRwu/Dvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022550; c=relaxed/simple;
	bh=MpPzqbf3QaeIL408JP0EEziCl+Tb8FH98+72eTKTBUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkS0Ud5BRasPOoJNsFPTZlhw9/G6dby8XabWy/2WeIqro3Fko5NM3wzsFcpNlFaCjvGiFaFlt8mi5BYLQ2zlJPxo1Lr4y3n6d/njlEiB45cDjVKOzMRAM72oV/37s6swCELA0OiqDeYz+kpYn3JoHA9YLhJhf6I9pRs8df4FfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kz87yrYP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e681bc315so158083b3a.0;
        Tue, 15 Oct 2024 13:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022547; x=1729627347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Skv/FwWiqOmJCmi289YOKQkgyeCp5KZu2TwCeimUcA=;
        b=kz87yrYP9tDoFFBoNEszKKnVhxroXDVsp21PlIlVlBWkUBNYiCy+Q5kDF0GFZx2aV8
         RPFcF89M7HW1/mneT9bAI/xkdjvbdQaf1MZLwXHyDAasGLtY1aDV90fhBQR78URVCH+I
         hXU0R5gF7CiTrlXiVHwcds0bnYyU35tpo/pPj5BL+HfoXQqHRBWqjp8z0XhCeqVBj+pZ
         hacTHWF3LLK/7wWOomxs24DroDQ7dLgUtbcR+zcoqSPMlGvYz6DTsFPmYSjouHausNg3
         sUO6i/TuzRovgoL/JGg3xBJmiGxGnmXnQHK8Qu/NuHmADV9Z/82SFKPVEgllLgmIRGd9
         CaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022547; x=1729627347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Skv/FwWiqOmJCmi289YOKQkgyeCp5KZu2TwCeimUcA=;
        b=BOFMq+QUKy7pW236mBwUYLVFfT3Z6arPhAEfpa3NjSCDEwKPS5Hi80mlg4pMY7kW56
         LtUDTZFzH4kr7bAk5wbH4jRGIrmENUOsZbW3tX4qqvlc/1h2meqnOFIi9JuWUvco0kK/
         tPHZ2wlcb7lKNeE1JP2mvHDtuj6DRFJsgHVNGVVAycd9tUidFbJ+Z6gmUez/+S8rjIWv
         1MwzjHZ09KuX5sPfYE3ebIS7MT34V+0Z1a/uVbXy6LwxddeO6pEOFNgyXJktx4BqJRuH
         JOENtWo0L2rxtz7Z9TpXC1h7ofkjdO8b0yzK+2QJuzaiz6DjGLHHvIgC5sy3hr/x1D21
         xGTA==
X-Forwarded-Encrypted: i=1; AJvYcCWXBCQILHOTYOciLttxJa9EAZX0keCq7sSFZ65LAmeobFA02ePhMSBXT9sZI1B9qSrChHKCgBzquvwbly/L8V1GGNg=@vger.kernel.org, AJvYcCXksJFFgwav12ebv02HP377v2no9Sqhz6aiZL/FpG6Zl0UL5M+KEQYpYR3K/7quNTIFktUeQwvgLtNgocg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhrdrDMdpwkbvrGIBiH8omfD8xLNGuTrw/cv0Cx625DrJUID8
	WWYVh/s1p1MWhheQi7WngyaoaLstTPdlew296iOti0GkKQZ1iZMfTAGYQ6Ou
X-Google-Smtp-Source: AGHT+IEQnw7F9c7Ey8W9o134olUzK03vIKaAJnu+pqnhlh9tRdXyW3YGwXlQQhzrHqsD0mCukl7z1g==
X-Received: by 2002:a05:6a00:8c2:b0:71e:6f09:c0a8 with SMTP id d2e1a72fcca58-71e7d7f0e50mr2802760b3a.10.1729022547232;
        Tue, 15 Oct 2024 13:02:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:26 -0700 (PDT)
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
Subject: [PATCHv7 net-next 1/6] net: ibm: emac: use netif_receive_skb_list
Date: Tue, 15 Oct 2024 13:02:15 -0700
Message-ID: <20241015200222.12452-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015200222.12452-1-rosenp@gmail.com>
References: <20241015200222.12452-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small rx improvement. Would use napi_gro_receive instead but that's a
lot more involved than netif_receive_skb_list because of how the
function is implemented.

Before:

> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 51556 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.04 sec   559 MBytes   467 Mbits/sec
> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 48228 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.03 sec   558 MBytes   467 Mbits/sec
> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 47600 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.04 sec   557 MBytes   466 Mbits/sec
> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 37252 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.05 sec   559 MBytes   467 Mbits/sec

After:

> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 40786 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.05 sec   572 MBytes   478 Mbits/sec
> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 52482 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.04 sec   571 MBytes   477 Mbits/sec
> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 48370 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.04 sec   572 MBytes   478 Mbits/sec
> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 46086 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.05 sec   571 MBytes   476 Mbits/sec
> iperf -c 192.168.1.1
------------------------------------------------------------
Client connecting to 192.168.1.1, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 192.168.1.101 port 46062 connected with 192.168.1.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.00-10.04 sec   572 MBytes   478 Mbits/sec

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ibm/emac/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index dadd987efb6b..0edcb435e62f 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -1727,6 +1727,7 @@ static inline int emac_rx_sg_append(struct emac_instance *dev, int slot)
 /* NAPI poll context */
 static int emac_poll_rx(void *param, int budget)
 {
+	LIST_HEAD(rx_list);
 	struct emac_instance *dev = param;
 	int slot = dev->rx_slot, received = 0;
 
@@ -1783,8 +1784,7 @@ static int emac_poll_rx(void *param, int budget)
 		skb->protocol = eth_type_trans(skb, dev->ndev);
 		emac_rx_csum(dev, skb, ctrl);
 
-		if (unlikely(netif_receive_skb(skb) == NET_RX_DROP))
-			++dev->estats.rx_dropped_stack;
+		list_add_tail(&skb->list, &rx_list);
 	next:
 		++dev->stats.rx_packets;
 	skip:
@@ -1828,6 +1828,8 @@ static int emac_poll_rx(void *param, int budget)
 		goto next;
 	}
 
+	netif_receive_skb_list(&rx_list);
+
 	if (received) {
 		DBG2(dev, "rx %d BDs" NL, received);
 		dev->rx_slot = slot;
-- 
2.47.0


