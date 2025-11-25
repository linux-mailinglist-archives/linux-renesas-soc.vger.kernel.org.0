Return-Path: <linux-renesas-soc+bounces-25111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C75C85A73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9CFCC351A15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A99328278;
	Tue, 25 Nov 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVNejC6C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B7328606
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083205; cv=none; b=trM4nKvqoPe/KcZqiJBtIkowXUKFWXWJXca6ZWWBxlWzwocuaJWcc4DVGY9v/ZwNdSvFVSsCj6ssXdNGh/zIsTvmDRR9dvg1G7xeIJeMT2gHGxBmyMH0CXaHCppX8EGw294A/9yW8J78wLeimq0zzt5eyWWFiSK0MyO1wbTiEKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083205; c=relaxed/simple;
	bh=9U4oO5I2NrgNcG17dJctJ7d46CJVpoossK5zTcu6m/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WahMF/R/N1z1YLWFmPajOBMx8FzyUgusVYcMmlvM6Z3kS+/x9UT2M5XlNRxPdn0RMOesAP/FF9ANnKjd/UC0gldpRPGVxC01qVA1Cwd74eZImiDLzMAD/xCu/tg/tmBaa2S4e0pb9ViAHVbBPqr5iuDZtI82k5/SD/9fnqJVWcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVNejC6C; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so46560425e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083201; x=1764688001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9zh8AfG+HNjbK+VLsM1cI3csPWUGN2qVWpFhP1KUXY=;
        b=LVNejC6CK5x8w3WEjXAL2/nW/Soytrzv3km33PvKIV1QlJE4EGls66sjE7L/lULJUC
         xoO53Pa7qe4GP8CG0iikdmMNkKpez9wQx/vTaFBZBQNDPozNgcE64EiN4jTGSU2anOTe
         WTnKXgk4uGYHc+Yayfz0xaElCPuYlDx/bA3LixCxB2GQEtYE8IaZQN/SlQ0V3r0ksIKp
         YaXQnIs+YcqXdMozN2Sws5veLGB8B7JmY5qtQ6V0kdnUpAPjLx4/uV8ZgxrVt9HKWT87
         bRREy7lQ9IlD6F0xupWnu2OZnCYp8DrFAhgZngIB2xyXmQYpVCfQLwBr+ZSf7XIj3qtj
         9s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083201; x=1764688001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9zh8AfG+HNjbK+VLsM1cI3csPWUGN2qVWpFhP1KUXY=;
        b=ch3pa4wkwM70fMKFTTEFmcERmc4VairoaHLHTfWfpYalc4O8sy/oyT6AderQyyK/rv
         HXdKLEjAMd4ZpEt8a3xlf0KDjY6G6BhZ20VIUCOOom3eHlgZyaR2u/expQY8pNh8/rXd
         r720fxSVGW/wMIdgPU2a640zS4Eu3iB+bWH6VyWwES4a4CGROSmUOT0WGc3xW3xII6J2
         9pnvgWKg8oQ4R9X/J4dYDVqEFkM2c682sEU1kOp76pW2avvyruzuILkksilnEvmQY7Jd
         jTDdnVbwEUqeEq8A7du8hujVZ45CIIPyVK/pyra/qzl1/25LQTjjCgSklGlSc9bBO2Sf
         kPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTvoq+nJwUoHegx+YYGvOAnzfG+azfJS1ccu/BkmMYZ3ThJE0O3IF1tTxsx2utqOKQjMsaFcju5ZFJq9veYHd+yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBi9a490ex7tl1FG3uNBCKKGn7HL1wf5GIvFHAvO5QyEkoPLqh
	fskRSa8N2vMytSJwXQLm7xAgrbcXhFLTz4MEoywvUjUZpH4JsUHn9eF/
X-Gm-Gg: ASbGncuVC4p1WRNOUQStw7WHTHLF+IH+zJ9rQZDJpaJFbu/urs46eYuLY0hHWKyMIHZ
	RTbS2TttYsd4vBmzhelQDtzbM2+rTwEyHGxOj067zDjf4pgZoxrQ7Xjc/UrnBVo1fV1yDgmSOhv
	8Pt53IvJLaiWIwkdCgn1op1h8Lpl1yWr7tOtKke/sGDRTYZPt8B5LG00S9voeYkaXDwhY1qOuC1
	ozKfz/x+NUccCWkqWf1vU9zF2rsPevfVodiViTmqWUEnKaH/L5XbvW5qlwkCVyHhW5sBkwwqLUf
	6OA6kZSGB+32BTmyGldFEu8tE7vkXrlcPcU+G2U9L3CQEYMLdx0Ol8TNSAq42dxI6g9NX447UPf
	I0jfk8Sfk7mBxekZ104agMBP5xHVSiXkjRLBP7DOrVxGnCfcJxkUo/oi2o1bNgzul0wDIzwWrhw
	WwlWfOA3o449h9YT6IT5TbfAAALggW6UCvYUZlK7h/S2MlVpqoCX/SBfEO2YQy35No6zPcUjHI1
	8kopOz1noYG/8zn
X-Google-Smtp-Source: AGHT+IFvMZXRi0NodkmkvyAj0DhVJuKBmn1mTBhyFBKqA6ZbjFFQnNJMGYPDLgRUcU08fkxzO2pSsQ==
X-Received: by 2002:a05:600c:c83:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-47904aed270mr35278435e9.12.1764083201071;
        Tue, 25 Nov 2025 07:06:41 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:40 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 07/16] serial: sh-sci: Use devm_reset_control_array_get_exclusive()
Date: Tue, 25 Nov 2025 15:06:09 +0000
Message-ID: <20251125150632.299890-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4dc5b51f01da..8869c25eac95 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3715,7 +3715,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
 	if (IS_ERR(rstc))
 		return ERR_PTR(dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 					     "failed to get reset ctrl\n"));
-- 
2.43.0


