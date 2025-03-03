Return-Path: <linux-renesas-soc+bounces-13934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5CA4CBA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 20:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47A4616AB35
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 19:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B985C22CBFA;
	Mon,  3 Mar 2025 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ad5mzEHl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA3E214A64;
	Mon,  3 Mar 2025 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741028931; cv=none; b=qYO3Gc/8bmvXXD0Mnv/X+XOwvb0UeOnBfCYFHEySwPFxNS9BZlQ0lr+2eTT/ziTrIkzk/Ys6HxRI3mFHbCCffCKeYRTpS/Uoj0jjd1fva8UeqOL24AzOq8/Uzu8xelNEtywVnCoy+e4uKxAwJbkA3Q/CWCOuYzWFqx7xnCxHj24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741028931; c=relaxed/simple;
	bh=Yje3DuWMISvZSa3Mbxv9NiyZ3ok+2hfDkATqnad69wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=daj/bgdtCMU8JcfRNoVZuKuYCw2byI0FOTMDdDgm2af7/8hp4g0BnrH3EH+M+DV1WlziCNor57SyYNV5U1OX8L2b2b57aaRuF6H5hgmABf2XRz5mdMOxEz2JYHKqQTNPvoM73KMoc9jXKiKcxE6n+FCMTsURA+D1wk97ZtfrYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ad5mzEHl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso8833395e9.1;
        Mon, 03 Mar 2025 11:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741028928; x=1741633728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cF/23zUstDppzkURu8wJfdQbb4zZ6KV4RiUE3G1K/pk=;
        b=Ad5mzEHlYCwkE3bkEFQy8+MPtKaU2N549pSZfqMQpVToPKnOlIRLDH2mZH7BGCavSU
         bqlYIVHPAZvIllnCZb1kSx/aNRxl3djy/2sWKJaymJuSSlzut6xrgOrFZPp9lE8yFl0L
         X2QY2jSwzcPAxzFaedH0TrGmnFCVO/j6aB8gky147D4XWtRuCyBhJgkhdOIhKzmhUrgi
         fjfj1B+BvLTlNUlZGS020jXpxeD0cKhpKZyMtFkjE54wM+GylN7T3zNKVSbc1MFCl7+h
         dUs729VgxmIfUPZcyctx4zS/VZPaKU2bI1yQO0WtJ6YAcC7SEipXSc8tFSiON3foPwFb
         PFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028928; x=1741633728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cF/23zUstDppzkURu8wJfdQbb4zZ6KV4RiUE3G1K/pk=;
        b=TxZbeHalht5TW/7F3+zRtnACklrNImEwjwDv060KOtR0FD3NhqW5pmamUUE4amNzo1
         b2qpyO+M57dZmPs20SHuMd5Cjzcql1xOgkORpIYSWKCmHVQxnuzfoTNFsgL4ygqdHjTn
         tzZprj3DGUbwexHYo20He+LrqGYJn8WeJ2a20qybOpfX4sLKdII+tWnhVxlq6DWqraRV
         E4s4wpeyCv/4pNsXTRFCMF7NSapM4MfVonP+a0ondrt1pU9aDhjk0nVsKb9ZVwyB3t4T
         fO4ZtrxCi6HqNuSk7hS6FwxSnFFXm89JtgzHZ9veaxkJ3lxu89zaPLcfQnbo5bSdk87K
         xL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAy5lqEYHpMmrpXLBlWy/zgYBLDu5sIYZoeD8a/3+TAKBLip3DxqY0+N+3cA1+JbAnhriAphuMfBii7gDniwVvDQ==@vger.kernel.org, AJvYcCWQ5a1wv4ZV1SVGeMDRS6hr1qCs/m3gKCdanJwx4WE5gBVpN5XvnaMhd1nMAzWnut7cO1j1VEgY@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPDcUVqmw3PCG0LUYOrydTsBhMz7fJco9Zj3P1E66gifhbrQS
	73USvXWM7x80/fXFxjeoatp98DVut/fXGxePamcWWIkd13SJrbKV2Qrd0O8Y
X-Gm-Gg: ASbGncuPyRUEn+7R+818UCmUyo83qxjcswhHB/NQM1WXg/DBni7hytetrSSUNgDdllF
	hb9wTmAjEoCfxUNuE5qnXONwLxUI6YOwIJL3IRsNBzfvrIiaTVk/HUvokbuygRrEWzCpQxJ4Nsj
	Uo7I/56kn8LaNsDx9jVGQrCJU00nxKnLkNqtpPru+N6TUhcssBZm6k/xeKUdsG48UGafmiDQbWO
	ApaOiv1PJNs+LHAMUSNOZAU7c46b02ITlGWg+qEFXMqio5m3qnbyHoPPbA0nYFWxifjnsUBK0Hg
	1W84qA0wiOlAaKbJKnmNBG7f4JFFxUwXl3BYM6Ilsv0MIo5b5X3gMM6IORbMuD9vQlsqTvMX
X-Google-Smtp-Source: AGHT+IEWVs4i0tbonkHc8HHsQJeB84ekhLGbjKn2nYHkiAn5v4AKZwYjR6d1OGmPPVC7xCrrPo0OcA==
X-Received: by 2002:a05:600c:3ca8:b0:439:84d3:f7ee with SMTP id 5b1f17b1804b1-43ba675d56fmr98691015e9.24.1741028927840;
        Mon, 03 Mar 2025 11:08:47 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:5c8:2ec7:65d8:a3a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc18452c3sm47420455e9.25.2025.03.03.11.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:08:46 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] reset: rzg2l-usbphy-ctrl: Correct reset status check
Date: Mon,  3 Mar 2025 19:08:41 +0000
Message-ID: <20250303190841.179890-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ensure the reset status check explicitly evaluates whether all bits in
`port_mask` are set. Replace the double negation (`!!`) with an equality
check to prevent incorrect interpretation of partial bit matches as an
asserted reset.

Fixes: bee08559701f ("reset: renesas: Add RZ/G2L usbphy control driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8a7f167e405e..6451f621e862 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -88,7 +88,7 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 	port_mask = id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
 
-	return !!(readl(priv->base + RESET) & port_mask);
+	return (readl(priv->base + RESET) & port_mask) == port_mask;
 }
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
-- 
2.43.0


