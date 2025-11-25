Return-Path: <linux-renesas-soc+bounces-25106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C02C85B09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4E784ED685
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4188327C0F;
	Tue, 25 Nov 2025 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KITUXPaA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678B326D4D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083200; cv=none; b=NJceGxMrTwYGd5Afd7Fk4D71Yung2y04MdmPSWZHiqqp+ItUrVv0zg3+BAIBtMVFpuC37ipdEbKIpDZU9H7iUue2XgNrTRfAQ52S0MGY1peiDvJVYe2JaywLIjPV5OoBkI5nBRF+UnLrNO9Iz7r7v7YcqorTeTvMHjqTxKGMJhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083200; c=relaxed/simple;
	bh=Nh3Ty6TiX7FCEIz6ikF19spmIxiE8SBKU0CTyBwe/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R992hKyXxfPtJ96VZoDRPaZimD3dQlEa2W6V/8K3O0IVlTjAR2Zk1QVUd4CWe4+HXPpb24L7ANJi69y+WjxUPUQdMQDVpa72sENnY+vzWgqENo5xp5Y+tFdfdSApxjUqkoVV4YtkN8XYn9bGLZ6QB0ki3lGhGdX7rn1tx7vbL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KITUXPaA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so2966904f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083197; x=1764687997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsvzpDdHuaCCHjJpYBsgV96uU86b6iPp7/i436ekO/M=;
        b=KITUXPaAPaNEjZuoZ9vUCvYuqHolUJJqjZI/47FnxXC+Ecl/tBc/RPSMEzm4eAVHKq
         jSWTfQ6kt8kMYIByk96Fb6b04yJsd3jvOq4aCCJnUMW/t2owUa3ubP4zcZMAtzS6l0pW
         ET9fvxoB6E+Jx4btB/otiTfhm9Q2TLK4gk7x/iZBv+yqXyquH+64H6uicpC8M9j6kYPA
         LmKlPdJXZXfT23ktaUtLtTqmC/Uq0zQg7sC+5XopPU1s4Y8WB9dX0aqeDJTxDzca7Qxj
         SuTAOHNkFx7L/dyxAB4sRx20a+xBE7bN7+o7z8uF5D7vUArfQQTNdcukuycMTq7s8vbE
         1F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083197; x=1764687997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LsvzpDdHuaCCHjJpYBsgV96uU86b6iPp7/i436ekO/M=;
        b=SG3gI5LUkeotWjk3PE0nIpjm2wNeT+9KJmGUktGnEJtGD4JNqzAXlnQhZLntL1AiOr
         Dbz3UdJj6f8EXYwgBtDf1tdR9HgWT/DiGMi3S531w6mTqhRpa0dtNvfkjKtTFs5i4JPM
         orwilWUzTii0n3I6Z7rQh6EbBYN/+Tw27+wNvX0bVzyLieTAqp1w/nY17yFCFcu/qZUW
         vtLLZ2U+bJP/DzRWxPwsaLyDMgDEvxiuF0M3Xirn5eUuh6Ot4oVAIEd5fOManBahV5Mf
         IjKODIGmovkxs5shTfk8NOX2p6Pro7BWpkRxA02WlnreuR3sLC+qm6DW2MUEQhFmXCyD
         c3ow==
X-Forwarded-Encrypted: i=1; AJvYcCWLTMo0hPwU7AdSSTo/rPZDEPfJpTzUw4Mz85eCVKVo/oiog1T9F88gxOcISfDORKFQIN/uw/ooO5SCtX4H7NPEVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcDdMPwKWA8vXxHBUw2/gusN1DB7Emc6PaDLJNywgjh5HfhhW
	zZeerNeSCw/tdV+9aWqYzDwjPuxbpO+HBWqOlzra/lxQfe7uPkuxTfzC
X-Gm-Gg: ASbGncuhPtqXZyQhZjH1vYRhDWoulnAVXr4RrFSb6QUf50fRd5ULY10TjEHeCi6eIDa
	zT4jev9eFsnynaX8RYgGqFxxkmjRsel2XtUib6c7g1NFE7Ta0nh/5qOBATeprHj9pS5xUQ7Hkv4
	4uKb4J48saZsK+10BZksKrLFr4x7zxW4aHZKGrfqndVN7fBLh2chvUaetfqPmDZ4NfXp3vk7aul
	bFEKIfDDgvoDVc7GQWI/b6qxPqIxcWCSbPASoPaDmQPxZ/YiEQe8Me6RxmlKXrWKGAXC2VsKUFr
	dx6WtHRIedMdK5EzlnFaMMYdG46TDP+q2tczu7jgKyEMx2RJz/7HEcJow8kxCUyhy39578Lti94
	vPOF+zsMS1aPpwesC67tn4TldeWvspQ4ilCso88pTojAC27UsF1VUyG6q4WUKcuK3Ob8nqJTA9D
	IGDsbyPdtigHmSmP6v8nNqkxR+S1fCB4kUu5c7q9zjmUfOVbjlTZd6q5cUogQduJMbHw+H8Yqdk
	g==
X-Google-Smtp-Source: AGHT+IGQ2lrJjpd5A0Bi98GjwpO8U0bS/285r/RkgU2XPW9IQYDqpZ5dHzIRnpjdKjTjaKMviAxfTA==
X-Received: by 2002:a05:6000:2508:b0:42b:39ee:2855 with SMTP id ffacd0b85a97d-42cba6528a2mr21269154f8f.8.1764083196944;
        Tue, 25 Nov 2025 07:06:36 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:36 -0800 (PST)
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
Subject: [PATCH v4 02/16] serial: sh-sci: Add sci_is_fifo_type()
Date: Tue, 25 Nov 2025 15:06:04 +0000
Message-ID: <20251125150632.299890-3-biju.das.jz@bp.renesas.com>
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

Add sci_is_fifo_type() helper for SCI operates in FIFO mode to
simplify the code in probe() and remove().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/tty/serial/sh-sci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 53edbf1d8963..56d6489b2a7c 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3546,6 +3546,12 @@ static struct uart_driver sci_uart_driver = {
 	.cons		= SCI_CONSOLE,
 };
 
+static bool sci_is_fifo_type(u8 type)
+{
+	return (type == PORT_SCIFA || type == PORT_SCIFB ||
+		type == PORT_HSCIF || type == SCI_PORT_RSCI);
+}
+
 static void sci_remove(struct platform_device *dev)
 {
 	struct sci_port *s = platform_get_drvdata(dev);
@@ -3556,8 +3562,7 @@ static void sci_remove(struct platform_device *dev)
 
 	if (s->port.fifosize > 1)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
-	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
-	    type == SCI_PORT_RSCI)
+	if (sci_is_fifo_type(type))
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
@@ -3918,8 +3923,7 @@ static int sci_probe(struct platform_device *dev)
 		if (ret)
 			return ret;
 	}
-	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
-	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
+	if (sci_is_fifo_type(sp->type)) {
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
 			if (sp->port.fifosize > 1) {
-- 
2.43.0


