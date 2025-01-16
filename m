Return-Path: <linux-renesas-soc+bounces-12210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFCA14196
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 19:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4039167A7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 18:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D87222D4EC;
	Thu, 16 Jan 2025 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oXQAN/Hi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAFC22CBED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051786; cv=none; b=DSuuwlwRvrU2/EprYAZweAKGP/s6w3fg0erYBuBXqwoo0ZipIWzrdz/viXsS+hHK2AU3xYhh03ulYObGshSKwtJkly5/TrLG35ZzqEhNEmWHPGlBazv7bP33BDy2BjfFsIjZ5xHb23lT7EsLc3AEYp9h/An9Oo5+nN3VWxQTuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051786; c=relaxed/simple;
	bh=uqq3kMHadr9kGhubJ6WWGg0WLHId0kU6QtAtpj50k6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dzfw9YoD6hJmH/LD2wUgrxn9UUw2AFa8mKz7uVWYaAe9oSUVONks5LbYA6aUae9jkRwPxz+lJftgP9ejmUVyyRnwE/AW0W+VMoFR4O466Ri0tQM2ALIClODwyoVf8QV5uP+4qmH4er7GmSe9AgEBLYCY2zgpfAIjnswZHBQKE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oXQAN/Hi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1032042f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737051783; x=1737656583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgs3q9e5gTha9jyWfeK+tF0kxlh9ork4Uz9d4Avy4Eo=;
        b=oXQAN/HiP3T7T48S7pEaFc6swfLRNJupBmnpvXcEW8e6CGWfOCaIrx7X27oGt3Ji9L
         rfEHNs2s885ta972h4JR0FYnG5tQ/gtTNhul1WgPXx4xnPz/hWMDXlL3NUAZLVoxOUOb
         M0OPxz+0L6nALArwvEKeAe7ILRoRzcE1Du6PC4h/BGfmUbFyG4kuIAPCQMg5CEP4oQmi
         we7I1W35Zt2eP41G+NwHC0tY+yh8fyhyhR+EuPnac11pHsGxq9kaxnQzWMkQ9C8DP/CQ
         2T8+oHHVWOcCRZDtJTdQGzu76OIMO/zB/v1QrrNkbsQO2jFi5cdktx9zuABfaYVIH+BS
         UWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737051783; x=1737656583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgs3q9e5gTha9jyWfeK+tF0kxlh9ork4Uz9d4Avy4Eo=;
        b=VCkPQEn5llUy6DbpZJmXX3IUERdASCKHtIb66bIdlNdmYd4KbOZiu3WY1TV8EQNCbB
         NYZ8ELCB5sGYjtS9c382ypQNCflzyN5nCQMPqUQdkIbXZQObA+sD2Tt4HA4NwlWXxEpQ
         dNci/pbw7bVZWldFvRqHDMIGpD7dxP9C71UcxXhaVKQFkBBYPR8P877R9zHJBW+T2OWg
         86NL0SuRyNJpzIta8nAcFkjrh10X/mWFgwIZXNkn2gUCbbU6cZw8qQSzVERyYKItBtAb
         OjvdOLA34Q6ktuPEi7yf52lbOKYwjsePVHaKcD78EVmoGYMHSLkce54JBFOtiJb2EKEd
         mHqw==
X-Forwarded-Encrypted: i=1; AJvYcCUK+VjAjNhjVYM8R9iXtrsOLMTlNEiZ5CDU55usLkRu1YULM73bp+5kNvwxSfqiUk/ZpBdsoWpQkhgi5SJX8CjeOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/oU9j56LcoCagIFvx24lMmMGjXG+oYwDrLBRpUpAZqT7kWMq
	y0aZ2YaTDDe/mEvku5rFreWv+iaAOyEP3/CsXws2YHQnvVBM1J6iRpBL6iML+s++wRBy5WotAwR
	m
X-Gm-Gg: ASbGncuz18iK6cgdVE9ZCo19CP96X0XATnGWoLKr4E1UtZRqHpnGBp8hdYZwCUBwail
	sQD7i0HARnjlB+9XJnsM7Qpifau3saDlC5xPPzqe81sTGjPwfyCfOSN47SoniWkrdrg5s6KQCNa
	dEcnbp6wcxw0nTV8ixoE4apIG0gg5k6QxZczZEVdrvHxicvDq9wnCF3a8b4ShzdyfgtB7asjqMk
	d6IqEe3P6Fk8dmVjcMhkkwUVQJW9/vUWJpddNJqS/G8bbJiOmDKr1LlrwdSO2Fvgnvh5rT/GOeR
	IDvLjK821e4=
X-Google-Smtp-Source: AGHT+IFCaynXpEJsQvwRloE6R//x5qfnNbfyNt6NHSxk6VGriZcxNiyTgPIAAL7cLGpfePzKNuczyw==
X-Received: by 2002:a05:6000:1847:b0:386:3825:2c3b with SMTP id ffacd0b85a97d-38a87304672mr28732966f8f.18.1737051782923;
        Thu, 16 Jan 2025 10:23:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm495942f8f.48.2025.01.16.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:23:02 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] serial: sh-sci: Drop __initdata macro for port_cfg
Date: Thu, 16 Jan 2025 20:22:45 +0200
Message-ID: <20250116182249.3828577-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116182249.3828577-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250116182249.3828577-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The port_cfg object is used by serial_console_write(), which serves as
the write function for the earlycon device. Marking port_cfg as __initdata
causes it to be freed after kernel initialization, resulting in earlycon
becoming unavailable thereafter. Remove the __initdata macro from port_cfg
to resolve this issue.

Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support")
Cc: stable@vger.kernel.org
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since RFT:
- collected tags
- used proper fixes commit

 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e0c56c328d10..09e69cb7d798 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3562,7 +3562,7 @@ sh_early_platform_init_buffer("earlyprintk", &sci_driver,
 			   early_serial_buf, ARRAY_SIZE(early_serial_buf));
 #endif
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
-static struct plat_sci_port port_cfg __initdata;
+static struct plat_sci_port port_cfg;
 
 static int __init early_console_setup(struct earlycon_device *device,
 				      int type)
-- 
2.43.0


