Return-Path: <linux-renesas-soc+bounces-25112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C0C85B27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67B294EF06B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2003D32938E;
	Tue, 25 Nov 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVQfRq+i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73857326D44
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083205; cv=none; b=O1qLd1vfDBWYPSQY8IC9FYwoUaZZC6GoVQcHD3XyvEIgZtR+XeeUNAmse5OQmxoGBfsCQejm/lTLz6rHvjn1oDrGJ8M415MYd+JQFTrYcw7QLYPFx2Rwt2MFcdXTuQuanMBYV/eY1C6LZ/He5UYvcvOVHgUn3RaeinEaEsczpS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083205; c=relaxed/simple;
	bh=bvZGunteSrM/a/WIsIyYRGnLG558EPF1JJm16o36fLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y81Rahhs+rm1wDvKy+vRk+pfqRi1YoxtNBVsrFB1BkA3la0DRJuDJWBjwlhm2x9qckH2fj4wUUwpCI4axuahfEj9OW3YicyOsXCNVmYF+7JuWxn2yVCqKNQOtuX1IGZD9sOSaCFZJJ5UcfwHiZS0ACAq3O/3WmK6wYeB5VugOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVQfRq+i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b47f662a0so2964909f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083202; x=1764688002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTZQaQp1phCcJN1UymBMs2ZvVQGslFeouD+Q/OgyOGQ=;
        b=VVQfRq+i4LAfI5h5YX9zU8lM15uQM3PG/JBFiigrZ7LcC7xk0dv00sZODAu0kGHcD9
         TP8ImiwQcqh3w/fdneHPq0/haaLU+wivSang6cIEA/JzNNF4DFajs+6mIK/YMUct1JCK
         8dkg1XuKA51WSoyTBNYn0ks5d8vpuln3G4QxOfxIFGTG+NUt/m9cGk5Qse+Tz+cm22UH
         tsthKsapmN4ivArAhoQOYanOJWQEprk7jAdj3xx70/jpcSJ/qHALuCQJJ70Y5BO1LeiA
         5ccy0K+9O1xuNlW5q2+8NBVTVsA9x8ZzVgxpE87GapMKoRVLrPFRvRuyI2wYrP8M/5vO
         5IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083202; x=1764688002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTZQaQp1phCcJN1UymBMs2ZvVQGslFeouD+Q/OgyOGQ=;
        b=bo/caakYMKNpYP5uFKjDaNJdaw5RMBfpIHTzj7LHFDlCmtPchQOgJLr76y5V158HBm
         /kN2K4Qx1DHmp7Eckrj6lGbg4kUNkLn9qUopwvH3eCXqfekyAr8SccBJfhKBq59hf05x
         GGx00N7SFWXEnSG+n1+UE8+lvsJMjgoYj647qlz3mfF6lfLFEBfDJU6AvUi9v3yVNFcJ
         PC7wWP9APKJZDg0yWKfVu9Ot/RawVEwy/EwijnwQE+tBbKAufSAnnQq53hHqbVF/Mb2C
         jyGSGCBwskolIEggczcGIgnYTB4yJe0AwU2GmjsLzCXFt6bmdq/9W51PI0ONPnEsBNDq
         /RLg==
X-Forwarded-Encrypted: i=1; AJvYcCUo/yBRKLkpx6kty9ZgIi7+omo8YHOAnZTjSMjg8Li03z9sq/8JUWghkHT5f+QZ+nPbOKbLRNDW3b4W+gcLAd+X6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEZHDybg8BdcVhADXMH/AauO5TvnnqmE0s71bX0EgU5gjlpTT
	n0OaM8KXxN2SxcYEBL0acG+tFfqxOb1trpC9UhzLGO8bKSirt2bLgNFf
X-Gm-Gg: ASbGncv9j//i57P1AsULjmGJ/aslPQQPQ5llyLRHnbTTor7EUidBhobGPp9fA+B49l1
	JzmDe49lCRNMvpyFX8RILiwaexps7fkho2Wny41RfZDt0lIK/RXZygVGm4Q7kz0deay30HxIbB4
	NhJshS0oio1ofbWwo4b/zva2i/k2MM7wwnae2G04DCdLIEF4PQQ8SQbESUbccrmoBPOA4qocnBP
	VbERTMp+tHlN+totHXZ43WCnurxXloTccdyoyg3sAoOEk/mctELQYBzIwq5zKyyyFCgkZow/ZL6
	6Z9qELPhda31cPAlfpXaNrBie8pJaaFnkQS3xDDhvGTybee86+jLDKkDZszIEQC8cdRtSy/EJmb
	cVn7BpyjB1RjWqMmEVdMuyDhJxYCPIrMW/hndY+tfuIsOYEv4c75RplsFHUaiDvgEdi/o22Bfzn
	w+XejPv+nZhtnV4kJr30MZFgTncE7YFvAVVCPVEBimrSPPX9lGSvRdkkduPLu7BXPnEUh3M06zR
	E3VLg==
X-Google-Smtp-Source: AGHT+IH7BC1ZyxS8oRXsiprnT4CSaHhz6BZHzWN5J4GKslWr/kg1x38bb9Tm6SchIBbfW4h0mucEAA==
X-Received: by 2002:a05:6000:1863:b0:429:c8f6:5875 with SMTP id ffacd0b85a97d-42cc137bbe6mr17916074f8f.20.1764083201748;
        Tue, 25 Nov 2025 07:06:41 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:41 -0800 (PST)
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
Subject: [PATCH v4 08/16] serial: sh-sci: Update rx_trigger size for RZ/T2H RSCI
Date: Tue, 25 Nov 2025 15:06:10 +0000
Message-ID: <20251125150632.299890-9-biju.das.jz@bp.renesas.com>
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

The RZ/T2H RSCI has 16-stage FIFO. Update rx_trigger size frm 15->16.
Currently, there is no user for RZ/T2H rx_trigger. However, the later
patch uses this variable.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 8869c25eac95..ae76705baba9 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3324,7 +3324,7 @@ static int sci_init_single(struct platform_device *dev,
 			sci_port->rx_trigger = 8;
 		break;
 	case SCI_PORT_RSCI:
-		sci_port->rx_trigger = 15;
+		sci_port->rx_trigger = 16;
 		break;
 	default:
 		sci_port->rx_trigger = 1;
-- 
2.43.0


