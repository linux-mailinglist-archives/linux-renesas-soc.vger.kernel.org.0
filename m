Return-Path: <linux-renesas-soc+bounces-15435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F16A7DB79
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC563189021E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 10:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036EC238D56;
	Mon,  7 Apr 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GE+10KQU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3137F2376F4;
	Mon,  7 Apr 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023012; cv=none; b=t96VODVm27UBJMzMl4Yj+M3zbDO/nGSUjkFHQ0fjX30SKEZKqye36JbIkApeW31impsQlrKbj9PG8GIOzN8+teo0EoO5MMDAEBZZHRlVu3JZcYFNjelnDv7CIERBF99AvtXuhqedzcOrGefYvdXuXItoR/79vO7E1/SFcjL9oFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023012; c=relaxed/simple;
	bh=JPr4IPusXu6E+MAPG2d2TogsW9Kq03h6kaAEvoKbtTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+GfwTe/cv4i8a/6gQgKEiQa3Ldhr/cgZ5vKFIrbmRRgWbS33lYF1yOGP3nizfOujR/PQZE62sNhzQ7s+OjTq67KX+u0dK6trZJCuyPk7/rgLQHAhwKshrJMNDocgKYeEd1SW2/13ZACQT3Jld7Q3lc5BZrIEtzSwQ3/0s929og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GE+10KQU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf848528aso34567935e9.2;
        Mon, 07 Apr 2025 03:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744023008; x=1744627808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgyJSudWfh+2N/OtRxBUgvnd0zEKKZ9y7XXQkkvhRX8=;
        b=GE+10KQU3+D4zb3IXdUTBzgKWTUmJ6mRMXQW68/GlaCuNb9aZUTYmI1eJN8rIMJQvE
         qlQIPZkLvcuPTDvKnoNyr9ytbspkszeEYADGgh88rMvxZmvJmTXTdzJu6DAjZj8GzOQM
         rypgNry5Ln31hSrt1ffXri9r2FOB4dNs+zuscTA03eRqWlc38kn8nCbEMcbGwhTXNA/h
         a79CIHS4lx3LcrmwYUsGqkcCjbktSq2Zwj45uS3whGdDhg5LQsuIKgPgWBH7HR1ZWNJI
         SOwn/JIRBlJ/ticBgrl1cKgV1ZNgksRJYop5uqsyavIn/K3Kbq0DIkd5R0VMute1PcLF
         oQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744023008; x=1744627808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgyJSudWfh+2N/OtRxBUgvnd0zEKKZ9y7XXQkkvhRX8=;
        b=RRTWQeuZOLJyREjH/wHqhs4gRNK3FcrnUmwUOjNvYSvu++bmzADJl3C5L7LUfB7EtE
         7nAU91Yf3rUZTHVN35hjS8QUgNFbbRv+i41sfyncSH0J4g6Q0cxL64esMFHF9wjHEoeH
         J1kexq78zw/dIaNPe17wKgZhk7oAoN6Oiitxdm0UVXHJ51Ar2+W0pEi8ENipiOwjOD43
         KPOWwUV9fuVzN9FW6LGU2RPI7rKRJHm1U0URg/DMtIXitEpYv3obDsNwo9GZuQ6tvEwG
         lHJpRhqVoxkaHQsT/macpQn0oSf4teOGRuBFjJO7+P4IzpVVRDYZwe8Jso05quoVSPYG
         ke8A==
X-Forwarded-Encrypted: i=1; AJvYcCU2q1Ef6ShGV7EVnzG1XKTVmfURext+Urm/7JpQLVxKRU4lmVKZlwWKiZU1Zpkds4tdo7Dv9syvaL17+lQ=@vger.kernel.org, AJvYcCVLHiSoa3RBpJ80glKbOR1Szw6Vat0M39MB6d6AGS1wDtnxrVw3CVf9j662faF/nlVPV/SbGpmgFLxjLS/Xf6AId+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgNb2n189n/NEdyhXFUyEdkKRuC+4P4g79znQethzjd+5Sxi7
	gmhFvGiYlB+3D0zGPkRJdQHOHtiGpxZy1fGiX13YByOrCLzP+U+/
X-Gm-Gg: ASbGnctIu+ssnzNxugi1ioQRSydUVHEczuuR3LwrbhZX0Ds/UTrD/xCyJcttlY0K/tZ
	8jOfWcCGB68CFCeTC3+CriHn1GB5B1dWq9b+KjhRWozYImfWRVTJ6zHIM8LjrREqp7II1BOir7r
	HbwvasOXND3s2jeIv7svLjh7tryjajWsel+IT/DRZYsiI4N5uqh159QjVUHO/xwkzhjCn8Ib/Uh
	AHo1kH3OkLrPM9axU6sQAAWvg8aGjavc2hcQnBowXAc8F2NtidutCV1SvVg4lvJlrNojUtUOQce
	qmWFuf7PEnVGq1lWN1vHsNuw71ov/9RQktZ5F4og0RPIlAZLBjkbU4t0k5+wYodK4h+hiw==
X-Google-Smtp-Source: AGHT+IFtRQyH/n4F+U3bXsWJ7B32IMwaMOKnWA5MjHmQnzLYzKFFsBT3Bt/ietEKEmSnfVwLGUJOWw==
X-Received: by 2002:a05:600c:5117:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-43ee076924bmr55522275e9.25.1744023008329;
        Mon, 07 Apr 2025 03:50:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm129975765e9.0.2025.04.07.03.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:50:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] usb: renesas_usbhs: Correct function references in comment
Date: Mon,  7 Apr 2025 11:50:00 +0100
Message-ID: <20250407105002.107181-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the comment to reference `usbhs_mod_probe()` instead of
`usbhs_mod_init()`, and replace `dev_set_drvdata()` with
`platform_set_drvdata()`, as these are the correct functions used
in this context.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 4b35ef216125..03d4d40c90b3 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -698,7 +698,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto probe_end_fifo_exit;
 
-	/* dev_set_drvdata should be called after usbhs_mod_init */
+	/* platform_set_drvdata() should be called after usbhs_mod_probe() */
 	platform_set_drvdata(pdev, priv);
 
 	ret = reset_control_deassert(priv->rsts);
-- 
2.49.0


