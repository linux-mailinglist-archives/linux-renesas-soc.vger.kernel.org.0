Return-Path: <linux-renesas-soc+bounces-31325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALlmF4DM4Gm/mAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 13:48:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20F40DA66
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 13:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42A52301CABE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 11:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4FE3A9D9C;
	Thu, 16 Apr 2026 11:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OaubEDyr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138125A357
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340078; cv=none; b=eUDTQye6ZrPxPajKfTW9d72R2OPfcDWFrOLLvmHVhXYUIKgRHZJALZUPJAYq6laIevPT28lY+15BUabrr9Uct076dHNM+mgdHxWrktK6bkKnmJJxTm6NVAjLoekkzfUhuhmhZG3bubGw4n4GgoCYSG0mic2jV2QxxO+MMttkOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340078; c=relaxed/simple;
	bh=p+Vr6v7QeZHywua6N9UxTG6BnfNZRS00iaBz8qMIYI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svmAsJqcB23RbiDqzR0YeYnBlq3FhUMynRQ8Z39icAJz3lyE7bDS6kTKWkZTVADR09zalJFIq4Lc1TB2boz8tDPUH79R54cWzhMh7PbRUgNxzzN8A2utFZyRuZBhm3FCqJp96IB5QaF7qWu4QD9SjwYmNp6sRznvJosY47ghS5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OaubEDyr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/KAdXi548dAO4/
	iR/jciek6JeDYTNrm3IQXAXrK0Wos=; b=OaubEDyrdOypSTZ2JCDvwQ7zDQb0/G
	N55bTGomcgb91nxmo9D/SWy0N36Xf1r1U6Nw2j8YZ3gP6VIQRFJUKNSK9TJClfKx
	3JrYPEB2T2wMbBYtRrFdqZ4s1QG5OWNdGwInsL2DZwkbpF7R3cU/Y2JkLzNsqmbi
	5L7PuoOCMPrnoLR+iiIcOrFaLtL36rO9lLvIZ8eVBH4PJoFNZVwAAyApns356y9e
	AU4zaWLUIE2yaUXdH1VYhJ4/cgirAa0eNCLK7aiXtNvozg8kgNIODz5pNDqFGvf6
	rUSip9trRqxlZ3EFdG4/c6PmLcMnUx6tBlWf+dmyVVDC5VPAFuaXtRvQ==
Received: (qmail 3513053 invoked from network); 16 Apr 2026 13:47:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2026 13:47:45 +0200
X-UD-Smtp-Session: l3s3148p1@J2uUZpJPIoEujnvW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH 0/3] mailbox: mailbox-test: fix issues reported by Sashiko
Date: Thu, 16 Apr 2026 13:47:33 +0200
Message-ID: <20260416114737.36988-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31325-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,sang-engineering.com,gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: 6E20F40DA66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Evaluating Sashiko reviews, these patches handle the reports[1]
which were given because of an earlier patch by me. All were
reasonable. Please see the commit messages for details.

[1] https://sashiko.dev/#/patchset/20260410125556.39607-2-wsa%2Brenesas%40sang-engineering.com

Wolfram Sang (3):
  mailbox: mailbox-test: handle channel errors consistently
  mailbox: mailbox-test: don't free the reused channel
  mailbox: mailbox-test: initialize struct earlier

 drivers/mailbox/mailbox-test.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
2.51.0


