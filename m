Return-Path: <linux-renesas-soc+bounces-32781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNX5F/4WDGrrVwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 09:53:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD050579748
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 09:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D168304F27C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 07:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FFF3DCDB5;
	Tue, 19 May 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vzag1gZm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB75A3DCDAE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176846; cv=none; b=Qotr5VOzV8q1K0IF8t9FWDr/zeu/W0qjiMH8PhaVxaOJsmjqmPmBLLetsqpFL13AvPQROYJPFmbRoAW+a/sHL513Cun7Ofzcz21nBfwjZGwuv6PQ8gDpIcBdYLTJIao3Yx6RN6hRYJiarpxQ12PszPg/cqkw0OpvcQ77Mcskia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176846; c=relaxed/simple;
	bh=Es658tDUhANj0f65HggskjZBi7myAITa1mQQ3XfnQ7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbdJ6q8Gc+Atm0PrbuB+YT0Z6xhf03O3W9lgaufRMfwVnyCtgq5eaiJvwJ5QFTcnmlNMdtTF6xso7rNQP1ZNGEuZfe8qM4qwaDh20tiADT1FwkXA9W0f1r0P38pR7vzZgNGOpnOIC7fxEkNyWBT4QMeU+t/+gl40fCW3Bg+/dmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vzag1gZm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=srNJzadSlYth5E
	K7RTZS50LIHoTspbgGwB8oo2XUbM0=; b=Vzag1gZminY87pBKXNWF21D2DuLBMg
	e8WtpP3ur4/E6j6Fl4khJB/ahtS3i1DcBp1DomtzJ9dI5lj+vKw/wsiewJvnNWk7
	wSlNnc2WyHxqYqv72SrjAfRHUtVLgvfzA5D0fjtNllWSzLiYiO45uEXl81wBxMbA
	r7PwvoKVVCU6HgUr/vrmhg+QfIWRx4ouyt3EwDvFT4wJ/5eDZBCtgrFJq28A5qOG
	1EFgXRFSBWq7WhWzzKU/7b6zE4lo5HRJnlO53rbsplYswiFh2WSeURDLhTqYwAUX
	6OXifaUzwb8wjSKdvJpx6WMBnQWgtvL4Ltx9qjupuGRZ5SCR4hPz6NjQ==
Received: (qmail 167933 invoked from network); 19 May 2026 09:47:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 09:47:12 +0200
X-UD-Smtp-Session: l3s3148p1@PW8R4yZSGLhUszca
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] arm64: renesas: r8a78000-ironhide: enable SCMI
Date: Tue, 19 May 2026 09:47:02 +0200
Message-ID: <20260519074702.3308-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32781-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sang-engineering.com:mid,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: CD050579748
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Here are the DT additions which allow the Renesas R-Car Gen5 board
Ironhide to handle clocks via the SCP through SCMI. For that, we enable
MFIS controllers, STCM transport nodes, and finally, SCMI. Needs the
MFIS driver which is currently in -next.


Changes since (internal) v1:
* improved comment about transport nodes in patch 1
* fixed abbreviation typo in commit message in patch 2 (Thanks, Marek!)

Kuninori Morimoto (2):
  arm64: renesas: r8a78000: add MFIS, MFIS SCP and transport nodes
  arm64: renesas: r8a78000-ironhide: enable to use SCMI

 .../boot/dts/renesas/r8a78000-ironhide.dts    |  34 +++++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 129 +++++++++++++++++-
 2 files changed, 160 insertions(+), 3 deletions(-)

-- 
2.51.0


