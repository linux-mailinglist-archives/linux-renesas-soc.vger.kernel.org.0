Return-Path: <linux-renesas-soc+bounces-14917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D3A73206
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 13:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34C4A189A95B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 12:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D02F2144AC;
	Thu, 27 Mar 2025 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpl4J4GR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0AB2139BF;
	Thu, 27 Mar 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077277; cv=none; b=YTjUp9P8g27hP0gsZojrVXXzjfCqiZDKE3SK8qlibMqUaAldPIboZCNT37ied4K1vGmA++UzTqs8OOyTdJ/j0Rr5z8lDc0eK27C1ax2roZMw15Mp0VSARS/Jyym0W1ioQFFaTqIyZwm0eR9AU/vA27Z0NWRXs/kCMVIQ0Jevils=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077277; c=relaxed/simple;
	bh=uFcK8dv9IyB3rN3FdjrXC8dWfKCZoPqNcLpHOmLsShY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtRwa88YGAaOYk8DBcRk8u30oEeDPYRHoKaCamevxjUatxa+Dldwm9FUZmSVH8kuiTlrJkxe7KnAsSAZqn9596/tAA6M/KhIseKJL+BeCv05gpQhozGaPUV7wEMBtLWfFfewyyaarLKejIw5p/L7fNwSTOvIbhqrWzAnNxNLqG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpl4J4GR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so4748065e9.1;
        Thu, 27 Mar 2025 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743077274; x=1743682074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5+GQeBMV0uICOq0DNfSTLGdGSLE4cTQbex6WH+9l68=;
        b=gpl4J4GR+3blXgFsW/zAMStUuH29jx6HYTSoZO0PvGheXd1nIppwdOFy6ZX9XAEexe
         lW/s4G4KUG8quD+SYqbgn8XKgVEPPmsWneJ+xKwV0IT2H7UA9ZsfRZaxk5fNFdIazwp9
         sUychCBsr4dHojOuLGNzXfwoIeVPfYFaLQhqvz5ox3Sn78x30nLcM3XXRRr9xQ9jF76d
         KKXw0yA0lGgJ7jsMNp7dt4rl/x20bfSW33M6FyxkwBCupv4f0a7HS5jsEQ3Nh5G095Sf
         N7Z0nupwmhOQaxTXxTinMiBVouQKLMkSAtP9c1kIUOfq7dnNF9kkPDSaVFYsLWQ7Q4bA
         pmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077274; x=1743682074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5+GQeBMV0uICOq0DNfSTLGdGSLE4cTQbex6WH+9l68=;
        b=T+JODTBep1qCg3a55lAaL4RvIBpu/5UVyOmEg6B/B4AnWSgR03MhLPUEJN0mDmwIVp
         vFbaHwrvao1hfUyFH71aXCz12uY3O7vkln60HaUnzSK6kyOyxB1P6sxutyDyKg7+rDC+
         E469PAgZYFfdmPC+ESA7v8N0mQfFBEPABlEvr+4aKCDz2lUo7Y3kjOWPqQVHPpOyaR4O
         XWryGfcdG7fk8d7dR1VZF2LgxEA0W24e53Zol2BN/DGNMeHHqdYR+Kl/4CoMei9AHU3g
         dtSSBHmBhnCUGsmJ2th0PwDE8O8nopHkiPfrYXI5W202O6WFvC53GM6H8CgvJ0iOc9gf
         cM3A==
X-Forwarded-Encrypted: i=1; AJvYcCWX7k5M1QXHi/EAzoQlm6tDhWM5+sszKZfUWO9oz/otAzSfTWPOt8ibkbMxslOWlYBQQi71o4kQx9+D@vger.kernel.org, AJvYcCXVh5+qWYE3MAiNdH0vGjw4jMVO92U0e01x9/1oa7Xzdj9X9YTPDm4omtMZQ+VCNkqGV1Hmqj4gENOZDWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoqi/VCvSQ0wBxW2gx+fnCBz400nr9+l4u4a+e8beJD9IY3XEP
	V+tYyRcgGrL4cJ7IBNRfBgjGxmbkibXKp7ElgJVz7Icei7nmmKHu
X-Gm-Gg: ASbGncsgQm98exX9GkyYBPa1JYZG0yIrvlsZs9lVm2UzScNfxT8SFBhUj7qK7twy9LE
	Waqg05MyUBGljiNlBgL/ivWF9AmYgEIDWmFERZDn+i9jwDEq/QcUbtyxOistPY+S+Wv7iBD36rY
	8BT2aNWByLC8cl2JJViRmPZbnOQnJxpqp+NzIB58gg30VA1Q9CjudQgBEg52jbLZQ2KsY3z/du9
	KrGol3pMDbnMWevGrWQ4QvwuBRaq3zZEemYfZugbHGIguG1sVf7XpIlQuvJgy7rFnRmCSYg4+4+
	ciAyEBphcO2fH/l0k2CBcPyPKvYFPH8vAGBerSf7mJSdTJ5wEOjPeZV/mbxOc0qagVYi2A==
X-Google-Smtp-Source: AGHT+IHfKZJgVj5HkeXpFFXBvdDqQjRZND4EHNn2pTEaT1nqh4Ud9rxlXhYgjVm1sXDxwSTdZwp8RA==
X-Received: by 2002:a5d:6d0c:0:b0:390:f55b:ba94 with SMTP id ffacd0b85a97d-39ad1746acbmr3092716f8f.13.1743077273722;
        Thu, 27 Mar 2025 05:07:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ac9bsm35109955e9.12.2025.03.27.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:07:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-usb@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] usb: renesas_usbhs: Fix typo in comment
Date: Thu, 27 Mar 2025 12:07:36 +0000
Message-ID: <20250327120737.230041-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a typo in the comment by correcting "deviece" to "device"
for clarity and readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 15ef246a1245..0678830dc7ce 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -710,7 +710,7 @@ static int usbhs_probe(struct platform_device *pdev)
 		goto probe_fail_clks;
 
 	/*
-	 * deviece reset here because
+	 * device reset here because
 	 * USB device might be used in boot loader.
 	 */
 	usbhs_sys_clock_ctrl(priv, 0);
-- 
2.49.0


