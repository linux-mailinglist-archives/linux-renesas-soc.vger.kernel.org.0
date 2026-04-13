Return-Path: <linux-renesas-soc+bounces-31236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP8oHb/I3GmcWQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:43:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FF3EAC57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0518301DC23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9863B7770;
	Mon, 13 Apr 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g0jIba+Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363D63806DE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076971; cv=none; b=I71279s1EmN8f8J5nGTyNoP98Lfgiq7/nSCFRG+oapwS3POoSUmlP6TWEy4YtMUIA8Pn/p+RlHyai6s4Ly2/9J4vVmIQgLTxrKfdsG65YFd+Fa3VJsdrF/g6fYQohWYtgeL7rz/Kv6wDS3e/Yeuc82QvFCkA5+OQxl2d5LOCus0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076971; c=relaxed/simple;
	bh=7/DrXweXvjSm8Qyck5CcdwMke9swZ7THfVMznI+PMP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiXKRA2Sl4rGGvCxqIH3I27Tcf8qcKoOkgLyeg/d7AKEm9qmcsetQOPSE3LONVQFHkfNUbxgLssEyGb3oDQc6NSu43ACBNc/yqkmPIyKye4kXK7XokNH8seFnHkvlRqLiXqGcOuEAhRSGfbYhrDZW4IvGd8aRsL2LVypdul625Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g0jIba+Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ePKuJIQ3syxHc0vtxN8/MC6+Yukj2O+ecQDv+Xe4Itc=; b=g0jIba
	+QbUEm53I6+hgXvyLTAf9ZmseipMmwNOSgyrlBqQdt/7pzfuwmrjct4Js1MUQgWa
	e6ElGaLeYj+qZKm+t4fm1hq5Wj9Aap7cmC4lmFIwy9IGF71SmLeGeY80qw20lYwl
	fFT4TPZotBXf0SHOUTv7zJBYqVh9QxiUrsFRLHXhJm1kLJwTssk4uOlhfF05YkhZ
	HeLWTVXb1bVqg2iF+4PQo55i9RgcgJ7PNSfeb5syhL26RWhPQnWefdu3Xc2SJm5q
	9vAagGnSudZ06EuzPm4WzII56SptpmVDjKyjOW6EnzF8/+aA22ieXpj+KOmwND/F
	CkIvz1WOmoVzGSYQ==
Received: (qmail 2256029 invoked from network); 13 Apr 2026 12:42:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2026 12:42:45 +0200
X-UD-Smtp-Session: l3s3148p1@+UGbJFVPlNIujnvz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH 2/2] mailbox: update kdoc for struct mbox_controller
Date: Mon, 13 Apr 2026 12:42:39 +0200
Message-ID: <20260413104240.30493-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31236-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E5FF3EAC57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add field for missing lock around the hrtimer. Add 'Required' where
the core checks for valid entries.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/mailbox_controller.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index a49ee687d4cf..dc93287a2a01 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -62,10 +62,10 @@ struct mbox_chan_ops {
 
 /**
  * struct mbox_controller - Controller of a class of communication channels
- * @dev:		Device backing this controller
- * @ops:		Operators that work on each communication chan
- * @chans:		Array of channels
- * @num_chans:		Number of channels in the 'chans' array.
+ * @dev:		Device backing this controller. Required.
+ * @ops:		Operators that work on each communication chan. Required.
+ * @chans:		Array of channels. Required.
+ * @num_chans:		Number of channels in the 'chans' array. Required.
  * @txdone_irq:		Indicates if the controller can report to API when
  *			the last transmitted data was read by the remote.
  *			Eg, if it has some TX ACK irq.
@@ -78,6 +78,7 @@ struct mbox_chan_ops {
  * @of_xlate:		Controller driver specific mapping of channel via DT
  * @poll_hrt:		API private. hrtimer used to poll for TXDONE on all
  *			channels.
+ * @poll_hrt_lock:	API private. Lock protecting access to poll_hrt.
  * @node:		API private. To hook into list of controllers.
  */
 struct mbox_controller {
-- 
2.51.0


