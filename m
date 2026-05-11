Return-Path: <linux-renesas-soc+bounces-32377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHdpIczLAWqgjwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C450DCC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE9A3041A9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEEB37BE87;
	Mon, 11 May 2026 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hFZi7EUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1256D37B028
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502172; cv=none; b=W4fDlWNvv0QFAaUO/P1bUFDY2cRLRQ4b7HHDNi/B04NGu1fYWMALd4u3ldjsyQcd1+Q5wadIBrRnumT5XKOW04bx4J++mc6Sv36J7QgHXrK/xjzPXHpC9ftrmN5bni4CQ795UToYQd1CdEpwxrLJfA8uERPegBkrXhD1acObvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502172; c=relaxed/simple;
	bh=o2LHr3oyFokEUy25G4MnlpD8bfzjqL4xaggt6kufW6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWsaQDZXCFVSe9v9xwGpKdKhMbAvr+LfOwElewI5HIrALimduqpfoUPtbJomy6pNZ9fcAN2GKToXrGcTfDTrN9zcbkL7aI3wLCtgu2cmtl3wgph1VAN6N7iDEOpt11SOITkBu5Olvv2XufRG5lBl38rQS6RD0yscBXXRrPLqXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hFZi7EUB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17A9CCF5;
	Mon, 11 May 2026 14:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502155;
	bh=o2LHr3oyFokEUy25G4MnlpD8bfzjqL4xaggt6kufW6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFZi7EUBU4aNj7eP1GIzdBntXZ0JJqGM5UmHfmhntp4f7h6833Nrn4GNEaNBagB5i
	 gfFQIk6Cb/D3KQELySFh7XYPX5b4xo0GnwAPHesDrtiAQOTWX0zQUpDk10ascIri9+
	 VdHlAmzQ2UZoVVGZHjtX1+RZxvwWuqUZb+rQF254=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-test] [PATCH v1 2/5] kmstest: Fix formatting of kernel log message
Date: Mon, 11 May 2026 15:22:34 +0300
Message-ID: <20260511122237.3084426-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
References: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 331C450DCC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-32377-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

When printing a kernel log message to the test log, the closing square
bracket of the timestamp is missing. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 93b9d89fa1fc..7df5bfdb78f3 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -130,7 +130,7 @@ class Logger(object):
     def event(self):
         kmsgs = self._kmsg.read()
         for msg in kmsgs:
-            self.logfile.write(f'K [{msg.timestamp:6f} {msg.msg}\n')
+            self.logfile.write(f'K [{msg.timestamp:6f}] {msg.msg}\n')
         self.logfile.flush()
 
     @property
-- 
Regards,

Laurent Pinchart


