Return-Path: <linux-renesas-soc+bounces-27220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOx+JfswcWmcfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 21:03:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA615CC5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 21:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DECC182E56E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0F0480354;
	Wed, 21 Jan 2026 17:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yupeNTQC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5134FF55;
	Wed, 21 Jan 2026 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015117; cv=none; b=ej6vAnahzXOvYB5D0dKlFUFE7IMmwabGUrSlKvMOk3N1qI6lsQAxphj29LKqHbfCs4FkQYzvj572TMyjYSDF8m5JeORE015AjGjM7hZVVxZjk96iXrVoi6aumU/z6XoMIdkcXS3pp9ndKg6Y8enVALr32QO3UL0DCDEE3RmxlxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015117; c=relaxed/simple;
	bh=jTRHuoLkMYOcVrL/3kcNQGyLZGxd9qtEvjCjGiBq70E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BMJxCd/AaePasaCstvJtVjA08JE1HiJRshiMKDQgyZ57nplcR+sSFdPKxoJb09ASp1p59+imVK+vk1l+NSllsTJDrB4j7TljVmtSpK/WHZIeHMLLkVPVnvzYVB1zHbXpHV8OzfyQRNZAD0yjYwmNuGDRBRV/lHNsJdP7fwcpBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yupeNTQC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9BF94E421CA;
	Wed, 21 Jan 2026 17:05:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D7E96070A;
	Wed, 21 Jan 2026 17:05:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9818119B1804;
	Wed, 21 Jan 2026 18:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=u0hHjWAnslmRWLbspJi+RHEyV3uasfaVuWZwVTUDZgo=;
	b=yupeNTQCNZL74ia7xgE8SHGTEgaIbem8oxUwRVUS0O7ZPBqewwQvTtZ9vcvBL+nwvshbli
	J6+mWRbjg76IWvNDPqvclG84RHmHhbtwBSp+9BPkc7MBmFQYpvYpDJZ3p6OTuwcT//rNmA
	NDRnd/H+MTfyRoPPNpSViEAQopDi/0h+TCJH8VvwxvejHX6BrDUGZukQ4x0LtEzRVg8x9R
	ggRs1CpfMzJ/dQfxsrsZGt0sowIlZ/Zz1dE6am2ziNMPUSDMpjm1GZ1WrCz740E2vhTeqx
	71cND41Yrw7Y+njBbgY+Kb7UhGUAnV1tEysnfHg8Lzed/nyjr9KgF9YkCpIykw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/17] spi: cadence-qspi: Add Renesas RZ/N1 support
Date: Wed, 21 Jan 2026 18:04:56 +0100
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQ7CIBCF4asY1mIYWkBdeQ/jgsLUTqKlQkM0T
 e8ubeLChXH5v2S+mVjCSJjYcTOxiJkShb5Etd0w19n+ipx8aSaFVCDhwJPreiSPkWteMjrgjzQ
 QN65CULWxrfasXA8RW3qu8vlSuqM0hvhaH2VY1v9mBi743nolFJgK6/rUhDDeqN+5cGeLmuVH0
 gJA/ZZkkQxqKzQCgmm+pXme37v8DNQKAQAA
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
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27220-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 7AA615CC5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Miquel Raynal (Schneider Electric) (17):
      spi: dt-bindings: cdns,qspi-nor: Remove duplicated constraints
      spi: dt-bindings: cdns,qspi-nor: Drop label in example
      spi: dt-bindings: cdns,qspi-nor: Add examples for testing the specific cases
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

 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     |  81 +++++-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  14 ++
 drivers/spi/spi-cadence-quadspi.c                  | 279 ++++++++++-----------
 3 files changed, 216 insertions(+), 158 deletions(-)
---
base-commit: 0afb3ab76ffb521700af678ea931d31192f93260
change-id: 20251219-schneider-6-19-rc1-qspi-7c3e1547af6d

Best regards,
-- 
Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>


