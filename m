Return-Path: <linux-renesas-soc+bounces-32066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN5mMGzV+Wk1EgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 13:33:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D44CCB3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 13:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C50B23064135
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 11:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572BD401A1A;
	Tue,  5 May 2026 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFJy1OYG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952B388371
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980256; cv=none; b=Hfiy20liIn8WCkr0JWf+4TEALJvaDCRVAxV1V7ZlnXl30jLjBZb+hOWPwtcPL532syeuwVgEiYoHASQgVkzy0yZjVhJ7R8Fq2jNjtueTTxM1F+vF1OlsSLOO31LkiRHMx/SWMnVG+/fd6o2uVvcxGKqxxiSVGc8tZ336cYsR0Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980256; c=relaxed/simple;
	bh=91K842evcD16Ucl1KjEyczWmeAeIibln7xC0ChPpD3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFdYVldWtVKKAH+7Y5OFMp+E6MWgXUcnKz4l5qKSTDlzYaHWzJZVblHmiiWNA3BsFdtWKsC+6j+xritbFf4+UdXaEaiS19rJjaAL0GKB2LYUXa1vzSWi8JWUDftHrEbM64OOXirg3FuBToRbm7I0o9OIC/rgI45nIVzJ2gp2FwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFJy1OYG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so74736115e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980253; x=1778585053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBWradkhizwSf4yE2yoAp/RFCrxwteOMoA1zZzyzf0s=;
        b=lFJy1OYGnzCMYuhTUdRZgzOUoKNaYYhav0G2OQk637GOefYk6F+iI5c8Nu2rP/tiOJ
         tLNapp2XBmq1r/uy1oYiV7fS6bEZsBiOF9fhmqeddGPl6Omw4xUL2xWhNytOA+6ZUrCy
         SsNKrFyEuStMqJsfoJuHZJ1m9Nz+c6XJqEAIvQ29mV84ByncPUZlX/zIBMjggj/pNggD
         g7CNf0odFYFbCDe9MAC/4YoEuKTEwl/lD4MJ9P5Ha93o+KbRulSef3qjaThYMl1yg9BX
         IEW/cCXnJRoAuU9GVMhiyPCMcxEZva1HwhwRXlkPIBfOlt1Dz61GCc0wTsH0sQ7c/8HV
         yfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980253; x=1778585053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBWradkhizwSf4yE2yoAp/RFCrxwteOMoA1zZzyzf0s=;
        b=ddO3/8aRCd1mrNbpDU4uIp820crG+wjynKhNV29G9MNFxl38Nb4jWuA6oLkuOkpK7a
         hV435CIyoCIF5RCzAp+7Keb9+wcHPjk2FrFuUPDBlfvCM3OvP51jC/y1gEdk3T4pwDgD
         Gpe3w0wLNGo5F0+uRihuc2QNg4I6gCvNP8NLeCBs4+tnGj/nZK0QNsPMharEbzohrltK
         c7PVx9KE7lQFHwcY3kfqze1u/5ai9ydLmxsHzY1gN3urfZyblbjkY0QL6te/smfBTtKD
         oLvliPSEYpfeqqhTm9QRf8Bxfh33Uw93MmqriGeP6wtN/0Zu3nVvWgtjqgCKpi3LVPSR
         Qt8Q==
X-Forwarded-Encrypted: i=1; AFNElJ80DE1gLw/C5fB7Nr/g501QiEa6fbYkUDgfOMl1hGFCPbMTreBtjw46va306GT8+bJEhp+G6JSSXDjiWBxlHPGolw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KHslvO+i2msXQ96bzZytLc94T6T17heAHsNdMLFHFMfz0qIL
	+JdQIr5MVulqfZfWnq7wSGuZOPIdFL2IAU3k+fgJjhwLR111+1j8IJWc
X-Gm-Gg: AeBDievCskLaDrSLJqjC7YP3HzOLLVa2JfvRBpU4uEkM01hgNafeS7/j3dFvRWJs4Tz
	msFAKt1detSe95CTitbXcPboWKGH7c3AThMofUMk6tuTsPUYevdiMEw5LOHxeER4tUUQfLmy6de
	nTFYr5ry4xGydySfm/NAHSmGFdEMs0jUlrWhvEdXq+/IFoGj9a2rZAMcdFvtgKvfZkFzrhO6Lh/
	QVjd9V/9/RQSymS/g08PNkUmXCuqTN5h6zZsMCxJPKvNPae5eM7L28bl2QWHgKJd4IKOcoKWZwb
	VVREmpozJqtFqU05STgmmlAQEnp43MRrHPTRkg5S3Db74Q0HNyW6SmR0ft/ISF6Ps9W4N6SiSzA
	UTTXw75lfVumd9sa9QQyiYC4y8pMrVE1ZsWzQUc97EYq6xGo5PuVpQGD7ovgrLxbh4tznsF4NZa
	S05B0qcQILUmEzRDFM2tsAP7wpVo7OIsZfb7UsZld7Oq9BygFNS5mZ1166mLfbgSafyzK5qFrfx
	nLEiB/Morp78zTGHXgbvM9EM0kjcLsTxjbRnPraUfr3b3Kxc8li/aDdvg==
X-Received: by 2002:a05:600c:4f82:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48d18ce240cmr39137725e9.20.1777980252724;
        Tue, 05 May 2026 04:24:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm339946455e9.11.2026.05.05.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:24:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
Date: Tue,  5 May 2026 12:24:05 +0100
Message-ID: <20260505112405.667796-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C3D44CCB3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32066-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,sang-engineering.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On platforms with multiple xSPI instances, the driver fails to probe
additional instances due to duplicate sysfs entries:

  [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/devices/rpc-if-spi'

This occurs because platform_device_alloc() uses pdev->id for the device
ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
all instances to attempt registration with the same name.

Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
unique IDs to each device instance, allowing multiple xSPI controllers to
coexist without naming conflicts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No change

v1->v2:
- Add RB tag from Wolfram.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0fb568456164..3755956ae906 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1034,7 +1034,7 @@ static int rpcif_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
 				     "cannot get enabled spi clk\n");
 
-	vdev = platform_device_alloc(name, pdev->id);
+	vdev = platform_device_alloc(name, PLATFORM_DEVID_AUTO);
 	if (!vdev)
 		return -ENOMEM;
 	vdev->dev.parent = dev;
-- 
2.54.0


