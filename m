Return-Path: <linux-renesas-soc+bounces-28311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILuVNBwolmnxbQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 21:59:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C850159AED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 21:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCA9A30011B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 20:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD4D34889C;
	Wed, 18 Feb 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQTTGMZA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD134846C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448294; cv=none; b=hXMxObpu8cgtowLoXBhoW2AFEvHW3F8wbpXDSENailDKI2C5qEyZnoD6AjjzupHlUWfLSLjTuN7iwHalA9j9X/nVkZqkf5tEjKhp5ZrmQyiyNhPgKrXlHAJ3Gcu44LGBznVWIMAMBadKEOGJf5xroME3NXYThLtGi+1c9tqnx7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448294; c=relaxed/simple;
	bh=r6f5XA/yt5ijQxC9qj8PwFahd3U8KiCq5t1T39MZKU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkNfsNNLDsLEcUKGy8WG6wublA7dv1nwZpPjuD66gW7DzT8X2wai7U842WX0xi7xr8+vmW6IX5P9cnQd8nDEN+/yqCKmtdWFAVCP0OKI/6VgDHw7DUJw/v1hoNW3/SRJmdN5n0r+7NVPwTRbSKWvIY7wsPJUKFoM1n9bSPmwQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQTTGMZA; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12721cd256bso224942c88.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 12:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448293; x=1772053093; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYz/iLeO6q0BGWWQxma927idbu7N5p49ytkQNprhL0s=;
        b=lQTTGMZAZjiTraDUeAEqJMdNby/jTWB4DrE28iUD1stqL4w+8bBsAGndgtRAQmZHs+
         OBF7bEoyd91uzjI22RtuqMWmTPJo974O9ExuDDO+9xLXdOxOH/u0GX9hudj3nY0p/NEd
         +Vnp73F7iKRWMRSibibCjDjMh28nAyFU40MwOwCMU80bBMYIQ1Pn6uLAbY2lBsAth6cC
         bRR0uXXn29SlT0d8vsFAkzXdlS6TZEYE4QqZOPfrhzymh0Ik9oAjwPzrEmWkNGkLn6wB
         g7PZnwC7hzTI2G6cFdcHVWgaaP4YW6YzufLtGCH4nBCnq59CYOgXNWSbMeRnGS4kEEoe
         ZVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448293; x=1772053093;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYz/iLeO6q0BGWWQxma927idbu7N5p49ytkQNprhL0s=;
        b=ub6JnxdYvBRj7c/PD0mm4DSiehh9yqp9qrKsR1bHBprsHdTs+X6/ZPLfsN2vihCmAk
         7S0k4VmoaYoyb1Wr+LFQCfeXG1jnjpY6tSgNQWE2JSSvEyVxdC68TNlrJmOV9LE/9khP
         QvM6eqGXMtfK9brTXd6otyB1n1ya9Q45jmR9XMsKreOLBqun57Ie4VjlJfB4fkswRaD/
         3e9NyplYCZrA+M4g2TDZii0kTr8J8rTFD+69vnSxxtrvxnUc4j9apBzm+tiQ6PeJ5QGn
         vnb07+N5NIGivt9YTvQmt4UcWFqMpfivXJJ0Q198y1focooMp1MjWNSnTjBNj6Ehxe5Q
         MCPw==
X-Forwarded-Encrypted: i=1; AJvYcCX7yu8IBrUJGZRq70NBgx2TZAiqNIyusws+iS+Veyx2i7G04HTgisu1SQ+eD0nk0eXFigBYoLQ7Wb80P1b9lsUEiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuFBXIzJ52VJDjvqKHmCJMuMh/ck5y+K0LsRc8Ut8z4TKmd2BA
	Tn3Wj68coZEe+sEb1aXanZUwpqSWJqOFdtNRm+gWJbul8ePpRME/p4JHlZpddA==
X-Gm-Gg: AZuq6aJP1JGJd1NkUljC68t9O3FfyiiJo9qHyrADqY7LTT0Bs08m8k3mFOuBBww8MRx
	GsDExo1N7sm9Z2DPygRwo1I7y6vA+A3HV+C/rZJcQxQ7Bh6u6dyNq7+WPTRaXCzEOrZistL34gQ
	n84RyzQvKFLAQ9h4YGJf3WGBKMnXtLHWTK3tHelDgPe5vk/M8XwscJxwTTTH+Vfkq4KgrpUBaGA
	QiQ/c7HOt9p4dxe9vQw6AlAbUolYjaB5CthOkJ2MDU3R7zCP/Wcu3ScQed65/fRgBTGEB+25uOI
	TkZ5Y2bGDOQYpRhx/R3CGLd9zxfOTThG/CkDmhxrncJP2igirAen2gEdbASdYTiCfbNzWB1uke4
	AemxJZ+/4MscYWNpBfu4sP9ywTWG30dWeRpq4vGh8xi3MWJHa4atne/2dGghhksa3iY8x1CwWuM
	DP5XcV72lV3CgxDEnxKjg0GhhSJnec0JX459MZDXLF+bQeKeTO8X86XaKOsKcLomJK
X-Received: by 2002:a05:7022:2206:b0:123:330b:398 with SMTP id a92af1059eb24-12741b90b7cmr5415874c88.19.1771448292879;
        Wed, 18 Feb 2026 12:58:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c63feesm24200691c88.4.2026.02.18.12.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:58:12 -0800 (PST)
Date: Wed, 18 Feb 2026 12:58:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: rza1: normalize return value of gpio_get
Message-ID: <aZYnyl-Nf4S1U2yj@google.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28311-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C850159AED
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by rza1_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 3cfa4c8be80e..d83c7d8ee82c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -589,7 +589,7 @@ static inline unsigned int rza1_get_bit(struct rza1_port *port,
 {
 	void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
 
-	return ioread16(mem) & BIT(bit);
+	return !!(ioread16(mem) & BIT(bit));
 }
 
 /**
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

