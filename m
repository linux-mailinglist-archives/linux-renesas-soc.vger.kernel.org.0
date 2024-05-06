Return-Path: <linux-renesas-soc+bounces-5165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CA8BCCFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 13:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CDA7282211
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 11:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62874142E8F;
	Mon,  6 May 2024 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A0HdvaR4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A46EB51
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 May 2024 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995636; cv=none; b=SG8fANO/uv3mMI+eqMDNogM5NNdSQ/q0pGMhXGqw0FOJyDTQ2j/mriD9TUVT+UA39bCI7Mm1gRAesHzUCqCbXdZWDkhu5AEV6avvqSLBf9Ul4J2xxgsZLH5Bra6ZIly1NvH2poufG7U4rj68XfvfLv1EXeUsh9PSI1L05esydLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995636; c=relaxed/simple;
	bh=vNn4nBjiHVHd0R6UykwuRVMBMzPNZgmYEEMVlqZiy8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qc1eS0donj6kPQ3eRUT4Ur2uouDxi5inVtpoq5SmjSTVZXJxYIKO5zGZDmrPNFkCN2ahogM8GtjPhKBbZTcaf5brAeIZjLn9TlwDL1dfrhCYejWIAjSxnqJTyqgZ7tkeuE7ECKmKnviCGGXcFX/xRVGi6LBfdeHkiq5gBAB1CMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A0HdvaR4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1+/fXyDcdDYBqoMNsLyvP3kBF5cFDb+XEH2MDBafQ6s=; b=A0Hdva
	R4Xk+v0Nl+5IlgTd3GeGcGgRYHs9RVfJhjKzzMlm7hxYYsYhG+/FX9ryO3dU6M7z
	EKfBgP+lXcplr5BLSrmesb7C7AITCWwxe3PSqCZunflx8DhFLg/GLLY0coYuT4gt
	j7KvKaSTKYyNIrUxsJ9MBe29+sgFv9jD+paTkv14nD9tj5VSjAxhAKVSUkNjOmrR
	OhmPsUe8GAzKD0KEqzhq2HnLQhR7pUzijWpMl3X0vkTwWcUH7PRo6LCK+DkpUx5A
	keIlQMscFjFfnshbLNOgPMaCUNCWw2bWGceuE8CFweACgtmdk7y2tbzBR411UiAv
	f+3oiHXCe4lxbxdQ==
Received: (qmail 172868 invoked from network); 6 May 2024 13:40:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 13:40:31 +0200
X-UD-Smtp-Session: l3s3148p1@gwJgiccXhLYgAwDPX0CuAO+oYiCi4tWm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 3/4] serial: sh-sci: let timeout timer only run when DMA is scheduled
Date: Mon,  6 May 2024 13:40:19 +0200
Message-ID: <20240506114016.30498-9-wsa+renesas@sang-engineering.com>
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

The hrtimer for RXDMA timeout was unconditionally restarted in the RXDMA
complete handler ignoring the fact that setting up DMA may fail and PIO
is used instead. Explicitly stop the timer when DMA is completed and
only restart it when setting up DMA was successful. This makes the
intention of the timer much clearer, the driver easier to understand and
simplifies assumptions about the timer. The latter avoids race
conditions if these assumptions were not met or confused.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/tty/serial/sh-sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 09eb0c824b10..7cc354ee6305 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1325,14 +1325,14 @@ static void sci_dma_rx_complete(void *arg)
 	dev_dbg(port->dev, "%s(%d) active cookie %d\n", __func__, port->line,
 		s->active_rx);
 
+	hrtimer_cancel(&s->rx_timer);
+
 	uart_port_lock_irqsave(port, &flags);
 
 	active = sci_dma_rx_find_active(s);
 	if (active >= 0)
 		count = sci_dma_rx_push(s, s->rx_buf[active], s->buf_len_rx);
 
-	start_hrtimer_us(&s->rx_timer, s->rx_timeout);
-
 	if (count)
 		tty_flip_buffer_push(&port->state->port);
 
@@ -1355,6 +1355,9 @@ static void sci_dma_rx_complete(void *arg)
 	uart_port_unlock_irqrestore(port, flags);
 	dev_dbg(port->dev, "%s: cookie %d #%d, new active cookie %d\n",
 		__func__, s->cookie_rx[active], active, s->active_rx);
+
+	start_hrtimer_us(&s->rx_timer, s->rx_timeout);
+
 	return;
 
 fail:
-- 
2.43.0


