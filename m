Return-Path: <linux-renesas-soc+bounces-18876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF21AEC6E1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 13:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AA483BDF55
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 11:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CBB24E00F;
	Sat, 28 Jun 2025 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAAf73ag"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C2246BC6;
	Sat, 28 Jun 2025 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111844; cv=none; b=UFs7J9O7cq4+dira2/glT//AMLmH7pU+hGpqD1t7Ffm5114MriWHFkzhrIa25t2BRDXsSRAo2OjQyVc/dql+wWCkttWE54niji9+Bt2VaGlBy+UvmsI6tL+ooC1EaFJw2P535HzWbTpnCLqLZrHdup7Z7+nKt9pvBGBFUvlG318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111844; c=relaxed/simple;
	bh=+P7qdg3affLONYbyRNA52F9b0gXvCpeloZTRNGflykk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=js2mnm/+5v24xDRsBhOXADN931xXEHGx1s7UTEJUFDE7gm8vi/OmFjMgjaGz/vu8IViuRApn7SWK284HWCKRS31wA/67G250ztmhPGFUcEdgoNgXezsqXRw4FLXZXYWxMkaZlFA+cOheSrHpqd96Cs8Aqq7I1pwRm7MpMjurfLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAAf73ag; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1844331f8f.0;
        Sat, 28 Jun 2025 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751111841; x=1751716641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt57lhKghs0xjG0iIIUZ8pzjHBVb+Sq327e3qQGY/5A=;
        b=KAAf73agHqzrtZfVaWKXNUgRWVpg1kZeIOx3BvZnLR1d7nMl9nrJ2r5CsBV6Irmlw0
         55Sz6+DdQIBkBvU2/gBAC3fnaxWouk5GryddJlH9xLOOEKCKUO9njEMvC5sqYnXAp1PB
         Ps7nM48URXIjsK0yXHVH7C2Ds5BZ6NYi3n1d+FrsQ7NbG4hYwyHijjupjE31sxRHhOYp
         nMQMkzUdqFcAIty6AJmUm0VNcj7Hwlp+vNcDUWWhc7++gqVzR7yr0jHFP05PkPtGnMeF
         sghe+O+P+wg5TwGbRdWTE0i4sn7ZAtiIHlpiJoSvElirT0T7VUFlD+R1eSjBgEeJnaig
         bngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751111841; x=1751716641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt57lhKghs0xjG0iIIUZ8pzjHBVb+Sq327e3qQGY/5A=;
        b=W7+ltYJwVZFDLpRM/jMVKCD9+RkfzQa46ecK+xFKoeDkktgK3Rzyzbn8A6KuJwRRyk
         278koq0YpvW9Oja+/GexTiaxSoKtJIhmuIhugUXC7yZE21TKBSAarCYHS+mpnRXwuWRS
         bgIIdGxwPONQ7AOt+rwH7xz2vqoSdBRnowbvWYjqftcC6Y8RLerm95mXdVwzmZCpVYYz
         aAniEFRTP2XgOoaPFL3xJRyT6R0gNI8qOtYbUGHBsCJr4doQZt+/ZDSc6jFdq3FCw2WH
         ZlHrbxdcOIK61sSXzGT2rKWw6VZ+vYI5FtH3QkB+DRDHxRzcDuRpkNmOvmkHfhG1Xd3d
         CvVA==
X-Forwarded-Encrypted: i=1; AJvYcCVGndFmE2nIXhQu9adcZpvjfhcTC0g/qkG/sznyzzqPotKYbSOtBKEGH1+87YeeFMnnU3ClaB9qjCMYDsbd@vger.kernel.org, AJvYcCXNM7AIDbUNQEs5W4hZ8vkhmF23Xh2gx77j5DOByhh1wF4OKAi9hkPtCDHOTwwdTRLfPZk2NPyzh/9T@vger.kernel.org, AJvYcCXzuMAqlanbVnEgSHYS7s+b6vblc4ujuqaFE/k/dJUXMiPcy36P45/o8IwFz2IUtyPnDYJNbBZuS8CpbdSPlsMehHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCQcpDtr1h4WAS1cxobushioJZiwOEHmOvA56dPh31UP6yxnhL
	ilh5z7EXMd6wGhW14Ap24+uZFfJzjneJk6ti6HYJoZ1K8Tk7aNUtMxD+FzJivy7b
X-Gm-Gg: ASbGncuBGKc/u1UwC4ilalgT4wTB/5BDlzurvXYmNKjQ/Z2nEfHa0iKYEZlyEBjXQGC
	U0ypBsTWVJIbpvXWrnOQvjBb3BUQ4erLG4Ke7WH0o9pDGla95b4Z0xJXYN8J1zW70fw6IUvU+rj
	AMSuW1iQFAh50NcovMHCisrULPjWzQxMkZCzMALHpJs2owJaC14L4TGF+pu0YuwAGN4eNxeTfSy
	10que7I9FtkHyUteCovIC/04ECZaEHAM0M9AY5ROSs3ys5i5qqBCzkQmqOsrRgwI5khxo2zM/gb
	uwhBgppbTn65L3fqZ5P3lkDGzQNQA3/Tj4ToPfxkoOWqEkVK34iPo4hMX9W/h651VifLXaDTRG7
	LIUYpOdb2J8i7093U9oBY
X-Google-Smtp-Source: AGHT+IEA3BjMqaD1Rc+5dV+vcziUGPD6+GTIDJcNWmkEf/rWGznrE7Q6fPbHQGqTuKtx4IAvtu3Ygw==
X-Received: by 2002:adf:9dd2:0:b0:3a4:eec5:443d with SMTP id ffacd0b85a97d-3a8ffcc9e9amr5197727f8f.29.1751111840546;
        Sat, 28 Jun 2025 04:57:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dca0:b0f1:f055:ea37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7310sm5247818f8f.18.2025.06.28.04.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 04:57:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v13 3/5] serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in sci_shutdown()
Date: Sat, 28 Jun 2025 12:57:13 +0100
Message-ID: <20250628115715.102338-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace direct calls to sci_stop_rx() and sci_stop_tx() with port ops
callbacks in sci_shutdown(). This enables the RSCI driver, which reuses
the SCI core but implements its own stop_rx and stop_tx logic, to reuse
sci_shutdown() without duplicating code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v12->v13:
- Added Reviewed-by tag.
---
 drivers/tty/serial/sh-sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c356544a832..5c4283ce542d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2289,8 +2289,8 @@ void sci_shutdown(struct uart_port *port)
 	mctrl_gpio_disable_ms_sync(to_sci_port(port)->gpios);
 
 	uart_port_lock_irqsave(port, &flags);
-	sci_stop_rx(port);
-	sci_stop_tx(port);
+	s->port.ops->stop_rx(port);
+	s->port.ops->stop_tx(port);
 	s->ops->shutdown_complete(port);
 	uart_port_unlock_irqrestore(port, flags);
 
-- 
2.49.0


