Return-Path: <linux-renesas-soc+bounces-24645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8965C5CB25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6D0BF348D4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D493313E2E;
	Fri, 14 Nov 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrogVsBa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE91313539
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117529; cv=none; b=a+W3bR+7rOiOUvJdFNo5shvWJIV1LLg3g/K6CcWbG9IBT6Obu9ZLrM9N25VT/PnzFV0NjOvLRSypFHSSaM5JHOGX7Kg8tucx0TUAdJ4lRwtUO5RpOwcKi/VZH4eaa4Q+v5CJVMwCfIIf+pYqtFkvz3BxH1WhbiP3ZUIfK6rJECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117529; c=relaxed/simple;
	bh=Zc48rn3Gh3wyXoGNOzH25ymkeF9Nxkl22AZ2QQZQW40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qWPUmkm8MnI8cS4Q1i13rn9Su2gEY4M+nHEB3vG1gnKPegQtE084jjidOEE6A7+LO3LFcy1G+afd3Vgtf4VV2H25EkwxvLlKm4RrMe3OxZYdV68TaNAEdBvzLbQDr7W+FVtTzO4COJWUGN1C1qufy+RH4l0I5eSe4CxmFFtYsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrogVsBa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1110300f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117524; x=1763722324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjwR6/kXVzZn7yjf+PWc3qHx8PvUc69d8LlxS1kTA+I=;
        b=WrogVsBayNd/jlC+2JkDdNeUYEIQotbpUNQQ5e/vSYKjSI0zuUj29wJyyH/K/VTV2B
         hmoF9AD1/LgXmbJgic1ntCsMbsC8TH8RUyUGg/iXRqpdoSirQaA+PNhbzihsD0AQ4IBF
         oiSDQWNQLXUphkupqS1mWorLuPr5y/vHq9KPw75CbHMLEK6OFJk45YkmyD1ng9b/wY3S
         RiF2XREq4G2jBmyOs2t4UcOfwkSUQ+JOHgv3esPTlvlb89ZqEsB+YzFlzC1jiSE7E9/0
         1jbECzGwjazdrmEYNHgi3isI/hnNhHCzgHQ0eaWLXEptdQkqXBG2qvdLvFbHXrxvdme9
         TsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117524; x=1763722324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjwR6/kXVzZn7yjf+PWc3qHx8PvUc69d8LlxS1kTA+I=;
        b=GJCq8qdlQ5X/uU1n2TOG3jlx9vDd4xxEXecFK6wSEwaYewtPo5kiYQ6ZiFa0LLG4rM
         cQJcxJGCQlRIqw65uCIfiA14KBHneJhJyHr8hG26nhkTMtjkVW1LvDRfVn7cAAXXBf47
         u29r7K+B3KBLEyfmCB0lXhnwoFxbdOGGwJ/VpVThyJJ2QJl1CPZvnw2L45lkGEo1apzk
         zDC7KtbJHnNFQzrXohBnesUKrwkK4gtIKsUReWtlIUKQE8RFuP0+CC8Brn/dezYFx/Sd
         2Sivecin45Z2+7cXKgU04IUXWS2xIxrcthdfj8slxtADgh+mZIifuYzTpGp+IBwQHSrg
         M78A==
X-Forwarded-Encrypted: i=1; AJvYcCXjPDQCT1nX3VVu8/4Lc/UoRE10ryObCOypn4Ga+L+TClPq2DEHGnjVQ67Sxub6lj8yM/kJJJmFKpXwfZver3i3rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8bHpUDHA+Y2gsh1MtWNyYjTl+EttCXf+dZe1p/06HZ6yq+h+0
	Ly9w//HqymYz7uKVCpmXvjF80bVfbWOqKNSPBPtZzG2CRKpc2hJALCSD
