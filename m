Return-Path: <linux-renesas-soc+bounces-25376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6714CC943A1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B1C1345DD4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49D93101BF;
	Sat, 29 Nov 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m77s565E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694F130F939
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434616; cv=none; b=gBIi8XrIECejDWki6tBWf3GtNpsqAElgmpBhhHGXqtmDZvyB8t97AoGAfEuR0kR/igCEFBG8z3ruXT1iEeaUSZxNWmyWMjPMrCdofXxY0fB6hlySnx6rgDi/pjaR5a687dx4n/+g96hOm7kkm950oIUXqWSQeooXznsM9Ictlb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434616; c=relaxed/simple;
	bh=Jyr2CHVhr92k//wyRYmvtRWJKSE0xW9i+OMuWE/VQ3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+lCDuNk13idCgyF/6gucIpjX0Sr/LNWEXik9fuBn2jZT/NO9BsKDcRkuyATCRmcseDXXnEpj9Gh8R0BqOnP0qKDSadkumeTWLW0G+vAkJIwlqjdYVDsRrNxRnL3Qat/ZhMNyL7LU6AIRlhCbnlAZPgObSQTEBUSYORsYnQ8UvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m77s565E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47118259fd8so24575445e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434611; x=1765039411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1laVFJ5J/2PogvGPArKDBntximPg68iaWIWh3V2PMC8=;
        b=m77s565EkotB4BJCJQBhXEToYm61Mb548kx8KAOur8XI9cBMIFz0ccOG8A1bkMhR3b
         5PEzEqj2s6Jb2whhBZHncBXkrNZVP6HouqllVTw3ziWTV6I+ehlKWkLuGtGFSDF4u+FQ
         nCcAF4sqU9NnrBQMjZQJPmZNnRyhdGtK9jW6D5LigoZ36EvPs4AuAzFlUaSqYdPL9jxB
         Gt2XzZZFUeEl2LGb/enVROVp6NbsebuwUSenRGLc1erbSZ2mokwxZ8jghauzWodB3veR
         JK1puyZ0dCqwlnmHPSd3fqMdxooLvEMgtWZgneZ05Pj/KPGoOa2H8Z84jn4fulKo2PJC
         Ep8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434611; x=1765039411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1laVFJ5J/2PogvGPArKDBntximPg68iaWIWh3V2PMC8=;
        b=na6dIQpJZUB/LORo8nS8x9n7UkK0sZmedQpXi+yMBWCNkPJaIuAN1C7dkdPuaUSsia
         /HooW4hkCglW6gbF2MWCJphJn2ESBfGJ0gbDGuLkFdLgQTaU2cgJb7+imT2P5vOq0A08
         aGfitAZVLmYg9j5e6OVSEi27LSnN8HlEpGmJ2D1bw63NuO3K/Fi0pS9/FXuU1JfKVcG3
         VDYB1MR4jkA5XRcM5yStUzM4x1DmJiio3ow8+vy00DolEetlt2sx84I4f24ZWoOhFhuh
         1ycT3Sem7ZprXIgwP1gIMPNmwiUTqXGlyq3LScwrXyG484jM7dtjJGWQ/n6E2jWiJ4Tn
         iI0w==
X-Forwarded-Encrypted: i=1; AJvYcCVP8F8iyJCSpnGLxWU6D843tlaPMyIxeLMlb3JyRq2RMI+28CFG5vJ9608LaTS2K73eplabsDiRdT2bRTVw1jC3Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+uStwJj5hipYRDzJvwu6sLx0RaR2Sk1F7uCt+dDaXsNpbau6
	HlKBvq9ZKF+4YTHJ5HXYCNCp3y3pS9UxSBbjO97Y7VuQWcnuq+5oak18
X-Gm-Gg: ASbGncv6QsqHdaHg9WXoOf+VLMwv5I4cjgoBAI+sQ5NOridUz2m+VtRhk21EvDh3Wxz
	Vcuer8oWEVT8nGzBABBYLLbqUKen6EIHlLY7eYLXemCUkKzcpk61HhjZALox61DYDVa5LKtCnd7
	zvaYDu1ZorHFAbheqiAH/o++P0WpcvehjfC0y2GsBUV6tPBiL1Db5iAFB8KUzO5s/ORA4G9cDE+
	UhbYrp7Nsn6WrHh+dMEjzp5tQpvgnbVbKVDJicZuLhr0vVXKDaKqYZyN9NU4n53o3Rv12+PJvkL
	JVCug12cpiCBsLZbD4dJzHITj/Jvbl2woWMcCdDCiXXRUAs0Z9sqnfPR5/K8dClb0BJnO5+Pzyc
	Me1kfm78n+uMO4Xx/LC3l1LO2QcgEZRQLmBDLxbx5V0zAqhBlJ6YZ/+C5pnmNi5BF1lGloU7aJG
	lDxsQZckYQn5sfjjLifqtcTLWjoCIsVaBpgYzVIt1NSrK/bA3ZwexxQlK61aPVEYzdnCYml6cvD
	VO/c3cHcWN8G5vy
X-Google-Smtp-Source: AGHT+IFOOPMW+EuE+WoBWDENaBFiI9rdwCgXZ+oiJXrJkuUjq1n/4uLYNcYjwXAPQNmHWmA+/475eQ==
X-Received: by 2002:a05:600c:c8c:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-47904b1ad30mr172572825e9.22.1764434611363;
        Sat, 29 Nov 2025 08:43:31 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:30 -0800 (PST)
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
Subject: [PATCH v5 04/17] serial: sh-sci: Drop checking port type for device file{create, remove}
Date: Sat, 29 Nov 2025 16:43:00 +0000
Message-ID: <20251129164325.209213-5-biju.das.jz@bp.renesas.com>
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

Ports that support FIFO has fifosize > 1. Replace checking the port type
with fifosize for device file{create, remove}.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Dropped checking port type for device file{create, remove} and instead
   started checking the fifosize.
 * Dropped sci_is_fifo_type() helper.
 * Updated commit header and description.
v4:
 * New patch.
---
 drivers/tty/serial/sh-sci.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 28d665a9861a..ff5459c449fb 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3549,16 +3549,14 @@ static struct uart_driver sci_uart_driver = {
 static void sci_remove(struct platform_device *dev)
 {
 	struct sci_port *s = platform_get_drvdata(dev);
-	unsigned int type = s->type;	/* uart_remove_... clears it */
 
 	sci_ports_in_use &= ~BIT(s->port.line);
 	uart_remove_one_port(&sci_uart_driver, &s->port);
 
-	if (s->port.fifosize > 1)
+	if (s->port.fifosize > 1) {
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
-	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
-	    type == SCI_PORT_RSCI)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
+	}
 }
 
 static const struct sci_of_data of_sci_scif_sh2 = {
@@ -3917,15 +3915,10 @@ static int sci_probe(struct platform_device *dev)
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 		if (ret)
 			return ret;
-	}
-	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
-	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
+
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
-			if (sp->port.fifosize > 1) {
-				device_remove_file(&dev->dev,
-						   &dev_attr_rx_fifo_trigger);
-			}
+			device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 			return ret;
 		}
 	}
-- 
2.43.0


