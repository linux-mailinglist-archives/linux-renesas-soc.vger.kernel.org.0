Return-Path: <linux-renesas-soc+bounces-24644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 31563C5CB1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CB653471E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D7D31329A;
	Fri, 14 Nov 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQrYut4c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E3631328A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117528; cv=none; b=rRfT+RjeeHIWYlHkfEvR36y1jHt2gA1Y4GbcfAEOt3TwnCUN4FskUnjpOljmnM38t+lVGJIXSlT5vPQPHIk7Fv1960RiiATOOJvQa+SzA1fhLL0SrjchmX7FC2lmIBy8/Y2qHFFtk98O9EWH4QArJCfp9eDAwC5P+DRXZ/T6tzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117528; c=relaxed/simple;
	bh=iDr+sjQfrHDp3DxxIo6LAV+CM7T5ZIZH8WpOIp7Dj7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+wVA3gK3Nmeu3aEIlKhY/6FoPWhXJc7irPIuiyBUaGRM5HeP9/w5Y5mAI7vkU4zFejK0L8//VcdTqdnMtMVjkc/sQChTRzD1gKwWpCIkoOa6JmiFqAv28Gn0TDzcZZmR7jC5GTbCgglj4soJZkshDmpu3EudiWMkPOTUqWT4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQrYut4c; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1468224f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117525; x=1763722325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE9iX1ursNOQzfwEha6Mc4rDjGJl4IqWi+8gkqilwc0=;
        b=MQrYut4chTP6Ud3I4s6YI2vVmEAGucr7ICqauo98zFsEDe+mpr8DLt04JRyE8uyixx
         kxSaogSkXd99wmuv8U6LoKmocHh/QTuGutEcQTHWqU/5GSw+ybQp1tnHSlUG/cu27v+A
         5dfzUHbwZ4C0106KjaOYUk2vHxUW9fVAlfxoy2Yn77NBrjXNWXHSjtsQiDr7wQb2c+Ii
         nLmctwGVhPTabZN4ncM3k3nGMEPY9ufWs2qZa31CR/Qmy9uA4FJBFOtQNukR7fzQQDZM
         +DuZEZ3G88QLJc6DBbDWGglm9ORqX9vrOG4TmU/B+jYmiedxmISWQFHFfkwNty9KG4bn
         LLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117525; x=1763722325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sE9iX1ursNOQzfwEha6Mc4rDjGJl4IqWi+8gkqilwc0=;
        b=BOhnYpHop365o4yB/lf0rIsEGXxZzrMsjjTkly+fh2QPm/GJ31JzhDfeCii7uEPy7c
         Sk7xIYN9w1hFiNFqRkfm/bw3VOByY0+rbzmSUfeQJ792Uh2FXnEm9jWJ4CuzKoezFdF6
         XKve98pSnpOGi9peOPRZcsYBmA35Y8qGkOnMGe7FEmc5WaNceCL7n7W2MLR37yofqsnO
         4xSTGDMzaizw3V/LvGaeiYf4FKDLNzBjX1bTWKg48kNxFozVrUmrEA08MQWwQnauTqYN
         flXhoKsWgM47pMusUCBiYuaDM01GSXj2zSf+nXPlyZpB+jXzmB1Te8aEVeVSkk8bkdDr
         uUcg==
X-Forwarded-Encrypted: i=1; AJvYcCVjRYko21A0pbaKPZVr4Dit8j7YA9xCextFuCm6blPz548F1R99OD6OGi4leJ71nfAP64ouM/zsEcMFJTsbjsYo+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsyPPk5dg1gzh7ajGRCL1J3XAI3m5l0RRUxM5LX7zTtUmUnDWX
	6X2s/aLTq+UfFcgyFVmNaXm6CTziL6BFDvyCRLmc/sZ/XDqlqbfb81O7
X-Gm-Gg: ASbGncvLHZN7hl6eUeQQaNtRrEIKQn9A4LRhEfVzVzFb2mB5Y9/z+WsQz9DD78LH1XM
	Ig3jn5DVLSXRIKkRd63be5jZO27jKR4AcHiUXdvA1o2tlsEjr5DJMiVd9DDfj7H4nRooS46AGFM
	4VpuRxay6Se2ZY2j5Aa04iSXa5pX3nqwt65/oA7lWf28lDJCoUE/7ZHXPNOclPjp1jaY0zDX8Q3
	mxPj6MOZ2KzgLPw2WTH/UVxAf4lpA9NcGY4WcsB1Dii4I85CSS4kPw5JnWT0Rh8u6p5FwE5GIuX
	WpizDADV5MTyfw/RwFUvWZfKDkOaO4NHwiwnsd2Ut88u0ESDjtp7uaniIP83+uyu0eOapOjZ3qD
	C3xAICIRbRHu7CGEyFp/kWHgTD12kSZO0DtbmPuVdRNxMMYcuJ2HDKpFqwLIk55iT9bDHg4VJh0
	L5LbeacR76qEFiiEmB3ifyA/WDDGnNCiOeiLLeoJOHwOAt70w2tXjP2kJ6YR2Txs6vmszD6ew+9
	ELNyt/BQv/K/F1UY+emM1ThFH8=
X-Google-Smtp-Source: AGHT+IHh5EhVhpsPi+K/X6iNqc6qBAFlJJgODP+ZykzrObwqlrD1Pj83VU22VCd8tYUDjSmwsdu2Nw==
X-Received: by 2002:a5d:5f47:0:b0:42b:3825:2ac8 with SMTP id ffacd0b85a97d-42b5939ce2emr2119323f8f.59.1763117525277;
        Fri, 14 Nov 2025 02:52:05 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:05 -0800 (PST)
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
Subject: [PATCH v3 02/13] serial: rsci: Drop rsci_clear_CFC()
Date: Fri, 14 Nov 2025 10:51:11 +0000
Message-ID: <20251114105201.107406-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b3c48dc1e07d..9681e8ef4bfb 100644
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


