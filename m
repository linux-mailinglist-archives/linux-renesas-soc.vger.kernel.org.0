Return-Path: <linux-renesas-soc+bounces-25108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B286C85A55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6ED835182A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3862232861F;
	Tue, 25 Nov 2025 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyjcWFeU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE146326D44
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083202; cv=none; b=FzZsApcTD9pbYgJOPqRz/1sosSfvfuKVF4fb8CUyW9slRlo4mrSgRI/N7QCXyW2/FGWgVj8GKknEMGGGAdFGuK4I8taiyWz4zfv2x1XkGB5jLtHCadJVOXNtjE3GkUL3CK/tjybWUeCriSixjqTUw3ND0yrpiyor/HSuziUJ4q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083202; c=relaxed/simple;
	bh=CSD7kFI0wySJ/AlKIEamPA0YB45z8JOZMFeKgaJIhpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLmdSyS9DILwf40EKRkJ5pbbDLf9ED0o/f1VsklqArrJkwwy6tN5dgMTzE2oW4ZJSlrW2bK+Ycj4h5DCu915V+cVH5wK6AGowaS9l/0ZiCLOsINJyhG+zlmWUBeUnh+8/tGxusOEXbjrWy9jshpfgc0IyfNFDtV2S3ziYahDt9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyjcWFeU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so3714732f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083199; x=1764687999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQziduuM6JBsyM6+4nJEFa2lBvhbFNVVerLMQJ71dvc=;
        b=NyjcWFeUU4Y5gUNqAE669LPveQTx617VC0Oa3Yx1u5fNOcZqkDTI7EuTIsT1dxwwLy
         0jbBIoW82YWN/CY94mTcOPvwWSdokCG0dbEnqluzEkKPSGLKnD9QdcIfTmE2n4eb9SJS
         FpjahswGzoul3oTnlswHr/cTQpZajok2YOMwSg4ZyoU3TJ3pA5Ohzvr/ek1XLZs4KNCZ
         MznJAxWbL/tWusqKeOtDqVZoAtr7yXU40z5LlWWkAaU3CfysOTpmc+CGKTLWig6N6KbF
         +UXNGuXT9Kc6p04hpdGw6AeTk4kH+64bUN3imr6SfZWp9FV/0jlaAPBHSJ3F4KpgxrSd
         vmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083199; x=1764687999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cQziduuM6JBsyM6+4nJEFa2lBvhbFNVVerLMQJ71dvc=;
        b=tmMLikWI/30GyByTr3RHZ5nWHCODguXW1q7Kp1esae6kCKEoGEKO1P5IYWPLgu0ro0
         9QwXHbTTyWWR7rg65lUYRNRbMquuaZr2vUE0/AMv233tmyMsrobiPaSyGSHmVfNT5r3n
         VnzguF35tCqtDAg8keWopLLdt7cPaxa1qs2WDH98+nkoMpwv/pBlfKb1h3Zw9F+irkKJ
         04GL8nIxLSqz8GElYzxwESD70oidNJgs7j2qCUx8DCSYC41sY0mPFv+vNHiDIQSIZB3k
         RNtt1DVzdZqImB4CQQJ2EGImAvLQn5pDY23omzykam4T/dI0PSLZN1a9qh89utPx2ur1
         +jeg==
X-Forwarded-Encrypted: i=1; AJvYcCUFHEgJPnl5TnfEJrcCOEcUw6fW6bTzXjjkKwhlzKFfRWAdTvOAklXQtfK1q8PrsnWFT6yTYP5D03Ew6qFOM5V5uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxghtp1zM2AgGAZOFKH0JLReY7BXOlgm92lf7bYXf6eefzcHo+w
	5wLAaCnp+IqkOEldCaY/ZErApC20gfWizLoYSylOldM+tQvvxqEh2k9c
X-Gm-Gg: ASbGncsphjdMWk7mBiKLvhqxo34PJO1Ojdk6jFpVJK19ypllZEFjUrczN0Mggh1s/pI
	MNd0K2/1YpPVKGAgEL+0yFibex6lMnqQaK6hFQZ9xOXo3lmI2zqhGaGvmn7M9wMEPg+Tu1cpmbV
	6SBmjv9EupXk7RlCTcgsIa2myUHXIzXooh4Q1R3r84lrHBnWrJdxgnluJGismAOlN1b80equFyC
	Vtg5SSqw4TFL6pXI9cURR5XAwfU2jnXA18ppISNViolahjfvWh/V2GvhJ2q0+D0V/UJytt5XD4W
	hDXX8jOoP5+ucyjqUzeBtnm0CsPUeKAI1CX+pzE+azL273BUjITvLZRIGB8yZLLq1c9QZ8ON86U
	OcpAfRNbmUaZ9T9IgKafpdUSy0OIFAHhNIq4VIreGLF7ilZ9O3uBYcChdufKl9Vs3gkJA4awGQd
	PfSjwPL6VPdxhkraqMIS+5vQ1DUatvLypBbWlWdrRJnW1S4OpF+8MUWSxgpM2QfPRyRit4Zbg8k
	A==
X-Google-Smtp-Source: AGHT+IEjq27xh/vO088NXc1xLod8BK5SoqS4WSTemdISNzAYy9ARbRUfoih94uE1BYs9/hR5op/8tA==
X-Received: by 2002:a05:6000:4014:b0:42b:3825:2ab4 with SMTP id ffacd0b85a97d-42cc1d22c7dmr15817905f8f.52.1764083198699;
        Tue, 25 Nov 2025 07:06:38 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:38 -0800 (PST)
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
Subject: [PATCH v4 04/16] serial: sh-sci: Drop extra lines
Date: Tue, 25 Nov 2025 15:06:06 +0000
Message-ID: <20251125150632.299890-5-biju.das.jz@bp.renesas.com>
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

Shorten the number lines in sci_init_clocks() by fitting the error
messages within an 100-character length limit.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * Updated dev_err_probe() in sci_init_clocks() as it fits in 100-column
   limit.
v1->v2:
 * Updated commit message 80-character->100-character.
 * Increased line limit for error messages to 100-column limit.
---
 drivers/tty/serial/sh-sci.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 56d6489b2a7c..4dc5b51f01da 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3186,11 +3186,8 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			return PTR_ERR(clk);
 
 		if (!clk && sci_port->type == SCI_PORT_RSCI &&
-		    (i == SCI_FCK || i == SCI_BRG_INT)) {
-			return dev_err_probe(dev, -ENODEV,
-					     "failed to get %s\n",
-					     name);
-		}
+		    (i == SCI_FCK || i == SCI_BRG_INT))
+			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
 
 		if (!clk && i == SCI_FCK) {
 			/*
@@ -3200,16 +3197,13 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			 */
 			clk = devm_clk_get(dev, "peripheral_clk");
 			if (IS_ERR(clk))
-				return dev_err_probe(dev, PTR_ERR(clk),
-						     "failed to get %s\n",
-						     name);
+				return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s\n", name);
 		}
 
 		if (!clk)
 			dev_dbg(dev, "failed to get %s\n", name);
 		else
-			dev_dbg(dev, "clk %s is %pC rate %lu\n", name,
-				clk, clk_get_rate(clk));
+			dev_dbg(dev, "clk %s is %pC rate %lu\n", name, clk, clk_get_rate(clk));
 		sci_port->clks[i] = clk;
 	}
 	return 0;
-- 
2.43.0


