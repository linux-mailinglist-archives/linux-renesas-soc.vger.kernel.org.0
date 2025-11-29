Return-Path: <linux-renesas-soc+bounces-25375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9739C943C5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D4454E3985
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300EA3101A5;
	Sat, 29 Nov 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l30bLzuE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B14014A4CC
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434615; cv=none; b=KSdfsOliaHrd9MeWRFxnybl11ltkLnqEEOhHp9Br2sC5gDZd/Qx2ZdWNKcDDjr/a3P+Q6WvISamSTRDgMWNYkRXtWcYQm7d175X1hqhfFGQNvBOBKFsc0exIMH0rYEn1OsM6Tg32Xm6laoK9tHJwk4x4XU0xZkWdQhlpQ9Dwfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434615; c=relaxed/simple;
	bh=4+qdkiLaRporDdUrRzipvhog0ZgS7os+IKj+fRAluV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXXcwnGgQXFdAsI32PK/c7944Fl8HbCfbdgMF1ZcNtwQcMYwIlZRIws4NM1RVMnBGW1UyeF4zS1Ze3nM+NmiTYKYYWUAzAVtXZKVCsmGA7hxPAf8hUJn3F5gnvqzl/gy0589YSydFi4tsqCa0pqeWZbdP2GBBHnu74mGfcrcC1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l30bLzuE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so18856035e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434609; x=1765039409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6H9KwOpHdjyaDI1JbCW5ce4fCWBO/3HVRps68z53Be8=;
        b=l30bLzuEHrP9Dxc0xrAFcejaOrDnwDh/0y2JMeqFdkD8glkGNC2RRiKXpcifcv5eRK
         4b6htDREeTKJzU3LpgiZxhuv6Da31ltSurGw/pvGr3dR2e2tmZYeEKE02l/qHbsYJkS2
         5suRwBqFmtJLKAxqQfDdr5eTFxh27X99wRG0pqVsyKVtBNDXk9/LQqaBvxpsJabNxAT2
         93Avp40k8P57YTCdj6Hy5KeqRn5VlSuaFTshqmX+uDmlatAZythWIeuOgWFFO7pZrPOw
         7fq61orXyo8HQjuinNkaNWv4O0ohl8ENdKigb1nBwHCthy4JV0AzgupkXYABaJUMmPR9
         SO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434609; x=1765039409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H9KwOpHdjyaDI1JbCW5ce4fCWBO/3HVRps68z53Be8=;
        b=eO9u2P073kMVsD5W8x1c10EpwTo2OUZwbsUxsRIj7L4GELSvTG7Mzlw64ek/vssS5z
         GnkHCbvqtZrmhoU/fCeA6AhF3+lXux7xWWwGYO4Z+n2rdiHHwNRtCFrpaisk2S+zyL5s
         tC03ab8QRn93thN9Y8sYx9uUUht/eHaNrtpQ304iUofBV5v5a7fjZe5NsqePIKmmllyx
         YqzqwoCBdBsc8ewrG0XxsLXm57kDYk5gXZeBdVo3zmvlPqNYNr2DKwowBWZdKDn0sttc
         nqyGtxSfEDu9TvUvwJI9oFa/0azaBQz7klaGtUeFbkEcAq0f/mo3AXt0Z2nA5K+S2r3a
         FP1A==
X-Forwarded-Encrypted: i=1; AJvYcCWLXeobqkVKBWI0QDZujHUPlPCjKVk1291pUa64TlqdxCHHW+kC8FS3P1bOHxFsPMYlOaPBynsozyTmyWJQi/7N+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoP5rhZABe+efe11+oVt+SJaX2rAisha/XbrGOCyy/79OMk0yl
	2d1OP/S0sxC1RX+soxK8dDOl+4bl+okbo6h6oZWIrgs5aEGoPXAmAbks
X-Gm-Gg: ASbGncuay8330f+kB20PDFNuVBoFzkPo3aZpjpeolWtCDk78Emx7DlKFvafxR5uA/Wd
	LdU7a2z6Kg+QVHOz+dMjyUX4DT1TTYInbPfCieUpSDm6DY/6phD+omkhjhCxcdc94iq5B+up7Sy
	R5q9AFik+kk2Eajxv4JrsBtdYAKKtrLnT7m5ktVEHaJimOw0SzGoFP8/wAZkK6q1lcpbk1bhvlR
	c0UMnstd/wb/M6sprGfko3lLXvhIztii2dQq531qVH/GWPpAytjFLC8y8X8fijaY5a3fIgcdSkL
	O96pmY+AigITX7Zd40lAhlTCL0uCsCAWsBUzZV9APgQm69RuV1gB9z5WQsgLGjzRPiTm/hXpAR1
	dR1pJbwfp+Lb4XMb/uEZN2vUzIjSHYPMuseSzbt4hs0s0Lg6syQ8EUzpWmnunROQmFsg3iwBtsG
	lJQFb57wePPYqHqiFOR7Qwc7kmduTfHie0Y/zR7THVE2Iw0gqojq3IfMOUx2zAu0qMZ+Rv/qDWt
	8IoD/pMKYYX0zm/xoZd
