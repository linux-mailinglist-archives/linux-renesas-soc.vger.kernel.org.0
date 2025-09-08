Return-Path: <linux-renesas-soc+bounces-21580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72043B49431
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 17:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EEF54C2886
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 15:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D703A31158F;
	Mon,  8 Sep 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bdF74zlp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GKiTFO23"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324930EF99;
	Mon,  8 Sep 2025 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346294; cv=none; b=Lj2akixIeQGoxG6LmWQxjeBYhZ+ry0ZRawJoYmkOJYG97KK8dGYKodGUqbm52/dfo05ohRLa5e1AF6rsInBMTVsm8wAIB4JUNNqJ69t0PsozdEMg2XgPwBw7iP3s5d67quMFOIDzAHPpVmRNHrfcg8MHl28scNUA29rD2Iqondc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346294; c=relaxed/simple;
	bh=CBb4N00/8fKeWr7PAv+IbtmTlM91IijtzIOlnRqQGxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pu7EnKIk+iKXbSxsRD5tlATlNcRtkXE5sUJlM7cO+2WTLlJBHjjkp8jVbfDIRK3nT8N5exnsum54gNUxIc7a5/+fPY9/rmiTgcaOJMKBIHEz27qorHyzvLmjUgh0Dv81TeojqWzqgJuIY//tDPZHwUODRTu205cfUiaX+F3CLWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bdF74zlp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GKiTFO23; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 4B76A1D00075;
	Mon,  8 Sep 2025 11:44:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 08 Sep 2025 11:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757346291; x=1757432691; bh=2o
	nnzAEtpf+DmvogfHNvOOZZgYbnwdJj+LIkOOafgXI=; b=bdF74zlpALJDQrOrFq
	v3Sy0l/n+Y7BHvQ3nFNzrqNClCAktfI2RCkVgQ1TDEEgwe0nmnHwqiidNKA2u+D0
	uiGFMT8NxI713wAvVsq76Oiz+Qfs5MoAA22ZKz5amrj+yGB38TU91yZm4SorIdKU
	+5dqDrByO756np8DOmPEBKiz6f5wJRSpcEst9cDVHUnocVvM7+R+p35PBpmizNNv
	aKHXn6CRJpxrJ5m0AwcdiWmHYBbXdvu4xMwQEMimq31joXMKaKojtUmsEWDTJmJW
	aBYLJ/l1rYvl/tpUSvoonYagDR0KCVd++W6A0RMANELJPoSa9KcBGk/F4PwQ3y3S
	dJYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757346291; x=1757432691; bh=2onnzAEtpf+DmvogfHNvOOZZgYbn
	wdJj+LIkOOafgXI=; b=GKiTFO23tly6vy2RSYopQLJAQQPluvCdLdZNLrQVUk3J
	x2Zhgs3ftGWEBnZ5+vZRu4U569WqYa54SWvDNVKfj6H/mxNs/2NRKCKlTqKK/SUY
	r9mgeYr0Mi8/sKJpqigDUqijsW+2yjkpoqzUjtGj1A98CVX9SZFbboSBW5cAoDQG
	BWnibZk6he/PdDFyXsmudAdJ5BRgSkdkdLnbP5Loj+b2dBu0kZMEK0cNo/gDQ2zc
	hrQu625pzEr6CdcA6gUOBqKS4ci32oKmnFBLqnKc2LG8QN8VeINVynLtIU7LF7Pf
	5hWVgd4+i+tjCAN2OgyM2wR5C4b3FZMEYHiTPubfHQ==
X-ME-Sender: <xms:8vm-aBsFSds16A4dgAglD7K5O8FMKpr4L88JKifmfDFVAne1fiVO8g>
    <xme:8vm-aH1Gr3M0x_o0NW91NU4IY9PcWhtMzYFKfP-4Iq69V2CTOBoW8WlJCWoHt_Hri
    k0FgGiESL6bozf7Sos>
X-ME-Received: <xmr:8vm-aMHIM_WBPZZeMRDXlhybQso6hXxO0QTwn7_ulAhCFzoPWMxVNeZ0o26jb5OUJyWe6QGHcLAMF7qdkctIDFWm7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopeihohhshhhihhhirhhordhshhhimhhouggrrdhuhhesrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnh
    drtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphht
    thhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
    pdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8vm-aCtJFvGEIGallmxQaD_fPgI87WOGmwpqpyIMM8rkDuF5uMwuSg>
    <xmx:8vm-aPrZTyw7eBpA-BreKuZnoGHxPE6ASeyG2dqpKOJi9RcRKKRq0A>
    <xmx:8vm-aJUtyeMMHaSjxR5k-7n45FfSzlqVN5VFJFQEAQOhYGikIw5PNQ>
    <xmx:8vm-aH3McFlKu0qSWXIdadUI_uVN1erN3VT8KHmXwZKCIdHGNo7l4w>
    <xmx:8_m-aL87HkHXLMJfhnrFlkOVvkJ7_9SIr4_5Deq7FbJ-OCMqcRUrsBe0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 11:44:49 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] net: ethernet: renesas: rcar_gen4_ptp: Simplify register layout
Date: Mon,  8 Sep 2025 17:44:23 +0200
Message-ID: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
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

The daughter driver rcar_gen4_ptp used by both rswitch and rtsn where 
upstreamed with support for possible different memory layouts on 
different users. With all Gen4 boards upstream no such setup is 
documented.

There are other issues related to how the rcar_gen4_ptp driver is shared 
between multiple useres that needs to be cleaned up. But that will be a 
larger work. So before that get some simple fixes done.

Patch 1/3 and 2/3 removes the support to allow different register 
layouts on different SoCs by looking up offsets at runtime with a much 
simpler interface. The new interface computes the offsets at compile 
time.

While patch 3/3 is a drive-by patch taking a spurs comment and making a 
lockdep check of it.

There is no intentional functional change in this series just cleaning 
up in preparation of larger works to follow.

Niklas Söderlund (3):
  net: ethernet: renesas: rcar_gen4_ptp: Remove different memory layout
  net: ethernet: renesas: rcar_gen4_ptp: Hide register layout
  net: ethernet: renesas: rcar_gen4_ptp: Use lockdep to verify internal
    usage

 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 76 ++++++++------------
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 33 +--------
 drivers/net/ethernet/renesas/rswitch_main.c  |  3 +-
 drivers/net/ethernet/renesas/rtsn.c          |  3 +-
 4 files changed, 32 insertions(+), 83 deletions(-)

-- 
2.51.0


