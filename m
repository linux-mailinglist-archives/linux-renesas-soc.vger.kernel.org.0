Return-Path: <linux-renesas-soc+bounces-23912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A750EC21954
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58DF11AA096B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A87336CDFD;
	Thu, 30 Oct 2025 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrMMf0Xg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC161548C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846935; cv=none; b=GZYe2yGRhSPmM2FLJcYbz077vOur78GnohE+wao4l+gqjcNHQiI4xyiM/4UJ4qfpSPrKTHW4xw4M5VOfh9K0KzqvW/iBk6cBVvFDp8ZZqIqDC0psLC6oVNib4piJxnPugiFMBQy/cu6hU4G5WqP+/1DecxeV7t6002VCf+s1ZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846935; c=relaxed/simple;
	bh=6rJaHYLudOTTm3QmqB48Nxc1YcoHdZeo58CPf1gncKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWaFTfVnzKPhFm8C/7Ly0m1heS4KTP6+XOhuIs9XamyRD5eeu10pQsXz/4BN0l8dnKZfKRt+L7a/qtH4MSWjwHMPwebt8IZVevAT68eppr+y/WPf5Q3MlWcviO6/AvrpTizI/Q75jnYZjkBvRH50L7GJ1pGWLH28eu5lABVdnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrMMf0Xg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso9479625e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846930; x=1762451730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5RyjODeDGquD2fp8h4Ys0a9AjmkuXgJEKfRWxOkPhw=;
        b=PrMMf0XgSq1B0JXI4C70oCTj2Maqfp1aTPQyE4PfRxWdqt4RZSlYefFUdv8axPHcp1
         STUeFTfHz9GPVUjrC/5SHapO9lE02LoIsSbcamqAERyWb6Jta/HSzxqwpFbIqkspa301
         Qs4NdYB/PALTNM4Fylw/ORaandhlO9QN+9KGjy2+7mqGPwulG5FfCBpBBvKlYA8YQY+O
         tj8yisso6DiZySXDG82ICckzbG2Ne/lFWHThEG6ebrTQxIS9TpfKil/+Zt0UI1g4bU86
         VHO81rtR3k6k5Qd0LPeEmYjFktQwxT9EgtM+6Vsbm30b4TOlWyUdbL61BbaqB7aNNEiN
         0qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846930; x=1762451730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5RyjODeDGquD2fp8h4Ys0a9AjmkuXgJEKfRWxOkPhw=;
        b=SwGAavL0VIfDGO4RRDrl6okxja33zhO9ONsfvotoJVhjkv0N3s2Pr/MH5JLM8XadUx
         JHFfMrLWZuw8t1alxBUBUl5Da2nm8kdJo2ifaPer4qDpk0RFJujai9q5IUZB0RX0Xjax
         r7W8+GZH7bDm7Tt8R17BxK/w9YrqLLDHlWkBh7i3VCGFBzKp1Ng5supWKpmaxVLxbENM
         kzyYy47wSLVz+AgKu/lEOGuU/NxTM/x5qZsQCyET44//TRTkGuU3p2/I2jGPp0UN/ZRr
         8tcr/6u9m3IDMnfThToucr77G/6Io1MDcmN78+TiF8ZgeR/Ln79sUxIKzIZiSYVxVx40
         fuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS6gfG3PbQSKVybZ17PsF42lvFeU8JP9Dl6Ldc6cursXseM/cWB3priADiVbxDR4d3O1EcmxB/2hXJzDrzCw91CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAKg2M95JbcXA6zccscP01PtaOE/tALMxSf5PywwYkniag5KhM
	XuYu2IQgYcg5Hjsa9z7pZ7Jlw3fTdHGF2i3Miqw5JFbSetT/qolyt9TD
X-Gm-Gg: ASbGncvv1jph2rq3LPajNFzfUZQYoBGNSI0fMU38zidvVOLgVV4t9HS5cOslR2xGEb9
	nxGtwv/jdOsP7M6sxQB9CZQe2X6fZxp3oD/4axNX54vcEupg8YN/7hfwm5vXJ+Mxq25wgRIceek
	vIE6Pe259yHHQ0QrL1Ny0QjDP/4gvJ1Jzw9GUpUSx7Ffww4pViPQU5Qx5RcJRYphPOW45icPuW8
	5Xuz6ydvY8QATWU4QzdBLTZPhhsS9Iaz7zGbhNSJo3UdeR/uefXLiRvxcabE7l1Y6xd3LsLuZ+5
	DcNxBKRk7gsKZPsrzqwVEViqgHdYUfhZs7a+cyPLL1hK5hbPpnsHni+ouydYAtGx/O27J2bD8mz
	nJ/l7rD+ZWmlaUWp+/G0KMV+7PXj67PkiCkeqjqs+Le8JE/UnitytNSa7SHi7Qgv5WsvFNp6222
	c0D5+zkLB/Kay8ZyJuKjRTYWhF6EBfC20BEH84c9oofI/aoaY9BRRIFwGGNdugptqd/s9HECo=
X-Google-Smtp-Source: AGHT+IFBi0hqrqgDBukpX7UuHHLxHjT0GA2iPHi9vZvzYJkR6850zvm4U+rMbHpm3ZqwPaCKtK5CeA==
X-Received: by 2002:a05:600c:64c5:b0:46d:996b:828c with SMTP id 5b1f17b1804b1-477307c1fd3mr5174305e9.10.1761846930304;
        Thu, 30 Oct 2025 10:55:30 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:30 -0700 (PDT)
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
Date: Thu, 30 Oct 2025 17:55:07 +0000
Message-ID: <20251030175526.607006-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
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


