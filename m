Return-Path: <linux-renesas-soc+bounces-21056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 451BFB3ACE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 23:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579C818970A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 21:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA2629ACC0;
	Thu, 28 Aug 2025 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OMb/RBF8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iChRG2Rh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6821146C;
	Thu, 28 Aug 2025 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756417523; cv=none; b=eaahDFOvhFfvG/SaTSw4vIgazPJOnQrL3UEIXDSFi2Qlh7xfF5cQHqCHCGrUPGRwOnZR1u7njaz4QOf7T1ftHfWeu85xBhlEQM7YaHPWFvk+NJFdE6r758VKhqpeFM6HfWmi41yd8SwUWxZDQLyw7C7HtGc5mXzkPbEv9KdnLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756417523; c=relaxed/simple;
	bh=ZXJTOAm/nmwEhwpO7qQm/q/mfhZbmiMOOiwtA73w5JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U8pQLSZCnUHv5hCz1Wlela4/tlCMWok4F7lCnBS+6bHZ2tQBSChf8KZ68ZOKL0iLp7yyoe4Hhlma7v0XegVCTj85gLDXUVW9wvdtqwGIwClvxrBAP0WsGjZlzY8ZoqtMIVack/II5RVyb/BExdrRRLBMtShH/f7mvkQK7z2kWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OMb/RBF8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iChRG2Rh; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8D61AEC00FC;
	Thu, 28 Aug 2025 17:45:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 28 Aug 2025 17:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1756417519; x=1756503919; bh=3J
	WcWzeNEvw0Y42QKd/eYrFW/ZmgqWxOHEP9xWTe/ys=; b=OMb/RBF89p1KKhSppd
	5smDqqWJUgwTWKEVHfgTXwYwMVIM9KQGUCJlc9/fPgWn5yNMBcs8oKCV4Jf+vXQS
	rPCY4Kb0LLmXdJ17bQ7GVCI5jeLz/ONX8QE1QjccuNkPmrLte3ib02S0+3FjOyX+
	QNkMfQg1K0wAd68COm9F0Or/vi2RaNHeJ9oznxSGmPS4QJTPsbiK+vK+Eb94lq3v
	Azf8cbjnNZK0KVpSlCwOQWD+2gmNW92s5CQeAGAz+wCqZ4cIYVgIfU9kO2nUqhC2
	gmenHvauk13nUIhwt21XSwtU7BWRZ/ZaNaA9RgrVK3Dje4KB7fwBPQEYYnvaokUa
	QpoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1756417519; x=1756503919; bh=3JWcWzeNEvw0Y42QKd/eYrFW/Zmg
	qWxOHEP9xWTe/ys=; b=iChRG2RhCmP8mSmIo8WHNPj9id/wiQ+0GlKvA/sOHnU1
	Kw0o29KyfNldA9AGeaETwOyvqKfpnCyYsdxT/GegS1PA0wE6muKHxDH1o/htWA9y
	+FqEvCShFweR0CI4mMa4VUUK4JmepA1rWh3giU+a2fNWRSujIsn0adXaZxlM2jsU
	Cnauf1w1yVNx6xMqqFG45zMfI1MRucRY5O19nJxxkB6h4aey6AOSI3/bB08g7fed
	BsIlyDr9xhoZG0kNAfC0G0v09Z44xp5FJzyTmLnqCmlms9pJTQMgYzBAwksaf/ce
	2f4ZABs+rPzu0udBzYEh8ohKcH7I8tQp4//kbHtlsg==
X-ME-Sender: <xms:782waLTPQom-xUMjL1bDAmE0_d89XwPVtRrlSLL7OZ-spCFxSfCzLg>
    <xme:782waFuB-g1IxPSySVMOZrjrP4s1PnTAN8bNf90eM972NzfKDdjig_5Frb7fSVPNt
    eYGDZsLhEajKZTFJLI>
X-ME-Received: <xmr:782waMYd_oNP5UxnXHWRHZ2At1kWpmQxBT6HLyozkZn69-vG3MkGN_q2TL5epGIxjXzZgrFks-yXVeGbN9TROxi6rQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedvudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordho
    rhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgr
    ghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:782waLHS659Qp_AiboeSKZ2mb4mCidoaGlrfAAXcM5S-FEOD2ldQFA>
    <xmx:782waAwWo_jxTvl5Y6vDT5rJW7iYrXUunNKoPEPFrrQFsQVA-evE-g>
    <xmx:782waNmaPAIj7EKKYt0qOPQvLwm_pf9-ZAHP1IXkPSk-ntUqx8XEdw>
    <xmx:782waJmzbrsISo8xWuww0CNrlm9EhG0hrpvnV6SNk9-aUKqWhhqAIQ>
    <xmx:782waHt-jcUAlk0N2QHcb2n19oJiZS4j9_lrESvafyDoFQycG-xiO4sr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 17:45:18 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC/PATCH 0/2] clocksource/drivers/sh_cmt: Improve clock event design
Date: Thu, 28 Aug 2025 23:44:01 +0200
Message-ID: <20250828214403.1765311-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This RFC/PATCH tries to address an issue with the Renesas CMT driver 
design. The driver do PM and clock handling in struct clock_event_device 
callbacks. This leads to LOCKDEP warnings and I think hints at a larger 
issue.

    =============================
    [ BUG: Invalid wait context ]
    6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
    -----------------------------
    swapper/1/0 is trying to lock:
    ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume+0x38/0x88
    ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400001/0xDCC63000, Driver version 5.0
    other info that might help us debug this:
    ccree e6601000.crypto: ARM ccree device initialized
    context-{5:5}
    2 locks held by swapper/1/0:
     #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_control+0xa4/0x3a8
     #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
    usbcore: registered new interface driver usbhid
    , at: sh_cmt_start+0x30/0x364
    stack backtrace:
    CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 PREEMPT
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
    Call trace:
     show_stack+0x14/0x1c (C)
     dump_stack_lvl+0x6c/0x90
     dump_stack+0x14/0x1c
     __lock_acquire+0x904/0x1584
     lock_acquire+0x220/0x34c
     _raw_spin_lock_irqsave+0x58/0x80
     __pm_runtime_resume+0x38/0x88
     sh_cmt_start+0x54/0x364
     sh_cmt_clock_event_set_oneshot+0x64/0xb8
     clockevents_switch_state+0xfc/0x13c
     tick_broadcast_set_event+0x30/0xa4
     __tick_broadcast_oneshot_control+0x1e0/0x3a8
     tick_broadcast_oneshot_control+0x30/0x40
     cpuidle_enter_state+0x40c/0x680
     cpuidle_enter+0x30/0x40
     do_idle+0x1f4/0x26c
     cpu_startup_entry+0x34/0x40
     secondary_start_kernel+0x11c/0x13c
     __secondary_switched+0x74/0x78

This series tries to address this by instead doing PM and clock 
management at probe time, and leaving them on for the CMT channels that 
are used as clock events. The CMT design is a bit messy as channels can 
be used both as clock sources and events. And the design to do the 
housekeeping for clock sources seems to be valid and is kept.

This is posted as an RFC as there is one other driver in-tree that 
suffers form similar issues. I intend to try and refactor that away too, 
but would like to try and get some feedback first.

The work is tested on R-Car M3N.

Niklas Söderlund (2):
  clocksource/drivers/sh_cmt: Split start/stop of clock source and
    events
  clocksource/drivers/sh_cmt: Do not power down channels used for events

 drivers/clocksource/sh_cmt.c | 85 +++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 31 deletions(-)

-- 
2.51.0


