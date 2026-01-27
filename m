Return-Path: <linux-renesas-soc+bounces-27491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLgFE4YdeWkQvgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 21:18:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893C9A4B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 21:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99810301474C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 20:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD3136EA8F;
	Tue, 27 Jan 2026 20:18:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63323265CC2;
	Tue, 27 Jan 2026 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769545092; cv=none; b=PINyuOKnTi4tvIe8NlWPf5gwdxCyVLY3Oq8JSrMf9KOG6Pu0Jt2PB+ywRllnpROuAy+fLwTMc32UCgpppMF7IyTeYcW0WCcfnxPuY7ID2IqQnGCPU9ShMgXKP+dwdcMARx7qLNTO7MPjuoedDxsAPqE5mjfYBckK3arwozapj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769545092; c=relaxed/simple;
	bh=mCoaBNPu3rA4vkKYBX41SOIXOOS2bbtUrm3BsqaZL80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRAezXclc8VwtZzWmIhtlJRQoHNh1Xb+2mARECU4Toxpkj4Kjqo/UH7BLdkTgtOLI/zNNsnR/mHkaUBUu9WMZnWkKMGRIo9PWpDRiOCsiQxEtOhwYqCQMNnX8bTAoWqrFrKGEPzrzxOJciFDT053c5JfsyduMYamqOQ1nvm0LS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: myhtBSzlSRejUx04eld1JQ==
X-CSE-MsgGUID: c8mOL1O3TFGijSk8Vxu4Uw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2026 05:18:02 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BC99240869DB;
	Wed, 28 Jan 2026 05:17:58 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 0/3] Add DMA support for RZ/T2H RSPI
Date: Tue, 27 Jan 2026 22:17:03 +0200
Message-ID: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27491-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9893C9A4B5
X-Rspamd-Action: no action

The DMA controller can be used to transfer data to and from the SPI
controller without involving the CPU for each word of a SPI transfer.

Add support for DMA mode, and do some other cleanups while touching the
same code.

The dts changes in this series depend on the DMA series [1].

[1]: https://lore.kernel.org/lkml/20260105114445.878262-1-cosmin-gabriel.tanislav.xa@renesas.com/#t

V2:
 * drop patches picked up by Mark
 * add new dt-bindings patch to allow multiple DMAs
 * wire up all DMA controllers for every SPI controller

Cosmin Tanislav (3):
  dt-bindings: spi: renesas,rzv2h-rspi: allow multiple DMAs
  arm64: dts: renesas: r9a09g077: wire up DMA support for SPI
  arm64: dts: renesas: r9a09g087: wire up DMA support for SPI

 .../bindings/spi/renesas,rzv2h-rspi.yaml         | 10 ++++++----
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi       | 16 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi       | 16 ++++++++++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.52.0


