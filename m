Return-Path: <linux-renesas-soc+bounces-35154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pe1YJN4lVWoFkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:52:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C574E29C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KBF+qj9g;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 861263072780
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCCD34EEF7;
	Mon, 13 Jul 2026 17:52:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93434C990
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 17:52:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965127; cv=none; b=aWuqrzzQJpAxJTEQnrRP/XqIN1VrpzSYWz2S2FYv8bzRG9nDTxhamZgmALL/k8gsf7JvDgaQ5YcpbLEkL8ccpODCsMUtQlgLWU3OlCEX61fubQBto5tOG8KgQE3IQBn3TRiTGcXgDYGb2NgeulO9Jngkxo5K2Afr2XDqzqgFAUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965127; c=relaxed/simple;
	bh=tqFTum8xzoiTwzEIEq11HF/yCjbkDK04uQ9G8LptZfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYaiXWL8FYelLcpk6wVjw9y1C4yfdGVY8fzUjABIT/DGuN6sRfOJIER9Yi3l7BU9185AZ1vatYiEPjfLswvZw9TxghLqk41eHRgPRJo8wdGmEpFzy/FXIxLJc3pkq6d8xdVA7qBXFhmIzcyiKzCNF6G68GzErAaKQ23ZqDCOoiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBF+qj9g; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472326ca506so2810182f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 10:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965123; x=1784569923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAOIXtxwq93qyBcSiXjj47sdRqztMqiVwZYz/1dkMGk=;
        b=KBF+qj9gyEsEzMPO1zfCme4Ao6+6LyyL5XcDxpva+3Ax72ZhHGQTWG56R37UpV1Tmc
         mKyP0A9Y6l4MBHKievJUYhaDsM86wWKjqg1k9f4hwEGfXiKHbyoIxifQ7qBhstpFx5Bs
         quWPYlR0ovkeUzZBctiOIRZEFPYK/b1ryNlyk3oJ25tk0hJR8fEl3BT9UTevbanLeQiL
         v34Mhz6mJwSDQ7pCMjtnTpQZSGLb13i1xnZHuRmTSmEkQTQ0GDM86S9YMyK41YSj+Brb
         7SHmrc5X/mBJGGEcJ1r2o6Lmkbn6r4Gc6iFI7LyjxnnKnm7B4ZctaAKdIIy43TxFcnZA
         uEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965123; x=1784569923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAOIXtxwq93qyBcSiXjj47sdRqztMqiVwZYz/1dkMGk=;
        b=FQzRj30JLzxsgb04wRxuer5JmWTHO+4JBNmU5byJ2RfmF5+QN3npoWSl4gAOWME+HF
         UZ5Sl9bAOP8VKKwFFJ5pxF83pGaQML18cKT/Xl6mb6ZHHZL8PpSIKuZ/gZGe/QeEHrpn
         lOJd4G2ZB3TEnuBeHYCH0Era5Yd0anKBNL77HoWdoc/Vs1uTuf/9f3SZDoTHeD36vel+
         U5DCZ4wKQBlP4uGh61rYKqswxdW9DMYige8j7b6/TMMY9H7pzRpOnyc3MRl+kb06lMXy
         z6oWc7x1vg9eF/g7d3mxol3APDDE+X6OZvJUyYxAYjHwkyFtXn21DS9Sa+ixSwdgJGQh
         v2/g==
X-Forwarded-Encrypted: i=1; AHgh+Rqy+QlIUHdu02AhuqSZLReJsiI9RUnv24DKx0Z5U9EEuHHEQsJ/6fFth+HyYdKu1gXfsE/6XscGDJq4zbnu2urANg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ74GFgYcJga7Fdjdb4U45g/MZGNQMVYzAJroMvVwWAws2qHHD
	qGcWH1mtry+t3q8xPDXKhfe4ha9/WC59DI7TzEXZG2u+mF0Hr4UaXGlz
X-Gm-Gg: AfdE7cleAREPcrZEg/pzySKawJMYKYrNCg0fcgnxUf+SWAg5zv6e/fmhx0a0FJhng74
	rwilUvfKUcDfFIO6jia/YsRBCEnuWDdWx6z+zYmndb/Y+I1pFlstWDfyYvEo2qSfNYyiFJSl0kA
	6E82891DgvqyAa4ovN2ECpRHvE/dyCuMSxdlC9C26vf/Do+3QV7aLzYEDBs4Kbt8AMWhVlGDtoW
	PZxV39uFWN+CHR6CHhoWsckrWTnWKJA4hEwlOj6QokLBeg8roXrJirPes/p/38UEQsZHoEJPlsr
	lX0D+tryTJQ4WN/oqkWJgtdkZlY9Qogw+y/O7knItA2BDs9IW89cBIYF6VnSyrHhCUb5hnrVkwf
	y50aUwjNlpVY0L5Vq2CCfiEQCBfjF6L7SxsgZv9BUP0Y1E5hr6k0kbL3Eks+go9iS2PqKRmfmo9
	RruOk5MnfeToGQrYbKbBT4cA88gff8gT6rFyulMg==
