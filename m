Return-Path: <linux-renesas-soc+bounces-25104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A74C85AF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 397D64E1CE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72045326D6E;
	Tue, 25 Nov 2025 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUcx4QPs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6038B218ADD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083199; cv=none; b=WadJG+ZdlilRxQBa/WIEcs0hw660Z9NFkvQG5TGOYcCLmJpyZn7zjQ0KTs1AOP8/loXXZ0Zp8tm8+4DwEByQ2on6E0s8kr4t6AQ3xn8UYsVhC1Y0FonA2+0T1BU1Ol4ahpop81aSMrb+kU9E2zee2D7Hyye82IfDgcRTmjzFt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083199; c=relaxed/simple;
	bh=0xS8K78DjTAzkXCfcjF18wm5OY2Tpz1uHDPV+jX+Zbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jwfydOBDjLJL+mT1az2LOeW76i4379DXgny+FTCOMeyBx46nvcW0jcfRfiFn803Jgrtq4GOmeBzIdtv1uPpE/zGC69arvs+DLEUdR/98JWKVT/DEYpbYGkLBy1Buz0l3EPN4VzY5HtQxc9UOhhNJWOStX3LLWOeDMp+QgPpqZ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUcx4QPs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so4612088f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083196; x=1764687996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JcCfv4Yq0kEBneZaO35f9OMACA2LwGKSwaRGO36V1TU=;
        b=NUcx4QPsH4760Lms5/eFDvxDYkJfQtNjUPrfXdiKk1YciNoyzy/avqrwvfZikAqBMp
         Ia/26ymhhVcqItoXfuZnrpNcOml3ObHIQr9qOhch845HCaqB7xZn1Zsu/RoUEfR/s2A+
         L4GnJvDTbqLH34S2LXuZASd3kDFOqrgXhDA/BAFNEUDReLcx8s9hrWl9ttjksqSeHIue
         mS7cxu9e5qASJeqgdM+B9ecfkBFngdTXeSKu8P20/fMEI9NR+NPxVXwwaOuL/ybYQgyQ
         uhE9GNQsmEHTPlpmaa2/gMttvXNOVrXlHzQefY5v35NRPHwl/0AyA0mw5HMSu1ns0P4Z
         Zd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083196; x=1764687996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcCfv4Yq0kEBneZaO35f9OMACA2LwGKSwaRGO36V1TU=;
        b=cXYtiOmis+7TKyrKX5/s1l+Y3IySc4kKxbSXWZXmNuQPE9EbrNYQcsZ4RFeY+8zcSg
         t8GbVgvVdmuCvlU+2/pLFjV0313OIEhFMkLnF8K9DL730i3Oo4TIE6fNLq2eQHmnB0Yv
         nV4DjUBYgTj60XHlVtT+y2zEAftJqlxEWMmRnJjyr4WGE5yMTuEKQERJXLATywAG3B2q
         6o6Z+8IiJMJHYkxAt7+eTmlneXQeYtbDLBXkFlBT1MqWkj8Gc0HK5w1aEX60TF8CvRqJ
         5qm1cmwJQhvJsX74VkbgAtloMbJqEaWhImims4N5kSDOjqJR2fJYbEK50k0HkgOKXdsP
         9OPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCxPnm/UYMtO7oOfXMilVqSjq37zKDpESr6EzakyhkWuvYNdy2e/FmVgFKeGsXDsYyZhZhG0a6HN9AMNyQ+j/FbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHhb3mb133Fyu3vw8Z+TkfgqJ5tD0VdT7lsXIZZ2ISsIOJ3J2B
	4GvOkRDCpC6Fv9NblC0QOt8qU7eipk1iI4dnfc50fugfV2oa4slD3haP
X-Gm-Gg: ASbGnctlnolnerylm4/olOjRbNtJHbaYwGjPkiARVpdVIineUL3n+41QgE1gVdrPLun
	UvJNoUFkT3j1yYZVmk1csu0g20Yzf9NcpI1tu+np8XpV79wHMWYatCxHjWIx41ykPQHLm5yTTPl
	x4yTUKqGu8anmePZITLC1roRMtwftxB8xg4kmcBb4UM5GbYxwUnO7Rd0fuWYIg/0UL6v0nH9tem
	EDyrxEB3lj8e8ps1zJjv11lguE/2FLjA5Oa49P+qJBoNHmy7/ryGZaJGebGJUFYP1f5jQ1SnUjG
	lGZEBTYy/N4I1MRqM9NWMdKsiOGA9z/htNnYv2EyQNFUVLxBjGAjpbPUBbeq8m72fIf9jtQNP/G
	lLGbYOQKXYm/5xZcxU6c4hnhZtiKevpcy0bX/FHtlR6OHRNU9CbH+z6cgNd9HHEaxvGcEUugEAE
	pYebkVLj1L8HwnQKHrlS3xVnfuQPorpLOcl6+BhTQsjYSn9QXw54c55QQj3iSIiTrfRRlCrmJu0
	PpA35iygVp/eEDZ
X-Google-Smtp-Source: AGHT+IF4viHI0TJFa2C5jwvYIFiGsGwcUn6t+vH/eRa8epQGnhvHI+4IHs360MrFe1ff3k2apj9zEw==
X-Received: by 2002:a05:6000:401f:b0:42b:3d9d:c5f8 with SMTP id ffacd0b85a97d-42cc1cd8ee0mr17498582f8f.6.1764083195643;
        Tue, 25 Nov 2025 07:06:35 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:35 -0800 (PST)
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
Subject: [PATCH v4 00/16] Add RZ/G3E RSCI support
Date: Tue, 25 Nov 2025 15:06:02 +0000
Message-ID: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
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

Biju Das (16):
  dt-bindings: serial: renesas,rsci: Document RZ/G3E support
  serial: sh-sci: Add sci_is_fifo_type()
  serial: rsci: Drop rsci_clear_SCxSR()
  serial: sh-sci: Drop extra lines
  serial: rsci: Drop unused macro DCR
  serial: rsci: Drop unused TDR register
  serial: sh-sci: Use devm_reset_control_array_get_exclusive()
  serial: sh-sci: Update rx_trigger size for RZ/T2H RSCI
  serial: sh-sci: Add sci_is_rsci_type()
  serial: sh-sci: Rename port SCI_PORT_RSCI->RSCI_PORT_SCIF16
  serial: sh-sci: Add RSCI_PORT_SCIF32 port ID
  serial: sh-sci: Add support for RZ/G3E RSCI clks
  serial: sh-sci: Make sci_scbrr_calc() public
  serial: sh-sci: Add finish_console_write() callback
  serial: rsci: Update early_console data and callback() names
  serial: sh-sci: Add support for RZ/G3E RSCI

 .../bindings/serial/renesas,rsci.yaml         |  82 ++++-
 drivers/tty/serial/rsci.c                     | 304 ++++++++++++++++--
 drivers/tty/serial/rsci.h                     |   3 +-
 drivers/tty/serial/sh-sci-common.h            |  10 +-
 drivers/tty/serial/sh-sci.c                   |  78 +++--
 5 files changed, 406 insertions(+), 71 deletions(-)

-- 
2.43.0


