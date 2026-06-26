Return-Path: <linux-renesas-soc+bounces-34471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WVbwJKWiPmqoJQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 18:02:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 940616CEC01
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 18:02:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fdRjeBD0;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CEBC3003718
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 16:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD453BD241;
	Fri, 26 Jun 2026 16:02:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0283F8EC2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 16:02:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489759; cv=none; b=Yo12X6mHEIAnrnbGo1fjQmi1h6qGORe72GsJltQAwYfLBywK/WNw/F+a3wQo5Xd3AXAowr4ETc695y4wld73rgrCTfY90c+pqs4nJQLObgaHDgMzi67glmzJ8ZjEqZg7bDTFfD5aFH0wr+mDUN586smMFV8VPAZrK0AesbBSOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489759; c=relaxed/simple;
	bh=i7UN6NZmlk87N9g+MUwiSXXy8P7EDhqDhWuLVQnXrEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iIuVUloEVwGsbj4Ox41x6tGB5bOZ//Mi8mz4l0evh0efWnXQ4R/NkUspobOA0Ot7UQy7fqUDmD//nDYlXxVkfWtFF/AmTc+4aSV97s1MFpiJNXTLodAUZdBsHcP/aDPYu7o/Rp/C56l/Q8zaBfE0vrgcwAxVV/DqvNDJYeDdvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdRjeBD0; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37da8b5540bso792737a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782489758; x=1783094558; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nB0N03rGfVExnQtJc3B4o4XRNHfaU9SsB4IMAxp8xSE=;
        b=fdRjeBD0YjvUKrEJ4BESbAsGDWS0wJjxvKFH22rDFQevIfjkTzFuE6Pcg4CgQk8eSL
         9T/dZz3+Zcw1IB4rA726tASBs2svXd4HAlgBdHwN3yHCE7EMhljfgKnWGMcvVXkii53S
         NV9aFddQxRENflXmYnQtlWpHJenu5I3niqOV+W/W3DWrK3KG5Y3h+DkDFma5mVs5jEXT
         cZbbioEV4hBL/+8p472ufGQaUbfgL8R5hhzPi8XZ7vNooQI8i4a44WpKONOBfclgp4/2
         3RixD+Kgc4byZ5/RqE2x7W14d3GtGOmdc8CFH67DIHc4+zfWRwfSijFgCtth5GLHQHhD
         uu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782489758; x=1783094558;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB0N03rGfVExnQtJc3B4o4XRNHfaU9SsB4IMAxp8xSE=;
        b=rz3PA0wzfD3BG38X7OhVEIIUEs/frLkvZCgw5Fs1NvF2d9GCs5F1FUiG1s5JJVhmLo
         JrfQDyrWl6K5+eCymYCUNriozEauvTS/x/Nubsge0cspOap0pMxd9NjpTwaRaVkLYSQn
         7IKfgMK5w0ISvqzoStlcwBRAxzDc+JxWTBsrcfcubWl2xvdZLGcf04MCwIelXqMvhcR9
         NaTAp7m+AAPeM+0/xasLhf84JfYb1gLKcAUkzR/QPvMm5EeuodRPpVIItudwwz5lf+Hi
         pGO1oOfLnuJrUmmgenX1uZO4fUdJMQ13k2Qx0GWe++jDZWHl7q7uCgy7JMVCs5qv5Z4R
         PnVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYIgfcAV5gAzI4A/K2Bvx2CuRy7Ed2a5VJCp1XqFBpwmpuLALp1ookyUTH6y3HOO0LZMtVCl4NT+dUN6jH8gdO/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrYOP1tUkML4GI+i0k0yT06A8JKhBYamAbDz+dVu81fFQ4/WX
	vtTn8GmCjW/vyTIpN7n2xlzD5rFlddQSonbDPclw2qiKdi/o+o/QDkLd
