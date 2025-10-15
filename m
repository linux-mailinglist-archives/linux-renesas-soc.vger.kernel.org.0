Return-Path: <linux-renesas-soc+bounces-23082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D14BDF446
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F0DC508B41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2762F069D;
	Wed, 15 Oct 2025 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2+JimHg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF422EDD76
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540459; cv=none; b=fgDdjd1+nprKflK9i+NXT0XJcfCOzmOmU22gFj2yK5hPwZCBWx3oCKuHP+899c11UsLU8tlLpKeV2eMnQndwnZ7vvLp4q5Gq/1iBL5yw0Z7BI/hWfAyrxjB0ew9gIZiqdr5SxP35J0xEZr/LM4g0MtKxcT7G6G1cFfZq4sfHzvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540459; c=relaxed/simple;
	bh=60XT5SO34ddHtpkn/CIdJmvGQY2Mb1sF34YxFyRKDfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1ykkO9fH77g9dNeDJTktA7L6dz78X946srmXo0kND4vKis7twbfNafGBhdZuOeHTgoxxUFRYICthctLroozSYJRVBffuAJveLkCdr4RorlBP+l7JvAtx5X8j/tNorTmzcmmV4GGXZAOHcjGswAV3Ij2vRyTtWqtkIuMw2vfR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2+JimHg; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b5515eaefceso5780869a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540457; x=1761145257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifGvImgtMbsz18j1645Ok+33OIuHZ/lnBEplV9+70Ps=;
        b=K2+JimHgj0OETor0U2PUWLzJe0XalgSCzoHcek+QuqM49FaXClZNjlwZef/myuLBfe
         hX6BQ4BEp+OSEZbtLXkvK/4uITCr9tVcthgkh3sim5kHYWh0ZGL/Q1bglm3rAFkvUHGd
         hejdzMeGEw2cbKRocB/DFBC2ywbCjJSr8LrcnO3+jLuwFJADWg0AM6JCO9rL0/7buJJE
         QNgZOvVyLd6+zL3Y5FhQ1CId7uQlges7VPZVmmPaEiXd2wiRvCdzHBjW1wyjBqe34+a9
         kFCTLo6b9aocn+fdDZrpIUnP4OXxM8qXWH/mKgY1FDdRqd1i6VYTZgfBaA4Fo0Zb3v4y
         du0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540457; x=1761145257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifGvImgtMbsz18j1645Ok+33OIuHZ/lnBEplV9+70Ps=;
        b=jNr9H0p1Q5UAGmNS7Cel2tMHz3nE2ZUaqwQiSeP8SF+Zue5G1trNLt9r+q4x3FHL98
         h9gpp7/H4l1ZVRSyIQD4FU9bTPLhrHvj0gttpOve0LNL90cFuhxo+UajlSLIUXv5rG2x
         xEH4gVwVRUKrV2cRw9RHHWfVQNS65D6R7eZ1QziLimTGr3fVMrbve7qAjbOnbHJGXWSt
         OB7YfXbG6daQ1gvsEBfWZg2ZOzSjo0YwDQzQ+WOC0P0hhSyS7vIJbUN8aa2SJcS2eSnQ
         ey8BuYBmQU2JrnCQSPJZ+UCYkpHyRBatxJekBglADgrTbUUFkgG677MZpTB3+SuOzuWm
         rvLw==
X-Forwarded-Encrypted: i=1; AJvYcCVSn9AVsfeZQQ7wvjxaEWlRHxv9Dh/FgvxyPVsZ5H9bTrSelrca/WdsScCCcb3W6WPHrvtxZf+lPuk7L/zv5Ymbng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZ3ZG+GMwIn3niPQEUKZPJm1q3YHV67A3xKf9SQWtZdSwCFE2
	FQUDb4Rk5tQ7fSC+gLWG/YpxdrugAEfX8B8Jw4I4Y/flNxRSRJLBht3E
