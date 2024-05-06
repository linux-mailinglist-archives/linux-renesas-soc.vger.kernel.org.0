Return-Path: <linux-renesas-soc+bounces-5163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851AD8BCCF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 13:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BFC8281F25
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 11:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2502814388F;
	Mon,  6 May 2024 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iY0ptTyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C634142E9E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 May 2024 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995636; cv=none; b=jDgMWimR+zrk+mE+EQJxoEO2xdsToRwCVUrU/UBzEKi0RAwzznKNC/XKYU6bw69EzvQp1dC9Vy8T8giflOJwWg+YOIWtAW0PNhdn0ZRtvniSGMg8Bbrq4NGOZT9UMuwlQ0AgXZwlPJ/9ExkQ9a8ql20jT9nLnZ94m/ANlxmKHJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995636; c=relaxed/simple;
	bh=6Rq27B0cqBXcEXe4wotRdlbpgW3xqppwXIUuno2GF70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sc98+mJr8Wn4+yKwoebZ3LMshO/ySugrWmWXUMeY0BXi3oCas06d678kVycfZN+j4Bb0xmM+3mirC13yl731SsT1gMCMEiYgzFvtD12VsHXBWx3yy3Gs7oZlUrFqI+4sK8C1TmRkC+cQ7CJQTpW4kmURxXAgx28ErfZO3ClmV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iY0ptTyW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=5vvEQdonqhAK3cFmNNinstUg5N1d+o2KAqgFo4CNsT8=; b=iY0ptT
	yWieqlnTPSFtINnk8wFFdkihnqfoHOqfA8AmLedpL/47H61OJOLQOT2guswEH64X
	H+J9zmifOQjXY81taDQgjxsGQBHtmz/W/Bnn20O8+fmb7RWzd6M5k8wbJHfEEABX
	yy2YQzr0/XO5POPM13hXIYOHu7dWwWDe21ssNxE1UK0GLcZt2Z2XkESp9ahNkNgr
	rm4ZIZ4Hkftq15/MX38BbQUpeuqvBFLb+H4gdnyVdZiLOnxp+BZm/zHriUY9WIG1
	LsqbMBYkvTaFqmNGMFCypPuryp5b03xmMb4vT2F0fqA92QI6+3NP9RWs0dDSYxVY
	dcFgV3u3iPx5w0fA==
Received: (qmail 172779 invoked from network); 6 May 2024 13:40:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 13:40:29 +0200
X-UD-Smtp-Session: l3s3148p1@tvNGiccXbrYgAwDPX0CuAO+oYiCi4tWm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 1/4] serial: sh-sci: protect invalidating RXDMA on shutdown
Date: Mon,  6 May 2024 13:40:17 +0200
Message-ID: <20240506114016.30498-7-wsa+renesas@sang-engineering.com>
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

The to-be-fixed commit removed locking when invalidating the DMA RX
descriptors on shutdown. It overlooked that there is still a rx_timer
running which may still access the protected data. So, re-add the
locking.

Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
Closes: https://lore.kernel.org/r/ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com
Fixes: 2c4ee23530ff ("serial: sh-sci: Postpone DMA release when falling back to PIO")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/tty/serial/sh-sci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e512eaa57ed5..a6f3517dce74 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1271,9 +1271,14 @@ static void sci_dma_rx_chan_invalidate(struct sci_port *s)
 static void sci_dma_rx_release(struct sci_port *s)
 {
 	struct dma_chan *chan = s->chan_rx_saved;
+	struct uart_port *port = &s->port;
+	unsigned long flags;
 
+	uart_port_lock_irqsave(port, &flags);
 	s->chan_rx_saved = NULL;
 	sci_dma_rx_chan_invalidate(s);
+	uart_port_unlock_irqrestore(port, flags);
+
 	dmaengine_terminate_sync(chan);
 	dma_free_coherent(chan->device->dev, s->buf_len_rx * 2, s->rx_buf[0],
 			  sg_dma_address(&s->sg_rx[0]));
-- 
2.43.0


