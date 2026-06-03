Return-Path: <linux-renesas-soc+bounces-33474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a313AafQH2oiqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:58:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4856B634E4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:58:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Bah/5tO1";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED712302266C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50FB3DC862;
	Wed,  3 Jun 2026 06:57:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423743955FC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469858; cv=none; b=J8PeTF6l3WhGg+DrBWtGyUKEeWFnKJy0O5ZQKGvGTcdmqe8o4cObamujX7SnYaUFdIoRvAUHrMkIGFFwy5S4FFPAgmkfoy2PGJFrBGbPjKECWYTDNaq0lOa49e5awh/JiL7fYQr3BgeiTDjuMWS/95GHTi0LkL1Ax3OO9B2pX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469858; c=relaxed/simple;
	bh=AS2+INrOBStqK63O2/21Dt1E4foxVMxhwL58vr7lqhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqkmFwHoQfjjDmM0xjPrKW6RSo6il8soBvc8MvupJ1odIeRHnROKEr3vPdnlt4I+rJzM/P1vcwKn80xJ+D9Jq7LX4N2N9BRd9lV7Q/oB6EamCAh8Q40Br9691eyDWHFau+UFTDpaKEuB4qQ74gvKQWKIumRyoB77gp5cNMEmsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bah/5tO1; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso14224695e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469856; x=1781074656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obmKHwd9QvTYySNkKeobznebi3IouECClMxpBzhWwuI=;
        b=Bah/5tO1I0B6KxLxb+bfjwMwbCT7xdWkZTGK2ScfpW33Carj0UxrpaIj/D4OtXk2b5
         UIJXBfJnnrXSpWXl/o+NkwHMEK6xjpUcsWqCf3ayX5WHgPs0i3/KNNeAOD1X0LoEj3Z+
         y69UhHrpotHHJuIpkqxSPENx+D+9KDaKbLB1diePchFnJFq+JPb3zQD/qgr3XzvgDuWI
         /GGLsrQO+0qAlsP32enSHW94ZU3UkoDXTlJrMDz/rdLksfk13yMovhesuXfNsj0+BC8m
         9juFivT0/j0BBcoCljgTTETnPIPZDwAME6+TVrImUq/WAKyhpDVGxM1lRxG8tN3XNtfr
         axsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469856; x=1781074656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obmKHwd9QvTYySNkKeobznebi3IouECClMxpBzhWwuI=;
        b=UdplclOqTkynMaHn6nyzHeslxRiogksrvhMMwdssPWpffR5aIaP6RaLauClrRrDKon
         TYl99C3LaqAcDGVYVXbgETouR5ztPmFXePpdC30+rLzu/nQhjd1pJ6H9pxXUyPfdFtea
         7RiLIt2wg0UE4sKiYElz8H+lNw9ydErYy25o7vTbf5Yb61uh0hGbHodbmGfjvmsx1M3E
         vX/TUTVJcTwUWWr8ANJkrX4rNI616Vfi+cJd9ohiOd/h8Ni0aSbujeDbh2u6H4FRx6yZ
         j4O/5L0X1Ya8lOZ5QIo8YUG5cXUIb1eJsnd5Ft7UF7lg6R6N1smKOuYVXSdrcjrp+Y2q
         VEww==
X-Forwarded-Encrypted: i=1; AFNElJ9IaFa3OwZ7WMClR2k1z7rl3dzDPbhR1ILiyQ0ox7cVLpEi8rzzMVCy1Xhmrht1tvkpPKuoBb1AX1J9X2d3m8NFTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMIwloCgCdPlNOF/W+74zcvXqqtx7pPkat1y0g5BJg6Xus6Vc
	kqQlI8wqOlfvVEGEuOIJ2+l1BvNpixF9z28Ll11+OjwCaunAaf61WaM8
X-Gm-Gg: Acq92OHARB2Ib3zZmD6F5IjCQ+0vTcVJu2CJaqFcKv9MHFdTht29otjzbvPgFV8JuGj
	KWcfOaSp+/rr00pOAoVC9g187mg89yGtCKTKHdjPgBuhX2wpO3wV/bForzcA2JVXL//STMr+nU9
	yGh2Id69D6BXT5tFqwaPLBW3rZqLnJbZLfo0rp1jmz3qt4wLPnXrgT0dFkfCd/rRxoR0qKGMyoH
	v7+W4U5ufXQKniXT+1HdAWHT5gT82q0oOfvo6ZRu0gjFgOfYhq8TR1LOHn8o0sOQP7xTZy7/ncH
	6hPHq6fkUDCmmZFVx3C84efjy4xkeaBENlJHX63bzGDuS97hYP2x9f03pTUbcn/vktEAghJ4ePP
	w4e7K8iPhMX4TqRI49bAdFT8abSucTRofOK1tFUX4KhQiRqJqZV7ZUo/5vBGeq4qHXVddufhZZ4
	vnFhIDJqE02JLOk0tGKtNYh8BH3RCc7r7mFLe1wKlmCHvRfEeBqJzcj97xS/Y=
X-Received: by 2002:a05:600c:c174:b0:490:b2a6:8c2b with SMTP id 5b1f17b1804b1-490b5eb82b2mr32533675e9.10.1780469855535;
        Tue, 02 Jun 2026 23:57:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:35 -0700 (PDT)
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
Subject: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Date: Wed,  3 Jun 2026 07:57:00 +0100
Message-ID: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33474-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4856B634E4F

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

v1->v2:
 * Collected tag for binding patch.
 * Resending the series as there is an issue with patch threading from
   patch #14.

Biju Das (17):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
  clk: renesas: r9a08g046: Add clock and reset entries for SDHI
  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
  mmc: renesas_sdhi: Fix whitespace alignment in struct
    renesas_sdhi_of_data
  mmc: renesas_sdhi_internal_dmac: Fix whitespace alignment in struct
    initializer
  mmc: renesas_sdhi: Introduce renesas_sdhi_hw_info to abstract clock
    mask
  mmc: renesas_sdhi: Add max_divider to renesas_sdhi_hw_info
  mmc: renesas_sdhi: Add tuning_delay hw_info flag
  mmc: renesas_sdhi: Add internal_divider hw_info flag for clk rate
    adjustment
  mmc: renesas_sdhi: Add optional axis/axim reset controls
  mmc: renesas_sdhi: Add RZ/G3L SDHI support
  mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
  mmc: renesas_sdhi: Add RZ/G3L HS400 support
  mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
  arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
    SDHI1 pincontrol on SMARC EVK
  arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
  arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 +++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 +++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 199 +++++++++++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |  92 +++++++
 drivers/mmc/host/renesas_sdhi.h               |  25 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 226 +++++++++++++-----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  71 +++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  67 ++++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++--
 10 files changed, 889 insertions(+), 128 deletions(-)

-- 
2.43.0