X-Gm-Gg: ASbGncseQzlonSzW/JnEGLjJ0cDCJXFsU8sA2pVETyZZsVHkkqYJ8hi7LmYQm37VEw3
	Am/CrLQT2uztTcOfZ48Uie4UfqgQouX/nXEk39KEF6fQI7GQes4wSTErcwRMdN1DuItXU9ycOIN
	HALmKyAF70nyXi+CRiJoIeDnzAJSaJ4mYe8Pa6yuTooEqEc8+L+CROEwQJmY0HCJrMFPCez/WI0
	si1ir2UFrd0vqyeoQO2JIUJ3Fd89jsP1GpFhurWs8oIg2pUW+0x7jiW27+Bgp3FtiVtbmnrL0+t
	Q5r3bHc1sFnUCCGmjnoM1gqfWGwhZ67/oombtQ6W8dIEaU77OiHRDgV8e2O7b49UlTz/irX14GO
	OoRcosyc4eES+7IzP75iAvjpcBbimA0iCApFTAyV3lHS9EIM25KlmDA8RH/T0/HMMx4cGCNbPqZ
	5lcoQ4ba7QuhxCMJ1RN5VnFPe1No+ToJ++N07Hp0wiwFBqXCxOrLYLBUkFErS0mcskk8bUXIe4O
	tF2/IEDEUDmnPx7Yl3fmOVkfZM=
X-Google-Smtp-Source: AGHT+IFGMe+dE5yo8EXauIb30wbc6Mj9yI1wBet8gXWiAgeJIUmxWa5RddlufYT6TUnAfj2nfMN9Ug==
X-Received: by 2002:a05:6000:2911:b0:42b:32d1:28ae with SMTP id ffacd0b85a97d-42b5282262bmr6112243f8f.22.1763117524062;
        Fri, 14 Nov 2025 02:52:04 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:03 -0800 (PST)
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
Subject: [PATCH v3 00/13] Add RZ/G3E RSCI support
Date: Fri, 14 Nov 2025 10:51:09 +0000
Message-ID: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E RSCI support for FIFO and non-FIFO mode. RSCI IP found on
RZ/G3E SoC is similar to one on RZ/T2H, but has 32-stage fifo. RZ/G3E has
6 clocks (5 module clocks + 1 external clock) compared to 3 clocks
(2 module clocks + 1 external clock) on RZ/T2H, and it has multiple
resets. Add support for the hardware flow control.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20251114101350.106699-1-biju.das.jz@bp.renesas.com/

v2->v3:
 * Dropped 1st and 3rd items from clk-names and added minItems for the
   range for the binding patch.
 * Added minItems for clk and clk-names for RZ/T2H as the range is 2-3
 * Added maxItems for clk and clk-names for RZ/G3E as the range is 5-6
 * Retained the tag as it is trivial change.
 * Updated dev_err_probe() in sci_init_clocks() as it fits in 100-column
   limit.
 * Dropped cpu_relax() from rsci_finish_console_write() and added a
   comment.
 * Added sci_is_rsci_fifo_type() helper for reuse in probe() and remove().
v1->v2:
 * Updated commit message for patch#1,#3,#9
 * Added resets:false for non RZ/G3E SoCs in bindings.
 * Increased line limit for error messages to 100-column limit for patch#3
 * Updated multiline comment to fit into single line.
 * Updated set_termios() for getting baud_rate()

Biju Das (13):
  dt-bindings: serial: renesas,rsci: Document RZ/G3E support
  serial: rsci: Drop rsci_clear_CFC()
  serial: sh-sci: Drop extra lines
  serial: rsci: Drop unused macro DCR
  serial: rsci: Drop unused TDR register
  serial: sh-sci: Use devm_reset_control_array_get_exclusive()
  serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
  serial: sh-sci: Add sci_is_rsci_type()
  serial: sh-sci: Add support for RZ/G3E RSCI clks
  serial: sh-sci: Make sci_scbrr_calc() public
  serial: sh-sci: Add finish_console_write() callback
  serial: sh-sci: Add support for RZ/G3E RSCI SCIF
  serial: sh-sci: Add support for RZ/G3E RSCI SCI

 .../bindings/serial/renesas,rsci.yaml         |  85 +++-
 drivers/tty/serial/rsci.c                     | 412 +++++++++++++++---
 drivers/tty/serial/rsci.h                     |   2 +
 drivers/tty/serial/sh-sci-common.h            |   9 +
 drivers/tty/serial/sh-sci.c                   |  72 ++-
 5 files changed, 496 insertions(+), 84 deletions(-)

-- 
2.43.0


