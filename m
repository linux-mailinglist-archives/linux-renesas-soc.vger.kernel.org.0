Return-Path: <linux-renesas-soc+bounces-30163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC2qJuB/wmnqdAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:13:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14649307FA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B11030474F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22EB3F0757;
	Tue, 24 Mar 2026 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oeb7qCVu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD753EF664;
	Tue, 24 Mar 2026 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353892; cv=none; b=u1D9t7gDp/mfRFQ9c9hApoDXhbpgBzTmVOUwNCKkO1CY6/FOVkRhq+LmqZtA3oeEecMrvO76Fk4cB1TAV+iQYCov0dSJBNX7y2S7PyhaZuCKmEjtfLFI26h7p5I7hD2Rr0hMnuELtq2I/4TWorPLviPoaHhhLvZW9tarOGq8jUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353892; c=relaxed/simple;
	bh=wzDpoWTGjN2CemGrgNHCSGz2oxmtF241NqxAHjQ4ZBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ayIM8J9n651ur4mo4MoyIPbywi2KRqUVBea3+mSF1JIw/UOSVofIz1sEFiODfqAllm45KBbG8ML1Hlb8FNf2GJO3E9a51tujcC9yS7AnZFKwmMN+Fgod17NhC97DXdYV5onHjb31aqkGzolbW1tHtoF9Po5PCOAE2ZWuI+a4pVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oeb7qCVu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 967A3C58099;
	Tue, 24 Mar 2026 12:05:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54E4E6011D;
	Tue, 24 Mar 2026 12:04:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC1F610451153;
	Tue, 24 Mar 2026 13:04:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774353884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=L5xHPkBFXn4i5L1t6bZ4kA3j8k2rR8A/FsoP1rfFGWU=;
	b=oeb7qCVunvyA9C7y4GABx11+W3ZVUGjNG1Mqmm9tkpsojInFxX2/yLULGybaha5yExAm5d
	YtOyqEdxaKNc07/MjvxWnN8TvIT1LCYiS9Tugk21JMqE10pHKVaoPK1JhItjqm+luYToY7
	HIauqduewV1fA4P/1jIEsPlhJHaayHqZyyyQrBbjPPiGosbhokUBRz99sORqLCXz+EwMoN
	ilVHJyF8dG/jWaSAjSpdaUQbcehg2Hg1Y6vVtDLYGnfywXMaB7kLJ1WnsKV7G9pUQwQIDe
	4GXOn/zxR5EpT5JwpBskOS18d9tpEkRSiZm162Q2YEB//45jQMHh43NUMsQAYw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v3 0/1] watchdog: rzn1: Add support for direct hardware reset
Date: Tue, 24 Mar 2026 13:04:29 +0100
Message-ID: <20260324120435.243641-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30163-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 14649307FA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

The current watchdog driver handling wachdogs of the RZ/N1 SoCs is based
on interrupt only to perform the reset. On the watchdog timeout, an
interrupt is triggered and the software initiates the reset.

The watchdogs available in the RZ/N1 SoCs can directly perform an
hardware reset using their dedicated reset line.

On timeout, the watchdog also asserts its dedicated reset line. This
reset line is connected to the reset controller (part of sysctrl) and,
if this line is enabled as a possible reset source at the reset
controller level, it initiates a system reset.

This series adds support for this feature allowing watchdogs to directly
reset the system without any software needs when a watchdog timeout
occurs.

Compare to previous iteration, in this v3 series patches 1 and 2 have
been removed (sent in a dedicated series) and a swap in OR-ed value
lines has been done.

Best regards,
Hervé

Changes v2 -> v3
  v2: https://lore.kernel.org/all/20260313092417.294356-1-herve.codina@bootlin.com/

  Patches 1 and 2 in v2 removed
    Those patches have been sent in a dedicated series.
    https://lore.kernel.org/all/20260324114849.242755-1-herve.codina@bootlin.com/

  Patch 1 (patch 3 in v2)
    Swap OR-ed value lines in order to have MRESET_EN at the end.
    Add 'Reviewed-by: Wolfram Sang'
    Add 'Tested-by: Wolfram Sang'

Changes v1 -> v2:
  v1: https://lore.kernel.org/lkml/20260310173249.161354-1-herve.codina@bootlin.com/

  Patch 1 and 2:
    No changes

  Patch 3 (new in v2):
    Unconditionally enable watchdog reset sources

  Patch 3, 4 and 5 in v1:
    Removed

Herve Codina (Schneider Electric) (1):
  clk: renesas: r9a06g032: Enable watchdog reset sources

 drivers/clk/renesas/r9a06g032-clocks.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.53.0


