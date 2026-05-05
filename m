Return-Path: <linux-renesas-soc+bounces-31985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMF4L3Jn+Wmt8QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:43:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE464C6347
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5D2A3008988
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 03:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73573ACA77;
	Tue,  5 May 2026 03:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pqpcm4bz";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ADrJmMy1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738DF224AF1;
	Tue,  5 May 2026 03:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952623; cv=none; b=j+AQOSYylEd/EUbWmtV+FXqRNMhF3WSZih/VmDKnXlm03kRON4acJkggZ8kyDBcKaxVA1IlAgLXdde+kAhLV+Qp2ExzKnt3zZ0VEsKo0ajLlpgKnmL4mjZVBFYYpSBeE+rz2//oOIdaWMM71pKHsr25PL1GAm5V/Tg4pCW/Q6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952623; c=relaxed/simple;
	bh=+HKjeg46457d7ufEpp0nqhVFJkjWcezOgVNG7swBCzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCXy96q3s7bUKhD9WfCYzqcUOTZ6Nv9FsWtbtUl+/cWYNz4xkN7Mkd3wVovb4MvUwfSib3/TpB//ka9fsBWhrYkHvA+6UaoXVA6vh9ILZSsy2mcQalHgSNRUs4Zre7/sZ0wgZlaZU+OimIhj0N+SnmM0HntF/JZqKG0TA1QKjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pqpcm4bz; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ADrJmMy1; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8krV2lYSz9tTx;
	Tue,  5 May 2026 05:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JPkGMZo0R8KobEm/98TuUeUCs1yFUDqx+eNSwkeA/iQ=;
	b=pqpcm4bz3BcUl0ve39KN5SchvunleQntvqpkk1MvevwqbrrlnX8S0q+v6wlaw6B9D3n5Mi
	WPi3TUWTpB5Brp/SlHnBRHTVPhLZEglO14Rf4YKk0sDL/tX+/LXwGkWxG6DiEuoJb9kGPx
	fCCr4tUQwAAspzOcSWfV/W9d5xvH9YFC4F61P7Iq4r/QU3f83ezjkEaZIQaUubDVI4jxfA
	PKWjC0ioW9hGMlcPk908Ygr69wbI2kw0+dwJEttWVdYvyL+WmpG1fmP/NFcWCkkLZvmgmr
	w0rrJG63cXWXjXwKphD/Kca4hXti3Rdh8K47uAzo6y8ESRZ9I08omgN/klnfwQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JPkGMZo0R8KobEm/98TuUeUCs1yFUDqx+eNSwkeA/iQ=;
	b=ADrJmMy1aGJQlE/aiU2l1NM842m8tRA4ZG9OBBgDljZtYKFLh5Nu/hBO+/l5xiGHzVOkIs
	26jwNC0eurgKbhx2wxV6GKPFe+Bn4vOWWM/Tfta6O0DIjR6cI+CV8BxfolOHNjH8OmDtms
	d3Tju65XEs1s0jFZJjcMFQ9MrhGweN1FMogPKYKqbdivqvikn66veeMoW/jxLCfp+UsmGf
	DTrOHx43/DOABBerIj4/77ouTNNXNz3rxkkUTz227W7mg7G5dzjjV78wjBKw6kFMzCeFQA
	EI0Wj51J1GulEulEFqwg6xKncayZAX2MK5LjZlTkdlD1YMbcNe0ltZvksQ4aNw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/11] arm64: dts: renesas: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:41 +0200
Message-ID: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 96149303a1e4fb23754
X-MBO-RS-META: uxm3dosm56ffjxoto3s1gzf8tzrwabpd
X-Rspamd-Queue-Id: 5FE464C6347
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31985-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid]

This is the same patch for various boards, details are below.
The discussion that prompted this patchset is at [0].

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

The Gray Hawk patch in this series depends on [2].

[0] https://lore.kernel.org/all/CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com/
[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
[2] https://lore.kernel.org/all/20260504225428.114959-1-marek.vasut+renesas@mailbox.org/

Marek Vasut (11):
  arm64: dts: renesas: salvator-common: Specify ethernet PHY reset
    timings
  arm64: dts: renesas: ulcb: Specify ethernet PHY reset timings
  arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
  arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
  arm64: dts: renesas: condor-common: Specify ethernet PHY reset timings
  arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
  arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
  arm64: dts: renesas: draak: Specify ethernet PHY reset timings
  arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
  arm64: dts: renesas: white-hawk: Specify ethernet PHY reset timings
  arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings

 arch/arm64/boot/dts/renesas/condor-common.dtsi         | 2 ++
 arch/arm64/boot/dts/renesas/draak.dtsi                 | 2 ++
 arch/arm64/boot/dts/renesas/ebisu.dtsi                 | 2 ++
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi      | 2 ++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         | 2 ++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts         | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts         | 2 ++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts        | 2 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi       | 2 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi                  | 2 ++
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 2 ++
 11 files changed, 22 insertions(+)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


