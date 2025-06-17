Return-Path: <linux-renesas-soc+bounces-18448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02CADCDE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D20BB7AD242
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99C52E9729;
	Tue, 17 Jun 2025 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl5EmfG0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2382E764F;
	Tue, 17 Jun 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167914; cv=none; b=o1NmCkbjd04W9ZxnK56yfagD1mJdO2gaYkBUIQZzxgVLt6Mg9kmKejZddrQQ/IxqclzpfoGTB3YEph5fyCkpFDYN9e+e6ZX5ubRn+1H8iEwy/wJXhIiuUpk9Rsw09IopRTPyS5Z+YThdQ6NW1y4WRQwyED+QbtuD7HK21U4scus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167914; c=relaxed/simple;
	bh=32vaS3oDDxD9wWwCFqvRGlf6S2LFX05pBvdPaXOd9PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4zvxSp55qKYUA38F6JyR7AwONj+yklQpamLDp1lFF0JqYEFXjx6rgAoI5ssCBQP595jovZgNEWUz6zmXPRXcUV0fq68zY07qBWWQ8747BsSX4ylXYTTZkDTRvYNoGsEUkXw4MQXmH+JtoJ+GRnCYLJXV2YhQ9rWB0goNFunYVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl5EmfG0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4372253f8f.2;
        Tue, 17 Jun 2025 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167911; x=1750772711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAqNzOFflinZMwWtXBZIkd7G8+XaYao2cwGX1v4/ej8=;
        b=Pl5EmfG0bRHzPKKgJvYKHkAP+1hI0lNQVnQqyc6fzBqCqFpG6RDCIjwvKHom/3UcVH
         cKpjSl8cU8jKu+txWG2AT1Ui8yDRoauKK5+sI4b6JW0fkBvoXqYr5oea0Cq3r/3Iq7Ll
         0647CyARml4rVb3oQMO6k2uGZgLTkgono+SWSYpzPMIK1kSoUtFSacyV/hyJtutgnBb9
         AdogPl3HXS0TgqQBkoOf4GryvKQcAWnMbD3efFdPuABkPmQxyv/Dsdl2rIKT7u3mCyQT
         XgGShMhMBUNjrlp6Rut6H3fKHkIfE7NqvtEqSaUWxRU59gTH+QqeF0xYoQH+57ixaLpH
         XWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167911; x=1750772711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAqNzOFflinZMwWtXBZIkd7G8+XaYao2cwGX1v4/ej8=;
        b=qm0PtLYATbRu9Gdhwcqs5VfM1TXkURW9NJ1x9DfSBv6b0auepQqQW/1OjEzEgqDlIt
         ny8vTseBdL0R9PeKXj43/alTIXlMpmwXiOcNYUBnUENOhoXnmK5inleea1MhOKAgVlaF
         6biB1mG8Wv5Rl3RcZR2ns+M6cdJXWuM3XtClxyBDn1lsp4bJ+ws07Fbove2D8/ouclhx
         FNAeIO3wX6+IMSb0ycDbvTkYw4/7muGHILXk/himWxCXJkZ9EUBMMbbi+8Z6nOoBDJrP
         MHtD39afMUMinyPe5fR6sLuvfaIDKR4TL1xHJNwOhC2gLS1xU6E3XySp9ffFIu5/wTEU
         FDTw==
X-Forwarded-Encrypted: i=1; AJvYcCUmT9vgVrpmnAF0+W1Wl3xOmwDjosieqUllLoCS0Q4ZvaOvv14ieOKRoffMWy7/rqIQf3oUc/SvzffO@vger.kernel.org, AJvYcCVI1Zxfjb5xZ+Gm/v+aVM/uV3UunOey/Bu9r6n1VaPheIDWRhjORNDvd/5/rj92rY1ZLQap7TBp9eg7yd356rWQHrk=@vger.kernel.org, AJvYcCW1oBEntu/wZ1Z3ik3TQzSpfe+hwLLLMOt9iyalAFOjmLX/EPJ8KRG3kg4XVgWCsEzCgES9+R7PYws7IdwY@vger.kernel.org, AJvYcCWviDRnE40Wo0/4e034xB65/+qIkcFHLfoNxeMNJnr/cc9oCHkXs5fTZiVtK+FyqZBytog7EYrZCVsSkzS7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkysxvhnf6EEI8sh7YrnMMIcV6brWJ+XHiU51lQsF4b65cQjQz
	64cVmiGJmg/8jvtrHXAy1IfvN0mUJZKolX75TuWPD0ro6BO4b2xY3iUW
X-Gm-Gg: ASbGncsWKnBnZ0YJXvt1OeNfdwFJd2hU048E9WO1u5xIXk1mCNiYJAPAKui46EHT4S6
	CJZwWIupp3iIaStXtjqxG5Efwt7KJitgPYkZCNOcXcVjoVe2PIRtUmiPmt7u3vjRrmVxx8g7KcA
	6UhWrk1bvSXdCWsn0xc07AI3Hc0SyrIQtGRBS6km/9NKmUFHmpTGPozfD2FDJhSAFJO4HZNo02N
	U7QKo+DB//ZFioCoZcjLXdtuG/nvl189IfzV+wxQlsgRMztWno7618O+UVD7H6xQVWZ0DoViRxV
	H8kAy/pK3uyjrmGlQxG730prH5DwTMz32e3Yky7hgbcePIa+TKBrEK5GY3Y7gMo+tEwPHWUPWV3
	dBFGbVZNFPWw=
X-Google-Smtp-Source: AGHT+IEIBy/qhhThKzZjZs15iuzXDn5mHLJsctTHGEcXER4Z289sGD5otxtVYLG/NG91JzFkXG6SQw==
X-Received: by 2002:a05:6000:420c:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3a572e92ff4mr10040312f8f.48.1750167910898;
        Tue, 17 Jun 2025 06:45:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 4/7] serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in sci_shutdown()
Date: Tue, 17 Jun 2025 14:45:01 +0100
Message-ID: <20250617134504.126313-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace direct calls to sci_stop_rx() and sci_stop_tx() with port ops
callbacks in sci_shutdown(). This enables the RSCI driver, which reuses
the SCI core but implements its own stop_rx and stop_tx logic, to reuse
sci_shutdown() without duplicating code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c356544a832..5c4283ce542d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2289,8 +2289,8 @@ void sci_shutdown(struct uart_port *port)
 	mctrl_gpio_disable_ms_sync(to_sci_port(port)->gpios);
 
 	uart_port_lock_irqsave(port, &flags);
-	sci_stop_rx(port);
-	sci_stop_tx(port);
+	s->port.ops->stop_rx(port);
+	s->port.ops->stop_tx(port);
 	s->ops->shutdown_complete(port);
 	uart_port_unlock_irqrestore(port, flags);
 
-- 
2.49.0


