Return-Path: <linux-renesas-soc+bounces-30194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHRdBl4Xw2lCoAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 23:59:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B067531D90B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 23:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1DE430459F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 22:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D973C7DF9;
	Tue, 24 Mar 2026 22:58:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEC12D238F;
	Tue, 24 Mar 2026 22:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393082; cv=none; b=T9l2oB/Agh1VJyVtc52scN7DVdKPgCLRQB65RxHDcCa9w4KqyepfuF20bPuiXz05RBFUbmfbdyk7EFEHiAxuLL9VKjTfARZxU66i5cBxMqOA5NAMF+IZgvGXV4ON6h4vT1RbJMdsH/F7QputJPzIuyO/fj0JM49WqbLUAnBPflE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393082; c=relaxed/simple;
	bh=kbebKpZc+kOH/NCAbOn1JPHayuYXWSqmfRuqOsgshDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qq7dYz5mSoDVOGhCYdn7t1RaCEAoIq90MZLAxWODrUYq+fUBRkJo1JgjEFY7KXbg07tIdOS42EzAdk1SjFJz3SIRyoUKWgLGoITfe5N/6d9zy+h1v06WS42qOfFbVaZ5eRHng4n/jxWNswvu2picJSvLR1lLmj/1BjbAh8W34WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Vkd7Xo+HTQuLLxwzRJ6/dg==
X-CSE-MsgGUID: WOxQGzJTTm6/+mSk05czbg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2026 07:52:50 +0900
Received: from mind-2s.example.org (unknown [10.24.0.35])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E9800400B54B;
	Wed, 25 Mar 2026 07:52:46 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Remove WDT{0,2,3} support from RZ/V2N
Date: Tue, 24 Mar 2026 22:52:33 +0000
Message-ID: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
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
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30194-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:mid]
X-Rspamd-Queue-Id: B067531D90B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear All,

The HW user manual doesn't explicitly state which cores
from the Renesas RZ/V2N SoC should use which watchdog,
however, it turns out that the original intention was to
only allow Linux access to WDT1.

The purpose of this series is to remove WDT{0,2,3} support
to prevent the CA55 cores from getting in the way of the
firmware running on the CM33 core.

Cheers,
Fab

Fabrizio Castro (2):
  arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
  clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 30 ----------------------
 drivers/clk/renesas/r9a09g056-cpg.c        | 15 -----------
 2 files changed, 45 deletions(-)

-- 
2.43.0


