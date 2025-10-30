Return-Path: <linux-renesas-soc+bounces-23930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D619DC21A1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654051898061
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F66375737;
	Thu, 30 Oct 2025 17:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXPMvkaw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA7237573D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847102; cv=none; b=k4ZEQvm4idY0RRONltiH+rmu8+dVsmuk/vycIuKoPP7gX9thzTphRFs0k6HXWywmHIodS36LvbQdJ16Fm8++0HSqwlAvJ9rhrmR17togdEGt7Y58y8RoxVqBhydZ3/u+oAzTl/PjDhYoQR1dlw19VDUT04GoNDDaf7fmfaVvaAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847102; c=relaxed/simple;
	bh=hRGcrf757tBUlPVJghD36FxXRGKWF+Ddzd5vihoN5uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLYrAj3LRwrSSpmj4lkPuA5srT3oZUV0Gw05qEm8/u/3+cadnyaMOudr+hwz+dQfOnxTAYKjTAspjwdAWTRH2W9z71ojCQ3jbQRgsB4k7JfKzKLRjqhHwckQ5LMM5DfCCenKqSTXCBNs3lvEbwIkV8rBpHIh3ab14nt2SIzARo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXPMvkaw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475de184058so4931735e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847098; x=1762451898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uqGmMoi1PPAQaFicRlny+AD/MJGroEdg5O4X9kuPbw=;
        b=YXPMvkawHvTCa7O2TOGqIkRSO1AsAnYS4wF4Dua4XUXv2vIpXzO6uc8jbEa5gb9bry
         KhOjFGa4yRfI4Pw/V50I0GAObednKhdFwdvbqHIlHE0I0qvWfyovVf2P7wBQowI08Wd+
         dZpL2msLWPRY3bGpM+U2DuONWxQbLjw/ucVzbQn7b4gUBggJ+oTe1rcYk898qTQHU5vB
         yY5eXqw5B6ZbgckwVn21oR6mk4y5ZtHxrqNPO1+KzTfMxATL2yVqO2sI45Xa4B5tycyS
         bFknHEf1kI6vu8pKzr1zsxf7tcnzmwXlu1OaUvyq2PYCzc8Oa0k/GRCjZ3II9pHihdl7
         rYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847098; x=1762451898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uqGmMoi1PPAQaFicRlny+AD/MJGroEdg5O4X9kuPbw=;
        b=V0VI+76GAeTwsJM9FfrQ5dBTWSnQx5JWG7jGbE2W14fypYyTMcVdtCUPO5950xTwWT
         6Od5Kwtmfa5iRS/Lp5ykWk/XFXF2vZqlEeHeXxWrP43/69+VZONAhPYm0X8YBSnfbxem
         f55zLf+HioKl1EZSvNwiVfxuISG+d8W7b/K/YP0PweXLrnkN42M1F8Svu44sZa1peCxb
         P0pPmGhQgbF4h5gWHlaK5q/X8zJgi+YGD4c3sJG78E4ob9sw/Xuisb4wOKGLOHTVSfA2
         JMGAetqVtDfj5wTM7c3BEr7dp8cTQ+sNre82xOApu3XvRFU4uAOwLMdqkoZFqH3ATlCu
         6sMg==
X-Forwarded-Encrypted: i=1; AJvYcCVIrxi4vRZBPzqjCyYvHU6IVbrSaDx4NNy4I88QG5+VG4bvULYEr7zar7Vcow2dcku1ednh7ITP6XgI7/1NkJq0dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vtVJo4ibvRPQ/Frg9uHRNUuSDFNNTcgBJETIllo/Z4jO7Myq
	zD2CfqlpVQXT6a1D+vYaToU0e4Vfl2N6tIm33XTSBIGpjwDo1k/o5uK/nuRbZYux
X-Gm-Gg: ASbGnctz1/o0VDRTJvbWQvYoSbD9mdCK61QkJyV/c4d4pe+e00KgWxgguVJUZRVeB0T
	Z8GN5jsG6CpTRGer5Rx2KTsxioS7pYTpE33sbdSp4lmY6lEkzkqIdOFRI6A7QVQLni2gsYjxAom
	H14ym+LmiWfyNT1oHvJEdbBqEt9cAF10xsvNFpI+Tao9xf1KsCJxwo3cWAyP0/VI6l8ZsCpOMAN
	BE9boB8MWURgGjWuZZNLQetxUXjVNN6/aTg9BKOiFGYBy4tzcMikOddj1cFXrn2OKoO94tD8ker
	u2HqCS0kpa+nfhNGbd8UpsFWwqWYzpWW/pJsrNIU9tFEom8R2rWqCEoikVmHERAULWTfL+seWWp
	213m9qeE7zLd8or+McNGnouCk0PLTHbOStIyhVxrEar9/EHsYL84ISLxc+yO2EAakSvJ7NuELoh
	oRSabVjm7M+kEY0ut9OZX61tbyMiO1V1IilnYRlSFsFxuUTWNaVz4T2VwIPHQ6qgeevJFIvfU=
X-Google-Smtp-Source: AGHT+IFxF/iIFAzHknsywdTtIa6UpsxTE/jVAyMQAFSxtFD6VyWI1a9ctJ+afJ70siiRJJLy10m6Fg==
X-Received: by 2002:a05:600c:5295:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-4773087258fmr5929595e9.23.1761847097921;
        Thu, 30 Oct 2025 10:58:17 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:17 -0700 (PDT)
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
Date: Thu, 30 Oct 2025 17:57:55 +0000
Message-ID: <20251030175811.607137-8-biju.das.jz@bp.renesas.com>
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