X-Received: by 2002:adf:f74c:0:b0:46d:d5db:98 with SMTP id ffacd0b85a97d-47f46386edcmr630296f8f.44.1783965122623;
        Mon, 13 Jul 2026 10:52:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c899:4fec:2bdb:b719])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464d6fa7sm1011037f8f.37.2026.07.13.10.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:52:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v20 00/12] Add Renesas RZ/G3L SD/eMMC support
Date: Mon, 13 Jul 2026 18:51:41 +0100
Message-ID: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35154-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,sang-engineering.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 189C574E29C

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

RZ/G3L SoC has:

Channel 0 supports SD and eMMC (including HS400/HS400ES).
Channel 1 supports SD and eMMC (except for HS400).
Channel 2 supports SD.

The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
not support IOVS and PWEN in the SDHI register (no internal regulator),
unlike SD1 and SD2. It has an internal divider for all modes except HS400.
It also has a 2048-bit divider compared to 512 on others. Moreover
RZ/G3L supports HS400 enhanced strobe mode.

v19->v20:
 * Replaced the check mmd->clk_mask with mmc_data->clk_mask and moved
   the code after assignment of variable mmd, this ensures assigning
   the default values for non-DT platforms and DT platforms with no
   device data.
 * Replaced the check mmd->max_divider with mmc_data->max_divider and
   moved the code after assignment of variable mmd, this ensures
   assigning the default values for non-DT platforms and DT platforms with
   no device data.
 * Fixed the ordering of resets in suspend/resume paths.
 * Added bitfield.h header file.
 * Reworked on renesas_sdhi_set_clock() to handle the 11-bit divider
   case and the 32-bit register write.
 * Updated resume() with scoped PM runtime call.
 * SD_CLK_CTRL clk enable turned off before updating SCC_CKSEL_DTSEL
   register.
v18->v19:
 * Updated commit description for patch#1,#2,#6,#8,#11 and #12
 * Updated clock and reset description with AXI master and AXI slave
 * Added else condition for reset and reset-names.
 * Renamed aclk->aclkm and reordered the axi clocks similar to resets.
 * Retained the tag got binding patch as the changes are trivial.
 * Fixed the clk_mask for non-DT platforms.
 * Fixed max-divider setting for non-DT platforms.
 * Replaced the magic number '9' with ilog2 function in
   renesas_sdhi_clk_enable().
 * Dropped divider variable from struct renesas_sdhi.
 * Updated renesas_sdhi_clk_update() to return rate for HS400 mode
   and non HS400 mode(uses 1/2 internal divider).
 * Updated handling for clk divider.
 * Renamed TMIO_MMC_HWADJ2->TMIO_MMC_HWADJ to make it generic for
   hardware tuning delays
 * Dropped duplicate SH_MOBILE_SDHI_SCC_TMPPORT2 macro
 * Updated suspend/resume with scoped runtime calls in suspend.
 * Fixed extra space in HS400MODE2 comment block.
 * Updated the comment HS400mode2->HS400MODE2.
 * Dropped the updation of clk handling as it is taken care in
   previous patches.
 * HS400ES support is enabled based on of_data.
 * Fixed the space in HS400ES comment block.

v17->v18:
 * Collected tag
 * Merged patch #4 and #5 and updated commit description
 * Annotated the empty sentinel entries in the OF match tables with a
   "Sentinel." comment for clarity.
 * Retained the tag as it is a trivial cleanup.
 * New patches drop struct renesas_sdhi_hw_info, instead using
   renesas_sdhi_of_data and tmio_mmc_data.
 * Dropped clk, pinctrl, SoC, and board dtsi from this patch series;
   will send later.
v1->v17:
 * Collected tag for binding patch.
 * Resending the series as there is an issue with patch threading from
   patch #14.

Biju Das (12):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
  mmc: renesas_sdhi: Clean up whitespace and add OF table sentinels
  mmc: renesas_sdhi: Add clk_mask field to support flexible clock
    divider widths
  mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock
    ranges
  mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
  mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
  mmc: renesas_sdhi: Add optional axis/axim reset controls
  mmc: renesas_sdhi: Add RZ/G3L SDHI support
  mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
  mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
  mmc: renesas_sdhi: Add RZ/G3L HS400 support
  mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 108 +++++--
 drivers/mmc/host/renesas_sdhi.h               |  11 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 274 ++++++++++++++----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 ++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
 include/linux/platform_data/tmio.h            |  18 ++
 6 files changed, 408 insertions(+), 88 deletions(-)

-- 
2.43.0


