Return-Path: <linux-renesas-soc+bounces-29363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MxgKgI+tGmKjgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:40:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7732873B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C03B93001A55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7343A3C6A4B;
	Fri, 13 Mar 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eYQEFcPi";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="muToOyAR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055236309E;
	Fri, 13 Mar 2026 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420029; cv=none; b=RhIQiw94/Rm5MKQZ4yELuavCTDVPttIFBSgzIPrrdSXxWYMTSju22oalh+jhB1SoKehmK7gwrQKqlsWeyM4sGjtQs8Ppm3Q3MiS1SWSEzhxWOCI6bHEf1IbMlYedYpPnXBHBIZZV6XrNmulgaaTgI32eFbkvhq217BHYwgTOZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420029; c=relaxed/simple;
	bh=7dscg8NAFHQNjHLD1DKqDcgR306qyAIwsYmPQ0Ureos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekUeaTkpBPaXdSX4uQ8x4PUzIluzj3y78hBdi82VsbdHiQINVtwZ1I7H7/BwjEdaf/zRRwZ7l0FVHKrYoQQG+q4PCAKj7gUXvAe/abkJYoUII1qSvTLVWDqgFA3JJ24rr0pHQ3tEIdhXnSczlMgrvbyuja3FmANdgcCvEBkW1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eYQEFcPi; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=muToOyAR; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fXVbD6Vkcz9v0l;
	Fri, 13 Mar 2026 17:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JNJNBe744ZGzg9YjQ2tzTZC5HYngRHwBIcHZRRMHlWs=;
	b=eYQEFcPirCKORhXsborpIu+UncfhB0e8PsdjV6dPalSujgIrHJ/U03m3ODQgq6yismLwnT
	L7EZvmus6MTNbpEBt3FDd+I9TSYhCUpUGVddJobsSXcv8YYozesxujSndFTwo8UaVI8Txp
	Axr5ReXic9C55x+1ueCLwKs+4d0nRYqAz1WVUeae0GaaFL9UPwCkk+RpUG4ScZ0zAPgFX6
	ApADSt4m/gJT/ipqbXtOw0DeBsXmVaV3ZpVw0Pbmk8wybDlpT5xtTTCKfXADVXxOlwHI45
	qvv0EFFrW+51GTgbevnx+ZNu5oes6dL53VJaPcJ930Fm96spFDDmRYZOHfgKTg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=muToOyAR;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JNJNBe744ZGzg9YjQ2tzTZC5HYngRHwBIcHZRRMHlWs=;
	b=muToOyARr9J+fp5D1Xw6JdAqbemighDb3yVmE4sIyMqOsFFgUU1q7NXvTwAVephyWIDvns
	x1buh3bgFN922iSjxV/GmnvIS/LWsY9B4RKdwuuM2rOf2yAMHW+cG+ubIDOwXJ2O7w9gsj
	dKA4CuzDWsgTn6Oyu9/TbppeprQVsrs2odQa8KhrU04uNFhO2E8t2orbyK8wRyxEK60g/A
	+GNFbjiDrRJB9c3H13qnY6PcO32Rxa8nQFiUUSIBSSZjKvQGmoRItcTAEmMrgBjjF6kZFn
	t9kJS/brZT/kcGgIH5YisIIuRCEom1p81DDmWLgucuvGTjAKsspNCIBQ75ZLdw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Date: Fri, 13 Mar 2026 17:39:02 +0100
Message-ID: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d6638a3d09f41d33cf0
X-MBO-RS-META: qicis6mnxoqgbbuayxctnws8fx9coqp7
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29363-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_CC(0.00)[mailbox.org,bp.renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 8A7732873B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Realtek RTL8211E/RTL8211F and Microchip KSZ9131 PHY schemas
indicate that compatible string "ethernet-phy-id001c.c91[56]"
and "ethernet-phy-id0022.1640" must not be followed by any
other compatible string. Drop "ethernet-phy-ieee802.3-c22"
to match the schemas.

The KSZ9131 schema does not document "txdv-skew-psec" property.
Fix what is likely a copy-paste error from the "rxdv-skew-psec"
property, use "txen-skew-psec" property instead.

This is compile-tested and schema validated only. I have discussed
this with Biju and they could perform tests on real hardware to
assure no breakage. Please wait for their TB before applying.

Marek Vasut (4):
  arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
  arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
  arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
  arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec property

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi    |  3 +--
 arch/arm64/boot/dts/renesas/cat875.dtsi                |  3 +--
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi        |  3 +--
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts      |  3 +--
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts |  8 ++++----
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts |  8 ++++----
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi       |  6 ++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi      |  3 +--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi      |  6 ++----
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 10 ++++------
 10 files changed, 21 insertions(+), 32 deletions(-)

---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
-- 
2.51.0


