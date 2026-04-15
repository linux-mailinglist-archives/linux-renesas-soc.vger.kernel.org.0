Return-Path: <linux-renesas-soc+bounces-31307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA+3M0Ig4GkPcwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 01:33:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBCF408F56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 01:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DDB630BF2B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 23:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C88281369;
	Wed, 15 Apr 2026 23:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oKP4Oj3+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AfAeqXh3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2951A01BE;
	Wed, 15 Apr 2026 23:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776296000; cv=none; b=mS2eEplkYHXqaxgJx/Ssqh36mG9fX9wq5O9qH9Yv4Wb+zzfnuf8VUzcgZTzg6DYQxzKuNC7+u2tUH0Odn1zaSWkbdygRwC/FD1FsDDDr9Sodib/Ceie/5xU3eqYpGkBLD1RGZ05gGB61nYRrPYItan8CeQ8R02ot4QCnqlTO0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776296000; c=relaxed/simple;
	bh=nD+DOZCqRg7yUCKRVdUZCOhUEHlGnvGD+8VMNtlkb9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nyZgyQ6mXzaUSvmndIUS9cahBhgeSsYCVou6rqV1DvRu8rj8r9Xc5EMSCK0k4mGpFSMemCQisaYFvt8zIiQqZlvSrfd5AyBNhQqN8QEwSTqzWjSc4M/v9WeSFazuRolhk8x88SVhwu017lCUBi2gNXjF3Z91GMj3kgArzxutEkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oKP4Oj3+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AfAeqXh3; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fwyBN0tKMz9txg;
	Thu, 16 Apr 2026 01:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gvWOWQVPz49XTZTstMQ/fvYu1MF/JxDwsGNwmUvTe68=;
	b=oKP4Oj3+pCqBUNihBLZNhvmVArwceWZ9wffmh9Afe8lUzgwgdQrVkn04/r/W2QPyTwYLKM
	ZC7K+cnBXevP92tJinmH71Mfk6Qs+/ALQrMOpyWqD3/ODVGnZwUXzyb89NbvnoTu4C6aQu
	81ymzOtBlpA4jw7kLz21KeG9TBj4iMDL8oPtinD02keIZ0blBywlcK2iv0FCr3maGwhqXN
	nbDt5CBeqXU1e+qqUpzqq80mTzZ773ZpLP9/sjlvx5EOeOW3EbseOTElxDlyMh4lk8W9sG
	VOwpue7atI4TUTNfoMp2lxdm2EpuLWlGoS/s/EFEuj2S15VuZvzcK69cLEaN9w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gvWOWQVPz49XTZTstMQ/fvYu1MF/JxDwsGNwmUvTe68=;
	b=AfAeqXh3NT12dP48aAuh5RQuIdcjsUpXzKEh1IYBwKYexG71oabLSsU/AwXLURLBYpmc4M
	qzzP4YktqsCbzCyj80UMEiBeUJtbW4S9yJolZpHXLkx+kZVYHI9xAxBRN5MX+hKdN0FUEC
	WPkFotwoQLQiLbaCMnmEJtKjT9PkLYyGeFHbUnrRxsR/5IQAaLRA8mttQqMrktXR6cvXk2
	sikdx+UE/OuWbo+FSqn1Ln3t5FOhicUqKCmFhuAqgPk83xneCdu6fK+uvfrFjacZLaiV7y
	3pZYIcL/uJyW86a8MJtFzlOfNgKju4TPFGlx+faL8nWA4RzawZlm53MC+b6vpg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] Describe coresight on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:37 +0200
Message-ID: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rxmaqd7ujwu4pup7znsqwx9x5yhk6sb1
X-MBO-RS-ID: a58143ec36526588d86
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31307-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 3EBCF408F56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement support for ZT trace bus and ZTR trace clock on R-Mobile A1.
Describe coresight topology on R-Mobile A1. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Please note that this is written according to R-Mobile A1 User's Manual:
Hardware , Rev.2.00 Sep. 2013 . I currently do not have access to this
hardware, therefore I am sending this as an RFC patchset.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile A1
  clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1

 .../bindings/clock/renesas,cpg-clocks.yaml    |   6 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 116 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a7740.c             |   2 +
 include/dt-bindings/clock/r8a7740-clock.h     |   2 +
 4 files changed, 120 insertions(+), 6 deletions(-)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


