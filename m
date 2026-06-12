Return-Path: <linux-renesas-soc+bounces-33903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44AKJpS/K2oYEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 10:13:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3CA677B0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 10:13:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="NSAjnw/R";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8347301CDAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 08:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1D1369D77;
	Fri, 12 Jun 2026 08:04:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C948364022
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 08:04:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251466; cv=none; b=tDsLaXSmbM9JSFcYM11bKIl/dl3POUIpDCNhahPQRcZu4EUtO5IJbV39MyNQEGJPi9Gdrg70PK50liD7QYTE8socfEiNlczxSX64p+VQdZkbRFbySRVF3zsdhflUHfyf8rT4vjKlvQ3kpZrQRqNDqwSuf78WsXBjlymGTjxZwbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251466; c=relaxed/simple;
	bh=SD6udC50xqZVQxPXlHTu+aZ4viUT2akMMWggNWejb70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEi1GlrRFi6CK6B+wSUlq/xxWCWINFRy0Dryzz13zXz976Ju00JYn0W6zgENTrTuIszNWniLctapr2gwZoC3bjm1W00r9Thobg27lG5eUTjAj3aJhk2w+rB5a2XjDW3UtgAFexCvadgVLYzSEZrtRyT1Eea0T64FKUUb3qjJn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NSAjnw/R; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Xe30Lk+zeo5LYt
	5BDIEDOR0jr3l6SkDT59cNfjB+Tkc=; b=NSAjnw/RMqDmiDQRvIW1BHss34wUzi
	TDpaNkwdnLfFTbzwdFjGWBKpNTVD56CB+CgdDz9j8I9cH4XBhYejkuXx6D+IdnD6
	KbTepUQvuVfS+GpfQVe1rL/pAkz3iGzYWdK9HoxqfwKR89wqsGmMQ0+yrKGb14IY
	3fYBUaNls1/gYtBUkrXXHn8oD7vcxA3K9IY0NZMozF1ziXpDPX/jQ/Y+L8vHVZvF
	7Xo8pPO5/2k/ZPnE95M5AYWtFG+4aGyIu9LFBrYWxBAZ70alfsKSdCTQ77Rn2W8A
	/hp4RA1uoXjsBgqNEHyrC0S2L9Y0JhQx46ehC4sYQVZH12NQEOiHz+MA==
Received: (qmail 2443762 invoked from network); 12 Jun 2026 10:04:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2026 10:04:10 +0200
X-UD-Smtp-Session: l3s3148p1@WXr16wlUrKcujnsK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI and FRAM
Date: Fri, 12 Jun 2026 10:03:54 +0200
Message-ID: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33903-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:mid,sang-engineering.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A3CA677B0D

Here are the patches to enable the SPI-FRAM with FIFO (no DMA yet, needs
more work) on the RZ/N1D Extension board.

Wolfram Sang (2):
  ARM: dts: renesas: r9a06g032: Describe SPI controllers
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 ++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 90 +++++++++++++++++++
 2 files changed, 115 insertions(+)

-- 
2.47.3


