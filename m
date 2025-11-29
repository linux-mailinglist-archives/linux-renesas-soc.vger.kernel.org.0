Return-Path: <linux-renesas-soc+bounces-25384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BADC943DA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C1053A5AE2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1B030F94F;
	Sat, 29 Nov 2025 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsM05OYP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51F3112C2
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434622; cv=none; b=sQ+A/WqO+JK3E3YDdu9S2Ck88/fhnUL5NIXwHzO6rNuYFu6jZcUfLHHwwgG+v+2tDN9yeqEW4Ri4OPxWzBj3YoG3kAP0yVuJaGy8JnAT5WUaVVmHDvgTMFK10GTUNJs9Jewwvzz/QPxsP+LMB7D9P+ll4TwWEU/2Vl7qDPLWFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434622; c=relaxed/simple;
	bh=YmCSx/5zP/xv39yO1GxM96Pkw3/b6e+V34jI5TfF2ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0RGvJOpcoNE5twKEqZ1IJ81vxd7BN4isbqUXoLrJjRwmtg2mZIiig9RNCZiB2O/Tvn8hidQd5Ze3IiyeSatQdjqESAJE8+kV3Podj0na+/DX79uENAshUoja6fggowXKTxzCklnU9q6IPxxfIwKwA9djoMsNn5teXngkzRk2uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsM05OYP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2e50c233so787f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434617; x=1765039417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCds5SL6p55Ece6CoMNTKlBAZwv4gWLV93N5BoUx8oQ=;
        b=EsM05OYPDTEyg3fjY2TZ7HRjzESe6KWkNnc7oBEQ6MmPugcQUZc7c8T1bxzsiJGuhY
         9Y2SR6R9ixsBDpBUJChWV+k/+legegkdhy4K1cM8xbaUefRQpBkS1i2pWy2eUmiIuNrs
         H+DrQjzTW8Zz/8ghMUsvZNilqJ2Pofuwb6m+oWajqv9kUzCUaypisYxSVET6ycgI4vB7
         JzGG+DwOuGjcQqg2IaqJTLQsLaF+y10XGx53oFxzFNbe9sqrT5Cf1k6hFrPb87XBFDgA
         GRIZL8Ggrz4xp3dGaXSMqR2k6KRtmfis+zgosOnkbDdd0C+lpAI+oe1ocfNT6dn3j32o
         Nbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434617; x=1765039417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCds5SL6p55Ece6CoMNTKlBAZwv4gWLV93N5BoUx8oQ=;
        b=DBKKxgjziCWWM+wCEwwZ7HcX8Z4axZxEviara6GFBm6s3AfL/zm60w60WaiT9Kexa/
         PCi82Lbl5vRvOb9eYH/+uly8DeAIzhQJSytZeh72zECDCYUIFJwOzo0sID5O15XqE5yy
         xh1eL/jPHCFlxcvHphG10wneTuGjzI9GmQaQrIvGnLtd+ML/EekybMEdIrYjlFeAlUij
         UTaB5wHpJ/XDX1I0FhjCX5ndWuydSfloMUOShUg/evd6YNQr/nPOmcSIuBq2qRj10BDv
         fOvAi76LiZDL2Kmk31N3T+0jH51KJWdpt9o49fCOwLnIdUFm9HlyZ3LEi4TE/GuD0qc0
         jZrA==
X-Forwarded-Encrypted: i=1; AJvYcCWrYuw8JpR1YPw/2Mz7VZLq6I8vSvrqfrBVg5E+uG29ejc2GdqBpwWuMvy/XhdMJ2/0S/Xo/pqWftfa+/EhZDhnUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRe/DlMmzSVrPN11M1NydaO23W/KfiRzdm23PzIFIcegTeZqxQ
	ronBVESaX5uvth79T82YXU57HZYiphEK7MgqpGVoCZ/Ni/kVMopSX32w
