Return-Path: <linux-renesas-soc+bounces-30732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCIeIflVzmnPmwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 13:41:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B50F38875F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 13:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC1B63096F24
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 11:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F25839E6C7;
	Thu,  2 Apr 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZuplouSG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160C23B9DAC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129276; cv=none; b=Dn/wM8uwfvX/7yC75nOWU2OEXVbrAXlSrkDcUqlnR65Jdyz3L75hiw492dFec51QjyUuwkEsoDRXpUwCtqvWVGZiHYLp9QnARDHV/guyIeS2Ce1Mck0n6oKk+tRzbiCqUenEvvLIq+fORcmVC1Ga5dn8vT8+rEU6Qi95UteRv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129276; c=relaxed/simple;
	bh=T8iDr/pu20uRPBeX7MW8jhy3cF6OUggCeGd3GPHPWa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhhDY9y3/JWqNe9eZ2mqGSIdnkFQBH6jf7Uyq3quDDuWhw0P//jrPsR3TGBLUHsKXvWipcpVz2qUIFhqCSBlT+ZqnIEmRtFaE1Vstk+bySSLbW0SSvM1cYG2NuDdMe1jhJtU7IOXID8ZL7AsgYdErwObRGggNnOUvurmZOcXQ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZuplouSG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=HhqIL+Nr78jcfW
	YkUI9lCzMQGbFHWBjytuLuj+PmVb8=; b=ZuplouSGNFrkVOzmHMqzD4xn0htA4h
	G+NnhOopaYFHpLBwnt/U9xWCOSRNHMBBchwu+ds4vzCOyPpyP+eybFq5+1EvYH58
	xA8aBKsr9NMtOZAZWIpVnwiRhvXGbgRxseRwecWfiwizsUIufryqqYVN1+V6O+j2
	wnrOMew0fQzYdnCOLD3SCaz42NzIFu2iEtnJk5XGfUwqMVlI+UeWfkZYStMiLqWw
	19N2+9qxsaCxa5GF8jbOt8gMcTpsu3J5v5mGgoeoqcB5/lNLvb+4sz3DU8NqLNU2
	5SiZcxjj1i1C+6V/GTsuIy7r0PTMcbDVIffx7ikli8SH46zy3PRmdLWg==
Received: (qmail 2479082 invoked from network); 2 Apr 2026 13:27:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2026 13:27:39 +0200
X-UD-Smtp-Session: l3s3148p1@zl7kfHhOMh5UhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 0/3] soc: renesas: add MFIS driver
Date: Thu,  2 Apr 2026 13:27:04 +0200
Message-ID: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30732-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[kernel.org,mailbox.org,vger.kernel.org,sang-engineering.com,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:mid]
X-Rspamd-Queue-Id: 9B50F38875F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since v3:

* dropped superfluous constraints in patch 1 (Thanks, Geert!)
* use more 'unsigned int' instead of 'int' in patch 2
* re-ordered declarations to be more xmas-tree like in patch 2
  (don't want to go farther than this)
* added tags from Krzysztof to patch 1 (Thanks!)
* added tags from Geert to patches 1+2 (Thanks!)

Renesas R-Car MFIS offers multiple features but most importantly
mailboxes and hwspinlocks. Because they share a common register space
and a common register unprotection mechanism, a single driver was chosen
to handle all dependencies. (MFD and auxiliary bus have been tried as
well, but they failed because of circular dependencies.)

In this first step, the driver implements common register access and a
mailbox controller. hwspinlock support will be added incrementally, once
the subsystem allows out-of-directory drivers (patches already under
review). This driver has been tested on a Renesas Ironhide board (R-Car
X5H) and is able to communicate with the SCP via mailboxes. Also, the
mailbox-test driver was used to confirm back-and-forth communication
between two application cores.

Because of its multifunctional nature, the driver lives in
drivers/soc/renesas. A branch (with some additions to enable it on R-Car
X5H) can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver

Thanks and happy hacking,

   Wolfram

Wolfram Sang (3):
  dt-bindings: soc: renesas: Document MFIS IP core
  soc: renesas: Add Renesas R-Car MFIS driver
  soc: renesas: add X5H PRR support

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 187 ++++++++++
 drivers/soc/renesas/Kconfig                   |   9 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rcar-mfis.c               | 344 ++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c             |   8 +-
 .../dt-bindings/soc/renesas,r8a78000-mfis.h   |  28 ++
 6 files changed, 576 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 drivers/soc/renesas/rcar-mfis.c
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

-- 
2.51.0


