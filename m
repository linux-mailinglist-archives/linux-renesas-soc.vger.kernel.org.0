Return-Path: <linux-renesas-soc+bounces-30513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLSVEmsWx2mWSgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:44:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD434C7B1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D890A3012E58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 23:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F004536B074;
	Fri, 27 Mar 2026 23:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OxtwlH1N";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IIPcsmaU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F6395273;
	Fri, 27 Mar 2026 23:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654980; cv=none; b=k9dHCu4U84QK4vMWkKmc8kPjrd2xW8eOHnCYTWdysClBxyjnEEOFw8ayPkEr0luXjTd1swbt/mzdUCOBHFI7ZuYc7KWjEOrFj3Sk5FVn9L+93ZsuSPkuQSKh5hCe858DW8v73/JhZQVx403WFy8jL5whaQZADJ7YQQuNY7sZ/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654980; c=relaxed/simple;
	bh=NtMatZnJhRnn9EA9m4QYZZZyHi84Nh1rxJ08S+HR0Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8Z/bajR913JfwrREgwrcAV+ysHXY8vPR3/VHC+OQvahOtB/EsVI/RVGJxZqolBi32zugjmQ8v8mGzmmpFSxdOmYwUvL0+jtYBZa2Sv64Yo0vjwbFxRacN9jPoh9mvtt6HK0Vk8OlRUZ4KNt5ogUXfG8ikfIwcJ7rcaM/FDvAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OxtwlH1N; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IIPcsmaU; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fjHJG1Qywz9tmr;
	Sat, 28 Mar 2026 00:42:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pudUxNmNHF6c2MfPxmIneGnnQ77yu+zSLu1gflW/mao=;
	b=OxtwlH1N83TKRN1hp7daxJLc5N9mm3Q6XvizptzlKnw5DTFOgDdJ81+m2flcUwDY7iZZ10
	pjIiGXJ/Frp+T9vfaC1iFUE4R/xq0L57mXHcLLKEzR2Vn8BJOchTyPAwFz4aeyn30TWwr6
	NcgBuKXxEnFo3itWzjRaE8k9ZJkG3u5/qeqB/n2Fhxp3mwkneNHgh+Ot+mJHZ9hegUEd5K
	WRAqKfGi7x0BbrRI3bJlB1MuQMYhyjSi4J+HNAAxttixq5BikSODUMfP5pehFknWHdWWod
	cJP0TT6igypy7HULMMt1X8MtVfjwlElkfqPFLFtmDSQZHpl4rGRWo6yCm378hQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pudUxNmNHF6c2MfPxmIneGnnQ77yu+zSLu1gflW/mao=;
	b=IIPcsmaU8ywWDiVs746b7eHICgWF4j9BvYuY3e2mEMlUQU60/jXNBcmWkL/K0lsBZt/Z2H
	eor5Pj+cgcFwC5dXAf2b3gQ9Xty9jcj2ukknrrQAcja+zFVxoaG9i4BERoMgdHB3dPy2nt
	3ams+Kw9Iqruf1mZ/qHGXCJo76ucP2wEgpf6kNRxh5zMGuzaoeAuaEViW/628lyMTY+4xB
	bp3SSef3chEyQnlW2gUbqQp49ouT2jdesIpC+sllVVrNy+lY96q+o59WRGywCE9kIlhh8T
	/sVRxXJIlcfQ0rI3IkV5ewSdZqTGQSuLnddHalMo0V0q6S1A+rcHgF9Kx31W/A==
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
Subject: [PATCH 0/6] ARM: dts: renesas: Trivial DT fixes
Date: Sat, 28 Mar 2026 00:42:05 +0100
Message-ID: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b2b79677db91ea5b61a
X-MBO-RS-META: cfajky37wi7z98d6mdepyg85uwsguhst
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
	TAGGED_FROM(0.00)[bounces-30513-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.18.168.128:email,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: DEFD434C7B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing unit to bus node to fix the following type of DTC warning:
"
arch/arm/boot/dts/renesas/r8a7778.dtsi:43.12-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
"

Drop superfluous address-cells and size-cells to fix this type of DTC warning:
"
arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
"

Marek Vasut (6):
  ARM: dts: renesas: r8a7778: Add missing unit to bus node
  ARM: dts: renesas: r8a7779: Add missing unit to bus node
  ARM: dts: renesas: r8a7792: Add missing unit to bus node
  ARM: dts: renesas: r7s72100: Add missing unit to bus node
  ARM: dts: renesas: genmai: Drop superfluous cells
  ARM: dts: renesas: rskrza1: Drop superfluous cells

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts  | 3 ---
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts | 2 --
 arch/arm/boot/dts/renesas/r7s72100.dtsi        | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi         | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi         | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi         | 2 +-
 6 files changed, 4 insertions(+), 9 deletions(-)

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


