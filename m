Return-Path: <linux-renesas-soc+bounces-23929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C50ACC21A4D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 513B44F1471
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DA537DBE4;
	Thu, 30 Oct 2025 17:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2/7CgLG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134E374AB1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847102; cv=none; b=XcFgNwuoCKzF9PNebjV2bx6ngDmaGV/E/yOdH02cCI+GycZznMWH8r8SnCZZmLatyJH+C9sb4EQRjGiUqtoLj4ZAH3esc6Zd/D7ewfDn6/tJO9/Nei2IXiobLexm/Mlkma18t3rg5TplTjEioQJIvzTnWIjpvjck3C8jldsTv9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847102; c=relaxed/simple;
	bh=9jcJ345rfMMIxdlmZfAg0y+exXpCpE0R+jvegxv2zm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+6BFmjvZB04XWYSXm4wYIn0uUr9lCIgpzDhYSNoIuvZvU28PCeJMdDT7WasImI8+H+NSP7l5eYGFsJ1SkLKlL3G6Fq+OwQP2dZtEcfM+bhP5icvYzMzA4ESLw61fPrmIQLB1exLHXiXYeiFzjwqcGnGrK5HC5blbQ1FdJa3lT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2/7CgLG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710683a644so13481495e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847097; x=1762451897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbIsB+JA33Gj1io+1AAFvPQwYHrrul7tUKhFdp8JQ+s=;
        b=g2/7CgLGNM06zuV3it5VB7AXNnSh/EFwuTl55MbCt9TwFejVsFq0yfSD0jmSKpi9pe
         cm2JLb+QJtOCRR5M18Bva9NoODFirJbmNYh8tMNP3WnQzAq8NlnBWM5FaRqObSiuBq4y
         VyBoUir3jd5pGWYhmGSso1bWxq7m4yhFF8RJeY/1yfcLIIh8a/UHOMiL8JKUExb2Z3h3
         JFfz28PD0MH3XYs6RI4fJ2aCZU/gSM3Xf7p6kkYfLxXTwgcAgVVU2RZ5agdCR4wQn/Gd
         qui/5F0a5Qpq77OMC0Hs7K2RN75atwWzfLJrLYWt1inZ9zWvw3xNpGK6yyLZfDPeejDp
         cWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847097; x=1762451897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbIsB+JA33Gj1io+1AAFvPQwYHrrul7tUKhFdp8JQ+s=;
        b=aOccLu+XtOrqOS79IyOI4X9tX8xDninFaSXxk7isUYBG2I6hxx3lG2X0lKBfn9sOub
         k/vcFLncM9XVX6dLRBsO/ggotWjEsugPHx94Gyz7LsYhJX/wlwPVlAkMguHO64TtXxNF
         JrrhUGsJysNe4TpIl27mK8rQMsNV62gItcBF0N1zzb3Bd8yCo63t81LIW9u1Hmj+UWDT
         oeQR7J8gvI0ifRLUO94PZfPbeUSXRteNsUNnhaJHEmBeqL/Zk+OQy7FIX/NrNh4Tyn5e
         W05RigcK9SHFJRYwHtZLy6ghWcG3TcxdNkKuJb14Nd7LWFZk7IyGyCZB3W1RcQ2UQ82W
         Dzcg==
X-Forwarded-Encrypted: i=1; AJvYcCVHIt+HMqGkc01INZaTKuWwuZ0VR0/f31iEY8Em1vJC0b/TySrEaDHzf2jtBfGjK1OQoRjjgi61FQpxsUUYAeo6Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFdGPMK5Sh+LlJ2DAdM7M8lmkzmJ7GoUCUO1kRmcFCfzw2JZYf
	baOj2zodZLRrmQwsLCMmuWloPLaBEncCMJAEZcOdbW08mwptip5mwO7W
X-Gm-Gg: ASbGnctWznq6jYQOHsTta9p9xw7pxkbLt2XXkS8qVktdxEnGaY4m8KndU3naE9SDadL
	kmcCVQl7qrkVU7Gk4RHGRJ8bV0TieA2eu7pgB0a+oAcrjSL58sBBVV6a1tYj3XTjWWrchHW+B04
	ChjU1T4vlYX20QPZwgj+aQZx6AZKefybOUgPF+0rkdmU9vaErCd3IirF/QktYPN98nzq9tvckv4
	BnqV4tM/dIMMvOWOYw0ROU7YInlVgdQ82KPBWFVXZtWSHyVect9PYZsYhqvDb0zWtwLJLnot41Y
	CXVAwRjPBd9/0jU9Ayn7XWPZDtDmIkhoFINhr7MnyaEdiJCFAjvHAQ+fNbNpvtJXfT42eDF5xod
	Npvuq1bJcOb4g7mzedDYUz9hlhsrysjjG8COUfim11D0V1ZMOO1PVDlKZRhdLyQVv3WDTDPOSPH
	jBlCyYTNsfxTX9k0r+I8EjHSrm49UMIOuPK4FSRV8zS1fdP/S3f21mnV7Pv4gvI5VP4kfiX3k=
X-Google-Smtp-Source: AGHT+IHaW/aKuio2uca4DVlK5hpIYnror7GRbjbf3WKhe549DWwP6AesragGrVL8J6g2M1dW2nuRjA==
X-Received: by 2002:a7b:ce96:0:b0:471:611:c1e2 with SMTP id 5b1f17b1804b1-4772622261fmr32312035e9.3.1761847096589;
        Thu, 30 Oct 2025 10:58:16 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:16 -0700 (PDT)
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
Date: Thu, 30 Oct 2025 17:57:53 +0000
Message-ID: <20251030175811.607137-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
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