X-Gm-Gg: AfdE7cnEjmML7kXervsQalqxjy8cO+mNbG0ubQxVt4TFGDDLRqyuv3nN1DdB6G9Q1wT
	HgZu039r7ghfwe+ejaHMQLouYJxReHf9SpKPtxIPslPychpNTyW8hZr0+g6t05zc02kw5xymvh1
	iD2rwLm65WzWipTyKoXATMupQ0InefiW1/TXcSNgwj0USk2bSwN2pDxz2cQ+EwYJ/r7YNsRSKZK
	b0r6Wo0KzRi21bnhZnDIJ3t9A7pbobZRhFOGT83EIs67otZLCwE2BB6f+C8+6pCN/kLlQqR3l02
	lsa9Fqh7tte6hkGJrsAwHLHOIv5c6f/JPYWwe9E4MSXhEApHCzBtmnfwgnTaaEL2HDqX6WEJ3VB
	z7jydp+1mToJuOMg+0p1DLbyW/dIaNT/nu6K1HasgrhnxYViY0QdsAVU+V4HoBsqiBC2fW4Y4bs
	lQuuIKBd+d7WF9GMgY8p8u8njoko2oZw7bbSzDQl9WM8ACsJNcNBiY9BJm3F+rBVY2ZzSyNQ7Nx
	o9ymhorM4I7RWeiUA==
X-Received: by 2002:a17:90b:5826:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37dfa251534mr7269381a91.15.1782489757620;
        Fri, 26 Jun 2026 09:02:37 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b657b3sm4149363a91.15.2026.06.26.09.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:02:36 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 27 Jun 2026 00:02:29 +0800
Subject: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJSiPmoC/yXMQQqAIBCF4avErBNMaBZdJVqYjTUtTJyKILx7V
 ssP/vduEEpMAl11Q6KThbdQ0NQVuMWGmRRPxWC0QY0GVZLIymvbokNqyVkoaUzk+fpu+uG3HON
 Kbn+3kPMDCWDmUmgAAAA=
X-Change-ID: 20260626-rspi-f0a56c6e5eca
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Mark Brown <broonie@kernel.org>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782489753; l=1399;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=i7UN6NZmlk87N9g+MUwiSXXy8P7EDhqDhWuLVQnXrEg=;
 b=ZO0A3r26F72IgnWv9fDl+OwU5EUI+bhNAfMK24m0PF6jGX+ZGxsDpS9yssQnG8VnanG6MC9RE
 FZE2QjPAY29AuBMSejrmJjxrpfWD6u0y5Db6QoWAH7r79JGIDv3kYFF
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34471-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:cosmin-gabriel.tanislav.xa@renesas.com,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 940616CEC01

wait_event_interruptible_timeout() can return a negative error code when
interrupted by a signal. The original code treated all non-zero return
values as success, which would incorrectly synchronize DMA channels and
return 0 instead of propagating the interruption error.

Fixes: fa08b566860b ("spi: rzv2h-rspi: add support for DMA mode")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 0738d448160d..daa4239b0fe0 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -366,14 +366,14 @@ static int rzv2h_rspi_transfer_dma(struct rzv2h_rspi_priv *rspi,
 	rzv2h_rspi_clear_all_irqs(rspi);
 
 	ret = wait_event_interruptible_timeout(rspi->wait, rspi->dma_callbacked, HZ);
-	if (ret) {
+	if (ret > 0) {
 		dmaengine_synchronize(rspi->controller->dma_tx);
 		dmaengine_synchronize(rspi->controller->dma_rx);
 		ret = 0;
 	} else {
 		dmaengine_terminate_sync(rspi->controller->dma_tx);
 		dmaengine_terminate_sync(rspi->controller->dma_rx);
-		ret = -ETIMEDOUT;
+		ret = ret ?: -ETIMEDOUT;
 	}
 
 	enable_irq(rspi->irq_rx);

---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-rspi-f0a56c6e5eca

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


