Return-Path: <linux-renesas-soc+bounces-23911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6AC2194B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B5CE1AA06E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E5436CA8B;
	Thu, 30 Oct 2025 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llu4AxCb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B577936CA7C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846935; cv=none; b=gvXH+QOnjfDAfrSz5F7n6ocPmKnPkY06uoNepRSOC1A5Fzc/sxoWdRaFnV166bTkZefQG7jQDFqIPpEtTC3AZhra1CkYSiUsP3pgQCM8u1Cq6phbov4K6526IQ/ahBR+2Z1pIgrL1hacCv/gqo8l8OEMG4Lnik/M1wjU2/nFbdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846935; c=relaxed/simple;
	bh=CGCGb9V5eBipiJiyKGzWDh8EBRU+yWeR3nCYNAfd3C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcXqhA1UGU/SOi0KkKLWmi7rSWs6SMzdG1CvwVC0pH0mVZTamPivdsSd1erOibXpEyWURSbZgV6qdO68Q6SBxy5mZUj0Yz24Lcunfz3Ew7RYbdHLMR7tL2G7IFUxHF6PL9SZllyFPEcawUqKbUk2OUCx/y3IriapL80P6WJ8nE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llu4AxCb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4270491e9easo1199848f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846930; x=1762451730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yttjZeqTXK9cHrnm5+lJ6shcRMBRq57/tMzXtPds7Io=;
        b=llu4AxCbYEFeFmperq2HYGcElsxZtbHyCqW0L5UMacOds+BzpLFfE4RaM9nkFnlafC
         Y5dbIK8ueAplhvdOH2i1GZ5vKwa25+YQiWMmKClCg85yeRVGmfXhe+leyIyi4dOucgEb
         tRsMsgdQYAgpb4MW2eZZq7TaKNG/YraYHkzJBOivurrCtyiunJlirRb3a0kJT0q+/unf
         c25eCHAyf391GeUKNcIUpt9NNUUeFJnaY2jn8oA+qDoGA5nsFZXzyazAFa3JNhFC+XgX
         VMEL2EL89IAl8NhQ3wRS1bpZn/RpTUQEe24TnsLSIKnoKOVJNowktykzuKcAJZmN4JTA
         mY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846930; x=1762451730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yttjZeqTXK9cHrnm5+lJ6shcRMBRq57/tMzXtPds7Io=;
        b=O8jpbKPG4h7ZTjxlfZkGZeZDAMFIdp0LNckwpVss8luXuWoxkwA2bQkGIzEJruxqD9
         a4wq9IMA2z3XMlQZTlHRlZD4Uf+6PLG8jF7KdOqIphQ+Tinnj1MzeLsrbZ49Tb9NS8vk
         0rTZO2CBRhc/50/2FTH1wUjFu6VCA2rv5QlevvUrt0olFO72A9B15zxkDrHE4nIoOPq7
         BoAnInyklXSzEwqTbaPuM2rnTBZ6JtO43gy+/bBadYvX2JhDVC+8V9Vwt9uDDmZ9bdGP
         CQeKeri5uwtswoyYiU0qV/dBEZ/WCuk9h7Fsw6G90v8+4GO9WlyZ2JEapHAW0poz6uJV
         K4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXYivnF8HsBWd2Idc2axAWV5L5Tj5/3eJNYAah9yKgG1M3osWmgt5btSPy3KDNhEhv+4NPx1nvwyQYUobozxbPOYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUpktDlXm5Bac6K7ezkDYU379Vg50SLdJ4HEvN/JIrYLVoQjs
	Ly2LNU5nNIs2c4XDWDtsXbiblbThF8fEMZe/2+zYd0ERvf53tL7qhhoT
X-Gm-Gg: ASbGncs1SYt4v0X66QgV3XU8eB+Dl1XxtNtrKlF1dYq/19GtIt+a9++g+RW0OKpuxLI
	YLGXKSa3sgEOrWCeqLB1trJzzzL/Cjw1FpO7z2+plDKcFDIhF6jr9bLi9wxlTr/BN0CjxxVP/nf
	pgUe2K4lH6S9mpKZRX+UKpcxO1zC81JiYwveljfEPU4PJYUfzh3IrkUxyoKr5sUlTW/iuk2LRVX
	4brXkoXKuoMmuF2XK5jo5pmtDmyiALukIMTSrg/DtBh08AuZFz8beXYhJbaweg1xO16k7C7UVFA
	6/RRK3OaVxZBWG5oBEHQopMVVVT9hce+8+w9aiM15rRSguhWiu1rtNt5hSuM8LM7/75cKS8QvQD
	J9OcNlF8jGu61Xv3tfrwJQ9OKeQ8Jpl/90csnFkP0vkXxSfBc0ZOFUiybaaG4Cyo4WXYTwPujD0
	7gC1qieqOZlLWvnP18WuujfFHDoTFrs7hlpEWUd6NPNVcBbbsYpJkdSnfRWZUNwZ/KBO2fZX8=
X-Google-Smtp-Source: AGHT+IGYIITVqCReHtNAX7+uLzQsVs5gAndiYBJ77Fh5G2SnarCvdls7gc0J2+Oyf01J33C9+PqrNg==
X-Received: by 2002:a05:6000:24c2:b0:427:6c4:f165 with SMTP id ffacd0b85a97d-429bd6aa1c5mr412181f8f.35.1761846929744;
        Thu, 30 Oct 2025 10:55:29 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:29 -0700 (PDT)
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
Date: Thu, 30 Oct 2025 17:55:06 +0000
Message-ID: <20251030175526.607006-3-biju.das.jz@bp.renesas.com>
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


