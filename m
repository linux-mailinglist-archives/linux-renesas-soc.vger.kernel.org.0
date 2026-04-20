Return-Path: <linux-renesas-soc+bounces-31424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMr/EJdE5ml/twEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:21:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACA42E15D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3D19370C78B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCEF3644D1;
	Mon, 20 Apr 2026 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAzlAvWW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E4363C4E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693874; cv=none; b=aUcDgzUoK4PV2Am370vzgN+IA6FaRCGbqJozm2CpMQ1JDIqmwO0+Gxa89Ph0cD0M8GqqSKnC7ha2aS0IV3hBa/kQbVuzGU2o34yd5pAMpwtB0ZQqFopU1FwH7p7E/xpldpIz2P+Frqmy6SUNv4OXQGzv7pc2a5TK35EItuGnP9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693874; c=relaxed/simple;
	bh=yDUaC1/iNFVY6fhdVZI8/bN0lGWyeP+qc3u5oWUJa8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLrgs2ik4N2McegnnrNtV39SeFFWrV20SO7nAE19NRzmb6/yRilmNEUq3bW6C0LZrqGTi6/+SgnEdrjO7f82sgSmLWZhflE0UeTeg/MHt1ALmG4k9ImxSkZiyKEvEt7UKXyvrsKanQHdNHhm8jofLSe+uRawudctvAnvYBw1aic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAzlAvWW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ad135063so24777735e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693871; x=1777298671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UMhxU2rlH/zA2V/NdLqMV3kwXNHA2/stIZVA8XUKtU=;
        b=QAzlAvWWJxxZA2Mawq6YF9LMqIwES/EIGDAIQT6TLGuTGyu+lzny+d0qWnX/fNP7wv
         FEpopZ2uxcetgoL6JDn1/tAEKgIt/4KUZD84+S2a702QT5PJ1Y+Ieveh7OAHiIQcmzV+
         4yt1EIu3IF9CXl/h8lR4fcij3MPY77dEAYUogvJOwaU0b2YF7UglePcpqnj3IJsS2ISz
         tdGuFFaBmtR0/h7JLYZ7Pe03bX36wwX3iq58FaBI/GJ0hkslNLFNkJjEyPcSTfzjc+3Q
         kEFTX1ubFFb0n0BWuSAMZE+i5btudHXVxBdIRMqxf3u7ltqmN3DDzcYKaj5sBTrFRQLi
         UgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693871; x=1777298671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0UMhxU2rlH/zA2V/NdLqMV3kwXNHA2/stIZVA8XUKtU=;
        b=oXdVv5BupTh9Q0daciipLBj3PFMdpgHLudsxeUuXlRYHwkGMe2cYwRC1kPJU/AVRKx
         KvW/kRR8u6ZewMsxrJwlpNc3rVEhxAoMsH9p7fvw82rrsY9ZgLNjqPyDi+bJ+Cp1Pth8
         SU2JcLuP+8098up/t0DKLJKMsdZrk0zgBCrSv61r5UxOvFEheBfcWCAV6pkIVUOGzUTY
         gG3xrRkz55HwceSdtZ6+oeEj1C3/EOo2hC07q4E0z7+FAUYNu8fNd0znTlq6oLwZlGNh
         HhJB04x+EkPAhdjqW2gzuUF5LGwZAO8c/uO+POOij+PF3TOVQoecMKpI/+d+DSz2Y6v/
         N+1g==
X-Forwarded-Encrypted: i=1; AFNElJ8z6sPTYiJB6uyfWVkwl6NS4MlHXsxqq/2LwpDyGCO2lyXZ5jgx7UQvM/eXci6825vkCMteFGXr/me3/f/f9zUv6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4AKx5PzH4hQAAzXp1586uw6nvuz2rMFL+PqtMiE960CK+Yg6p
	64yP+srboQU2hje5ljW9QvvS+LX8IK5ZzizL9kPFsIcGOGPEcadZrbFG
X-Gm-Gg: AeBDietvJbGwIBECBMVF7AYd1o4XuQQXjU8hzKmwRQ3xOCJhtKHcCmpPSTltPOf7+cf
	eUMK831AI3WW9/pCs5doRlFxsC+wVaPCmX9OLxYXlxM5BmXIG38ZbxJih3Ux7aOZ23YFsQ/j+AF
	B4qV0ZWqNzidlxTinvIYN9v3wcJB2uwYGE+8dRQjNclnyCqLfBp1yaYCSJOmIuFwERLHIwquu9R
	sYE14xSRTZCWpbUg7yMBZhQWSpvRlua0O+TuqwuhH1y9wLdQpm/GKAHkx6FNapA5bwoJtkXVo4G
	lFfWThKSZMXxNsIk00TcO8laGwsND4IpWwGgln7xPoPYkxWQGBcBXuiUY+Vu2Ti3sDrPxxOaLim
	KRmNDDrNRdqTSbOe44Px8wixX7xTMtDONMZYOWHP2kKfGDYYP3tdjUd33yMcgGdo+lLzqkxB1ZD
	8johaS0YueQmKXkEQN0RnLnyg/Ft92fXyMF6rbC274TG4LLNM1IJmNxuthnlM=
X-Received: by 2002:a05:600c:4e4f:b0:488:ab37:b442 with SMTP id 5b1f17b1804b1-488fb793c6bmr201341385e9.28.1776693871037;
        Mon, 20 Apr 2026 07:04:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm28377778f8f.31.2026.04.20.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:04:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/3] serial: sh-sci: Drop check for zero baud rate from uart_get_baud_rate()
Date: Mon, 20 Apr 2026 15:04:22 +0100
Message-ID: <20260420140426.237865-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31424-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A0ACA42E15D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

On DT systems, a zero baud rate from uart_get_baud_rate() is not possible
even earlycon derives its bit rate from chosen/stdout-path. The zero baud
guard and its associated done label are therefore dead code. So remove it.

Also drop the unused done label from rsci_set_termios().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch
---
 drivers/tty/serial/rsci.c   | 3 ---
 drivers/tty/serial/sh-sci.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b00c9e385169..40db9daa4272 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -265,8 +265,6 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	}
 
 	baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
-	if (!baud)
-		goto done;
 
 	/* Divided Functional Clock using standard Bit Rate Register */
 	err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
@@ -278,7 +276,6 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 		cks = cks1;
 	}
 
-done:
 	if (best_clk >= 0)
 		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
 			s->clks[best_clk], baud, min_err);
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 7473b26ce9cf..9be359e04995 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2719,8 +2719,6 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		max_freq = max(max_freq, s->clk_rates[i]);
 
 	baud = uart_get_baud_rate(port, termios, old, 0, max_freq / min_sr(s));
-	if (!baud)
-		goto done;
 
 	/*
 	 * There can be multiple sources for the sampling clock.  Find the one
-- 
2.43.0


