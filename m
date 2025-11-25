Return-Path: <linux-renesas-soc+bounces-25110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D7BC85B1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66D464EE8A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709AB32937B;
	Tue, 25 Nov 2025 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPvjpNL4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA7326D69
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083205; cv=none; b=gst8e/LWzFPeuAwPxggTZ4T1540NxYI4lvodfsshqbsj1Fe+59jlP+EYO/FK3gYzJlBLRxnT9YdyPazXYjU5z0Eacz8ld6o1jhWc+EBHxomO75GNGT6jGHMC2a2jpHQ12ER0on7cOEUNfXvIOaLzJWQAJmuW7PhB7mWYmhkS5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083205; c=relaxed/simple;
	bh=0XQJSgadsToJ4b5yIqyUB3R0b6zEChYhyXBoI9Dp4m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dStUVbU7E7gAPlK+WWQH/ZZOroCxSEXuE462q8AvWVh2AljB6uN2A1F3OL/Gqo7V3zBsg2ERZkJPZqHdG/fzbuwKLeZNFGWjY4tR+lUObaUcKvPoZtBkIjwxNlljXo7FyUGcrv+2RlHOkCLwWi1zdny9k3dqFn8jQ4/2XxfXM7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPvjpNL4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso3398412f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083200; x=1764688000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0NtGTkOpvHiixTJXzZ965OSOKBk0446FybRMcINNKk=;
        b=JPvjpNL4jNABCe40z6llPVEQExAFh2BVbkWsgagjeJL6Qv7i4zw0/yuhMGp//dbOa/
         rawrc5rGOniMYg54CXNi4YayVEroiaAq0/C42x7Bvph/hXssTkrDJPxPFvxJB4oNNImt
         ycqm+Z3Bsn9lc8Tzcp9zqjM3InFIZftPgHzQ7ZM+R38CGn5d3/sLQWYQaN+b0Xl9spnH
         M+o2G9Al9XFrjhom1JaQma0QvU/tBhyfh/2nUJaMbn/EjvB+2dWeHoNzCrYB8WG0Uv1K
         UFU4CEHQGdYyA00/tfc1Sll1537e61dt2/x90Y99mArDoQUJWqn6f/IFLU4n9H+KbnJ0
         pEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083200; x=1764688000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w0NtGTkOpvHiixTJXzZ965OSOKBk0446FybRMcINNKk=;
        b=gADBFRjkpko0IcAlMlOP+toPnkZPT5+i3peOJMRz0QiZL3PUr/I/1ABS4Sjh/1m95O
         V+kvhOdWVdNQ/ExDjUWz3NkkjdHkIXvHYZpBAzSzTlN/z/Igvk9Gz5DolCVzK43CgqqP
         Ua7vRaB4Dn3CTSuP8xlXpuYjs0XFzPdxazzzNoix84ESYOfz4mGVpFnsf2wBvWmHOkGn
         4Et/TRkl3QkdxOj3vAkUIClJGX2yH0Mwr7zmWPPm+szfwBo0CyoQ9e2J9h9hNiL8qsxz
         iKOpHI98RNJ+WjsxIABDvpYMCPtNtqEVCPzo5GDrD8afBCRhlDOKmyARQLc1wYmcnvwX
         6slQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfobNRvBSjISuxsRG7mfGQCE+0Bko/r//WsqYzArtqkLGTH4eD6/vKqsO2kjfhAJ4+7P2hTodmNrmoveOP7X6YMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXfRRNFuL+ITHEgJPQhVSUDGo4diDhKfN5+ovpo6q3kHgt2o0
	ZW9VDDoFrIDkxqdHQRYOAwxvFp1QAhXnHchzmUr5U5UZWZTJJezYhEQr
X-Gm-Gg: ASbGncuBEtuLrL/5vg0Z8dhl/mt1FtiOMQH+z2NJhrOAvYG129YVq20gAO+rr1+2K4h
	SoQQNtNfIeYMLgVEu52NKQSsaWTgAEsdmxHyWmLRHPNx7O/s87A2kNGsLz3BCoBUipMjSK6BnFo
	dMXWqFVwFb6e84wnvNM5BKh74tSpiTMqxEBUG7+ucSL491TfVG0TFuKsGVKZD7RWCrEXdcvv9f0
	8w5+In5I10BSYwyYfvbopncOSSv4oPhMdyrp+2zVUC0a7WwqJ5mtCOH0R1UyTJJbzjlsuzM6r/X
	HEe+4ZPk2L/mAAx4RonL8zAyQnR3JQks1MVBcwh88P+K1HQWoLqBaouV3nCZZ5qGjI+FsXl+0mG
	pR3bLOOZShoETc1l9SKxTp/50GFG1tkz+JMjhnfIUGrsWN+LJZDDTMkxWu8kiSDD898G/HII/Yh
	yC8tQnbRLDd4b+/P/W8E5Th/51FHch4Cz9dCtq8/Fv3Sh5EAjztJK054gBfL6hsGkpw7jjLQ1Su
	w==
X-Google-Smtp-Source: AGHT+IFo0OhinOAI/UzHdmsqWHopeqG+0xTMeUG/vYAaZONgIemRGTkV9J/yAwaStUhaaQyLgihjhA==
X-Received: by 2002:a05:6000:4012:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-42cc1accff0mr17229344f8f.14.1764083199477;
        Tue, 25 Nov 2025 07:06:39 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:39 -0800 (PST)
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
Subject: [PATCH v4 05/16] serial: rsci: Drop unused macro DCR
Date: Tue, 25 Nov 2025 15:06:07 +0000
Message-ID: <20251125150632.299890-6-biju.das.jz@bp.renesas.com>
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

Drop unused macro DCR and its bit definition.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b5afa7b2a4a8..3ad6cb8e1d18 100644
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


