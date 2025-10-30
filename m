Return-Path: <linux-renesas-soc+bounces-23913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DBC2194E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A9B54EB00B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5901636CE03;
	Thu, 30 Oct 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J82MttpW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82C36C256
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846935; cv=none; b=cNZlFkocJ2QrhdlV+4pDvKym5CEe+ugYGC2dBhGGb53UuvfIKvgvkb3lDZ3xWJ0IpNrNLVhzJZKxXXS9sJgRUr3hzj6ZYha9zNQqyBFenzfOIf1X8MZ4hgFV+cFj9WkLsLph8Vin2SevcF7fFYg6pXLQ154S3Y18nl/mtaWfnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846935; c=relaxed/simple;
	bh=9jcJ345rfMMIxdlmZfAg0y+exXpCpE0R+jvegxv2zm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1rX45w5lyzs2CNOSZeRd0lEX+BjEE7dV1LyLF8/uFIY479SvCLtzbzvhBbxl5bA1ii4qS28ByibwAzziBhk9m+xJfbzTB/K2tPB1hhOAxOs0CrCUNDxShhnweW43AL6TtsqKaZYMhGdwDZ2YbCkJRTUOxkOHvX+tmz12qFB3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J82MttpW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1408952f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846931; x=1762451731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbIsB+JA33Gj1io+1AAFvPQwYHrrul7tUKhFdp8JQ+s=;
        b=J82MttpWIRLzbNEEfH+3Ncrsg/jYUIIN1lQ9nT3qpprSyfwFZTx+k292qSqPOp0GRc
         BNmSaBB/F5m3Cb4K83iM2sAVIfjfN5+ofA+IPFv2CuSQlTzy2IV7sLV4W2Zm9Hwsai0x
         XmHQhD4zkjKv7FLeStCGweTQp4ynd6ZJvJHVJTIqRrC5jN5YOiQTWHJmakoBFJX9iQyG
         5b8GCp1sm4Wz5+A31X5yZqFW4v9nJvILLctnkZBTeR1ibpFO4DCiLnNB0nmTA+3Qbs74
         llsdnhZoFd0CYI30Wi08BmbQL7bzSPJxAeBTSmJCmM3kcMNkV4vKwxU/9Sj0n+4wiYpY
         qQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846931; x=1762451731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbIsB+JA33Gj1io+1AAFvPQwYHrrul7tUKhFdp8JQ+s=;
        b=NGDQdXOGpUtyEygiv2OC5OfQwiDoEJvqWKY7pDvrC3yHFa0eC6Xoca81joDMBs6WeW
         ng2MBwe48sj2LDxw0pVonf4JyhVYVnalgSt/PPQt/pLeygf4oy/SzVk1tz/Bp6l9Dv29
         XCBPtwlCRxdKxRyHVexuGKVQ765VyxVqMMP1UCJE+0DfM+COiELiRy+J67rlWFM3tVZx
         N7bdzrGiK17Sx6q+1fyO+SSewzNfe5FsXkRnrOI1tyEA8cXXGW4/X4WNJh4i6uoCBgFz
         dMiRYaEQUj3SlvfsAKO0hdWLNI4R5zKjvxb0noMyNZ8k38oZ+NeZhi+pybA7rBUoFxwf
         rjAA==
X-Forwarded-Encrypted: i=1; AJvYcCW5TwiUb12vcYdBG/d5XFUw5EPxqnjStafhMKqVJLjhIYaFQuGG8yjm/oDTJMYaoSN1+OE+3yvQWDqFaEoXzRZyGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy022Wkqxv2IvKbGOYuTrbkEaJiFW6nV1m1rulkGUkjbwrkkXL+
	LDMGCLgAHiJgefSohRSxnpktZW6P8pRy1dbXdfhgc3vRqof2iyf9x27t
X-Gm-Gg: ASbGncs9CjpjLfflaYzuTfTZ+lC0Q3Jasd6L4+qP8XxvmOsfsja96fHr4S52fzlnHyJ
	Keo359CE8DEPAd/h1j5cJ89/f49tsR+SY11L8TJi5mmBxojs9BeKw+ymj4EM+cfv7zUqYAzWFXF
	6ma+pnslKXsZPduPGAJHPgMu7tfWm6myAZVGg6lg9UlXtvM46qzAlSSI4tmoBAJHavATImGiUR0
	tslvRYmDjUAocNYFHZguRkK0L01PMb+JnufgG/SyJ+WhICPrYFnJ490dXeqULlaJt7hJQRwLkXE
	4MMtIpJRU1WpV894WZRD03H9xTmq57GNKzPNWeNLjSMeJpLb1Mv/aQ65niCGlNmC8X9uNaHWgds
	OryhJJaSC+09dYp4ZzmLSrSdh6kLmbjpjsXyzF3N2RV+99soLMQnupYfrNvPgqsWmu2ZWXT+c2n
	N5y4J1Enp6f58usX7VNVqgVDwePXEL1WeWCc94K6B4/NHlY2Llvg2Wfge7gTle1EBQHqC4khw=
X-Google-Smtp-Source: AGHT+IEF2L0p91EN9iLwnGMihS3zlarLJMg1F5IRe+iNrL7LAp7ExKgFdBKaDNHl4ZjJyQD8OKHXaQ==
X-Received: by 2002:a05:6000:25c2:b0:429:b718:167c with SMTP id ffacd0b85a97d-429bd68847fmr429373f8f.28.1761846931270;
        Thu, 30 Oct 2025 10:55:31 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:31 -0700 (PDT)
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
Subject: [PATCH v2 05/13] serial: rsci: Drop unused TDR register
Date: Thu, 30 Oct 2025 17:55:09 +0000
Message-ID: <20251030175526.607006-6-biju.das.jz@bp.renesas.com>
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

Drop the unused TDR register-related macros.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 470b5701cd67..ade5ee479e99 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -35,12 +35,6 @@ MODULE_IMPORT_NS("SH_SCI");
 #define RDR_FPER		BIT(11) /* FIFO Parity Error */
 #define RDR_RDAT_MSK		GENMASK(8, 0)
 
-/* TDR (Transmit Data Register) */
-#define TDR_MPBT		BIT(9)	/* Multiprocessor Transfer */
-#define TDR_TDAT_9BIT_LSHIFT	0
-#define TDR_TDAT_9BIT_VAL	0x1FF
-#define TDR_TDAT_9BIT_MSK	(TDR_TDAT_9BIT_VAL << TDR_TDAT_9BIT_LSHIFT)
-
 /* CCR0 (Common Control Register 0) */
 #define CCR0_SSE		BIT(24)	/* SSn# Pin Function Enable */
 #define CCR0_TEIE		BIT(21)	/* Transmit End Interrupt Enable */
-- 
2.43.0


