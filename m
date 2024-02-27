Return-Path: <linux-renesas-soc+bounces-3228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B5486862A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 02:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33861C270A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 01:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673661B28D;
	Tue, 27 Feb 2024 01:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bpAxC3G8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04D36FC6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708998124; cv=none; b=fYJqhxEum8ck+SQ+lZtbU6v+jXadKlKfKAWmjTEi4YB3eX6tLI3xsMPIIa6Y+5BWiYehzbsUxpmg9V78g2qIIktclMGI0b4R89YuVvmBc0Zw7SVaDOyWO9a8jCNXXxq9ad69GHKrkjRSZioWpUWr/I1f7/mHk13bIrYrUO01Tr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708998124; c=relaxed/simple;
	bh=DmiYehH02JX9eScG9j64ZSxMCrWI7n4JEDZAyxQWx5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=puC0raCzSoHfydI6rCE1BK/Xvfl/sBu7Zpk/qhxwbthnp4Zzsxrc0+/SJGPoDevYoXoMRu6nUho3PuiXIJVAwtcLmaBX1YrdULfgshfZYyOCN9e1k5UXWnkMhru9DxTeNb6n97IbsybI7Gs9S6v/njSPpwnmRSjiMEaVxyHoNtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bpAxC3G8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4129e8bc6c8so20019355e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 17:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708998120; x=1709602920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58sBPe0nZJHNQfsXFyQ0Ar+qIGc9GIE6zpmVSU3zB7Y=;
        b=bpAxC3G83v7dXHDyGbl4MBPrFbEfPbuVQL5Dvl2snjSXqExFz64ieRglp3fWO4XHO4
         H+ul3J3m5rSvMVrnTdsm0Ucy790wJ22mYERgZgfyP27xFf02I1UoK9dn76GO2RzxvvFe
         otensB4n4Rv/HmjCAEMSieLbThInmqwzusJpVm/Qz82dPGTXCBNjCVK3XXEyhod5Z38J
         KtOWnA8H3XAWQEBK129EoxR9IZuZmt5sULtuf5ssakiZlaXIjmJMvsoqFEwucOMgbA4G
         1Jqd72UL2usA78dyvlRGe//bgkDdz63EcwPHjfqi8bT7V24kN+GPJGEzNAO75qHZ1V0E
         MMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998120; x=1709602920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58sBPe0nZJHNQfsXFyQ0Ar+qIGc9GIE6zpmVSU3zB7Y=;
        b=j5STaw1Wbt6Y8+3IAbk6QfYDnnsOo/MDhWCP1ZP/97spgccPRklVnOo4KGgal9SGC+
         Pqf3shsdlViRm1JnbXHyKkcCRvvu9Emb7MeAOJ3Oj4KJ0KW6YJcp+WcHEypPltC2CKhG
         4eK+NZaGOWCzBYC4+ujTAs6tQAurh8l8yT+GcYqjjSl+ijHuCtYZiXMGp1QZFmRkpyR1
         vhgFgLkQ/6/tbjoUiyS+EaPSARLhyn3C5bZjbe0ITg/9qcqDTquG85DHDacfsXfKym0Z
         wZhMUwtQM75O6WI90fQwY7ueUF5+H20gkYma0s7LFmiDZkRpUiQtQzWqGWRx793UWWol
         +oMw==
X-Gm-Message-State: AOJu0YykxnqRWqL1qJ6J3gZBMi97mbSInpV4AOHPRUtsEs8T3rb2ArHQ
	/LJxA0mjmSRVyeV7OnHMehk6OKxg1xfJIgkHsTymlDGdlTGXYVNzjYXt00dGNOs=
X-Google-Smtp-Source: AGHT+IF7uqfLZ3XWY/OkIW2VTtPHfVRJo5sq/Y9TPOOfjNW3Te4TDXmQCoiAPoRSmL1R7WL4P3L/KA==
X-Received: by 2002:a05:600c:4504:b0:410:656c:d6d with SMTP id t4-20020a05600c450400b00410656c0d6dmr6082590wmo.18.1708998120133;
        Mon, 26 Feb 2024 17:42:00 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id w15-20020a05600c474f00b004129860d532sm9827918wmo.2.2024.02.26.17.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:41:59 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 4/6] ravb: Use the max frame size from hardware info for RZ/G2L
Date: Tue, 27 Feb 2024 02:40:12 +0100
Message-ID: <20240227014014.44855-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the define describing the RZ/G2L maximum frame size and only use
the information in the hardware information struct. This will make it
easier to merge the R-Car and RZ/G2L code paths.

There is no functional change as both the define and the maximum frame
length in the hardware information is set to 8K.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      | 1 -
 drivers/net/ethernet/renesas/ravb_main.c | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 751bb29cd488..7fa60fccb6ea 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1017,7 +1017,6 @@ enum CSR2_BIT {
 
 #define RX_BUF_SZ	(2048 - ETH_FCS_LEN + sizeof(__sum16))
 
-#define GBETH_RX_BUFF_MAX 8192
 #define GBETH_RX_DESC_DATA_SIZE 4080
 
 struct ravb_tstamp_skb {
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 6e39d498936f..b309ca23f5b6 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -566,7 +566,7 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 	}
 
 	/* Receive frame limit set register */
-	ravb_write(ndev, GBETH_RX_BUFF_MAX + ETH_FCS_LEN, RFLR);
+	ravb_write(ndev, priv->info->rx_max_frame_size + ETH_FCS_LEN, RFLR);
 
 	/* EMAC Mode: PAUSE prohibition; Duplex; TX; RX; CRC Pass Through */
 	ravb_write(ndev, ECMR_ZPF | ((priv->duplex > 0) ? ECMR_DM : 0) |
@@ -627,6 +627,7 @@ static void ravb_emac_init(struct net_device *ndev)
 
 static int ravb_dmac_init_gbeth(struct net_device *ndev)
 {
+	struct ravb_private *priv = netdev_priv(ndev);
 	int error;
 
 	error = ravb_ring_init(ndev, RAVB_BE);
@@ -640,7 +641,7 @@ static int ravb_dmac_init_gbeth(struct net_device *ndev)
 	ravb_write(ndev, 0x60000000, RCR);
 
 	/* Set Max Frame Length (RTC) */
-	ravb_write(ndev, 0x7ffc0000 | GBETH_RX_BUFF_MAX, RTC);
+	ravb_write(ndev, 0x7ffc0000 | priv->info->rx_max_frame_size, RTC);
 
 	/* Set FIFO size */
 	ravb_write(ndev, 0x00222200, TGC);
-- 
2.43.2


