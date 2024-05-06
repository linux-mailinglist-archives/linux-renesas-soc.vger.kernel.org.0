Return-Path: <linux-renesas-soc+bounces-5161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE6C8BCCF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 13:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ACEF281E25
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 11:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E573014386C;
	Mon,  6 May 2024 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HD4MITfX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9214262C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 May 2024 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995635; cv=none; b=TQhLzBS94EtlY1XFA/IoX7eFa9n1gM4rbRZA5hb+X4hJAymWLnDUaCj4LDKq8V0IBGg1laYGw6YoU9ojU8NDX8EJpZIFEK/v8AsWdd1rIIx+5IML+EpXR9wBX1PD1/V9FD2HdvN2db9PnEHSd+5dvQ3L/wXpaR/oWqKQXeiJYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995635; c=relaxed/simple;
	bh=tZekCqwesM0TH7zbeTcT2ilFSjF/za++SpAUFY+hRMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDoWUAhdkzN44dgXyUwgepr6imROUqmiVe3zz4abk5BW4k/T/9EUnv2k1p62a4gtNMFhCBDVov0ZEYBmbVNw/9lHF08KQTrJX1rPSxiQyFRaQtpLiUdKi81If4hoPZl9WHZUcwOSdLTAOuLd01gDQ8cksWf4B6lj2HuSgKKf1lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HD4MITfX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=b0eZn/5/l2EZquZuG8Vtq1BaQMNdvpMDot1jtzd3GNg=; b=HD4MIT
	fXtOLqSvs5hTbA609YvGcnRMuFmzuICm/BtAj+c7CFjQ+FcgZvTdguYi26x4Gx5x
	aUwskDia3s9CmBxlYF0vK4tcwVMJWYq0JGmpBQetCLRpJ3MBZMmLR/xejuf7j8iL
	JLURDLYzEnAFWI2iDSS2dfOzdaAThty39XSG33dTBxgL7IndmgVjAUsw2jsrXVNo
	O6P7ChA2KzQZQpEuNb0JzAl8IRzJS4viA2Foado0LN/0QR5Uqinl6a32202excsa
	va0+l5ivdZgiLfM/pFxO+I/0EmdqzX9hH0wL9YoiFQQlUNAn42T1GEteyK6X9oDQ
	exAdH/P/YqpZfaeA==
Received: (qmail 172901 invoked from network); 6 May 2024 13:40:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 13:40:32 +0200
X-UD-Smtp-Session: l3s3148p1@fa5riccXlLYgAwDPX0CuAO+oYiCi4tWm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 4/4] serial: sh-sci: simplify locking when re-issuing RXDMA fails
Date: Mon,  6 May 2024 13:40:20 +0200
Message-ID: <20240506114016.30498-10-wsa+renesas@sang-engineering.com>
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

Avoid a superfluous unlock/lock-pair by simply moving the printout to
the end of bailing out.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/tty/serial/sh-sci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 7cc354ee6305..4dc9c142690a 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1361,14 +1361,12 @@ static void sci_dma_rx_complete(void *arg)
 	return;
 
 fail:
-	uart_port_unlock_irqrestore(port, flags);
-	dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
 	/* Switch to PIO */
-	uart_port_lock_irqsave(port, &flags);
 	dmaengine_terminate_async(chan);
 	sci_dma_rx_chan_invalidate(s);
 	sci_dma_rx_reenable_irq(s);
 	uart_port_unlock_irqrestore(port, flags);
+	dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
 }
 
 static void sci_dma_tx_release(struct sci_port *s)
-- 
2.43.0


