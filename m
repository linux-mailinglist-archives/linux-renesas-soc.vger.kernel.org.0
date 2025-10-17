Return-Path: <linux-renesas-soc+bounces-23247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD6BE9C63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 17:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16F4A188D20F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 15:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542643328FD;
	Fri, 17 Oct 2025 15:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNOIULam"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183942F12D0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714399; cv=none; b=bNHAtedmd5mPEGSrZrW62RToU/bgr07As9ynd+2QhiKaAIBj0gyA83FNCma9avvz8VWiCFiLFclq2YsHSkMuudJVXCGywaXxBfG4muJuYza2v8/DOoX8ASLZiauHKj9GvBh0+6FsqDBDDbaLbteT4sf9CRblXkE7MI30RC4hdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714399; c=relaxed/simple;
	bh=7Ap1yiV2IvW5TscRyVekKp/pYADoMM25JQW9IdJTVB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdDj5H7J11vxwSllO9LWekrwOokCH4gS0LbDyJ37mXK9B+cKfaF2LhFkPAogZWjrsvpEZOt8oEx3jdrNx2wh1aIKQR7nVFlBcXiqJ+qkLVaZghylAbo/BwZ4jyDhKHNBqnk/JFVvwM+o0qjBp/ky6HorsLwZS71/86b10a9UEq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNOIULam; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso1496786a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760714392; x=1761319192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXVefTb39Nse0uy+Bbk9GELviGijLUlE6DvoOutRIgk=;
        b=hNOIULamp4llWnj7/SyBAffjMi+1LQK5HtQ+YNgIcHDB/JEWGc14K74B8GXWT6ZoKN
         +5i83W9/K8xFvfeA41QhF3UH1A+sRfnN7uZcvXC0TUvgvSiPhWv9V2QykJ3O83PYXMeL
         lI+tOzMjL3RUKu8tqQPEPKumLlp+T9QKz23kZeoU7B9wndniCqxekdL/yLMzWuexvXal
         Izm2ailEk3hgE0Sx2wPJ9UYRs/BD4XLTAR81/IfS4dsasEry6sIaPaXIHfjSojtPeTa0
         wbplohLXO2HaFha+EnLS8sxtIHS3YBTDbXs48hdGVyhLXK0CzhwIU9NYfzIxP2Yt3Y98
         9gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760714392; x=1761319192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXVefTb39Nse0uy+Bbk9GELviGijLUlE6DvoOutRIgk=;
        b=M0yRXPbqpzvEqwcSzxZ0VYEhgqIvywSCMhbHwlWRdgLCmCvOz6EtZp9j1ANzKhV1c5
         ZpqC8j2Jt2kOlUe9Td3lXyKV0cVB0SICqd747LYort0DbKVjFgBPd8sC0pPOqLsoWygs
         l34k4oYoFS7Ed0truNoaLxtTZerdCZMXzMb6cCpIXmNlAqMVWZCWO9F2Rly/JSLKAd49
         /ubRQ/3QfoDEVQj3lb3/CCC+bGcVN2NMnjl6tAT7N+/P4/OluRt1JYfwkyg739vuLYb7
         APN+3ZRrjr10hikqfnopXCp/B1KnB2zBXeijI6kNtokcpYHWN/4PNUQnb0+h35SHSmLm
         QuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOi89vlrKTt34rVA60/fsSRP2IQm9AyIlbYrtw7IhoBBPqc4AEVEVr0Umim5gFSeZdjqIvo16JSsHFmbYl7TYTnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJtvJ3lulssPAu6MGHf6JW80X6TS0ghidv8x/F+GKE+KIjDMO
	7+0q1cMdIFcqQdCCqqeHZo3yzkkn8AUjA5H9aurbuBygoDwbBDCDDLsE
X-Gm-Gg: ASbGncuXnoWFo1GkWV0vU77vn9aQ1cmwxoCgjmm/ug1o06gYRoTNasBEEr1SodhthJy
	40fRKJ6aiaOBDv5xAZTN/IJwU0pheP9fORaVCPyVaWE1Yi0vdYDgaP/lUpQkd6IW0vs1QPUdcbv
	bBkk3T9kAvGghhci21aCTR6M1q+ij6z+m1jz/yJ6OJe7WbGR/+SYcgz4oTL3CDbEz3B/QKzQC2m
	F/1MeX/RdETRCl0CSnm27KKFgiEHQq9mnZIuhw8TSyphD9pfTi+TXnFbiSeIukU1Hj7fyEttdcc
	NlfpeDljcLr+l7GlKuzDjgaXXCciykMJ1Aa1UleRPWi3NRurTbnpNFNERlq3BiikPKqdkdL4hJd
	PvTB+5rugWvvc6nhNheN4bLU63SNI6ExV5bLh98VqgRSDY+Evco1lckVi0tYIIXTsCcaA0YY3h3
	UyI+LmHXTxBAVKkAKcNioEJ5BvB8NCw9uz
X-Google-Smtp-Source: AGHT+IHyIi9hV84N2xKmSAprgzQAB1rjUdqIYAvzNOIv45BdiAJRGsffALu2EyeoAjWoG6N3Yyv0/A==
X-Received: by 2002:a17:902:e88e:b0:290:9332:eed1 with SMTP id d9443c01a7336-290ca12153emr45972955ad.34.1760714392396;
        Fri, 17 Oct 2025 08:19:52 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:fdc9:5e8f:28db:7f80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a756sm67193955ad.14.2025.10.17.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:19:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] net: ravb: Ensure memory write completes before ringing TX doorbell
Date: Fri, 17 Oct 2025 16:18:30 +0100
Message-ID: <20251017151830.171062-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a final dma_wmb() barrier before triggering the transmit request
(TCCR_TSRQ) to ensure all descriptor and buffer writes are visible to
the DMA engine.

According to the hardware manual, a read-back operation is required
before writing to the doorbell register to guarantee completion of
previous writes. Instead of performing a dummy read, a dma_wmb() is
used to both enforce the same ordering semantics on the CPU side and
also to ensure completion of writes.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Cc: stable@vger.kernel.org
Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch added to separate out the memory barrier change
  before ringing the doorbell.
---
 drivers/net/ethernet/renesas/ravb_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 0e40001f64b4..c3fc15f9ec85 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2232,6 +2232,14 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 		dma_wmb();
 		desc->die_dt = DT_FSINGLE;
 	}
+
+	/* Before ringing the doorbell we need to make sure that the latest
+	 * writes have been committed to memory, otherwise it could delay
+	 * things until the doorbell is rang again.
+	 * This is in replacement of the read operation mentioned in the HW
+	 * manuals.
+	 */
+	dma_wmb();
 	ravb_modify(ndev, TCCR, TCCR_TSRQ0 << q, TCCR_TSRQ0 << q);
 
 	priv->cur_tx[q] += num_tx_desc;
-- 
2.43.0


