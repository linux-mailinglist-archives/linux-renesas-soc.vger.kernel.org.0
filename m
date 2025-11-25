Return-Path: <linux-renesas-soc+bounces-25114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0957CC85B39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C7B24EC14D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3007329E4E;
	Tue, 25 Nov 2025 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQWPqBOo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2350329378
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083208; cv=none; b=DU89yyW+J7QIfXAotr/vvb2V1B9ozxFahnW51sOc7KuTHXY49P6I04+dBQEPslhFH6ruCRvlmakm5/bVbsVSxDwPwanHXX79KOvEHU27ykg67V7hiwbxnAcE0iC64vPIL6uFnpWmgmV2VUjSsXCxPC/+E/Et+Sla7gcohZ+9e80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083208; c=relaxed/simple;
	bh=Et690Nyk+pHGvb5l80zTzY2XD8G7Ab7SHaBdICOlCHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dykUvLHIMHEZJu3khN1lB1RMaUuP/KxbbWs05uIPxVyV8tEEzmIUC23UT7d1l5Ga/H85iuZAygnIQSQ4rbz5GeriQ3NrU8+G7Cf/2WhBNexTEsrGPhi5sLNMPaxceivVJIbDkA0TWpObgyUZUxG1PxNjSGreFFEOxBqzL4B4yck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQWPqBOo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so3190223f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083204; x=1764688004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uBC2MlE1HUaPDZb990/KasBIbCj5RriVOgSLly0aqY=;
        b=DQWPqBOoJqbCl4InN4YsYk4GG0gcpbFXaVbWrzpY70oq9QWn6AC9I4FcdYmSQ+PHUI
         TVHbi+1DzZVhuSyo1p+fg3ft6Bd3YeTyB2LadK1U/LFnRYIh17RhQbBHujgpRwiEIi1Y
         grzcuPydxVzW/1dsBBSIQbSjmzOMCL8PbTvwbuyrPnC2GRTY4wCJI9XYO8qnn/AlXIG4
         8moDXTCUvyZYGmlboBT1Bi5rTSLqDVw7N4JlZviAGQIPHb1AtLP9NkWkOJdUN9P8m9/4
         eJZzGCS7vhz9IBkMx4/z6dP4X+8PTHs9XpHDiu0HM+dzyZGnp/XsGndA/Brdd523hi1m
         SX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083204; x=1764688004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7uBC2MlE1HUaPDZb990/KasBIbCj5RriVOgSLly0aqY=;
        b=jdUayPoXX8F4lTQfwFTUAqOgXmWrmauWQf3KCGyajiu2uvSS53xd17G+S1Fpm++BJZ
         85sLAP6ijf3RVp4YHndTh/WpZoX2hSw8dydtJKEuzXh0ck4IH/5wcOpBREb2dCQrWq8M
         UsKunkfI9t4OiJjzKknUuahLovBPVProAZxxyjILMguQhBMvzx/HpdUXT3W+COg5TJMh
         w0Ez3nDhqRSypVhO3OA5BzD9LAfpA1vaEDI1iznZr6eQixEBm1PdBgRDcmBsb3GJ+kW7
         b+MJKvDvYrmC90SpayWRWMOK+5gwGluc+bbAEMlyPz2HdsrHPMwua2FcFo/6ZovcVfJ7
         52Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXh47bIXm8syeNPwxcz3N3+GuVcKgVE87JQtMZEOFK2G47hPrne/VS+zU89UZ6jhc4S58S8BOjgOf7c1g+CH/ugoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyucNXhf0XDFM4t5Y7d/jfdDzgzWw3tx9YdjgdWdrp0f+FCxFBD
	s3OZg+KdB5H5DmZKPaaSNh6jyEL/xy1wc9CuqiL70h5Py8fWlhLLdD1R
