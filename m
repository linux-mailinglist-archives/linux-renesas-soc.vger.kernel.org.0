Return-Path: <linux-renesas-soc+bounces-29324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAJ3GtPXs2mzbgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 10:24:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F87E2806DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 10:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 775CA300D1D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20447387349;
	Fri, 13 Mar 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G6PtBbzy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51784384254;
	Fri, 13 Mar 2026 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393872; cv=none; b=eQwJreRwD+xoOGx0GdPSE7bwUhcZ+S8gcOCsGoiXxXwnY/UZLcUFEsMCwBBvxtKtxocR+6yoPtxMhHVB2OnLDfcnZWNvpM1c7YoIpDWeaSKj/ODSOz9M+VJ8eqKL8sHshKjs1yS1kug2NTvDhPQFKzn+E5pHcbHGrdZm8ZBRK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393872; c=relaxed/simple;
	bh=dAmU8idGkuMvsrFcSryOD0FTNdsKN5HQRLdF+8gRxSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mpJiCBxiyR0b++3pVWE8pnGOy3d+KZ20A2yjNxfz3noJeXnmjm+bZdHa3jVXt1S0K7W59npKBIaCRgYu3J2CNQ6eF9DQpZxN5ELCy0oukzgrvXise6L3XWvbBxTkaYYfPh2S8Ot82ERapLKSVaLFjNiM6yUojT5l6i868lLOOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G6PtBbzy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9EF321A2DA3;
	Fri, 13 Mar 2026 09:24:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71C3160027;
	Fri, 13 Mar 2026 09:24:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58DF110369DD1;
	Fri, 13 Mar 2026 10:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773393867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9BC2/Ee2NSV1ueoD+FcjW/TcAiBJTqR0eFXTRftNYiA=;
	b=G6PtBbzy77KSqE86KtNrheF8cMCrcWOU2IpnFCATBFYMLBdNnaNr8KxIw04pMpVGQH/dPW
	eSFNEwFQaxnFSINhQhffhYeAUEGXWXA4nOT1G2f1jvLHBefvfYiiHjTB8ac6NHxsjBc72O
	mCvL/rOxmI8U1t5j5FhhftLFe9FrRRFVuPkYVVIz6kT+oEDwPDNksk4ZYt4SY2Xxo37xTT
	f9otIqLSVl9pgWxuTBRPlmGOkjzun64g2ltF+nbj2OqNt1o26gVToLgkB3120ETCXLTng6
	T9RTQdCvnWC52xRP4MGc9v4QwliCJGbZPhuwLb0iH3cfpyyGfr8qfhmmXEIwSA==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v2 0/3] watchdog: rzn1: Add support for direct hardware reset
Date: Fri, 13 Mar 2026 10:24:13 +0100
Message-ID: <20260313092417.294356-1-herve.codina@bootlin.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29324-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F87E2806DE
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
reset the system with any software needs when a watchdog timeout occurs.

The first two patches are minor fixes and improvements without changing
the current functional behavior.

The third patch unconditionally enable watchdog reset sources at the
sysctrl level (sysctrl is handled by the RZ/N1 clock driver).

Compare to previous iteration, this v2 series reworked the support for
this feature moving from a DT property and a helper to enable the
watchdog reset sources to a simple unconditionally enable of watchdog
reset sources.

Best regards,
Hervé

Changes v1 -> v2:
  v1: https://lore.kernel.org/lkml/20260310173249.161354-1-herve.codina@bootlin.com/

  Patch 1 and 2:
    No changes

  Patch 3 (new in v2):
    Unconditionally enable watchdog reset sources

  Patch 3, 4 and 5 in v1:
    Removed

Herve Codina (Schneider Electric) (3):
  watchdog: rzn1: Fix reverse xmas tree declaration
  watchdog: rzn1: Use dev_err_probe()
  clk: renesas: r9a06g032: Enable watchdog reset sources

 drivers/clk/renesas/r9a06g032-clocks.c |  5 +++--
 drivers/watchdog/rzn1_wdt.c            | 22 ++++++++--------------
 2 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.53.0


