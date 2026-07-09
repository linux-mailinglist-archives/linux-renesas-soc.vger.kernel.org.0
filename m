Return-Path: <linux-renesas-soc+bounces-34989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UqoTJpT2T2q+rAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:29:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E9734F61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:29:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SbmW8maq;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 752BE300559C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 19:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0C539C636;
	Thu,  9 Jul 2026 19:29:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF093B389A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 19:29:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625361; cv=none; b=JAeNRX1gXJtSP4XByTOPEH2HWYSA+HkJOhY3RUgio0/YmubbVTjhHBFmQC32+ZhZ+MMfj7iz9qDTHOsWaFYLRB6uJ5m98CgLksbVO6WVkNYC9KBGnNfUHI/B3CIgenNty6nZnzO/hJuf4cZEIcXn6scoOe5Ojooe8utnLv3N2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625361; c=relaxed/simple;
	bh=dPCjt2VVOrgeOOiej3J1U81Vg/oNhi0nOgkXTTXIb8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a5x5pbrffeLtxqgLuZvKmhAi/SIKk9a2oBhhvJ7Qe2hryn1F29mv7mkixURaSJCGK91cLEdpUlSq8IcoBMZgtHtghun8GLITgjxqBR3ZDmsyYI0qEpBF1t8nplVGPeSXbexOdn7BJV8UCfR456nfNILWTfw6Q+PtjCQdQFV4tmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbmW8maq; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso537255e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 12:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625358; x=1784230158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJQOEk5yqB+dE9SiEhcvYRxkNhnNp9MLYOiszo4g7GA=;
        b=SbmW8maqe6RrhgpI1e5+/YVHoWVT6bJS1yzE17CVYAatNWNSTvVGo8jQj7HV16ezzp
         2/iE0NlcPsP5qF4gAXdCpjQLe1tN4j2RutsWj6ZnzBl8wPdBTwqa82SURrq41I9UDuBV
         dDlWQVhlmpBCqE7Es/3Py8uAsOcfg8WQUUhzN1rMmfgFNsO0uxEP6gYU4YksJi8KBKpk
         V71oiAedIENv1hFGDQYTzCYl6T2r8IDeHOVnM+m8uV2zKMvLhybd56WfZf4nrHycRIWs
         zdDIXlmF7OiSlYUhvIN+J1ohyqUGlYblQMFQEpzl9GHFeDefRkKi6qzd/qo+bHbsI8ZP
         MOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625358; x=1784230158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJQOEk5yqB+dE9SiEhcvYRxkNhnNp9MLYOiszo4g7GA=;
        b=KngukXRaMyLDmWstgtkYHQk2lsIB1rbIeJ7+TYZdA06EqWufTMM7+miCX/iVYa4/YO
         dfAMX2SUEzjMXj3P2S9Oi6WRqsXmCo6KGx+pUPK3VgNzBvOw+3JxNJK5wxxCPdArQ24G
         Ua0CbdkLn6Jp5aWkvFdugNiCa7d0yLPRNsHOXcVQ8n0VeIZyw/DAfOl22Dq9nlP5ntwC
         p0IHZg3wyxad8QTxx4816jCettKaZpP23nuqj44fdHw6rf2OrXePJ9T3cH9REMyz/H0m
         G6prOYDaKCA0fJh8HVZ6vRkdbSCnXOQjkm8nwwOzjiNOdWuR/V5rmND/PA3CDSWHrTAg
         lVLw==
X-Forwarded-Encrypted: i=1; AHgh+RqOwloHZW1zpdxs1ptN+rQcq+Vsk/33r9Gcer/N06sRoWJmcIhLM7Vbqdmx9PlClPpJ9HatS0o3ouFC5DpDXkcwyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNa7I1xBrPLeqHgyDPJW939Gv6QA6npB5Mnc7+Vm6UJEEpwv2Z
	RD82Z3w57ui4iKaLni8VrI+VR34lnkad4hXIrN3w0LTF7+H+ayp6jriM
X-Gm-Gg: AfdE7cnW9YOTRU1B6v/eMDFKln84K2L04hJNqq2ey3x5YlWp2/zD13kh4PA3746hOr2
	MgKjxuTYBmg4N2gS2cCRUkPNkV12HtGTw3f+pCahfgM/jO/OcnSmlmqQGKAwI1zODyt2Uv9LTI2
	l6HP+gxr6RR8Jcg8jlu8CgyFGHXF5hyXPICYNTX7de8bwstxQCeFA85ywrl+jOYarOScCtSXSHT
	sJwIy09iPj5karI+fxnIktTBxOXsA0XXIjmP6/aGmfykgAryMxZtqDiVKnMnLgehokmsdU8dUQ5
	V72Bkqw0ZDgDs2hGSMptt6nybbzBrrFeKeimh/TOUiWGMIuOIkQw5u5T3/+YH5wV+0mvvvso80U
	EVlFSbkcqKEFQINbSHzRRhjMn0N6UCFAUmV9W2/0edfb72Bn1idJrskVZMyv4eFFXAOCSLVCwSM
	gGJgTqz2DfiMgKAZ+fCUEJ
X-Received: by 2002:a05:600c:4e93:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-493e67f7c3emr78360215e9.0.1783625358090;
        Thu, 09 Jul 2026 12:29:18 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:17 -0700 (PDT)
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
Subject: [PATCH v19 00/12] Add Renesas RZ/G3L SD/eMMC support
Date: Thu,  9 Jul 2026 20:28:57 +0100
Message-ID: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34989-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B6E9734F61

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

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 108 ++++++--
 drivers/mmc/host/renesas_sdhi.h               |  11 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 250 ++++++++++++++----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 ++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
 include/linux/platform_data/tmio.h            |  18 ++
 6 files changed, 385 insertions(+), 87 deletions(-)

-- 
2.43.0


