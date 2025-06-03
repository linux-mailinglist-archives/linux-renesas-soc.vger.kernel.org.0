Return-Path: <linux-renesas-soc+bounces-17825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9DACCCA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jun 2025 20:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F6E189196B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jun 2025 18:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BB51EF0BE;
	Tue,  3 Jun 2025 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Umyz/H57"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC031EDA0B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Jun 2025 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973777; cv=none; b=sHf0FjZB3H6KerA+mGvz25ejiewJOM1qitHxK5cyTNf8bDOP/IkSwsho/OkFmcrW9lVxbFQr18LOmXfmrp8jDHraCKD12P0IMd1PSObEgKzm6zCC8hKyd1sEzahSdnF+EpNHKQ6x+YkGYh6Kuggr3gxRPfxDtqK58C4L8ak6T58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973777; c=relaxed/simple;
	bh=vWLmrVNcT29C8KsJhhxyPsfz6vvMC5hsmwliaeSSWY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DS4utdPdr705kN4jjtjTg+j7fIrl/LcULasHWudtxNFVkSvJCjR1YC0/jD8wreu2/xlijDHyTAgCCXFezUPLsM0mZW9ZUEum+4R7ut4IY/Vz9P/tiJ8VxCi9QvdgYzuznf3UuLPBCiQY9GTT/7oKR/FirOGuT1RVYzyNg1EWkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Umyz/H57; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bKKC2iIV+I4AOP
	uePqJbIyB5K0aSdCWcGxhWmHkvUxk=; b=Umyz/H57Tc6SvGd1pR2dYh9FKWqmZ5
	tD3uQKZB/RiabheDl3poL+Ca83GsoRl7LAOyyrJZPE8N92iyCKkOeInstdaLQwAr
	hUPbI5jx/G9AQyUeF5ebs/Lz1xDru4Hr+RzoicYs02vFgPf/ksKe193qMZCcCl/n
	YzhaQn4bEIMMIQuEksBfDC1m0fLqlJLwWcUiwgD46rWX0vNbane+X5VApNAfs+4X
	zXLnE/jTykzKW6uz3RQV3Aca3ZK7nE6PzYi+LJ3bDcDTb7jJpGtjET1QBgtKojwn
	sAZXQH4Vz1e4Gxh33WBz0e+uirfu5FFmogBj5Q78iAu0ycgkfjXBu4dw==
Received: (qmail 364279 invoked from network); 3 Jun 2025 20:02:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2025 20:02:43 +0200
X-UD-Smtp-Session: l3s3148p1@CATgr642qNMujnuc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: renesas_usbhs: use proper DMAENGINE API for termination
Date: Tue,  3 Jun 2025 19:58:54 +0200
Message-ID: <20250603180131.14579-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---

This was an RFC 4 years ago [1], and then slipped through the cracks.
Shimoda-san agreed to this patch, but we decided to let a change of his
go in first. This has happened meanwhile, so according to the back then
discussion, it should be good now.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210623100304.3697-1-wsa+renesas@sang-engineering.com/

 drivers/usb/renesas_usbhs/fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index 10607e273879..bac6f8fd0055 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -123,7 +123,7 @@ struct usbhs_pkt *usbhs_pkt_pop(struct usbhs_pipe *pipe, struct usbhs_pkt *pkt)
 		if (fifo)
 			chan = usbhsf_dma_chan_get(fifo, pkt);
 		if (chan) {
-			dmaengine_terminate_all(chan);
+			dmaengine_terminate_sync(chan);
 			usbhsf_dma_unmap(pkt);
 		} else {
 			if (usbhs_pipe_is_dir_in(pipe))
-- 
2.47.2


