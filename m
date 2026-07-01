Return-Path: <linux-renesas-soc+bounces-34602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J+TuOecbRWqd7AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 15:53:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5476EE650
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 15:53:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=HtHvrBjE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EF503322351
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 13:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A4248B369;
	Wed,  1 Jul 2026 13:13:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212C548C3F6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 13:12:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911584; cv=none; b=Qe5z2rl6RNENPzsHDe++nm03j6iPuuOugC2oqTqO664scHwIoFvFTAENhjUIfDziMaczXPGMgklZHt/Z/sXLfd+ta9lNDeZeUANALWz42Mcxaln24n2nNMbWpPCEzjNWHdVA3yI0pAbYx2oUHdg21Z/aLkR5eSygnJlPq7y+Xwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911584; c=relaxed/simple;
	bh=3yepFYZGWP7OCDCU1WhwbZCJftBue5NPWyqGLDZgBcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JpZpQEP++Dd/sgh0n2Kje18xW8/17nDVTboU87OceDqn5fT3ZayAX/WX4G86LlxEE0HSK/MfiMbkfCr7u9GrcJ3ob6iNQpIkwV8ivfbvUSr57mMJEySYDTXdy22jzH6RIQR9SXv0I5Odh5t4P6azU3p5DDn9EY//wxZUoJoweR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HtHvrBjE; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=vitzn9qdLoqkMt
	nHkttu4JwWU5DXcRVqxYSkJlcdvO8=; b=HtHvrBjEXkDcop8cACubCuhnhT+Bgq
	tBIna+QnVpAAi97qFkpFay3FLsrPQdbPG/X6Ul9vNneVeGF3UZqTnuizonS/vu/n
	xtAi+BBdEYlTN9vvFTKptN9wRNj+/MyDfA+suWAI4xNLWE5msgHPnujaHXp0y6MA
	wPGGJHupZrp67NTsukn6uI77yG0NUN3nbi2jfWXq7/JWSQnssox4CQ43qnOkQvEK
	y6T49qVMrW4ghOAoImHsy3ICDn+EJ/r8gROZm0Eg3hjsqQ0tcWi7VhhFiRDTmxwW
	r0d+mwZ7mFKYc/dq7J8cF+Clr4/HvTE63H9/TPXMX4QZVw3QO4QcXXPA==
Received: (qmail 712996 invoked from network); 1 Jul 2026 15:12:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2026 15:12:57 +0200
X-UD-Smtp-Session: l3s3148p1@Yboxc4xVVKxUhsc0
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 0/2] spi: dt-bindings: snps,dw-apb-ssi: updates for RZ/N1D
Date: Wed,  1 Jul 2026 15:12:48 +0200
Message-ID: <20260701131248.4545-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34602-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linux-spi@vger.kernel.org,m:magnus.damm@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:wsa@sang-engineering.com,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:mid,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A5476EE650

Since the actual DT additions are in -next now, here are the remaining
DT binding updates for the Renesas RZ/N1D SoC. Changes since v4 are
described in the individual patches.

A branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement

Wolfram Sang (2):
  spi: dt-bindings: snps,dw-apb-ssi: drop duplicated RZ/N1 entry
  spi: dt-bindings: snps,dw-apb-ssi: add 'power-domains' property

 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.51.0


