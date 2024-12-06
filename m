Return-Path: <linux-renesas-soc+bounces-11038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119AD9E78D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 20:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C22DE282A77
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 19:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02567204571;
	Fri,  6 Dec 2024 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="HoMz1uQ8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328141DA619
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 19:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733512910; cv=none; b=h1Ns824Tt/6RXf+MXpg+T2q+vhrqz5GDBolFUhVyp9oW6ycPHQEoVqZCCXua/MIG9oTencyP0N6+RKH/AD/KmyfP5CCpgmx1ZDjHlXDh3r65TuJGdXachUxVC4/EorqR4gFjw0kMvnM+AEz9SkprIE4jEbPtnWU1itMTrM90a2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733512910; c=relaxed/simple;
	bh=J1wLyzO5W9j22me9P5kEa5FIRVr4K39X5lpjOH5Mlbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aM3PjHlh9BiOy1P8KefS20wTm7YQGUaU9MmmAmxunJ7IaiaVgBCopOrZK7Gt/H/VLx65U9Ix9SmElZB6CwN4VYNKPDLJLDI4iL40xpxRt2Q1aIB7Qo1YAYCivOzBeGmTMzt1JXnlQY1TFH8DCTQtJVPllwqMqesq65QplyCi+rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=HoMz1uQ8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e2121112eso3359107e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 11:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733512907; x=1734117707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5NOSdyB6WjlvcQgCrw9n8rSk8sPjoBbSdt8losq+os=;
        b=HoMz1uQ8dmjv2njQLXj0xHIWahsuG4ZfnHU9zCMi+mg+1UDUQu94d2VgY6MEkEiDwm
         ccMZgIs+phJjBaOrko6woeeHf0jpmObFuNDwHO0/0fpQ/9DOrryHdI02FDBG0AA5pcML
         r1ib01AqBxZtq4r0oh7SUFuk7DDL569VyVgFQNi9Sz1NWBfJnT6xhWnm0IqGos515utW
         GKVUNFlN8TZFamKbVlodfCd71nTIdd+5VTUskh99tb400OWVuff5MEiJgKNHnQyhBmB3
         HCxtpdKk6XmPYsR7g4Vq4cx4+/bD+41ewp9Egl7FyGZLHy9WpBeGLx1DUhKlY+6prRYX
         +hIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512907; x=1734117707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5NOSdyB6WjlvcQgCrw9n8rSk8sPjoBbSdt8losq+os=;
        b=AbDUQ9vT6Cz9NYUnYA1nE06ii0x7dtYuyBPiUR2bfT1QV+KqytYaypyGrPOtFbvNUd
         e0FdKdtGwYY2ry5W/ovcXBRLISsOe1KnpEE+vDgRX4q/xFSQsd1jVUq75to5O8bBpSnf
         28svnh9WNfDnyw9u04wygPOJmJVxdj6gdhvw3beU/VQhq+fQuSDriNsGaNd7r5or1pGS
         AUfNmxKR6m9tkTmw+KGrP7mSwr8QFOPdh+2aJU9BbphSBqVkhdlqcL2Pk/rws/+DcZ5m
         cKEwdHDvtoVkD9uG3kgaFXRBL8L4M7LCI0txgsoERuOfctuPxAluUIzKwNAOaWTxiKZ1
         m/lg==
X-Forwarded-Encrypted: i=1; AJvYcCV6fVf9A0/EStuqCZxg5SQQvUp8NhmPXZhHWSbjt1v2NReRNvMpXOZmLLeh5HJ0NgROuP9DUwqGhaHiV5TTriXFEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGoX924ME5D2H1q5vQE8VMIEffwB/WfZpipRmPnF5l/hHYu2N
	Kb/XJjdKBioCM/Zl7KdQUunQxSFj+uIMawrbdjEzl+HwkUEQc4d5DHzdmoLRB+c=
X-Gm-Gg: ASbGnct8ZYoPP3ePri1lzzjm/YlqX7a43N6Ja321OGFk3ZOTblTzn4ZE7hD4k0QwpCS
	4Owuf7KTueIB3tOh1Jpg2GXA5CaV0L9COfU4v6lcrcIDoWfOyFZ42byh5UKL0jVKVWssYIH5ru9
	BQptv3GM7cHkAohlFtVlWGg9AaaZxCSA+VhDc+l8BZ2xa+8TEwG9BBpvqayGj5uO5dcv/l6ivqW
	tKA07MPiQRtxSCnZGjFeJQ3tz9xbUyVp9+ItxVqasHKBYqLCcRnsyyhxNvwktPh
X-Google-Smtp-Source: AGHT+IEkrNNKRE22p/N7Vgw2gN9RWXvT2Tt4dnHwGRo3syIX1cQ2Ucr9kBvwLbKypCn8l/wN+oLarw==
X-Received: by 2002:a05:6512:2812:b0:53e:3729:eaf7 with SMTP id 2adb3069b0e04-53e3729ee24mr1674109e87.34.1733512907374;
        Fri, 06 Dec 2024 11:21:47 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22974f20sm590041e87.70.2024.12.06.11.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:21:47 -0800 (PST)
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
Subject: [PATCH net-next 2/2] net: renesas: rswitch: remove speed from gwca structure
Date: Sat,  7 Dec 2024 00:21:40 +0500
Message-Id: <20241206192140.1714-2-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>
References: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is set but never used.

GWCA is rswitch CPU interface module which connects rswitch to the
host over AXI bus. Speed of the switch ports is not anyhow related to
GWCA operation.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 3 ---
 drivers/net/ethernet/renesas/rswitch.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index cba80ccc3ce2..8ac6ef532c6a 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1902,9 +1902,6 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	if (err < 0)
 		goto out_get_params;
 
-	if (rdev->priv->gwca.speed < rdev->etha->speed)
-		rdev->priv->gwca.speed = rdev->etha->speed;
-
 	err = rswitch_rxdmac_alloc(ndev);
 	if (err < 0)
 		goto out_rxdmac;
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 72e3ff596d31..303883369b94 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -993,7 +993,6 @@ struct rswitch_gwca {
 	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
 	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
 	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
-	int speed;
 };
 
 #define NUM_QUEUES_PER_NDEV	2
-- 
2.39.5


