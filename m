Return-Path: <linux-renesas-soc+bounces-23926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EDBC219C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79887422350
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C0E37573A;
	Thu, 30 Oct 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN+tFXfU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313C374AC6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847099; cv=none; b=XwL0YH5XBimio4snqYpaJNddh0qiQ7eA1JI+o8DPwE1yz0mWtIohjYHh1y1oEyQGNtyyh4Er5y3+sBwxgPOuya4iDws4oca7BfxA2qn23+swWQWyJFRe5/gamwAA4wzkOhjfmcRvbCfq/l8KWGsbdvUM9N91gQBCvZ1e9BCJKE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847099; c=relaxed/simple;
	bh=6rJaHYLudOTTm3QmqB48Nxc1YcoHdZeo58CPf1gncKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNYQjVWz6FET74fqGKQDc4lupfNYjbjqGNqRKASUzr+dwD4Bhy1szuFV4wMxFAywA6LSrkxzME22Thq6zQSihGDSqbQIlcBe+CeKoteyUZpEiMeGTFZ5Rt7mv1U5+3eoN5AUVRdbYkvpCBivOV8f4iuQ1/+6VY17vKgfcK5ZFYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN+tFXfU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4710022571cso15783865e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847096; x=1762451896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5RyjODeDGquD2fp8h4Ys0a9AjmkuXgJEKfRWxOkPhw=;
        b=gN+tFXfUhYd7AN3Egbhc+T7/pjjMN64BsyJlhBek2r3vzGltI3kPlI/rTbHDhObt/v
         KDuecshf8fz1/LKL+bgt6zTWG5uYBx98KpeqkELuXlTesVM8gspjIp8iuR4yzPH3BOhM
         Q7afw2djT/6wdIrjocj4Z0+aWgSpvOKEa6U/7oxh4957jYlIPv8JbOmV/AKNdC2BUxcE
         Uuk9TWfGk0msU8pD3UiTi54FxLCDgbIIPj9IvBuFUJioXNebhjbJ6y+/XMKLl96gyZe2
         y1NGgvNSCGB7rX09KdcbStfOVHdjViDBfcEqPggOCuTSn++ROLMrRusk6cyPkInqQhZU
         TuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847096; x=1762451896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5RyjODeDGquD2fp8h4Ys0a9AjmkuXgJEKfRWxOkPhw=;
        b=kFU5YcJIyzJ2Zi//2KAVSYq0bNd+U+xQsW6pb13PlakiYNEc+fnN97Bw/1QxYcimpx
         iJxF2ErQglE1fXIcKULkohWaACVQicTZgOlgfcfFPr9cZRLekUrCD16piHKw3mVRkeKQ
         ChhNcZ88fvq9EPg8soCD/s29uC8qf7K/aquj6tYPmnviB119V5IDS3tKjwR/49pA41IM
         9018bZQi3rRXjYS6g3F3hR249HdPBq+yZtbVr5J2r1D8+mNuB1wQ7Wqq3SgnzetlU9d8
         jZdUFn8OPfRMtVCh/IglL3TnIWfJuaEsw0xQXUXEdguWhaU8xKasnPmD/1mDEofqj6Uu
         1kMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK/Mt59i4uio0J8La9Lfb1k5CgwCj0B0DFeWv2va19pcIk8DLP1ABwBMbwiHcWv1jk79SGjVNGxziBh0q3hi995Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFsdfNoHJK4lEShuom35pr+liO9oyGCLdvdcwHWHcy0SFMBvWI
	QGGrKz1Bl46CJA5QKV0Kx/V+3BmerLnvcuCfRMKiup4CHJZ4/RukpXuQ
X-Gm-Gg: ASbGnctq6rISbO8ivAiRs7HznG/Utopp4HwtfS+NJghWYEV8bD0+if82iP/MSfCYFZP
	wRK4Tf3KqC5F9i2cy7MzrY7duYX/HEaGOaMAWd0INUVggpRHcIwjy9/M2XJGibwNifv+feyADQh
	+xHZE54mONi88xevSuL1sbf4IIaPIbXDA6RMRukIL/jaRNCKsTjSw3IveojbElC9bUmW5HeVJk3
	YfKGzZg8vOvmNpojwTv1D48VXLGBEtw7deV1NqApBGkGptFHBp+IYW9yOu+pxdoJM7lG3rzCSSs
	ebAzBXZ8bA2fvK/E+BEFBUSjDr8cwcmKI4vg3lA9JyMuzGeTSXfN0co7rJs2pU5xRM+BysNewks
	/nJsbEKeyXmFNuFIbYFTUk6WQbE/TCfpvXd+d3PD7Gb9wtEJTUQ+e7jKpV8O4rtBad0E17VJYsy
	QkYHaUND98CAYftCGQx/VAnfR/YjC5wZHcva1bo7qktOOYC79Vz7pP8BajotwoEOhfs3SBOWE=
X-Google-Smtp-Source: AGHT+IESJKAO8ONCerKPM8W5gyvkInHRoiE3CjlNsdnbfCKBMGmr+c3jFDp/+N+TA8ao+fo305pRQQ==
X-Received: by 2002:a05:6000:2f88:b0:426:d51c:4d71 with SMTP id ffacd0b85a97d-429bd675f4fmr449957f8f.8.1761847095655;
        Thu, 30 Oct 2025 10:58:15 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:15 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
Date: Thu, 30 Oct 2025 17:57:51 +0000
Message-ID: <20251030175811.607137-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Shorten the number lines in sci_init_clocks() by fitting the error
messages within an 100-character length limit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit message 80-character->100-character.
 * Increased line limit for error messages to 100-column limit.
---
 drivers/tty/serial/sh-sci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b33894d0273b..e9345f898224 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3008,11 +3008,8 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			return PTR_ERR(clk);
 
 		if (!clk && sci_port->type == SCI_PORT_RSCI &&
-		    (i == SCI_FCK || i == SCI_BRG_INT)) {
-			return dev_err_probe(dev, -ENODEV,
-					     "failed to get %s\n",
-					     name);
-		}
+		    (i == SCI_FCK || i == SCI_BRG_INT))
+			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
 
 		if (!clk && i == SCI_FCK) {
 			/*
@@ -3022,16 +3019,14 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			 */
 			clk = devm_clk_get(dev, "peripheral_clk");
 			if (IS_ERR(clk))
-				return dev_err_probe(dev, PTR_ERR(clk),
-						     "failed to get %s\n",
+				return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s\n",
 						     name);
 		}
 
 		if (!clk)
 			dev_dbg(dev, "failed to get %s\n", name);
 		else
-			dev_dbg(dev, "clk %s is %pC rate %lu\n", name,
-				clk, clk_get_rate(clk));
+			dev_dbg(dev, "clk %s is %pC rate %lu\n", name, clk, clk_get_rate(clk));
 		sci_port->clks[i] = clk;
 	}
 	return 0;
-- 
2.43.0


