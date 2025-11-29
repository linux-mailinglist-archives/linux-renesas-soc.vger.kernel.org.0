Return-Path: <linux-renesas-soc+bounces-25374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5183FC943AD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C05A24E4744
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CD330FF1E;
	Sat, 29 Nov 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1xEiAYQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C4E30F814
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434615; cv=none; b=iu3QMWMe1eF5lDwheNaeVAN8iJbZpRYLCcsHRfx1KIlqGQWTP8u1nhYQhHwffdBkQrRd3rInmfljRGsHQq6hTe5ZeafJIc0S0bs447W653SFn9gUqISjepSOyYIqXOXTzUTbgo/5VLLfgOXGGU32B32aknh+zwUHy+yZTAcScE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434615; c=relaxed/simple;
	bh=B7v9qrW+paFhlhLozJ6lRj0AyNxXth9PHBmIByVEUjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiGFOAmonLFuksmtCbVHRTjoOoD+9FrHkpylacuohPj4JAVbpJAis7Ccl+UMR8jg4+Y7j/7QGaFn0e3Tl1Y10pFNXsjR3YPuXPWhIVBJKj0VgOmbpQpMnkkjrcbIzDq7jgPXNd0jXnKCmWgTjraE2GRNTsBdsgEtDWBuKvSmlB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1xEiAYQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42e2b90ad22so129504f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434610; x=1765039410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bPqYF9HDpkdMmik2D0hgGXuyr4x4ACsXKFxzvuy0gs=;
        b=E1xEiAYQ2C1PazrD72ycPw7SLh4D76mqE04qlL83CHBwHGDYC3W3kYCXQnXqOpb+eV
         mM3rYbDBLElRwLRIp2wUjuXRh9FkNhkLIuxtrDXVzc8q2NhNTLrTc7LCXB0cMUL7IVoH
         YZXzvYLzXJk7Gwqli5HYIKk1mAh8XcVBw4fJBT6Zu3ETbVt03reJf8QJwk8Ik2Pp/Mgh
         WMipaRZcy2m+up3oG7OMdTitxnL1jPaGlmmJm5t3FAZWJSd6RKPVF5j2BGp4LjFqAZA8
         reDoBGvLMjkI1auSb1vzhdMMnvWPtc6YNMl8KrVoe5zGsek5eG0RMHcu6vNreFBngUfr
         FMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434610; x=1765039410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bPqYF9HDpkdMmik2D0hgGXuyr4x4ACsXKFxzvuy0gs=;
        b=FvLkGMJqkN+bj+kTkyh41WFZ/Vw1mikfe/ifuxFaVwzIwaORUifvZDf0U5B3eu27u1
         IiOnxvVLERJxbcBUn8C52S39wxZ8qv8387nu5odl3U5LXIGLiFQavmYgmS2FrtNdduv+
         WTkDqxrNI+2hPx52yiVz54+NLbMXXZXgpDjY82Td/C6Rn/g5ido+Oi5r3vBSqgEAPlIv
         +8tjJKRmDObLrRrcBnBPNcxl/Hm4PgVL9zqmNyPZu+VmYEgVkY6FT9tYmSs+aKNguUKw
         /Cpx2oQ4+72kzk0d37Z/wY0kQrNaIiA4AjBnfSWggzkj4yo94knQhTI8MpOXtu5KtwLt
         nVbg==
X-Forwarded-Encrypted: i=1; AJvYcCWbAMI8Ma9V3Ta6LeErtM6rHkFZmgem+HhuniBxCgLGQzlSastmA/IerFz/v/wOUlqWlEPHmy45QaDi45hbi4mbpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpP2ag/aH2WmzGvO5Ce7sycfHlr2H9VGAdGe7+rI3w6zWDl57Q
	iXoT9sn+eF+AdQiFWtVCH6WVri8vxj2ydaRSfADotdXNfX5RSjlRJWgy
X-Gm-Gg: ASbGncsAhwSVF3mJCmtiZ5XKnP3XYKuprbRixAFQlljSfWpUmso7ieQ6CM8rJwFqtNN
	7uwRTVhPBtxbzYU6+Zz8AwZDqZun2S047h9lj84zf9aS3cWyy8RD3LoN2zloG4tZrSyELZi9drA
	JRJDi96R0nXNoSUzgGbDs5U15fCFdJguWU6oXOILcXq/bBElQWDWiHIpr+O4p+E3qhqq5m+QK2h
	q0aHIGP71x5W/CB+2EGwFq1PadeddQEAEWSA2coX//+KuKH4OoJ0gUQyOtitE7julfPkxRQ1Zp0
	n7o5obBgpOpjBrpl3tGQ1nnPCb4hzXHTNEwQMsGj8Zmv4z4VeKYzcj2ccmIUyiEzHsSoLZ5ALuf
	UMxY6DeiFHYlki8mo4JLeQvr0wmDwkgmJP6dpFLX/2iHC895MVKorcw1/UpRG69RdPMjNp2ScEr
	4QEtZlic9qv0kfHLklPauA06UypjOCnJt0IjmqPT7UwzcfrH+B1LTsbE0foj+oY/rooJtcgzKcy
	C7NLQesoL4J8nS1
X-Google-Smtp-Source: AGHT+IEEb2qZ0UYDHUie4Qwc62VO5FnkQXg1w3EqYcfeQhWXDStHqlNvLIDNuNrRiYbDT877KormhA==
X-Received: by 2002:a05:6000:40cc:b0:42b:3cd2:e9bb with SMTP id ffacd0b85a97d-42cc1d2e29dmr33566362f8f.32.1764434610050;
        Sat, 29 Nov 2025 08:43:30 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:29 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 02/17] serial: sh-sci: Update rx_trigger size for RZ/T2H RSCI
Date: Sat, 29 Nov 2025 16:42:58 +0000
Message-ID: <20251129164325.209213-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/T2H RSCI has 16-stage FIFO. Like other SoCs, set the default
rx_trigger as the fifosize.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description.
v4:
 * New patch.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 53edbf1d8963..28d665a9861a 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3330,7 +3330,7 @@ static int sci_init_single(struct platform_device *dev,
 			sci_port->rx_trigger = 8;
 		break;
 	case SCI_PORT_RSCI:
-		sci_port->rx_trigger = 15;
+		sci_port->rx_trigger = 16;
 		break;
 	default:
 		sci_port->rx_trigger = 1;
-- 
2.43.0


