Return-Path: <linux-renesas-soc+bounces-18397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9AADBC09
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 23:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EF7D3B77DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 21:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874872236FC;
	Mon, 16 Jun 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnpGAOGI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3B921CC4D;
	Mon, 16 Jun 2025 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109976; cv=none; b=jag+q6oVjDPsLaAfa29ijUf+8sXd98W7k6ea7NwQlXtceIWKGUNPkDerCchY/ULY6CJ4ustAbf3lk/6yR7OYsAU515VkvXNiyvPTS9sb4jK2XLDvTO/DUvK5zoZ6PU1rZpGSVEwqfig9CiVh5HVgIgzymWHmOsYeNS5RY9URY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109976; c=relaxed/simple;
	bh=/810K0ZcVi+577RWK5ujSGmzADliPslNodEaRLplJtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdSN35AxCOeHR2T5DQ0OlU/4TTfAv3AG5eNq7JLiAclCUTsICxhOyxD6VNuBcJpXcxYkYcWofOcMUBW+HUa86oqp/3ZpnoMk5CP1S/iJjNGZWhfo2wIOqogoYTYmDqIjshtzfq1hBDf3Bmt/gq2O/SNv5tteyuETshZFgfzhQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnpGAOGI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2876254f8f.2;
        Mon, 16 Jun 2025 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109973; x=1750714773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86iP4kyWC3BxJ5nZa5G09885pR4aoO2Ag0CwrynykI=;
        b=AnpGAOGIzhGvPQVv7BOaZPrgVOdlfITMswoDCbK2pTKYfbIkM0Okv9zO1HADaceuOy
         mbBtjlmAovL3pG8Ft9B/AxZjNfNTfv2IJpfKIb+of/zuKCCTJOY1ZXZB7JecFcjU+Kbe
         KMUc/iMNXBpHfG2GAKqCs+1I3zI/+EIFPcglGnHP6bBv7L6YRZhRGz8/P/ojlAubybEW
         6MHfaZ4H0RIbc+MLawO4MN4aqavgY4EiSi0lxo7YRWlarwOe/Q2wA3fp6GApMieueH2D
         DsLnnReqzZsdnIt12tFyKju+3iUq7LusWyJDRHfZpBa5F1Nrrp+PZXcMremob5wQM9p+
         OJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109973; x=1750714773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E86iP4kyWC3BxJ5nZa5G09885pR4aoO2Ag0CwrynykI=;
        b=Pl8GxBK4n5v3dwMDTx7UUmOx5HXRpePHFVHi1epkasiIxd6zKiepi6Hqv5wL6jANMf
         qfNFpvFlqhYHlthmLavTn3iqg0TyqmYgf8qNIaQo8gBlVhbEyFN9bBp9xUvdpIpNF17d
         KL/gZ6ponCzSBwC8xd9Qw4Pt6+u3vHKzQvgDfjXxY/mReoNMyfj9VajYm6zpHEEqYk7c
         sVdmjEuok/Y9CAUefq51z2YquFclQluT1FeS7/V6e0cHun5jo5JmKf91T5Gf/xLM2BYD
         jVOCFK8bupXb0xlTziik/NhfYrN+VMUH6aboFMrB4P14TI4mHKX9L2fsk3vQ5qyN1BgH
         s4ug==
X-Forwarded-Encrypted: i=1; AJvYcCVK0rdnf3/qhQaFrd5bYriacKMc/lZlaPUB+x8gA2Hv0DROetMVE4bP/4aT0mjQtR0ohWTgmqMna0Ta@vger.kernel.org, AJvYcCWYO8tkrhJfIm486ik3HieUD8BdoAJcI0LmQxYAMo4FrIdWoSg+T7tgETINTnHPw854juxqaSe0iTtzKRQqQd2xteg=@vger.kernel.org, AJvYcCWc0q+e99RHFs2BCf+R0DCx/x9KaPiIapSxq0M9QVCZekSy78u/lwboEwPGSvNuxHBs6Tq+UCyJueqRLa/F@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYsaPLUGPwCsoECFGydPC9whsHb8sLV9Y9DhmL8EgexKiBVEC
	RmDx3DoJ9SXICyWTjDoDf1bfS3BIXgpEHial2qA6nwDRlBPiHiYmRpTKXUbOkUa9
