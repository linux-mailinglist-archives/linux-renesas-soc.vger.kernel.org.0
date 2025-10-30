Return-Path: <linux-renesas-soc+bounces-23916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD902C21969
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEA0E4EDEA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D5036E349;
	Thu, 30 Oct 2025 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGe/LOP6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3AF36CA9F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846936; cv=none; b=D2+yPmHy8N/hYvyy0Vs583CmboYdJHLy/0XICyjNMi7ZlmOvugz2aL1/6zy7VehmtkCHfmnl028prRgaLrBgUjVFmO2N3bjm9nWmYomehloDSzttDe6HK+1hSnXg6mxugz4qZbDujenYYDsOagcKQe/l5q7S24AGRkbjNMYhuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846936; c=relaxed/simple;
	bh=hRGcrf757tBUlPVJghD36FxXRGKWF+Ddzd5vihoN5uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9k/cmaRShtzcq4xyQscbVt7j3fFlLvhheG4sON4aw6E4w24+lqZKMr5pGwEe97sxkLVYrlisddkQ3mxR72fdifnwlJNeD3lP5b6rNLtXw8JAU6X+ptHILilsegpL5bXao92bdInCoi7XcLk5Eex6MuoM9oDge7jeHkJ66Faj/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGe/LOP6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso12260435e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846932; x=1762451732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uqGmMoi1PPAQaFicRlny+AD/MJGroEdg5O4X9kuPbw=;
        b=JGe/LOP6kP0kR3YkY8Zb3tovTrvToZP561qYcPgDTZTAhjepk14eHemg5Yf1+lX4hc
         B6kXOVgC770FUX+5EnJhk/tYMqMh7QaN2KD1spjLFmyWj39Lm2vsbdAF1RcpeNSMm+4x
         Xr4enHaO5Fdxcl/hh/iMjfEOI2qDUE4TGc7CqepFDBejhlPBdxoz1Qh0GdXyFAoWcVvM
         RJrkMmGyVU2WKyyUjzb8YrKyyPbl5BS9a6+ZiEJvZh9ClX2hX1zme6GV1WYi3jo5HL4V
         QIlaaAZp5BELY7hS9AtYQ4GBSRH1r3cn07pTn2pVkiVHhrebYnnD2oFDLaNwnPhYYWWe
         0ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846932; x=1762451732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uqGmMoi1PPAQaFicRlny+AD/MJGroEdg5O4X9kuPbw=;
        b=YPUvU87AC5QbrLBl/6JToOpapH18DkimY8FuFLXQgP30JFNZn1eHb1HA7gAdgHUAR+
         ZP0WE15z1ovsdR+r+ps49N4etoo6bKcg6vASfoGLUMrKYpH50gkbB3QMchG6lriTz3jv
         +zINPXihLxiR/Hl2+2VrMkQvp0rJ6hqjf5nGNNAd6FS39ijLTxmF8Hz8079BL1r4ORvw
         oGDb6486wgTXDoZ61hE4WTIKdUH4xim8GiP4fzPIXgiIH1YRgcgfzI3RidB+K+cD6/as
         oWSof8THeda0d7cg37xbvCaHtp2upMzaEHsYyZKRR8hpc4eoAdzXbTUtEHp6crPoEsb3
         z/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXaKAG6slrRP/ydVw6MVMVcV6NDWLxE9L6aWBTO23Jm9gqNIoTPuNWN71rfIURJSYQTSW/tUa2EULYicSkVO72AVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJySyZ7iEZh54PVpzteRmw86QTnlgrL1hvkT4zDnA8K+G8N5Cr
	QwFUhb1MexA6hGzzqfA/LkkvcHDxbW2m8CfF6Im1U2x+ljVqpcCKFLL/
X-Gm-Gg: ASbGncsZK2/JLCV5rNhy7jlASsfRPJiDtZ/fq8Q6UzXRl/1HKDQNSU8gNm7vATfR5G5
	306S3jREVeMb9XsD/38vh2VN876aga/uDVNbRZDSTpk4eYV+MeSPZrkSEhjw2rwKvDAztGZksQY
	7M0lDcES5JDgN7nC4fxtlQnchhiFrK1M2ZIb+o0ciCVqHgquGq6bzD0SMA/jYsE8cJo0X4D6lRr
	vLzTHxmxNifszhkhmVgwGY6HMi5gB5khwBP5zCt5f5EwUp1oJVL+c5VEZmIqqPUNbtzBq8vx5nO
	3myzvHthQH3S5j5FOVycRLbKzXwJucMlZl4bEqkUrMnQztEVsC/gRNC1kJAxk2Ga8nH8qyPWn5L
	vAbk1MsTUUhKBYlFJZ/r/TdqOTE/7CqfXLndq0ZuZTCr/IUil2SnvUsfbX89O3f/SUpq68Gm8pP
	M9VxZGGR3wQj5qAel+1GTfOKz807jPNs2VliJnHpvD7IjDMIU8zS6dblGHAeLc
X-Google-Smtp-Source: AGHT+IHhalSgP2kmhosVrLIAl+xUpJ8DATCni255mO2cl/2W+LygbY8oRYqgCijoqXjlLsSWAJ/x0Q==
X-Received: by 2002:a05:600c:3e17:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-477308aec8amr6285475e9.31.1761846932213;
        Thu, 30 Oct 2025 10:55:32 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:32 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/13] serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
Date: Thu, 30 Oct 2025 17:55:11 +0000
Message-ID: <20251030175526.607006-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E RSCI tx/rx supports both FIFO and non-FIFO mode. It has 32-stage
FIFO. Add RSCI_PORT_SCI port ID for non-FIFO mode and RSCI_PORT_SCIF port
ID for FIFO mode. Update the rx_trigger for both these modes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 2 ++
 drivers/tty/serial/sh-sci.c        | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index bcdb41ddc15d..ef1d94ae8b5c 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -8,6 +8,8 @@
 /* Private port IDs */
 enum SCI_PORT_TYPE {
 	SCI_PORT_RSCI = BIT(7) | 0,
+	RSCI_PORT_SCI = BIT(7) | 1,
+	RSCI_PORT_SCIF = BIT(7) | 2,
 };
 
 enum SCI_CLKS {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d07424caeeab..6f396e1151d8 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3149,6 +3149,9 @@ static int sci_init_single(struct platform_device *dev,
 	case SCI_PORT_RSCI:
 		sci_port->rx_trigger = 15;
 		break;
+	case RSCI_PORT_SCIF:
+		sci_port->rx_trigger = 32;
+		break;
 	default:
 		sci_port->rx_trigger = 1;
 		break;
-- 
2.43.0


