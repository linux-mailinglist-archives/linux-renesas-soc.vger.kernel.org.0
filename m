Return-Path: <linux-renesas-soc+bounces-18938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D2AEE823
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 22:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 910E0189C719
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 20:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F3F28F51A;
	Mon, 30 Jun 2025 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUTIXmwf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D023183B;
	Mon, 30 Jun 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315013; cv=none; b=QjvLnSHp89ZZjecZJebjPGXHpOkPXbeaSOgFwFKSrG4Bxjxkt5Gjpr8+LhToPKEfbiLD7ZG4Zr7cQoa1EJjhjtBpXoxVQHTR9RzzvNQiBwy6bNgIAf+nh82xfQxyPuTURhG1oFN4hDi+wsRfNnafMLs1N5CUFaUeeGk/HY32b2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315013; c=relaxed/simple;
	bh=g6hqr+J2pF1c03qptdqCZ+8L3bzLFJeiz0AkDf6Ry0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwfBuqaoMVL4/SYkL0HTqEVm5P8xu1H1/em+Gx+YVXw5Ir4EwDzM37SmkMIm0l+tFTG7ZV3dT2kVSUoCA+ENIkzYQTIdc3AvO8cl/55ELgzHnlMKS7DoEfWXliDlug8LMu9vvhCSNMEFtGmvliQ5yzeh6VPPAot7mhyF8OkFhCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUTIXmwf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2287894f8f.2;
        Mon, 30 Jun 2025 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751315009; x=1751919809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0odGTbRuyJr049EUwp2mzcTgQO9lLHgZa8OkN0rK/U4=;
        b=KUTIXmwf/LOm24GmjMaJpqOSf6VlPITJNyTmb1AMtpLb1CGbrF7Qci43g4CrnDUbV0
         GqDPYrSo1Cr/vi4f52QYn+U9oyzgteMuTEQy6460ohHB2PP5o0Jo4ys2BmFMZyqXs30W
         YHNC4PQ1qryKbG8QyKa8rMarywVehv3RgoYJnrUboInW7rKf/LwCrIZ7Um22S14TonlF
         juENqbtg39bEMpUOOVONP34DuuolC/Rm4BqgBIK+y1JXjsPYlkstQAahHRUamIY2e5s2
         fhMUmQXUMREUzMxTp9saHke5Rk0EjDq1fAlsSPBUB88+O4yxkwhyAaXWBuROI+TkfrPB
         qIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751315009; x=1751919809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0odGTbRuyJr049EUwp2mzcTgQO9lLHgZa8OkN0rK/U4=;
        b=hcGIwqoX6GSmfPW24YDWF7nSPWdxTv53H/PJw3L2NZhZpwZkrNhxffBuaxfdIrqlYk
         Nk9TI34kqO5ac88to/qDSPi3cZsUtfC3yFgjwD4GIDYX2y5g3g4083DWSMAzU0ACz37a
         M7/cgNA2R/6JW0VrQsPBhXdGQIrrV7VDe5eLC0PNY2yKwU4S96AuYpDhDe7zQ+ON4mCi
         uFJJEiFf9/kOYg9//t9iThqTI0DVVBjPnSeDdVQ+gP8DAh5jTA/QrrbwIoLAKiWVcLvn
         4pxrLWgXwpXk+42AdGj1UwTQ5e+jayWVV7sbMr7U6+eySByJHGeCOPUwL/MzVYFtnEXM
         yepA==
X-Forwarded-Encrypted: i=1; AJvYcCUOh3ho5xq+JFZFlnh7nxeAOxs1PqWZAVLcvlOMuOqfH+r9h2d+18U8hNzAQw6ablEFRY9h472narBdj5koO3PwJ6Y=@vger.kernel.org, AJvYcCWSnZDpsM3pZOfLpJwJFIjrCGZegwPMHniWDiNwHwggJR/n+8w/PUolGXmKP0sSsXNPUKn2IsHkg6va@vger.kernel.org, AJvYcCWUFdmXmu8cTm5o0pNYFPyBuz8Q1Px5xUEnUqcg6Mwo7UVodldotH76kkXP5NUwagXHp6szt+rRQKtSVE/y@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuJ0h9daHv2fS5PYZW7q3oqk13VCBpg1ZZsXeMG9Wi8zBDGS1
	QRgplhxem4vn4MqH7Wr23C22O0TjiTORN4D3s+P+N9z/n/seeYzdjkpQ
X-Gm-Gg: ASbGnctVmiagMI1H1lhO6PzdxJ/qDBRLbIOAVwklt4HOnr2Irf3sDrefeg+kxaYwtPM
	eiX4QEe5J+PTCu1I6er1h5BIU1MEtWwz+ovDaXgFkQOhvt0AM73dLtPT1qM1znUe+WfPiUdU5Ms
	HTyLg+l4igur/vH9BbZl3k69zlMQr6oKVJXvtz6RAHAkrdqdmvSD0lxfQEO+UufNHDFdyyP3Lt1
	S6D24/qsLCIzNNFbIWGNtYcuNdz6Xb9xXJnnSTPiaR/4ojyDmda51kolTRMAyQLEOcqYdM9qBQ+
	lbXFscebSADOz8q79N2XAafbBn1+6wUi+KL4p/HQdLd0d4sDfYRy79nGNlqIiFbVQ6V11QMOT2y
	sap3p74lDAR8=
X-Google-Smtp-Source: AGHT+IG4558x/ocshOI7mIikuZNBrzyiaVVFRj1v/lyejyahiKo53X3c1hz5JOh9H5+u5GzFLCFpEA==
X-Received: by 2002:a05:6000:4182:b0:3a4:f6ba:51c8 with SMTP id ffacd0b85a97d-3a8f482bc72mr13259113f8f.14.1751315009254;
        Mon, 30 Jun 2025 13:23:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a065:f77f:7ac4:1c25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5b7fsm148523195e9.10.2025.06.30.13.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:23:28 -0700 (PDT)
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
Subject: [PATCH v14 3/5] serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in sci_shutdown()
Date: Mon, 30 Jun 2025 21:23:21 +0100
Message-ID: <20250630202323.279809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v13->v14:
- No changes.

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


