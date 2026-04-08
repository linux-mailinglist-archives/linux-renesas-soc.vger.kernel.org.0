Return-Path: <linux-renesas-soc+bounces-31020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKmrM2ll1mnIEwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:25:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505BC3BDA08
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AA03303C612
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 14:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CD43D34A2;
	Wed,  8 Apr 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGUeC0qT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DF61FC0EA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658072; cv=none; b=okhIwjLkD5vzia2A0asSz/63HsDQC/CpBomz+IDgZIQTQ9r6XmcgIU00Ocl9Ryy6SnTh3OiCL/5pPBhJRU+Ul7li/HBa6wRUNvLZ9OEorxCnXvWj23DSzj/gYrHX7pyRbbQRis1Nf1Ml1FzDH1TVwVSeYjC/zthAtSmJP186mpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658072; c=relaxed/simple;
	bh=62Mob0LE3sWA1dLdXfSheWhD/xPqahp1LlfQRWC9iC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OED8fsuhc/NzLiezvr02/rTzxyubiP2X6G00v3bJwAgj88Dbotob8kavCGn59ziy1n7I9RkILf729K1Tc4k1fCaC4q32MDqYJ4Yqoz35FR+84e0lvTcFs9IP0weYYuHRe7xl045f4X2cp7vG6ZR4DCbXJKQRPUh81nE062u8xTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGUeC0qT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfbd17589so5004148f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775658069; x=1776262869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR5e0/e1aBEXjk8lZ27PYAez4UpdVKh/yDZiJgFVL94=;
        b=FGUeC0qTokb2e1w1lXNnv+ondKabpl/wwRUlkK0cqeJNm7B9wmpQFYfz9wffQ+V2tf
         0NTcBR3cg227+lJTcU0LBscwB1ZfS7M5uQnm359dQXUKLbu0HSyQjWm9/rzurw94KgT0
         FJ0khpa4CSzJcgfidKQj7eWgXVzdlZNsPRmTTfk/2Oeq7ych39agknc3iJiKcC8Se+Uw
         hpEeExusf0WVB+0oZYWo8DMjs7+HdrLkObWRMZJWDUiODS9Z7lFKBlslQniMMxLkqcCL
         byjcCDK7XwRHMPDNgsrqDUFxorsANF5IFNvwwls5EkzYfMMfYyZMAoUjTTQCXUcu38BL
         M0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658069; x=1776262869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dR5e0/e1aBEXjk8lZ27PYAez4UpdVKh/yDZiJgFVL94=;
        b=hSw6tartma+7tgijSutUUxRJJUvVz6lKYyRtZJhQwprg54MVHwCPjTX3tBgSsULIit
         /IKCOFaUEOMOqoTUJ17eg1BI2ASgiKPWlhHQl0oD5TmnN9EEDqU3RswSzjq5s2NkJrRE
         HyHnt2c299mklidh7Tx2MaQt9BBiQXGNTbeiQqmrGwHye1+hG1hq7HhVuCzuSzyU3vIh
         wWSwnjbWYoYPfJCyyGCrqVHoeHq+DXwktlH+dN2Tw3WY+ei4PHTqIXqpQLlSi7Y2Lt2Q
         oBDsanT15JX2c8Dj4MqmxQWeU8FrQ80IN+U82aB3wFdRyWypPwN5bxPHbqxyd52iiYz0
         TEww==
X-Forwarded-Encrypted: i=1; AJvYcCXerZQGuzdn1lydlZg4CgtUOJTXfiysVlpThUyRVkNUdZdhpt5mf5lUr3BwaBjKaWhjg+bDGUz+6tHTsqThVMQmpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWlwwY8EWaFWQMeBrvNGq/2ZS3YefBnc4Yxk76n/W7Ns1R1kA6
	u4V/U/E0yDkv1ASGCX9JfxqHcI2/+Rb8kH9doDrsJGc1ub6uAxey/vYt
X-Gm-Gg: AeBDietVwChbOzfcAHo6Es2Oq7RsQrafr+NidribOH6CLbtrGsdCtGsSFQBnLDgMQKn
	kc7M4jan2TGcCwN317w3KCkqJ+c47NnFK0y287GZ+HjfoIzm+q9hsHH918YQI2e5X7XSJMnRp4A
	ARudGPj2/zaf9p+UU8GIudrYEKkDq+c2CGD0fsG4SQIlPv7G3u95nawZ28oCOSDBk9vrtg7FdQE
	vk1L0QPdT+RXtVAyTZ6aonqbI3n+4VCOILiJswFNXgf3i4wwJr6R9pgK7xNxfrGyWqRSKtmlmmC
	JE/WXsZGeA/KApt6bwOLmnK99nIedkah9qvyV36My9YHgeKQggloDNsq/FCNHyami5V7CmgA4ms
	KXsetzazcGg44UHuULXts+7EfHiOZfc7gUAbmLBQ35k2wFlYHsVCxBLNLR8vHENOecKk6J2PQe3
	5Z4uGAMkMMl8s99jhgbNiM6fh617HsXCl8s9gwp7K1IuJbX4U=
X-Received: by 2002:a05:6000:4023:b0:43c:f52b:8003 with SMTP id ffacd0b85a97d-43d292ff3d8mr28536857f8f.36.1775658069291;
        Wed, 08 Apr 2026 07:21:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:f65c:8080:131a:202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm60474467f8f.0.2026.04.08.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:21:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Date: Wed,  8 Apr 2026 15:20:58 +0100
Message-ID: <20260408142105.310210-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,sang-engineering.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31020-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 505BC3BDA08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

uart_update_timeout() computes a timeout value by dividing by the baud
rate. If baud is zero — which can occur when the hardware returns an
unsupported or invalid rate — this results in a divide-by-zero fault.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/tty/serial/rsci.c   | 3 ++-
 drivers/tty/serial/sh-sci.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b00c9e385169..a0858bab0822 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -286,7 +286,8 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	sci_port_enable(s);
 	uart_port_lock_irqsave(port, &flags);
 
-	uart_update_timeout(port, termios->c_cflag, baud);
+	if (baud)
+		uart_update_timeout(port, termios->c_cflag, baud);
 
 	rsci_serial_out(port, CCR0, ccr0_val);
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 6c819b6b2425..429e89106ee3 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2805,7 +2805,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 
 	sci_reset(port);
 
-	uart_update_timeout(port, termios->c_cflag, baud);
+	if (baud)
+		uart_update_timeout(port, termios->c_cflag, baud);
 
 	/* byte size and parity */
 	bits = tty_get_frame_size(termios->c_cflag);
-- 
2.43.0