X-Gm-Gg: ASbGncuABO0EbmdQbxiGaSGY/3qLGrobC3WeXL0r1voYHBc/jp0UzzypnLKkxy4qe1S
	Q6rxMI4rf2lONWwDJMsQ4ryh4cqySaPLrz/Hy+EJLnNjFPXHtZk2BvjmimDtiWY2MqnW+XQ8YSn
	d82bZHaZMrc75jIb2ViOJipMaQYp/sBlt/+dUxg/QEt2xRaUi7zstI31k0bm4PSpgaoA4ePxs8x
	m8cy3pUGoz8rtgt1+UQ4tCpM7PIOGu4oPWkjZlF7tGjXtiGGbaY6QaYqvgWeglL0BQX1kv6b6Od
	3JPLedKqYKwoibA1mo3kd6nk05jjn7Me90RLNcFsw7L0VGCdwvOmHmori99kqg4pVT68fca5zY2
	rihM/tkz77t1twMmxP9m9
X-Google-Smtp-Source: AGHT+IG60JKWACadpTpRk2Ews59bDw4akfnV1Os9ikuRCiAfESunN6k3aWvTDIJn9hgbLlYcsR1gdw==
X-Received: by 2002:a05:6000:4618:b0:3a5:3b93:be4b with SMTP id ffacd0b85a97d-3a5723aebd7mr8593174f8f.25.1750109972813;
        Mon, 16 Jun 2025 14:39:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:4135:3769:337c:8a0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2354fbsm153211625e9.15.2025.06.16.14.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:39:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 3/5] tty: serial: sh-sci: Use port ops callbacks
Date: Mon, 16 Jun 2025 22:39:25 +0100
Message-ID: <20250616213927.475921-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace direct calls to internal helpers such as sci_stop_tx(),
sci_start_tx(), sci_stop_rx(), sci_set_mctrl(), sci_enable_ms(), and
sci_request_port() with their corresponding port ops callbacks.

This change improves consistency and abstraction across the driver and
prepares the codebase for adding support for the RSCI driver on the
Renesas RZ/T2H SoC, which heavily reuses the existing SCI driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c356544a832..24773e265fbe 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -880,7 +880,7 @@ static void sci_transmit_chars(struct uart_port *port)
 			sci_serial_out(port, SCSCR, ctrl);
 		}
 
-		sci_stop_tx(port);
+		s->port.ops->stop_tx(port);
 	}
 }
 
@@ -1497,7 +1497,7 @@ static void sci_dma_tx_work_fn(struct work_struct *work)
 switch_to_pio:
 	uart_port_lock_irqsave(port, &flags);
 	s->chan_tx = NULL;
-	sci_start_tx(port);
+	s->port.ops->start_tx(port);
 	uart_port_unlock_irqrestore(port, flags);
 	return;
 }
@@ -2289,8 +2289,8 @@ void sci_shutdown(struct uart_port *port)
 	mctrl_gpio_disable_ms_sync(to_sci_port(port)->gpios);
 
 	uart_port_lock_irqsave(port, &flags);
-	sci_stop_rx(port);
-	sci_stop_tx(port);
+	s->port.ops->stop_rx(port);
+	s->port.ops->stop_tx(port);
 	s->ops->shutdown_complete(port);
 	uart_port_unlock_irqrestore(port, flags);
 
@@ -2684,7 +2684,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	}
 	if (port->flags & UPF_HARD_FLOW) {
 		/* Refresh (Auto) RTS */
-		sci_set_mctrl(port, port->mctrl);
+		s->port.ops->set_mctrl(port, port->mctrl);
 	}
 
 	/*
@@ -2721,7 +2721,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	sci_port_disable(s);
 
 	if (UART_ENABLE_MS(port, termios->c_cflag))
-		sci_enable_ms(port);
+		s->port.ops->enable_ms(port);
 }
 
 void sci_pm(struct uart_port *port, unsigned int state,
@@ -2827,7 +2827,7 @@ void sci_config_port(struct uart_port *port, int flags)
 		struct sci_port *sport = to_sci_port(port);
 
 		port->type = sport->cfg->type;
-		sci_request_port(port);
+		sport->port.ops->request_port(port);
 	}
 }
 
-- 
2.49.0


