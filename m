Return-Path: <linux-renesas-soc+bounces-30160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAwcBFZ/wmnqdAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:11:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B3307F3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3214F30E51E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 11:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8163F7E8B;
	Tue, 24 Mar 2026 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CnWRH/Rz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65953F7A9E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352953; cv=none; b=W8mrP5v5iT5UKC3XklQH0EkRfhEPa/qOIxvQkyZ/CnBl17uJmG5MXV5ChJmnUUxoBVgu1+P7WBurRFxQWC6vpn5GaXvp6PhhjPw08FkB/SThlfWT0mE+Y7EpxxonJufVI7ksCKPEFp3CTBVxG7/1BmGd4pkI7pEPi1mo5+sCHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352953; c=relaxed/simple;
	bh=snLLRbym4+ew9/elKCySb+mytpFwTEnmeFcssDn1HYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ie0+6mMPqUnFJNr2T7xAtruPhNixJTjDK9fvEGleSiBIlyFE2AzenJvbEwE2pFxjM+nE+9zwmWu/WSiU0dIX+/Zh2YeDOqVFjjbUFVbUuRDtDMXqfX0kCBzgVD8LsKu94tY2QpcJKkDtKnPo5PL0fCX6Gx3KICzMbhpoCqYpHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CnWRH/Rz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39E11C58098;
	Tue, 24 Mar 2026 11:49:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E73C86011D;
	Tue, 24 Mar 2026 11:49:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6A7B1045034C;
	Tue, 24 Mar 2026 12:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774352945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OU9cevG5tQB9wG4AjTQEsfdGFIMRAmgws6xJlzfZFVs=;
	b=CnWRH/Rzy8SWfCwEX5g80heTJmaXvBjGfF12AhdEONe1iFbnNXYqk+sLGOlD2tlwzmrYcY
	7JbXYC+FOR7a54f2jupWJEjxejzz65yZJz3t2iwXWBw1qiq23eGrcFN1ehzMbEE8k7ufAJ
	Jh3ovbEiENPx1h5YCq8XhuTHw9mrdlLHP/dKL9A1bkEPqnKavM9Tt62K7EfEgx/Sol59H2
	onmiji+hcmI8PFikYTyAi7LcGtmRdYZ4MnW4EPB226NyHql0UXEfd+vbE322zI/iY1KEv8
	Aa+qqcXRrKcOjtMtOdfSWH+KGpqaJygQq/tK8fTVug1kBehI4nlzjgMbaTQ4Kg==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v3 0/2] watchdog: rzn1: Minor improvements
Date: Tue, 24 Mar 2026 12:48:43 +0100
Message-ID: <20260324114849.242755-1-herve.codina@bootlin.com>
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
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-30160-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5D5B3307F3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Patches present in this series are minor improvements of the RZ/N1
watchdog driver.

They were originally part of the series adding support for direct
hardware reset [0] but due to recent modification in this original
series, it no longer needs to have them part of it.

Extract them from the original series and leave them alone in this
current minor improvement series.

Consider this series a v3 iteration to keep consistency with the
original series where, in v2 iteration, some changes have been requested
on patch 2 and tags have been received. Those changes are handled here.

[0] https://lore.kernel.org/all/20260313092417.294356-1-herve.codina@bootlin.com/

Best regards,
Hervé

Changes v2 -> v3:
  v2: https://lore.kernel.org/all/20260313092417.294356-1-herve.codina@bootlin.com/

  - Patch 1
    Add 'Reviewed-by: Wolfram Sang'
    Add 'Tested-by: Wolfram Sang'

  - Patch 2
    Fix dev_err_probe() message.
    Add 'Reviewed-by: Wolfram Sang'
    Add 'Tested-by: Wolfram Sang'

Herve Codina (Schneider Electric) (2):
  watchdog: rzn1: Fix reverse xmas tree declaration
  watchdog: rzn1: Use dev_err_probe()

 drivers/watchdog/rzn1_wdt.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.53.0


