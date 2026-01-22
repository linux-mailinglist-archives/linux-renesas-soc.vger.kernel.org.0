Return-Path: <linux-renesas-soc+bounces-27285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HvjGrw+cmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:14:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667968823
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E885C300059F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6314F346A04;
	Thu, 22 Jan 2026 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ftWtvHs0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F0369961
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094838; cv=none; b=mcvAieJZuU9YvJQCdYEaRI5W8BSyui0RdvXLzzfxgNEfrrsLhu/ntZ9sQrNcmpuAmrwxUpoClE8bybVA4UqQOYWlF3XTn/UeZE79N4R5kg9ilO7m4PymA+ezH7Px4hzhX8AIh6ADdUBsZKmZKMsFxS7hI2EquPUesYXf3ii3UwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094838; c=relaxed/simple;
	bh=GoBlrP+xx9Qc9HOwCO15fgAlmfgolawxP9BPWkoewKI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/ashZHHgIb3ybhgmkXYw0eOq/YcI4T/0ZMX519xBz+GxTZyqvkC5iYzN0vy7ZNYXha2fBazgr1oWumEljDRyxAkDVXxgYK3K6cGFdCh/1OysGImTNwKmCFJ6Z7pcmg3fazmwoZFs2Gq6uF4wUzo2ZaGSp7fuR31rddDBw6s+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ftWtvHs0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5AEC2C21AA6;
	Thu, 22 Jan 2026 15:13:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70DFA606B6;
	Thu, 22 Jan 2026 15:13:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A6ED119B82CA;
	Thu, 22 Jan 2026 16:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769094832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MqP3qGlM2WmuWsK0tfj/T6xCCsShk8aEX5blVIcNoL8=;
	b=ftWtvHs070A7kCz2pBRHxTF+lTj0j3gicwtscTuKHAmuQNdC4+Jg9phkFQGRHx7CC0TRlG
	8nSZw+3orm9CqKxVtr2yyrL/3apDoqbJTD9kIIB337bcgd1jgW2d98AfwvktWlAajU3zEL
	UbqJdYLL3PNLR+FRxiI5q3XIiY08FRsw9ubhXMfiSPfS1XbFjcgz5vnLV6CQ/ZXpou60Ge
	wMKdodIPRtU5GMmrJCSgqhRjLPbYc+ak5fbXZLGxvq3ZwKcjaFm9oCVF9ezKZCmQlDFQRN
	XjXWP+xk3i7thlWILMU2I9skDsf/nrgw/R/HXahcrevLctYgo/fiJ1KSJDMi4g==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Subject: [PATCH v4 00/15] spi: cadence-qspi: Add Renesas RZ/N1 support
Date: Thu, 22 Jan 2026 16:13:25 +0100
Message-Id: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOzQrCMAzA8VeRnq00/VRPvod46LrMBXSdrQxF9
 u52A0EU8fgP5Jc8WMZEmNl28WAJB8oUuxJ6uWCh9d0ROdWlmRTSgIQNz6HtkGpM3PKSKQC/5J6
 4CwrBaOcbW7Oy3Sds6DbL+0PplvI1pvt8aIBp+t8cgAu+9rURBpxCrXdVjNcTdasQz2xSB/mSr
 AAwvyVZJIfWC4uA4KpvSb1JEn5LqkhaoRONr7T+/GkcxydN7gdTVAEAAA==
X-Change-ID: 20251219-schneider-6-19-rc1-qspi-7c3e1547af6d
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27285-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8667968823
X-Rspamd-Action: no action

Hello,

This series adds support for the QSPI controller available on Renesas
RZ/N1S and RZ/N1D SoC. It has been tested with a custom board (see last
SPI patch for details), but has been tested by Wolfram (thank you!) on
the DB board.
Link: https://lore.kernel.org/linux-devicetree/20260116114852.52948-2-wsa+renesas@sang-engineering.com/

Adding support for this SoC required a few adaptations in the Cadence
QSPI driver. The bulk of the work is in the few last patches. Everything
else is just misc style fixes and improvements which bothered me while I
was wandering.

In order to support all constraints, I sometimes used a new quirk (for
the write protection feature and the "no indirect mode"), and sometimes
used the compatible directly. The ones I thought might not be RZ/N1
specific have been implemented under the form of a quirk, in order to
ease their reuse. The other adaptations, which I believe are more
Renesas specific, have been handled using the compatible. This is all
very arbitrary, and can be discussed.

Thanks,
Miquèl

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
Changes in v4:
- Drop two binding patches judged useless.
- Collected Rob's acks.
- Fixed the RZ/N1D400 DTSI (removed the properties no longer relevant
  after my binding changes).
- Link to v3: https://lore.kernel.org/r/20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com

Changes in v3:
- Collected tags from Wolfram and Geert.
- Dropped the Cadence compatible as this fallback would simply not work
  alone.
- Fixed the clock issue reported by Santhosh.
- Fixed the DT snippet following the discussion with Geert.
- Modified more deeply the binding, to no longer expect a fifo
  size/depth nor any trigger address, as these values have no meaning in
  the score of the Renesas implementation.
- Link to v2: https://lore.kernel.org/r/20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com

Changes in v2:
- Fix commit log of DT binding patch, following Krzysztof's comment.
- Fix properties order in DTSI.
- Rebase on top of spi/for-next and fix all conflicts.
- Simplify even further the code in the cleanup patches following
  Pratyush's advices.
- Link to v1: https://lore.kernel.org/r/20251219-schneider-6-19-rc1-qspi-v1-0-8ad505173e44@bootlin.com

---
Miquel Raynal (Schneider Electric) (15):
      spi: dt-bindings: cdns,qspi-nor: Drop label in example
      spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
      spi: cadence-qspi: Align definitions
      spi: cadence-qspi: Fix style and improve readability
      spi: cadence-qspi: Fix ORing style and alignments
      spi: cadence-qspi: Remove an useless operation
      spi: cadence-qspi: Make sure we filter out unsupported ops
      spi: cadence-qspi: Fix probe error path and remove
      spi: cadence-qspi: Try hard to disable the clocks
      spi: cadence-qspi: Kill cqspi_jh7110_clk_init
      spi: cadence-qspi: Add a flag for controllers without indirect access support
      spi: cadence-qspi: Make sure write protection is disabled
      spi: cadence-qspi: Use a default value for cdns,fifo-width
      spi: cadence-qspi: Add support for the Renesas RZ/N1 controller
      ARM: dts: r9a06g032: Describe the QSPI controller

 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     |  35 ++-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  12 +
 drivers/spi/spi-cadence-quadspi.c                  | 279 ++++++++++-----------
 3 files changed, 177 insertions(+), 149 deletions(-)
---
base-commit: 7a3f3fdb79a26125b38fb91b68dab298ca7b44e0
change-id: 20251219-schneider-6-19-rc1-qspi-7c3e1547af6d

Best regards,
-- 
Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>