X-Google-Smtp-Source: AGHT+IF7BSSkL4PJ7kaLjjZt8SjH/QC2LhUcvOWBNmfsg3hyl22mKTnbN67vH2TMItHoa/S79deNhQ==
X-Received: by 2002:a05:600c:35d2:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47904ae214emr233092365e9.15.1764434608673;
        Sat, 29 Nov 2025 08:43:28 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:28 -0800 (PST)
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
Subject: [PATCH v5 00/17] Add RZ/G3E RSCI support
Date: Sat, 29 Nov 2025 16:42:56 +0000
Message-ID: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
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
resets. It has 6 irqs compared to 4 on RZ/T2H. Add support for the hardware
flow control.

v4->v5:
 * Updated commit description related to IRQ difference in binding patch.
 * Dropped the tag for binding patch as there are new changes.
 * Added aed and bfd irqs for RZ/G3E.
 * Moved reset: false to RZ/T2H SoC and dropped the else part for RZ/G3E.
 * Updated conditional schema with interrupts and interrupts-names.
 * Added new patch for set_rtrg() callback.
 * Dropped checking port type for device file{create, remove} and instead
   started checking the fifosize.
 * Dropped sci_is_fifo_type() helper.
 * Renamed rsci_port_params->rsci_rzt2h_port_params.
 * Renamed rsci_rzg3e_scif_port_params->rsci_rzg3e_port_params.
v3->v4:
 * Collected tags.
 * Dropped separate compatible for non-FIFO mode and instead using single
   compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
   by software configuration.
 * Dropped the non-FIFO mode support and will add this support later.
 * Renamed clock-names from bus->pclk
 * Rearranged the clock-names tclk{4, 16, 64}
 * Added separate patch for sci_is_fifo_type() covering all SoCs that has
   FIFO.
 * Updated commit header and description for patch#{3,9,16}
 * Dropped rsci_clear_SCxSR() instead of rsci_clear_CFC() as it clears the
   CFCLR register.
 * Added separate patch for updating t2h rx_trigger size from 15->16.
 * Added separate patch for renaming port SCI_PORT_RSCI->RSCI_PORT_SCIF16.
 * Dropped enum RSCI_PORT_SCI
 * Replaced the enum RSCI_PORT_SCIF->RSCI_PORT_SCIF32
 * Moved rx_trigger update to later patch#16.
 * Reduced the checks in sci_init_clocks() by avoid looking up clocks that
   are not relevant for the port.
 * Added separate patch for updating early_console data and callback()
   names.
 * Updated rsci_type() to drop "scif" type instead use "rsci"
 * Replaced the compatible "renesas,r9a09g047-rscif" with
   "renesas,r9a09g047-rsci"
 * Renamed the port enum from RSCI_PORT_SCIF->RSCI_PORT_SCIF32.
 * Renamed of_rsci_scif_data->of_rsci_rzg3e_data
 * Renamed the funvtion rsci_rzg3e_scif_early_console_setup() with
   rsci_rzg3e_early_console_setup().
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

Biju Das (17):
  dt-bindings: serial: renesas,rsci: Document RZ/G3E support
  serial: sh-sci: Update rx_trigger size for RZ/T2H RSCI
  serial: rsci: Add set_rtrg() callback
  serial: sh-sci: Drop checking port type for device file{create,
    remove}
  serial: rsci: Drop rsci_clear_SCxSR()
  serial: sh-sci: Drop extra lines
  serial: rsci: Drop unused macro DCR
  serial: rsci: Drop unused TDR register
  serial: sh-sci: Use devm_reset_control_array_get_exclusive()
  serial: sh-sci: Add sci_is_rsci_type()
  serial: sh-sci: Rename port SCI_PORT_RSCI->RSCI_PORT_SCIF16
  serial: sh-sci: Add RSCI_PORT_SCIF32 port ID
  serial: sh-sci: Add support for RZ/G3E RSCI clks
  serial: sh-sci: Make sci_scbrr_calc() public
  serial: sh-sci: Add finish_console_write() callback
  serial: rsci: Rename early_console data, port_params and callback()
    names
  serial: sh-sci: Add support for RZ/G3E RSCI

 .../bindings/serial/renesas,rsci.yaml         |  99 +++++-
 drivers/tty/serial/rsci.c                     | 310 ++++++++++++++++--
 drivers/tty/serial/rsci.h                     |   3 +-
 drivers/tty/serial/sh-sci-common.h            |  10 +-
 drivers/tty/serial/sh-sci.c                   |  80 +++--
 5 files changed, 422 insertions(+), 80 deletions(-)

-- 
2.43.0


