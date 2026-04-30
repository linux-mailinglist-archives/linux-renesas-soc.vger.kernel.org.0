Return-Path: <linux-renesas-soc+bounces-31788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEJ5KjIs82kByAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:17:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82E4A0A88
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6553F3026A99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38FE40149D;
	Thu, 30 Apr 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAsu2pLw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A1B3FF8A6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543787; cv=none; b=A9ym2WcnTBTp2ZGyjYsGis3d6oiG9O/5QM9SMxt4qbB8jqpAVQMblbic5fOEsu8evrfsM9lX48LZGmKCx3D+cuMCNmEqjn+i8yLnh0M48eqTkv8AsnvUVodL7WH9Deif93GFfQk4nHfutDTJAz9Oq40nXWvkC6PB78FSdTqLJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543787; c=relaxed/simple;
	bh=45NjOP9lbhIT48U21LYjyn3MRrMi+zN2K6qSPm0a5Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdcSZYTXBWT6e8OqJxD7p5D34Cn6ht0CIt3pHmInySkOTRT6dWnQAKVaUII6ls5tbEE/TWpODVFFrGiUKyKYZEGkTsYO+8WTKL/+BXRx6JrVGuWVQmYDUeAGYNmwvf4doJUCrmBW+O8T4OMN4sB/b/vvw3FlOoVOOgldbh0BU/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAsu2pLw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso9073965e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543784; x=1778148584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cpesm6KYDfDAostBorsWgOYDBeIMoVo6DFxuLE013MU=;
        b=PAsu2pLwUNcu17+6zj9tT5cwHkOldUVp5JRVk3VdA/8n1y5G5gnut9m5E8jcZcTxoy
         UjmYYhKqpojAMqeyQyPeMuwuWXbbOe8kfxSF6sj5rmbw9Lj33BjqYv7Y0KOT1Gr+n6ya
         Yu3O/KXpjpzkJcXvUt8NwSNUNKJ31VA33RpRTzOjUemqR7+m1QQh/M3iNc9FCmX8kwhb
         0qrAYrRc34gkXEXk61uQ1dfotmn2rD8zFqGL/KRHow2MCieNmbBti0HHTC1vaRHl58UY
         AFtm/+P2AzMo/YzmfGS6dp59gFRUS9SQac/k86fr8zfLHBqSFV7DWxgf21zyyD6k70MM
         yVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543784; x=1778148584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cpesm6KYDfDAostBorsWgOYDBeIMoVo6DFxuLE013MU=;
        b=kLA4adUv7E51OcE5Rh4xkAmC3LRaKpSoXqskkWITI50RDqogronL9fWHflx31U5Qj9
         0G1ISq8Q4EHeIJJZaEwqChkCFmVI7libpvE/vvldjKk8HNcfqpxudYoM8DcqVTAk1F06
         xXzqIwo4Gfy+Bj3nDXGaNz0yNO0qJdnAis9vgiCZgfq8T3aGpntsLAWeqCC1xrOXFuJ5
         uAB8lXu0SOElFqmoyzSZk5ET47lDF5Gw88zEDYpedhjs17hJ24CxIBhn6Nm2+9Ak+t6l
         e7tFOs4T/4aVS/fQwxck6+cqtnxcA1XKjjqF+q5mVkanAmzGaXbTtmywcBX9mvYF+G8G
         Zddg==
X-Forwarded-Encrypted: i=1; AFNElJ93w8icarPExIoOHoPTWxS4dBVBgc8iEZylhwBMjxlYCgDkYV7tQVEv5INIppH4ru0l3DcrsrkO0OziOU12quJHhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0mnuQ5ckx5ZicDbIPmgANfd/NzvBdA55MFoEN/1M9rMcZH83v
	4LhzcKyRHLP96KTJ/v4t/O7NC7ZKGpfVwa5zbzyA7++Nlv1EkDnScPy+
X-Gm-Gg: AeBDieu5yRx91wdS5rJ/T3/nTVzuUEEbDFtBvbWUpIFGDpuYbu+LZuUR8NW7IUiNxNz
	SG+ZhcOgiFCutM/bgTZXNVrcnA5qnxKOJboLKkWyXxYcD8+qttleB2kiwESepSYGI2Ek7x0O5pV
	EYXekUvJfX50mt9SinXg4WJpDEsvV0iF4odxoV+p0sFyNIccCcN3jTbR3LECTVXWG24uCR90Zo2
	YrFFNZenet0Po8zRNJgG2Qg9ipIao92oPC1p3Palj9MCUTOVlWIaVrEYy40S3oz4QvqWdvguTml
	e9aVdURuYWnO487SSQZm7a4CILiJE/Yx3N7ziZaseq6QZpZsCaoOSBPEaGgRco25fB9T2Y9X9v5
	Fkgwj07KKh4fLkhxsWD6cH4mYqh4Q5ZRGCWFG95Mjy2s/epD2J4ss0qbjY1SwwdrXh0X4xPjVTB
	VfubCo62o4hsd9qAaPJFuqdxAylo5URYI6EymG5H4fRtylNX6BCMJLz5BXQtWTlDr/BM+XRvx2h
	m+UFuEi2yUyNjsV/Yy9X1sYlwIHGf95GgZCpGg+HxF/e2xH5TpS90tCMQ==
X-Received: by 2002:a05:600c:c0db:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48a83f6b306mr27187235e9.12.1777543783833;
        Thu, 30 Apr 2026 03:09:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] media: renesas: vsp1: Make reset control optional to support platforms without a reset line
Date: Thu, 30 Apr 2026 11:09:29 +0100
Message-ID: <20260430100929.1088281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0A82E4A0A88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31788-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch the VSP1 driver to use devm_reset_control_get_optional_shared()
when requesting its reset control. Some newer Renesas SoCs integrating
VSP1 such as RZ/T2H do not provide a reset line for the VSP IP block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 627b5046fa80..605fac57bd93 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -947,7 +947,7 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
+	vsp1->rstc = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
 	if (IS_ERR(vsp1->rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
 				     "failed to get reset control\n");
-- 
2.54.0


