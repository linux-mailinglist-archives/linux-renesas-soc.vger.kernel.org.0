Return-Path: <linux-renesas-soc+bounces-34320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OdyUMCZbOWocrAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:56:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B606B0E36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:56:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=P+pVebQH;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B67B83011A49
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3763CAE9B;
	Mon, 22 Jun 2026 15:56:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C673A254C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143778; cv=none; b=H28ZZkrdyQUB1ccK6R0UVc5ln1LyuPftDvvQsRp5Yrr9NBYXL+s8DxNwDOP+h/jRnh0rn1hn7o49oJwQope/CqraSaU8x25mtZwGZInkL0K45kfufrJYRcK4MFlyWxMEgaMPSvxjnDT5UnUSE50VsD58D8Q27Oqde878RhSFDmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143778; c=relaxed/simple;
	bh=sP3DTqWhImdGCeIzHLq89T2njIMNXSi4QCKR90SAFW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VhrTbBFOSd2Zcono8V5SJRUilhuwJF2rqIHugk9K48Ms5cqCRVV3JqDYuOu2GiR8sK7r/wvnF/jgvB80wQu3Bg4Enw4Gjm/PAAtuE3jl60JFm/f5fLq8MkiedM1DoX04aHfh1huw2nQPbg+DsnPhPrMV4uJyCu7axmm8zvFY0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+pVebQH; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49222b6e871so39405215e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143775; x=1782748575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cK1dU3jvwLWVY/k3Aa4QkwFEo+fnh0XN5XALhyjrfS4=;
        b=P+pVebQHtSH3OcO+M9c9ctohSipa1dWcpbP4iy/mh/TxhMLqUM1AEc8EvVTiBt1Yag
         PDwQInUUtwICf1StG2cTSjgsjx6rhx4R96Z7rXLaC/uH4ytCZjSmFp4jTKY1ixyRIUOA
         7ztOt5ItBN/H4jBJMEocfQcg//lbM5mNwxj/owUZnkpsHqWw1akzj36N00t10wOfQK4b
         CN2oyuB4Bn4A6UmaYfR9jI3O0NciGD0nDTd4lggqeh4s9QP8zir0iW+5jXlKawud4e8c
         wFRs4+WJG3x83mhIrEdBurCS0T++aO7Jvk06W7N4Kbp1VqghOt0iG4Iu+sdlLE3hl6sQ
         mX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143775; x=1782748575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cK1dU3jvwLWVY/k3Aa4QkwFEo+fnh0XN5XALhyjrfS4=;
        b=ghOqpHTAK+WpzsPwxpJwZwasXnCmZdqDiEKNShWZZiii+I5Rkn1PJ1WATDHS+5zYBj
         1fy8tQ2VwxfU29pWe7hwa+QPNdrUJwQkQx6jpzuVPsFs+6T1wMwvFv3Z27ArYsyEyCY/
         9O9BRqiVz2xHTRFzUMPfZnS5hld/jXNZoC/qa7c24qvcMQ/9fARuGkqY3rCInnrB1viM
         kE3m3/17UaecQaXhWvMebwpINxJenDX1+SI0Egq9UmFEWT4h+uoMGt+THOxOFJs2w1xK
         0isQ6m0zPP27uKmtSthWnJzqiN47YFJ/uMmLL7zbiEYwHErqcga0Y/ligLccrFVJCnWD
         PLrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8veVycgFRnvzh/TtBmDLJvZWc84Z1BiU1oo+FMB7V7nKsvx6Esj/5gt/VfH2+icqg5GW1ld1R0Do+tWGneuBukeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7SJm+lYC311rdvWrRWK9sDHGsb6cHNmuvC1ilbC8SVUp3UNy
	//WDSMoC4H5dasC1pXwimyCF8wQj+AMpE0tmYFyMfjH5kCP96UNYkqBV
X-Gm-Gg: AfdE7cmOdi/c0LTPcgD1+hGl4sbqiYJOxzoWhrvGrFZkGzhK7pFnMTHIaIHMCZ+YD9M
	HpU0VQofcHjMJqa5XM/oItbDodcBIL0WSzlYbCqI8BBUlw8o6ZAByCiSsvdu2wUcaSjj8MGVLX0
	4gptxyuMcOS6CI1hPfKpIGYK0QGhrG81UQjXUqAzWkgPDDbsue4lirni87s0ojBnBThSk2Wkkh7
	qxHC22yHJL6fe+yAabziCG/YGe5tv+OlVTwFGHhF4O6stxgciBYAw/kNQNC6etFqSmACQ9aFgiw
	hLUOGuDNJ+3cVd7MEBYSTYxYt6FN6sVKQSv0lMvAY1oWBzH9/98Te3NFl5Tp7rYwdxaSr5EKtt9
	ptgzDD9rWVpfJK0gN55bwCURFHImowtKmd95r2SWtoFNj4twJghRqOsv/T9YfpkK2Lp2A/Icz6u
	d6BY9tvwPv4cstDgvI3zRdgU4Od4GmSy+9e2lcIQ==
X-Received: by 2002:a05:600c:3f12:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4924257194emr149666245e9.19.1782143775174;
        Mon, 22 Jun 2026 08:56:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:14 -0700 (PDT)
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
Subject: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
Date: Mon, 22 Jun 2026 16:55:51 +0100
Message-ID: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34320-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58B606B0E36

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SoC has:

Channel 0 supports SD and eMMC (including HS400/HS400ES).
Channel 1 supports SD and eMMC (except for HS400).
Channel 2 supports SD.

The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
not support IOVS and PWEN in the SDHI register (no internal regulator),
unlike SD1 and SD2. It has an internal divider for all modes except HS400.
It also has a 2048-bit divider compared to 512 on others. Moreover
RZ/G3L supports HS400 enhanced strobe mode.

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
  mmc: renesas_sdhi: Fix whitespace alignment in struct
    renesas_sdhi_of_data
  mmc: renesas_sdhi: Add clk_mask field to support SoC-specific clock
    divider widths
  mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock
    divider ranges
  mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
  mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
  mmc: renesas_sdhi: Add optional axis/axim reset controls
  mmc: renesas_sdhi: Add RZ/G3L SDHI support
  mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
  mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
  mmc: renesas_sdhi: Add RZ/G3L HS400 support
  mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
 drivers/mmc/host/renesas_sdhi.h               |  12 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 239 ++++++++++++++----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 +++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
 include/linux/platform_data/tmio.h            |  18 ++
 6 files changed, 370 insertions(+), 85 deletions(-)

-- 
2.43.0


