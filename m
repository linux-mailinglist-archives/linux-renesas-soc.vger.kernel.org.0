Return-Path: <linux-renesas-soc+bounces-21727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87504B51944
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B02E87A7066
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F59310636;
	Wed, 10 Sep 2025 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AdOiSQQL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N6PtHH1m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8E1E5B70;
	Wed, 10 Sep 2025 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514438; cv=none; b=sOVxPeMxK8mHE2t7e2t/oS2FQBF6iMRbZMnoReIn5IYkk/YjfxgOksN7B1I5Secgyai0CET2jAZAxI191wrKnWai8tU7bJvEx0iFk38oBfdNAhzLymAxMCIZnSFL5ZEnDU66/WOV0gI0ImPJHliHVGsWvNeekLAfi0eN+TTMjxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514438; c=relaxed/simple;
	bh=bj2yFbRCokvPHJ735Zq2Wa9dqLZJc0I744ezRzG3Fmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UOR20BkJnWtGAQNi9f7tfjy63hfv3YfQU9vM635OZNJh1ZzfjaAORIynfAUB8FXJ/52brkrBKmj/DN9847sZRSjlyydg5bVHL8q4VhqSLZIAaX32SGprgUheVkK+1IBdCUrFPfLu97X+Wl7gfQqruXCcLduMcJQ/yYjA59JbTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AdOiSQQL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N6PtHH1m; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6A670140038A;
	Wed, 10 Sep 2025 10:27:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 10 Sep 2025 10:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757514435; x=1757600835; bh=Nb
	/OvLkybPe18o1QZdMGfvhfAQ6tntAGQQX5GgK2rko=; b=AdOiSQQLwDzxEyEnK8
	N9jvw8WEo5jPOR10/sdw2v4ouqOPHR+/u8x2IKJZlv041GlpDaytGNJWZbXZk1HE
	A14HGaniq2vD8tX+cVioYnCxQG/WdjaJp5wywg368whdqft8oar5bdPXWzkGtiL5
	bsjBdF1jkK4irDJteF8fxU6Apo1bq0DqG8N3Oy50c61nDrgdBvYZngFvxMaA0oDY
	lMmDmCOAyPqofXmfPJmcHtrMFaUrFRX6KTdb34K9smrkdUo9BcOn2eSLNeyw9m8e
	XQRgK0pUV+T6Vjl1r/cj4M7sjcWsxyjYuQcZC5451CtHtSg6JuWXxa/bhdBfmNuJ
	17/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757514435; x=1757600835; bh=Nb/OvLkybPe18o1QZdMGfvhfAQ6t
	ntAGQQX5GgK2rko=; b=N6PtHH1m08UJW+OWSO37i1XzptdYTa76qSXUXYSyBiqp
	zgQfedajRv5SUhZT1LSQbblpSVrbc0SQJX9LizpmctasnYDqTfgT472d774Uox43
	krDiRqZxDpcPbBnWCulArtA2evJ/LbQxOhpVHcQFn4qfAcklW3/5FOs6o5odlL7u
	epGZwUFeQEP/0VND/ky01XQaYzGnwNHY9rTQ1LIiTs5ioWVsNpnlpk9o8yaBE848
	OybL59T3k76PSNlhgcG5m+IU28L9Uh9Nq/f35aMJJxRWnGLTsSz93esE23QE7Uit
	j5lQDnUokolUzYTVUQa7094XN1YaDLOl9eZPREDMBw==
X-ME-Sender: <xms:w4rBaINAbWbRYbN1Mcb5-zxL3uv05wEvT9KMkB2Be_xLW9BHMCk45A>
    <xme:w4rBaPv4sz3q4mYAjcFgTD_9SbpTqOJN3MWnask99tpcVo81zifFAE8H5_KZgINJo
    BAAql7k1852k9LAVME>
X-ME-Received: <xmr:w4rBaLaj5rf-gLSOXMAE6ervHdP_Ex6pAvqCtFaLVyZ-PcwghB9MsWNHCpjz_F1Wj4nbDEvjNeP6NcbD1PZpI7VWJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhr
    ghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhope
    hgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvg
X-ME-Proxy: <xmx:w4rBaByvGVK1dO6ldW7gafT9-IKFjVNVlkyt_uktxVuygioW7cwclw>
    <xmx:w4rBaDi74LwIdLP6lrZET0PbSSCAzu8EaTiwpKP1oz6sXmG1-Fxtsw>
    <xmx:w4rBaNnix2aCrDZePXi-sp68ZqMz64EcqIoTPF__dBnlRA8kc0e9qQ>
    <xmx:w4rBaJj6pTWTHm7TWtbNXP-LwF7OUbsDVhr9IYscXv43aGEy2fmhvA>
    <xmx:w4rBaDyw7r_o1x7yNFmWIy7QmM8tsM3tJKDDCYmYI-id9QadqFhk9N_J>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Sep 2025 10:27:14 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] clocksource/drivers/sh_cmt: Improve clock event design
Date: Wed, 10 Sep 2025 16:26:55 +0200
Message-ID: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
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

This series tries to address an issue with the Renesas CMT driver
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

The work is tested on R-Car M3-N and R-Mobile A1.

See individual patches for change long.

Niklas Söderlund (2):
  clocksource/drivers/sh_cmt: Split start/stop of clock source and
    events
  clocksource/drivers/sh_cmt: Do not power down channels used for events

 drivers/clocksource/sh_cmt.c | 89 +++++++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 31 deletions(-)

-- 
2.51.0


