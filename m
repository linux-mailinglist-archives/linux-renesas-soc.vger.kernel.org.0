Return-Path: <linux-renesas-soc+bounces-35256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Zw+DcdmV2qwLQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:53:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B075D20B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=MqUzAVke;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43409300C7CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5664D438486;
	Wed, 15 Jul 2026 10:53:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77568437467
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 10:53:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112834; cv=none; b=gomqXunsckO8Y0NT5kE8WMLYp3TLId7JT9mSceKBR0gMJbZWk5G5mU6FbmBstRT04G3HnkDKYefE/2AI+PmBuV/ql/GDR2TQi8bCRx3WQBBMqGgRVrQclkfjN4OxLGdIghuz9aDa8NN8ZyVoh0U8EuGA6egwtEigFl626GFywEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112834; c=relaxed/simple;
	bh=3S5qph7Dbs0bVnLZ/OYGw+fpWW2QCv/r3QolJOpsAvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3aP5mP+Y/4WRf/LTWoWG5PcnKcnDVfCVVq9li1Ww+73MVu1+CSG2/plK2o/SZ33WoQVurF5d7eu8CnP3lnHNxvyuTZ7wm7hEAoyJ3ZXPTzHlW2cPDOhY+m3WlzdoNElTk4MVpNfOvV049aD4eZV1vI2x1Dn1BaLzxZ3ZYbVouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MqUzAVke; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=nSEZizGdBLNTtt
	g9AbeJSWiaf0UL2WLOMSKQancVurY=; b=MqUzAVkeW7bvneOYesCcOlSy4lx8Yu
	IFE/AKOhF4hT381eDKvjL5bvN3K+qtCf9q1cS1X1uskfP0g2RvybKQQW3tzBtjzV
	Gzecz5Odtei7iI1uOfe2ubAVtAUv2JtRd7oO5dGFLgsIwG24u3QvVQ/qP7hTt9Xn
	BdrnTFhGMmMjqB71Tfo0IQUCO5hapTy52bQoBpWQmvve2Rszc+feiDLrGzNN08G7
	Q4w/9Lg8a5jRajA7mewpf7BMitbsLBpCXgnDOLhc4CHFBqw172dEhW6fgBBbjaXz
	ESHJ7D1CZnnR7oALofJIje6SpcxmmiVzRONQtroYqSltwEqn9xJFtiLA==
Received: (qmail 654684 invoked from network); 15 Jul 2026 12:53:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 12:53:40 +0200
X-UD-Smtp-Session: l3s3148p1@AQLmIqRWJrMujntW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] ARM: dts: renesas: lager: corrections for the i2cexio0 bus
Date: Wed, 15 Jul 2026 12:53:06 +0200
Message-ID: <20260715105306.25147-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35256-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:wsa@sang-engineering.com,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E3B075D20B

While working with the i2c-gpio driver, I noted two shortcomings in the
description of the i2cexio0 bus of the Renesas Lager board. Here are the
fixes.


Wolfram Sang (2):
  ARM: dts: renesas: lager: specify correct connector for i2cexio0 bus
  ARM: dts: renesas: lager: use inclusive wording

 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.3


