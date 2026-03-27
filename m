Return-Path: <linux-renesas-soc+bounces-30481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IO1Aa/axmkoPQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:29:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98F34A241
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A00530BD1A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7A135AC31;
	Fri, 27 Mar 2026 19:25:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07AC2236FA;
	Fri, 27 Mar 2026 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639522; cv=none; b=Kl0pi2A6NvmoHlX4vQjZwsiM2i9K9kFRO3OSkJbTj44hzJKUU/NDS156SQafnY212zsbelQVVgKdp0RnYA6LK+hu01o6IQujBIXm7oAwZ8vVTUz1cbgYyoPqPiWCHb0uwVCNcqZ+w79iJwqEUGyBE9NaZDPgaxDvzZOyrWGCYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639522; c=relaxed/simple;
	bh=3eN1vH5VayiAZJz5FZZREpn+siCfTofvya//VnAW7hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KqaiCM56ONfw/aMdvcPaN0v1RK/jnHi51GsEm4KK3N3F07gxtYEQ23fYBU1hHcQaKCFurjai2gh071wbsv0s9xKjvCAf3vzlmRYsFlebmLUj7+oWtH6cFeMZnvT9p4CQeafTjkZwJDR6adynyazQvDfgeO3GoVhVrelHtOEjIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: X5loxaDBTdm9bqv6t8kVMg==
X-CSE-MsgGUID: 5lwiUDexREKBguKTSrIPvw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Mar 2026 04:25:18 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0FCE34014C3F;
	Sat, 28 Mar 2026 04:25:12 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 00/11] Add MTU3 for RZ/T2H and RZ/N2H
Date: Fri, 27 Mar 2026 21:24:14 +0200
Message-ID: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30481-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B98F34A241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have an MTU3
block. Add support for them and fix the non-existing TCIU8 interrupt.

Cosmin Tanislav (11):
  clk: renesas: r9a09g077: add MTU3 module clock
  mfd: rz-mtu3: use device-managed reset deassert
  mfd: rz-mtu3: use device-managed mfd_add_devices()
  mfd: rz-mtu3: store &pdev->dev in local variable
  mfd: rz-mtu3: make reset optional
  dt-bindings: timer: renesas,rz-mtu3: remove TCIU8 interrupt
  dt-bindings: timer: renesas,rz-mtu3: move required resets to
    conditional
  dt-bindings: timer: renesas,rz-mtu3: document RZ/{T2H,N2H}
  arm64: dts: renesas: r9a07g0{43,44,54}: remove TCIU8 interrupt from
    MTU3
  arm64: dts: renesas: r9a09g077: add MTU3 support
  arm64: dts: renesas: r9a09g087: add MTU3 support

 .../bindings/timer/renesas,rz-mtu3.yaml       | 34 ++++++++--
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  5 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  5 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  5 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 68 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 68 +++++++++++++++++++
 drivers/clk/renesas/r9a09g077-cpg.c           |  1 +
 drivers/mfd/rz-mtu3.c                         | 39 +++--------
 8 files changed, 181 insertions(+), 44 deletions(-)

-- 
2.53.0


