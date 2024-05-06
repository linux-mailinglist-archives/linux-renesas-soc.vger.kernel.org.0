Return-Path: <linux-renesas-soc+bounces-5162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B958BCCF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 13:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32E071C20FA3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 11:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA35143877;
	Mon,  6 May 2024 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gmbYN0eW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E13143864
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 May 2024 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995636; cv=none; b=GhUHPxY7DiCHDPcb1aoMch2+Om4sZgSGdqNyX5Yfwn3WqV7/y6lCQ6JVLhbydxqpM5Y0ZjFaVtViBBxzkQ1Jd5ILltifKBzt9pLHNo34xalO/4wrjkBl1Rkysdnoh1omv1dRnzlYiGPjaYKoPKnLYkjR0Hrqlj1pwleVcIuLrX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995636; c=relaxed/simple;
	bh=BsQOXq+ahxAfweHQAWj5mwNGLsEtbwecliFaCCUsygw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6jW7nAheX3FBNxkxG/Q/Wen9051bEkKw2pZ1NRmwZyB+RmAAwO5LiHeU5g0BbM1AizrMAKI6B+xj4jwPWcY9tgNP4D1wxDHxbBak6hpM4c82J/f+ywQ1LrfPgwfMSy1M6LKmfSnF7k9Mc7Co0o7dpHSM4wNjQ8mB7XrjkJySiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gmbYN0eW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3vmDFjar/7zOCQ0E0AN2tIN3W6sFdzg+LLuJUacu2Pw=; b=gmbYN0
	eWVvpz13qeB+CpgJkjp6DR7VNk0TN2JEzS1AL2OvdXgr3olGLemUU6Zh0VJyg2ii
	ZHU8EGzAz6BY08+lbGpAD6Fhvsw/CqnPalBxo/pLbucRc3qG5vJzQFnKPy2zWQ/V
	tejPXcu6/l1Hf5iZFNanvcwYc8CMSo3TyopoZDkofxjZuFjj4TcBs0pxasac7U5k
	f4xCkxy3Sanuynmpo1bsKF5sa67UVIhK9VfWwnM1r/uwYF7ZldyTZoKDRPVVbBeu
	WEaSsrch/ny8MflRmLpTxh/nO0Z2PvsIFzLomm4u7NFfPcTjGeb/dOYU1F7WaPsh
	los4Y2U4t2QcdLoA==
Received: (qmail 172821 invoked from network); 6 May 2024 13:40:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 13:40:30 +0200
X-UD-Smtp-Session: l3s3148p1@hUhTiccXfrYgAwDPX0CuAO+oYiCi4tWm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/4] serial: sh-sci: describe locking requirements for invalidating RXDMA
Date: Mon,  6 May 2024 13:40:18 +0200
Message-ID: <20240506114016.30498-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506114016.30498-6-wsa+renesas@sang-engineering.com>
References: <20240506114016.30498-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure everyone knows that calling this function needs protection.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/tty/serial/sh-sci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index a6f3517dce74..09eb0c824b10 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1258,6 +1258,7 @@ static int sci_dma_rx_find_active(struct sci_port *s)
 	return -1;
 }
 
+/* Must only be called with uart_port_lock taken */
 static void sci_dma_rx_chan_invalidate(struct sci_port *s)
 {
 	unsigned int i;
-- 
2.43.0


