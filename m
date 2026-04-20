Return-Path: <linux-renesas-soc+bounces-31423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKyPOY9E5ml/twEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:21:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2642E154
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9061C3708D15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D87363C66;
	Mon, 20 Apr 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2C3iAue"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7E3630AC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693873; cv=none; b=i7haFgPQ2Cb/voFsdhGB798VLzpwWT6DWGJNkY+J1PkkdEvne5kADznfaZsVV8qAXqMAUKcz2R3OgUJ9Ckt3W1KGldOTUELVP57IPos78tFa6Fg9PLYlLWzeFw6q+7r49CTWUiFbUbKMaOYuzAI8VhAvhfy7d/Vrd0g7ddyy+bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693873; c=relaxed/simple;
	bh=qFelcTJ1pCIXmrY7KftYX4Oy2N/9lTZs2Hg3YIzcshg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itP+lCnT9rCT03bEV09WYeroBr3OtPXxtODRuF4t09Tz+HQSrdLfpTUEvwPnvc1n6libC0dvzO2Q9TmdpIf4YCk/INTI5zAwHYucGaCT7MfTivTntYoLnc5ivwloLkwQ3Wzm9pveBPnTmh6yiGxw13OXKsz7VSYYcxT4tKktaxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2C3iAue; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d74086e5bso3103803f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693870; x=1777298670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvbI/EJN7GrntRh/mrLK4eeJPAlGYiiclh9mMVV1bZo=;
        b=A2C3iAuePbLRVZ/TPlwwo2c1vpTw9/57ertNcsyijii52MKjm6WKR0VI7KWCLTyX4I
         v7t1Cf2BwjgxvYXCgmKyZ4vG1y7lyAZx2o8aEwdBAejVmjk+WsjgM0R8NM2xzweLQ+mp
         VvS0pIuxJKgIr8WuKERZTG7hq0SRlqsJiuio68W6F78brzXdGHt4STBCOHHLKo1WgTZo
         +a6swFmu8eV6TwYMu458+mtcBwPxIhWw9ljJ++j3RcWMjty56bQolnTbeSBBCW06Eki2
         nS5y8stBFExl061l9iR4G74uCsTgfYezATVbBIm48UZV801ln0KWk9CETBhjLZ/o1IOQ
         AukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693870; x=1777298670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvbI/EJN7GrntRh/mrLK4eeJPAlGYiiclh9mMVV1bZo=;
        b=eFsrmcaCv78YRfFUo2nBBIrGa7EM5NnbdQRunzBJ/71pIX6MbnGxFljFH/K4NbsJGx
         ZtCx+TiQFXShAS9cinsWsy+lXBsnenfy2aHdjeEa8Lgzg1JquFqfwwJD3zB8qydmlvSq
         63Fiww30YKE0DTWMOlIZXEZc5fEephxtdRcbz8kiFsYILfp2Tt6WhPn89JU+44VZCAOl
         x/sbu1b7bfFA63K8FE+GYEpwePzViQXg/sJQBuxGRMLGMklLRHJidmzohHULBSfRnDaO
         I2bGU91RFcGzb0Un/eUdGd6M4A84nJS9HKeLIYOXc5Z0NQFLhVlpIvwD2+HWeIOnSbas
         SIKg==
X-Forwarded-Encrypted: i=1; AFNElJ8lzNjguOBkgU7MEPgREWKiqDuRZ4yZxMOHo4JkTtfOQv0B2diwiUEnkwIYA91MZyXdDKR/XDOuUaWCxkjlmctbKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzESKjYgT5tbwJOn2jJi/nWkkum0N4bhY4WbMeCVOaT781hR0Oc
	8aN762MJID+C3yNZWfLLCK6O9zmYBZU/S+BIDwAPYA2ZGnRf+gITjHwW
X-Gm-Gg: AeBDieutUDZHwuj/FcYfzVNLr0ZgPHUKhVn7zoMgyZFMoRKr+sPRPwAO1lalyfE/Dug
	amlaajJV1ek7isz9u/49f/ZsFcWbYuvkRbE/FQimlOw3W5APAalnydGb73Dq+dHJZrvYFNO834a
	rZnVoDv5VWthV02vY2jx3askr/x254ZyDPkK9vTbK0viDWAsp99Y7FjCwB/SYyaJ5LvHpUrbb6F
	Ucg5MWd49IUyR7BzXDv9rgMv86QR5S4XwtK/dg8M9Kd2pb5o81xMge1kCPpz/N5PG0R1Ah9y9KZ
	bR9BrCybaSJeIAzTYtU1S6ri7f6CZjYbywDM6ne91y8JWHfam99c1now9fqqucJJ+lF83W6cTBC
	Xw1307Hpum967Z3qe0o1Dj4cqF3ZaAkQlx8rNsllqdI80KZFRWwpBleG1nXsnB0E4xkBECEjCJ3
	v46APgLBXFUqMZjewSGuyCU4Gw2ooPfGyom7K5UGSNOVeOUXfVpRF2MugwckU=
X-Received: by 2002:a05:6000:1a89:b0:43d:7125:e79f with SMTP id ffacd0b85a97d-43fe3e25c89mr21697002f8f.47.1776693870054;
        Mon, 20 Apr 2026 07:04:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm28377778f8f.31.2026.04.20.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:04:29 -0700 (PDT)
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
Subject: [PATCH v3 1/3] serial: sh-sci: Avoid divide-by-zero fault
Date: Mon, 20 Apr 2026 15:04:21 +0100
Message-ID: <20260420140426.237865-2-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31423-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90E2642E154
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The expression (10000 * bits) / (baud / 100) can produce a divide-by-zero
if baud is less than 100, since integer division yields zero before the
outer divide occurs. Rewrite it as (10000 * bits) * 100 / baud, which is
algebraically equivalent but eliminates the intermediate division, making
a zero divisor impossible for any valid baud rate.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 6c819b6b2425..7473b26ce9cf 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2915,7 +2915,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	}
 
 	/* Calculate delay for 2 DMA buffers (4 FIFO). */
-	s->rx_frame = (10000 * bits) / (baud / 100);
+	s->rx_frame = (10000 * bits) * 100 / baud;
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	s->rx_timeout = s->buf_len_rx * 2 * s->rx_frame;
 #endif
-- 
2.43.0