X-Gm-Gg: ASbGncuzWET1Tr1cgl0NV9q/UCuD+zCPcjHH0I/j0aNPBVh+lN0NDQN46MKysiRMmwe
	fSugeNguF8N+cJeF8tY8II9QkqPDG/yvrX6kTNuThzOzlWiiRLbeLnXBnpsZP9hJMSjf4C4KroW
	lPYN6Ytk6dCYeYVQZPgxHULVH2fZVwyDCJmHyQpJ8y8frqSx6p6cGDT2lOVnhUbuAA4l49gl5JK
	boGOFRaGblQcy5VLqku7UH1fJnQB2mbunGf9ddUYe6QVC9071wn44tdyjtXdRZ5DQxUWehUgONg
	dEacqGd1664o9GXQjqNF8OYJjY+jJUYkyXi9YRODr2931UrsYIFLMaHzzf7wCN/BEa8RJWE/LgF
	j/iQN2WWALMig72mXKX4OM7Cv03fjCWkQsT8DE9Wo88MFeRtfnuoW6gKVQfZ/cUvxFbcuaGvJSQ
	==
X-Google-Smtp-Source: AGHT+IGqxIssqtEE1gKMyZ/xPQWAaQDO4XMp/cQx9E/SYok7KUMOpcA7WPjXYLzfNma9OBCD3O8baQ==
X-Received: by 2002:a17:903:298c:b0:265:982a:d450 with SMTP id d9443c01a7336-290273ffbf1mr386779325ad.40.1760540456721;
        Wed, 15 Oct 2025 08:00:56 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36408sm199642265ad.91.2025.10.15.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:00:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] net: ravb: Enforce descriptor type ordering to prevent early DMA start
Date: Wed, 15 Oct 2025 16:00:26 +0100
Message-ID: <20251015150026.117587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ensure TX descriptor type fields are written in a safe order so the DMA
engine does not begin processing a chain before all descriptors are
fully initialised.

For multi-descriptor transmissions the driver writes DT_FEND into the
last descriptor and DT_FSTART into the first. The DMA engine starts
processing when it sees DT_FSTART. If the compiler or CPU reorders the
writes and publishes DT_FSTART before DT_FEND, the DMA can start early
and process an incomplete chain, leading to corrupted transmissions or
DMA errors.

Fix this by writing DT_FEND before the dma_wmb() barrier, executing
dma_wmb() immediately before DT_FSTART (or DT_FSINGLE in the single
descriptor case), and then adding a wmb() after the type updates to
ensure CPU-side ordering before ringing the hardware doorbell.

On an RZ/G2L platform running an RT kernel, this reordering hazard was
observed as TX stalls and timeouts:

  [  372.968431] NETDEV WATCHDOG: end0 (ravb): transmit queue 0 timed out
  [  372.968494] WARNING: CPU: 0 PID: 10 at net/sched/sch_generic.c:467 dev_watchdog+0x4a4/0x4ac
  [  373.969291] ravb 11c20000.ethernet end0: transmit timed out, status 00000000, resetting...

This change enforces the required ordering and prevents the DMA engine
from observing DT_FSTART before the rest of the descriptor chain is
valid.

Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
Cc: stable@vger.kernel.org
Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index a200e205825a..2a995fa9bfff 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2211,15 +2211,19 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 
 		skb_tx_timestamp(skb);
 	}
-	/* Descriptor type must be set after all the above writes */
-	dma_wmb();
+
+	/* For multi-descriptors set DT_FEND before calling dma_wmb() */
 	if (num_tx_desc > 1) {
 		desc->die_dt = DT_FEND;
 		desc--;
-		desc->die_dt = DT_FSTART;
-	} else {
-		desc->die_dt = DT_FSINGLE;
 	}
+
+	/* Descriptor type must be set after all the above writes */
+	dma_wmb();
+	desc->die_dt = (num_tx_desc > 1) ? DT_FSTART : DT_FSINGLE;
+
+	/* Ensure data is written to RAM before initiating DMA transfer */
+	wmb();
 	ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
 
 	priv->cur_tx[q] += num_tx_desc;
-- 
2.43.0


