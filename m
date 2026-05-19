Return-Path: <linux-renesas-soc+bounces-32784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPM5CqQZDGrrVwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:04:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A5579A10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 956A730E2B29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 07:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4743DD85B;
	Tue, 19 May 2026 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jfyAcLwG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EA3DE440
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177385; cv=none; b=ZGahPjKpt34TvZmLBTK2eS7aCRJon0EAZ3euGVX72v/UHPz1vKHv7nmq0LJvR39kL4OT88ZGTWpV0WvfaCRv45RW/gLwYfIwsQ9H7yCn7ejxnKti06UmqA1Tfn8VEnGanO4RUhfZZcl5poFzlb8QyDkv/co3LtWxAzAIDqPA5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177385; c=relaxed/simple;
	bh=E+OggnFs7O1eqchpmvr8HEZghnFe9zi+NBxeUGGYM8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ap+x0WUmyNtQdCHEJFbsEvd/7Ysoksy7JO1M2o7PoBU6nMu/WXV6sOJEAVWmBMlIaWw7skXh8XrjMLtLZmO2AasbOInr6QZXLRk942LiWcHjwEFAR+RVYbLwZiJNuO34t/mcU1ABNst21ApyZAzEieE3LdkM3gjo0zJF3ie3oFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jfyAcLwG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=sUfqZE23br+Hnx
	U4z7m416wnBgVF+Mr5HwejBaSmdCs=; b=jfyAcLwGkMmfpP/PYbRiH/B0suFlAj
	gefoDyNHlaGgXZrsPb20Nl3atpAfJv9MQwq8uJ9s2W3LCC0tyahyDuJQvaUDGYeC
	VgQ+xmIluFEfD6/x5xvFWxn/Lkmyj1Yq8jY3Vwf6yA19Lgs4kC6coHjiAmHP6P3H
	kpGWVzPLhlyH2UPJ4RzWA9KWAqY3B83luv2pUzNkCNTFXRiomD7MSGaJiuM7Ko4D
	t8VZfIoDKiK7t2sozMbEo0VwPS/+F9Lkp6uHMhd9WyE1R+XLAgqds2caIOCn3ZQJ
	bq9ipJgQCI/NQiGKtJqKwCtpTSagnWWA5wTmlJkWV0wYgQFzgGXCCSDw==
Received: (qmail 170743 invoked from network); 19 May 2026 09:56:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 09:56:21 +0200
X-UD-Smtp-Session: l3s3148p1@YxLTAydSEaBUszca
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] soc: renesas: mfis: add R-Car V4H/V4M support
Date: Tue, 19 May 2026 09:56:17 +0200
Message-ID: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32784-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:mid,sang-engineering.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 946A5579A10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Here are the additions to the MFIS driver in -next to add V4H support.
A full branch for testing with the SparrowHawk is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v4h/mfis

To trigger the mailbox-test instances, I use:

$ for f in /sys/kernel/debug/e6300*/message; do echo "Hallo $f!" > $f; done

Looking forward to comments!

Happy hacking,

   Wolfram

Changes since (internal) v1:
* added tags from Geert (Thanks!)


Wolfram Sang (2):
  dt-bindings: soc: renesas: mfis: add R-Car V4H/V4M support
  soc: renesas: mfis: add R-Car V4H/V4M support

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 38 +++++++++++++++-
 drivers/soc/renesas/rcar-mfis.c               | 44 ++++++++++++++++++-
 2 files changed, 78 insertions(+), 4 deletions(-)

-- 
2.51.0


