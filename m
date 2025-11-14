Return-Path: <linux-renesas-soc+bounces-24649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2870C5CB0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DC043B2C3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A36314A6F;
	Fri, 14 Nov 2025 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngKpl8LO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A7D313E06
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117531; cv=none; b=FZwNEW0E3OgHdv3HFvxCn6ko1vr6sadcSYxTakjJGQhpUMWpPv9yPPgFa8EDYnoUac5TUoweNW+ofdCkWZKpwWgENH59rlB1ETkyVDCXsV1Y65Phtm7sDy5Ztet0QLpBCtYaggYLamTBKJesQlZy4Bp+gaCaqW9n/fB1BCeU3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117531; c=relaxed/simple;
	bh=lhrbj0OcSPih2hHSQIH0J0fKDkHISmrd2RLvWhH6Nyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6eV4HJG7oIw3nTi+h/0C2cgyV9/9NJ5Msx9jYBFG6c0N18P8zeqil5KJlDqXraCt4hWuXyDftq1sCcW4GWS1sjZYIzrKAuNe9563a9EBvHliJ0Z/iHqCRPoZpKhFBmikY6nrj0oDHcXHJV37HS73bnw8tCdoyBfF0AkBhEl6AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngKpl8LO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1110322f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117526; x=1763722326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYpxnPtlPop5alBk2PoZYH1TzJtgTomEZwrKVEB1e8E=;
        b=ngKpl8LO4KYDtsy6reYHYXl3iRsGoqOiQAtFGJ4sqQRlSOxuXtbs2lndWuyNqRaPdL
         ICxsEzIPmt9D3qjUnSikbhp3bNozUjR5r1RvVNdFTOT8+Xcn1rTEQbfnHCDNLhhGtXSC
         hwDpbXMmCnNIaxGotcR5kF4RoThxOxjeEYaNWO1hV4ucsAa1R6cnizii0jOTq64exqOc
         Y05EjDzCoseDh+xWtn9rSIAfCmaKBVnpH6EWsMKCATpEtXNGhYdSPMjKvNrC9QuSx26o
         CHygOdyRcA9n89dvQNuby8vwshhBt7ze5unR6izS/IOldqhFmQkYlgmegi3+gPTjS7TL
         UF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117526; x=1763722326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYpxnPtlPop5alBk2PoZYH1TzJtgTomEZwrKVEB1e8E=;
        b=GO3l8/rWTmfZyZ9PuzTggY1Nfagu4KeyIjGMfvQ9AP7aJY9jWCXV2rh5rBp4gIhhn9
         6cnRH7d2u2a8paoC+sAaKFtjwIJD7ryEelQB+DTTiFCha+e3baGekZnbYGIKwhTF711/
         G5UYv09UtHJnMwHaFB9MeFKqfbligjhqryX8iM6S/yEIaQvUvKH+3kKnDF21wohJu7kR
         bCx9deMfDLc/64mrQa75pZuFhPi1thikRsfnKB6AGa42InVH++26JfPlBsXvoaOxRoSK
         R8a7VQ4RHDGhKpz3AGAcRC0qjUkNVNbe6mB1JK349y16xM8JMnd7nAmtkdpqVoaYKFls
         jLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv0ayCXJyFt8ZoBykA2FLvc9DMcES8+AJO1wHOz0g/pNKGoVf/gyTF5c01ceXItpeiPOUxL5GPReYdtYu8ac/9EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1OmBd4ZijrTV9/qV+6voI1N0oRLtTX9wItRDIMKPMfOrUz34C
	8yZAQaR6/4ML5M4b3MoxKdcLHIxfIRLaNEROHslJC0ekyNYyPfHx76SJ
X-Gm-Gg: ASbGncv5fQApffYZ5otfwGNiGJr0QWczkWxQoCNUPdpExQQoDmKhdEgPA0iqq/cQQXK
	kCy9KBB95q1DxgkoyLXaVWnKTZqaCS8SjGH/w9/aJKP/Q6U1b4HQxVHPm2ujgHnD6ddA0d7xeTr
	fODPBn5bb6bcAiHvAOm86UpqagabBZHYMuMvamgCvJ7PoCUVitO8ohlcx2Wofe5tK7nRezNrrlw
	DFhp2pxXCTcatWwqz5Y3f/CfQvE6MwF631RSxAJbTAICAyPr/fpdU7YOzyMk9jP9PnFRHsb2515
	ju2HDAjFkhyaPXIt2doBDIXTO3uHXAbRDFGViiNDMBfGOKuPIvBTh32RDKUoxwayU2ELOUI1lC3
	GyquNXnhp3YE2XkxiyDib3Z94wyDYoHcQDTz1sc5ocqZoa7Omw7Ivj0t7j2QAsQitVs78bE1zyt
	e5hPgm764sQnTxkC/PCrOBCtGAUGMJ3DCGnBvbRilqF/Ph4buUFXQm69bRUxAPmo0ShL/NcD650
	ZeQRtSkyALJtnHj
X-Google-Smtp-Source: AGHT+IGOR8QW0xb98M0JpE1UwFVZnxmTMEVweqBtK/qFgVR6+iALWh+Xf1+2TqWQnP+jdt03f7/uHw==
X-Received: by 2002:a05:6000:40dc:b0:429:ef72:c33a with SMTP id ffacd0b85a97d-42b527955aemr6201873f8f.3.1763117526404;
        Fri, 14 Nov 2025 02:52:06 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:06 -0800 (PST)
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
Subject: [PATCH v3 04/13] serial: rsci: Drop unused macro DCR
Date: Fri, 14 Nov 2025 10:51:13 +0000
Message-ID: <20251114105201.107406-5-biju.das.jz@bp.renesas.com>
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

Drop unused macro DCR and its bit definition.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 9681e8ef4bfb..9fa5d387d7db 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -24,7 +24,6 @@ MODULE_IMPORT_NS("SH_SCI");
 #define CCR3	0x14
 #define CCR4	0x18
 #define FCR	0x24
-#define DCR	0x30
 #define CSR	0x48
 #define FRSR	0x50
 #define FTSR	0x54
@@ -119,8 +118,6 @@ MODULE_IMPORT_NS("SH_SCI");
 /* FFCLR (FIFO Flag CLear Register) */
 #define FFCLR_DRC		BIT(0)	/* DR Clear */
 
-#define DCR_DEPOL		BIT(0)
-
 static u32 rsci_serial_in(struct uart_port *p, int offset)
 {
 	return readl(p->membase + offset);
-- 
2.43.0