X-Gm-Gg: ASbGnctVfXG3fMEhuihk+Kmkl5BZX+V6bl8/MDZOfk6KBikQ6jhcM4c+T3SOwStQRVn
	emUvs2+sVlgSkfR6Ed/Z8AmsAttb7sztGMT5pIfCxy5KlPzX2ESQj7bl5W/1H/rM05loMz+z67z
	PiI13abZxphNVelxUcQQ/hYBJpwoJrnpxNrl2ruicgX0m82gJzYwlv8Wd1mUjmofbK4yZE7p7RT
	8p3gBb3x0S+V/d7x84WKScuHeeoYsbbs0cTxTaPJlOz+IMo3AfJcMvYQwM35gQZsUNzdiXx4heo
	vFaEnzoxLl/9m13gXdLXL3fRg/x8RBfQbBtP+K8hUBsrUoOGgeyh+n7vFBWNQExvfXnRUU8CRjm
	3lohqDKf+Ae2XPyS9P0qvHSD9ZogMMTcl7+Z82djdCzHKlHJ+W6+EanSDpQBWZI3IycTrZfm+oa
	PJFcosNfLsxAK3/W8Yc3gx2W/6B/sGybHi0ykcCGpTl0cKFlQLZA/vXSk1xuwPkavdIQjrh79b1
	zSf2KZHQI0NzrB6
X-Google-Smtp-Source: AGHT+IFtzNqcNHQfGjKyo21/21zJkuYtEeH39fIKHX4otYIWX+r0NISKN0ppBUXCX+9THLjyTrnUgg==
X-Received: by 2002:a5d:584d:0:b0:429:d391:642d with SMTP id ffacd0b85a97d-42cc1ac9a9fmr33425676f8f.5.1764434617297;
        Sat, 29 Nov 2025 08:43:37 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:37 -0800 (PST)
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
Subject: [PATCH v5 13/17] serial: sh-sci: Add support for RZ/G3E RSCI clks
Date: Sat, 29 Nov 2025 16:43:09 +0000
Message-ID: <20251129164325.209213-14-biju.das.jz@bp.renesas.com>
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

RZ/G3E RSCI has 6 clocks (5 module clocks + 1 external clock). Add
support for the module clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Replaced clock name of RZ/G3E from bus->pclk
 * Rearranged clocks tclk{4,16,64}.
 * Reduced the checks in sci_init_clocks() by avoid looking up clocks that
   are not relevant for the port.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/tty/serial/sh-sci-common.h |  3 +++
 drivers/tty/serial/sh-sci.c        | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index abcd5bcc7c36..5d30771278b4 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -16,6 +16,9 @@ enum SCI_CLKS {
 	SCI_SCK,		/* Optional External Clock */
 	SCI_BRG_INT,		/* Optional BRG Internal Clock Source */
 	SCI_SCIF_CLK,		/* Optional BRG External Clock Source */
+	SCI_FCK_DIV4,		/* Optional Functional Clock frequency-divided by 4 */
+	SCI_FCK_DIV16,		/* Optional Functional Clock frequency-divided by 16 */
+	SCI_FCK_DIV64,		/* Optional Functional Clock frequency-divided by 64 */
 	SCI_NUM_CLKS
 };
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index a63370f22574..5d7e78f95c70 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3172,6 +3172,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 		[SCI_SCK] = "sck",
 		[SCI_BRG_INT] = "brg_int",
 		[SCI_SCIF_CLK] = "scif_clk",
+		[SCI_FCK_DIV4] = "tclk_div4",
+		[SCI_FCK_DIV16] = "tclk_div16",
+		[SCI_FCK_DIV64] = "tclk_div64",
 	};
 	struct clk *clk;
 	unsigned int i;
@@ -3181,6 +3184,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 	} else if (sci_port->type == RSCI_PORT_SCIF16) {
 		clk_names[SCI_FCK] = "operation";
 		clk_names[SCI_BRG_INT] = "bus";
+	} else if (sci_port->type == RSCI_PORT_SCIF32) {
+		clk_names[SCI_FCK] = "tclk";
+		clk_names[SCI_BRG_INT] = "pclk";
 	}
 
 	for (i = 0; i < SCI_NUM_CLKS; i++) {
@@ -3194,6 +3200,10 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 		    (i == SCI_FCK || i == SCI_BRG_INT))
 			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
 
+		if (!clk && sci_port->type == RSCI_PORT_SCIF32 &&
+		    (i != SCI_SCK && i != SCI_SCIF_CLK))
+			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
+
 		if (!clk && i == SCI_FCK) {
 			/*
 			 * Not all SH platforms declare a clock lookup entry
-- 
2.43.0


