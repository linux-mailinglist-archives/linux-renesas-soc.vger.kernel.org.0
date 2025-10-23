Return-Path: <linux-renesas-soc+bounces-23482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A5C008DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B17F6500815
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 10:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB230ACFD;
	Thu, 23 Oct 2025 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijc52sfu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C8519F115
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216214; cv=none; b=E0cJ24RAODggkHyNikaU8Xs4ozFsWEwXuf+0WVnv2jZT/Pvq/U7Q9VIBmdEg5QxLRDMZvqg3fHIBams4JLThXyYxByyjzPFEgKMMoUFWervGdv5/6Ib7ebfR7GO0eY3XpNUfiqtoLeOeKBV7FfSen1MRXttkmlXSHvV6wGDd+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216214; c=relaxed/simple;
	bh=XZ0aa4iCUybd6QVov9sY+LCzyX4cdv1qdWS9ztcgdcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pU9DuxrnMQWSszlEU29yURSYUH9Qo3mOYUL8xMXbkwSo6511Pw4mqHfftETJn5G15B+9BCQDaXN1/GZAzwEzqfPn7gHJ9LVkZ/PVVXzSP9V3JhA4RpQD2E1M3cLBB96Y45J+O3IbWk73qQmSmtUp+TjR6Q50tpIXicZOcarVjqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijc52sfu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-290ab379d48so6387025ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216212; x=1761821012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qYNWh7ObOQ58yx7yZwE/kCO34/ItQPE82ZLhZuHfPE=;
        b=ijc52sfurz9DvcCoSBvjQo4z14YVGiisIKM5ccSsXDT+GWY2d1ltLWtui074IiLOQV
         EebONfUrrXPJSo9genyPRxnxzBgZu5DPOeMyMirh+E0DDHTd8a+NNe3XqwH3FKVRXD2c
         SS9a/JQ5V9pcTrcOSGzNucde3/saMFRTp3UKBe+Amx+YTJZaF1F3ivDZLchNzihj1G6k
         ofVAFZgY3yQCplH19j/DuyEC4UoUGkn7eOf/hAQZoAtNlofGaINR3p76YmIkiVKLIkQB
         Z4tvX3VKs8wuZcdEl9hEBoxwB8rOr75wTdLqdY6VmOr1uFr/uIbvdhjitwyUwL+BHx3N
         v2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216212; x=1761821012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qYNWh7ObOQ58yx7yZwE/kCO34/ItQPE82ZLhZuHfPE=;
        b=R+K/fe8oKhHj2dD5L6xEKHBOcnaEaALJSZkeSBmYiqImqur1Sb88X0D+ZTPW0yUsoH
         Y3f8r8GNFpiF2wdd9jwocNFpRnRq7F5vpHDFMJ4k4Qq9Ds3SGHW3Y9VSBT8EE3N//Mnt
         6ocrVbB4iUDDqI607tUgHQcZWVM+1XmYlPZpUkG0JfhLy4caallPzkhhTkfEG3kEpi9M
         ty7eyfYnBT2hXRGL7IaoBARSDYRcOW5n0hmK3zLsvDg1Y5eXsz/Ff4FRy69DhtqhXs/l
         EkTXQpppoFO9XqCEkqW41pX/ytQz+EAgl2TNfu07KzsQdO9hXkkgsg3H3+TUL/HvU0ss
         8AtA==
X-Forwarded-Encrypted: i=1; AJvYcCXGKezHftRxueBcLdtRrPrrVdA4kwhdQHrcmRtrr8JSW0y1beyBVwUN5Hh08Q8NOnuyC/QQ+DC0bO0gRc2b8jUiLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvOMuvmelKccZIzk+1jokcBd4JLti4UPv7yE2P/Vx62ZwGkCvg
	GxOYJWscUUEmiIDFfUjEGcw/hsoZNl2gEop4HvjUb9sWLNPQSevxROad
X-Gm-Gg: ASbGnctYp983IxfGHI6MD9u7H3j3gacXZskX1TDliB6/EP4kIW/JLPJeP8qUNiURkGz
	jzq/tBFK4Ng4+i/Xdd752o03D7FxZhpN0/9ZtrSNP2vt0Q0VQYZfqE9+14OpUTcMHjBMtBa2QDL
	qSVhZ8+DUNaBPeFh/ctLoXXISogfYfI4XPRU00yxSJPYdZoG7Euu+PXgsEI6DC/X0yA+j00Fffk
	6wnToHBxQf8FPl+KqudCoxu3tbrM+PcbIf93x94GiBSpcITr1efEeuYfFqNKlhEPp7sINlOSDi+
	Pw/HAiDczSJk2muvDdUcmwvb1DNErf3lEj2xow8wOsDpkkvJtY9D9Bvz8O39SWZPdlAXHbvDFVv
	zYSbYFDrr4VMjbaSq3ZujJCYGPN61968dCzjEOdhQuDK7gH7u6TQNMMbE1nSFizi00WQScOr2Bb
	syTlnFt4I4lHD9b15077E=
X-Google-Smtp-Source: AGHT+IH8b5u4HtoHpKR/2HVfpSINg790zeUEcpfE3gcodr+5+Gk0kA3xe0PaMdH6w5uN7f9EIubR3g==
X-Received: by 2002:a17:902:c942:b0:264:a34c:c6d with SMTP id d9443c01a7336-290ca121a65mr282957195ad.37.1761216211772;
        Thu, 23 Oct 2025 03:43:31 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddec426sm19240945ad.34.2025.10.23.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:43:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] serial: sh-sci: Sort include files alphabetically
Date: Thu, 23 Oct 2025 11:43:12 +0100
Message-ID: <20251023104313.210989-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023104313.210989-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023104313.210989-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sort the include lines alphabetically, no impact on code behavior.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/tty/serial/sh-sci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 62bb62b82cbe..125a56d47924 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -19,11 +19,11 @@
 
 #include <linux/clk.h>
 #include <linux/console.h>
-#include <linux/ctype.h>
 #include <linux/cpufreq.h>
+#include <linux/ctype.h>
 #include <linux/delay.h>
-#include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -32,8 +32,8 @@
 #include <linux/ktime.h>
 #include <linux/major.h>
 #include <linux/minmax.h>
-#include <linux/module.h>
 #include <linux/mm.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -50,14 +50,14 @@
 #include <linux/tty_flip.h>
 
 #ifdef CONFIG_SUPERH
-#include <asm/sh_bios.h>
 #include <asm/platform_early.h>
+#include <asm/sh_bios.h>
 #endif
 
 #include "rsci.h"
 #include "serial_mctrl_gpio.h"
-#include "sh-sci.h"
 #include "sh-sci-common.h"
+#include "sh-sci.h"
 
 #define SCIx_IRQ_IS_MUXED(port)			\
 	((port)->irqs[SCIx_ERI_IRQ] ==	\
-- 
2.43.0