X-Gm-Gg: ASbGnct3sAWq/0wSGbVpNSAmn+SCp/7hfIRn8K+U+ggdDtZXZzfoBEf5sMZ2471q+MN
	4ICmIL3gzClZ8SqJt23vuiboiwNw+eG1a/wcfLBVygbmxp4JCJPBiykhhUX6By72SJsqOtuC1gp
	SJ5h1NQ5i0UlUoHhrDhEJAMAiv2cbfHSyQpJ+bP4eJX1Fe5VL9CwRrB1y2P2Rj7HXpeqwNYJJDD
	G0TeOqA8cam1JHVD4wUXyFIsEWIZWCPE0nwKaopqKPp2V0I3gHYi3kTrbIC4vVEI6jyPRQFjPxr
	IpuUQf6Gyxuokhu3kvdqZIfVg4MNB95AmgrfWoFyA1dJc+GP72pVRpXs8uJ3wN3g9Xid03ZQUTn
	VjuEJWGWFK9ufoxWyYsUPUxsa8ovAmGtIIRepjjZ/67fSg+6cANN3wB6npYBLTyJ0VzFFiiIcP1
	89SPlDMhHSOKSMP4S8f0OKudtp4rCImAwgrQJmnayLbP6EsBUDtxsYVU1JtWSF9aEO1vBT2gxrc
	jgL+us0hB7FFo0a04X9omrwzIo=
X-Google-Smtp-Source: AGHT+IGhwA2qdHgjK6YzJJeEkagwt4swWh4uBsW/k/KPMyocV9syebEZD5VRePRYGEoDb7M2JT1+hg==
X-Received: by 2002:a05:6000:1866:b0:427:580:998c with SMTP id ffacd0b85a97d-42cc1d0cf60mr16904982f8f.43.1764083203740;
        Tue, 25 Nov 2025 07:06:43 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:43 -0800 (PST)
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
Subject: [PATCH v4 11/16] serial: sh-sci: Add RSCI_PORT_SCIF32 port ID
Date: Tue, 25 Nov 2025 15:06:13 +0000
Message-ID: <20251125150632.299890-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3E RSCI IP has 32-stage FIFO compared to 16-stage FIFO on RZ/T2H.
Add RSCI_PORT_SCIF32 port ID to differentiate it from RZ/T2H RSCI and
update sci_is_rsci_type() and sci_is_fifo_type()

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped enum RSCI_PORT_SCI
 * Replaced the enum RSCI_PORT_SCIF->RSCI_PORT_SCIF32
 * Moved rx_trigger update to later patch.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 1 +
 drivers/tty/serial/sh-sci.c        | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 1b9480c7f4cb..abcd5bcc7c36 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -8,6 +8,7 @@
 /* Private port IDs */
 enum SCI_PORT_TYPE {
 	RSCI_PORT_SCIF16 = BIT(7) | 0,
+	RSCI_PORT_SCIF32 = BIT(7) | 1,
 };
 
 enum SCI_CLKS {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 08a1898f14ea..9afc3b8aae91 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1184,7 +1184,7 @@ static int sci_handle_errors(struct uart_port *port)
 
 static bool sci_is_rsci_type(u8 type)
 {
-	return (type == RSCI_PORT_SCIF16);
+	return (type == RSCI_PORT_SCIF16 || type == RSCI_PORT_SCIF32);
 }
 
 static int sci_handle_fifo_overrun(struct uart_port *port)
@@ -3548,7 +3548,8 @@ static struct uart_driver sci_uart_driver = {
 static bool sci_is_fifo_type(u8 type)
 {
 	return (type == PORT_SCIFA || type == PORT_SCIFB ||
-		type == PORT_HSCIF || type == RSCI_PORT_SCIF16);
+		type == PORT_HSCIF || type == RSCI_PORT_SCIF16 ||
+		type == RSCI_PORT_SCIF32);
 }
 
 static void sci_remove(struct platform_device *dev)
-- 
2.43.0


