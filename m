Return-Path: <linux-renesas-soc+bounces-23925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C3C219BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05AE3421FDA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B89C37572A;
	Thu, 30 Oct 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArECC7TG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D6036CA83
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847099; cv=none; b=GTaAFUQvbFFSowvmmVROj74HvHLGmkEJkSIIGxa16jDFjUN8bnv3JhuQ9Pl3w7jS8gQmADXqRpTNFLjWl+w/Wlh0FgT9JFtkr1uLrHC2uHQa7uCBel4G85wW1Yt1BbJVG9d5Va1sxkwEvYBSTFQI1eyCL8TZBZGLck8zQi15HRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847099; c=relaxed/simple;
	bh=CGCGb9V5eBipiJiyKGzWDh8EBRU+yWeR3nCYNAfd3C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9a603/9gNr1ebnHgE4Td2K03xCvUMzhODf5AL3UjnHvsBvDXEO8DpB7iBGIrmN0Z+H5Oq1bAQPdGkbyOTT4BKdjM+BWDW+QLcn50nUOzjWZyGzROXkxl1XlCI63XQ8Ux4GYYtRnY2m7nCH0wFfr5WWiSVCFtwsODOzXlXMsHhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArECC7TG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429b7ba208eso681954f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847095; x=1762451895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yttjZeqTXK9cHrnm5+lJ6shcRMBRq57/tMzXtPds7Io=;
        b=ArECC7TGGBErcGy2ngQS1TzpbESTXq2fI3lVCiD5EH0M9EB/iN+S9fqe1F0SDTvx+w
         JRDDibRt/I7TRNIG3jtHBBmgSMiBK1mC/xhSJhxy2LlVku908NFTbL0LYwp6wPTMe4NV
         xu4F9pLpC8XQmBG1yAtYQUow9hb12asJEJv7gWWpy+/pS5kwLPQACE2IsHeApihQDl5Q
         dB+JB7bA1zwxJr0j413pCoNUuAClLBR+TyDbYxitg1DPIFZ1IkrSLoQmCRWXgXmt+0wj
         k6o+3onn/EQvL4TBGCEo7mvV604KjI/OFQBx9H6nQ8N/VBKS/eKHUk3GCmRJD5DCEL3D
         hOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847095; x=1762451895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yttjZeqTXK9cHrnm5+lJ6shcRMBRq57/tMzXtPds7Io=;
        b=MQpIpBJQ3WMqLeZ7KBQWvJRaerQbg3+iRq8oAJZ2g/YeFFiLm8HFJdws1b3lxIUmj9
         QqL5k4pvLiKs1W8azq2CGX+hLtN2+YiNSlM6O8Eqzvab4ABSQA000xkzOJVqazbhkg/2
         wyc16SlozP/yhSr3l1cIY5ZNoXVGOL0cyNPll5W4dVqVf+hm6zBn37Ah38Sh9dfu5La7
         nrDnYukdSYQSA5KmAl9sFad52eq7mHziJfGkFvHxmwhIXa19+wMif5SgkJVk98N2QebK
         Xmjm8xiZrS1WKIBRFMwTgj7buF5DwNFE/RMKHNv/ozwov12uVzZBB27iU1iaVpsm18cc
         EMBw==
X-Forwarded-Encrypted: i=1; AJvYcCUNjEue8gg5oN5n0tIHbzpI8UiG85no64oQIHk3bpPOFNJXWeZVvG2LvC4Q3jYcJhYLjtjB/1MHrD302CGQnD6DTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvuDyurwm2nnmmmn9W2+BTsD7mYLxO1fKtikIxxNqDL7r9994
	vom22Snffta68k+1vaArfiJ6y8d0KGen6e2/JvIx1diqGoT1fJqqJ8Dr
X-Gm-Gg: ASbGnctNhRgt8UAKH1l+2ID/7LhkWQByKvHNbYGaFZwjubJuz5xbYQkkwqUSNtjpIwY
	Wp6Z63g5vKrHiU+U/J3Moel223rfq2GWv+lsYQEZTeSl9kUUePSGo7CexQpNDiHBohfDtH/xyCx
	OfSzrIlT3AKP7MkIsqBTHcOEVHsHoWB8QNRR1TVdJ9z+Imk8blKuUpXf+pIMojPNssDgqutZsLQ
	kzO5IMZBJD2uz2V/x5jZ59VulCQv/IOApTsZTuwuj355u+Di5QE2xrDSQ2q0nBJ08qLLFVCutjz
	nOykV/pGUh02uUNzfxxJcnrK5TIxgUrx6dEmTHPxJ2BOGLt5R+7p4rupHJzvqiDpb4oAOksX0m5
	7lg76TDvSo5uPpEmq55SJimYM+pcYCfMSqupSj7I+11tEFBkLLYe950rq2Glb3um/hNwQyHHaSM
	gMTu+zCVSn4VampmImFyOkBw4Wm+2DSfR1YMo8CiqNhCSyP1AYYRlQ8AbnudUe
X-Google-Smtp-Source: AGHT+IF+7U/wNQ0NpxIF99gi4U8nhseKBZ5Da8Q6VFYrm3gmjFcz96pkmQpTdIaTfQVb/63+drU5Mg==
X-Received: by 2002:a05:6000:1863:b0:427:4b0:b3e5 with SMTP id ffacd0b85a97d-429bd6ada25mr459355f8f.47.1761847095143;
        Thu, 30 Oct 2025 10:58:15 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:14 -0700 (PDT)
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
Subject: [PATCH v2 02/13] serial: rsci: Drop rsci_clear_CFC()
Date: Thu, 30 Oct 2025 17:57:50 +0000
Message-ID: <20251030175811.607137-3-biju.das.jz@bp.renesas.com>
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

Drop rsci_clear_CFC() by reusing rsci_clear_SCxSR() as the contents of
both functions are the same.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 3e1f4b3c4e59..504361ed5ecc 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -199,11 +199,6 @@ static unsigned int rsci_get_mctrl(struct uart_port *port)
 	return 0;
 }
 
-static void rsci_clear_CFC(struct uart_port *port, unsigned int mask)
-{
-	rsci_serial_out(port, CFCLR, mask);
-}
-
 static void rsci_start_tx(struct uart_port *port)
 {
 	struct sci_port *sp = to_sci_port(port);
@@ -275,7 +270,7 @@ static void rsci_transmit_chars(struct uart_port *port)
 			break;
 		}
 
-		rsci_clear_CFC(port, CFCLR_TDREC);
+		rsci_clear_SCxSR(port, CFCLR_TDREC);
 		rsci_serial_out(port, TDR, c);
 
 		port->icount.tx++;
-- 
2.43.0


