Return-Path: <linux-renesas-soc+bounces-34205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RQT3C30eNGoMPAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:36:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD60C6A19FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:36:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=buOPqY6q;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6263930B50AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 16:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148D0335566;
	Thu, 18 Jun 2026 16:34:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E22311C2F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 16:34:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800476; cv=none; b=t/EFDrfvyYA9yFaYMSE4HcQ9fgQtQdYMYMK63OumnBYbOieBHkpx+cvR6uX1l56eWyzxRvSQM+TEnctEVbBjV13o+gTWQXiC/5D1VoJB5tYnmRTs9RwFmnSwE2ZERaIfTHvnxgMf98kCZ97me/ylnFUrlIU6C0YGce6hFVhL4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800476; c=relaxed/simple;
	bh=XaUFrkaDUPLjYJ5ELzkWt5LI/tfyJM9gnOeguRGE1mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hFueoOya1ScBbSluhipbFcLRmMr+bUjOo95g68frZSZVPEGhrpt+S0A+Bril5uF6cIGBuG+mUAW4rbmD7+V2s4CChM7QFKfLlostSeFY2wCZ1Z8EqhjR7QN7wOKRF6QWEgY/JoP1GOwF6HdxZqvn7CNfHLmDnLynNVLcEo+h6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=buOPqY6q; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=jCtoIhGictYg0G
	JbVACR9a59PI/t13tB+ngu3j5/8gs=; b=buOPqY6qApO8mrr50VGvtlWSMDnwXb
	mAD0RWTLU3IzoIAq+Z8y67KnB+eU5GRADDMiOU/HB1RghEbXlcN5hJ5xK7GMDo2R
	kOOBYnpcltMpimD5gjIylF3wSkueA51HmdSiHnJbDFDp6tLax3ArI+LnhgOVogYj
	m5hYBACCj2u78YikYMYrXgxy8WxVtY7vSSMC81qebT1b4zoOmY9PlOZs1Y2xQtdh
	75WU8Uyqs+yeV4d1U5vNNklJr+aaYh5tTYTFrFRJB6DF1zjfZZ4MwNqJOhjP0ncT
	PK+luKATrgdLYr72RzPWqlsTwVPkZ8I6lXBsUOSpiGM9Zm/EeGnwbNxA==
Received: (qmail 638204 invoked from network); 18 Jun 2026 18:34:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2026 18:34:26 +0200
X-UD-Smtp-Session: l3s3148p1@rzHZv4lUNL8ujnsq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/2] hwspinlock: add summary in debugfs
Date: Thu, 18 Jun 2026 18:34:20 +0200
Message-ID: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:baolin.wang@linux.alibaba.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34205-lists,linux-renesas-soc=lfdr.de,renesas];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD60C6A19FF

Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
multiple instances and, thus, multiple spinlock providers. The spinlocks
are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
development on these systems, it is helpful to have an overview of
registered spinlocks in debugfs. This series adds support for that. One
preparational patch, and one patch with the desired functionality.

A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock

It has been tested on a SparrowHawk board (R-Car V4H) and an Ironhide
board (R-Car X5H).

Looking forward to comments.

Wolfram Sang (2):
  hwspinlock: reverse logic for used channels
  hwspinlock: add summary in debugfs

 drivers/hwspinlock/hwspinlock_core.c | 110 +++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 15 deletions(-)

-- 
2.51.0


