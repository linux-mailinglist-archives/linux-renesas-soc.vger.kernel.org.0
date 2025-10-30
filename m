Return-Path: <linux-renesas-soc+bounces-23920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1CCC2198A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81B91881C15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A0336E379;
	Thu, 30 Oct 2025 17:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLeuDtXN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E0336CE0D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846940; cv=none; b=OJMSgjFJEnkDetjvc0J+UdFOexzBArZIpdjF3q12C4rr4PrbBkhj/HMH1MCqjyfqVeSPHdA4ZTJupxaTu/utJ1MnesQqtQaO/ttKLUCj42pNNoOk7sLmBvSyGOUtQrVDaNJuTopTQjG6i/RkJYoqobofnzxjCbO6J7muDG9UmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846940; c=relaxed/simple;
	bh=FUUpdN5VqPaa0AglNAM37NGlXaHlU8F1s0H5S0bhfxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOPBCGdTUxZvv+klOoWv9wMisISCXXW0wcbY7vKD0qmXZulnDccMm2RDhCFKtq8d96bH61rjF0AHGmK319Jox3axkLxsmgtTPJhJBoYypFI9dB1flRbgU3M9EVO3t0NAtmUgZhfTFm5Z5xXc8R9sSQgN1KYeGCTmTcQLSGI+U/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLeuDtXN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-426f1574a14so946718f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846934; x=1762451734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx09GhYIQEqgtyHYb9x3QHdYCDiDGK8KkivjnJ7GUsM=;
        b=VLeuDtXN2KJFSg2RW2rvkZQMu13Rlp4GFEPNaVhqFtPZJv5CFNG+OYknmQOhhFDKyz
         8mx0tYDWG2jdrt83B+JeRMCv+A8Q601logzyaGpMUfW/XFrrNm4TfZLLjjUQHoK2b1l4
         YA0IiQWL4DaS6SmOgDo/nwP8i/t+1bGNsacIkF8y3OF1ZzT83AysrcEHfn5vWvT6B4nX
         rlSBFyda8jBKk5bRqDJ/Cjzbq2rNK1/ruwr/T1GnRJAeTxX2KX8c5jG0Pg8GAaePiqm4
         UrZaCSFL53wYn06Z30kKFtWuI2iZTxv1saN8emR/hk9wsAoedb+gxm2chfbKgGsxX2jb
         lIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846934; x=1762451734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qx09GhYIQEqgtyHYb9x3QHdYCDiDGK8KkivjnJ7GUsM=;
        b=W0a0VKIrPlwJchda8WafbaQ+9+ahqGNN2X9z+/IepkO1mtJvKDZaSa0sp2gLniUCW8
         V16a2OXiO6twrdqlHCB3DIbYtCxW2SdCR0PGsKUTbtWM7m9+4Mnwll6TrkmbkR2382+/
         jdLJCPrc7kPSOJv/FZjW+2aQNzn4gme4fph4p83B57Q4yEqSBVNJLEFlYLmL928IB0O+
         VIG2R/khaGt8Q0YhRcfNfSVxQttn6tk7x6OSX4G3QnVR+9B9v0P3547SW9WCKLhtM9v0
         LdEg9ayUAUiTHLmgywtLvZIpLSphcj+CWBotJbmeVlOsUMV3/G7rU4UsYfrJHlau8lMR
         0yeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPbBX0krlCSO5xHBLqEWIbA4bCncPSF0N6dtFj6/jKP1D3k/xea7CNNfRFpwASd77mSKB5oyTy6f483UCh7FlIOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycRSYarMgt9RW0mbjZoLFkwZtoaZT0GX9V2ldsLT29CdSkFqHY
	sCH0AAZrCpF8dHGQKUPygqIZcnhp2rBkJ/CTSWM5Kh9KCGILkS0MjDlf
X-Gm-Gg: ASbGncvEoSMElPbd9LWKyNXhWnG34kwJtzkXpDyPyVYYkG118tlp7cKn6oBfZF0PzXX
	VKVtUXJiD1lJkmvkhpduHFz6UfjQ/N2bXhuRLs7QSNTU2ajJ/KJ080m9NUB+1TBMEdTPVF0H/0a
	wpoOzqJMePKNO38WzCx9W1r/KFcSsH+WRq6rFidOF5xCvh4GwDZpbH1oDRrOD1KjCow5aRJn8ly
	nQcsiXMplh6PBI+kMebTTdETJ4CFSYsa3X3khJ11e4ePnZE8JO2wdKwRyhhXJiky4xsFl49/xS/
	QBaZ94FtzpcSSiN5k8FqXVWyL7gaENbuN3PldHLINgjRw7ltd8fE+GCKRgaB/Cx6jNJ/D5J9ZXE
	PHexFRn0rrPHsWJUJ5SbEByxHWDcrgQEpQ3k7VYxD1kJrnopxVjF5JUZUkGToaiAdF+ciBz0v3S
	zEQo0Fsqkgr36WdxZR4sRgPVK+hlTWFP1KwbqS7WIo07Cv/yW5VoVLelv/qU5z
X-Google-Smtp-Source: AGHT+IE2wGBv6w4TzgH/dIqRMjz4ljrVN4/hTLrQ5+0NZaeomnqoztVj/d+T+noqIPl5lxRmm33nkQ==
X-Received: by 2002:a5d:5f55:0:b0:429:bc31:5de6 with SMTP id ffacd0b85a97d-429bd671ed0mr446668f8f.12.1761846933645;
        Thu, 30 Oct 2025 10:55:33 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:33 -0700 (PDT)
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
Subject: [PATCH v2 10/13] serial: sh-sci: Make sci_scbrr_calc() public
Date: Thu, 30 Oct 2025 17:55:14 +0000
Message-ID: <20251030175526.607006-11-biju.das.jz@bp.renesas.com>
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

Make the function sci_scbrr_calc() public for code reuse to support RZ/G3E
RSCI IP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 3 +++
 drivers/tty/serial/sh-sci.c        | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index f730ff9add60..a3f4a76cdecb 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -171,6 +171,9 @@ void sci_port_enable(struct sci_port *sci_port);
 int sci_startup(struct uart_port *port);
 void sci_shutdown(struct uart_port *port);
 
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks);
+
 #define min_sr(_port)		ffs((_port)->sampling_rate_mask)
 #define max_sr(_port)		fls((_port)->sampling_rate_mask)
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 67eba7feea9f..ca4915c1e2e6 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2395,9 +2395,8 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 }
 
 /* calculate sample rate, BRR, and clock select */
-static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
-		   unsigned int *brr, unsigned int *srr,
-		   unsigned int *cks)
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks)
 {
 	unsigned long freq = s->clk_rates[SCI_FCK];
 	unsigned int sr, br, prediv, scrate, c;
@@ -2461,6 +2460,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
 		min_err, *brr, *srr + 1, *cks);
 	return min_err;
 }
+EXPORT_SYMBOL_NS_GPL(sci_scbrr_calc, "SH_SCI");
 
 static void sci_reset(struct uart_port *port)
 {
-- 
2.43.0


