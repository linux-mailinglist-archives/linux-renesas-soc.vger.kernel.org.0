Return-Path: <linux-renesas-soc+bounces-24104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF2C333A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ADD8464CF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7073D2D061F;
	Tue,  4 Nov 2025 22:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="B9Zvnfbq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="px2ksz+a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5827C190664;
	Tue,  4 Nov 2025 22:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295087; cv=none; b=UY0sSaKg1f5DYTeWj4IROORh05o1Usdbvb69GrdCdnKcaZGmqYeXTHF3xS7289XGyUOVkTegufwU4KTVC1iBYZSnQL9g8f7X7aStOrGn56pr6GCKiYdk5fMV37hW7ijenbwSRjHjCg7A0ZmKVM4+TBEUMdtXylFtrz3msf69ycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295087; c=relaxed/simple;
	bh=S6UuworAIPunfMclW67VOJ19CZRIpUYvgnDjO6qyOP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MCK6Ok3DwwfAkqqitkaJMAefudOhr7/VYTpjqrlt8rU93/7pgAQViZCc4mUSdZDocuj1CFycrjvZymz1aKTy2kL+h7yHJvpq7FVYqo21CkjSTvhz7CAX4Z43qVkMOo/3Ui1UX/gSKay/CnUUY8uAJh7JbX++rSifCoe/CXIAA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=B9Zvnfbq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=px2ksz+a; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 64C711400037;
	Tue,  4 Nov 2025 17:24:44 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 04 Nov 2025 17:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1762295084; x=1762381484; bh=N7
	do0JRSvt1zk2WIy/vOE2Yo4qpnqX0/sCS3fJVxF8A=; b=B9ZvnfbqfhbWoEWB0M
	oY+faqVO/9OMgCZS8TFu9Acreuwlr2MfarmbWdLDYkZCthb6MeUBMbjsU/dXRUFc
	VQiVLV/JN9gA9AsfwjRKveOFCWAw0ydJBTsMavA6o3qjwFXcCCzO33aWKRv5CjtI
	Pms3I1xBlx9BLLSvCj4+10xbWvvXdqewiriUenCY3BEcybktTDds+Y6HO7PpS6O7
	siSc9S9LAJ7Zk8yuBNuCOK8gNGn0JSJjvVTT9FQJ0B6JuH3jS4lSEiMs3bFFzFnC
	LVWCP/z0yQhbR68z+yJeVUJ9HZbWdVZ5ImbdfVwGWlXyVY+7gEr8QqkVnVlywsF6
	/GKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762295084; x=1762381484; bh=N7do0JRSvt1zk2WIy/vOE2Yo4qpn
	qX0/sCS3fJVxF8A=; b=px2ksz+asgrBuUeWZrFaEcDCY9yoTwWr2z1Oqaqk7dEM
	PSFpodLsjSp0lROdTs4d1ggxTA86tEx9tNsp89AxZ+SfepKzG1aT7tM84EamqiGz
	LQTajUby6E4OCcM/kIUj6VTuLoevFy4kNQB3HZ2RcghL4My2RMt57X8qr/5koJZI
	To+QkYoPKY1n3alIVgXk1we9d0fevv3LbVM+rbGOx8o/BJwxupAkdw5jtTX4ljXW
	5+V9OBKXNNYVpq3aqYs3HKsG13Jnyw56Q9O++Pbxp8EsObx7yVgfguoHYiVwS0lR
	wrjpVilDlLbN0mpSYpdoQ7BX67GVdZLw0nWoj5BkJw==
X-ME-Sender: <xms:K30Kaa9JvqnwuMSnZCyEKvCTWm4tInUTihM7wV3z5YzbW1A6D03JGQ>
    <xme:K30KaRM5-lDoAbT4wfrTf1Q16CTCVc-3cfHgAJopOM7LPBPRDU_ThozxKsMOxrVxg
    Rlax4Hk993l__rkqqj5MAXYOsOE1TyIsGl8LA8fPYm6qSf5nDkJS8s>
X-ME-Received: <xmr:K30KaeBpP_qq0aQnOq0KsqE-4pljPxGohDscwA1tWipxY5y5GG2t_MsCDIjhzgo-iFbuIuOldNlxTgcK75nrdZYn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthht
    oheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvg
    hmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshhhihhhi
    rhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhs
    rdgurghmmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:K30KaVOgSW5UH7ri6potxa32EDVr1yJd1drblfg7oZKQm6YzDy8BgA>
    <xmx:K30KaVe41Vv1OcRAppyhzf9dweGNY_SE2bSETmfVkzPPQQnlvILGAA>
    <xmx:K30KaW6alx3yMGU-6hBLf5_7uSi2vDLuX5zj74YBQazIGV4HaCt8Kw>
    <xmx:K30KaXLiKleASPVevJjgWs5rM2uMl10MOFcXTs2krSvtIKgS33mmjQ>
    <xmx:LH0KacmUbMtE6hm6vSlyGyUSZaRDRqWzil_r7IrLvA4f_A3MGG4wASml>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:42 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2 0/7] net: renesas: Cleanup usage of gPTP flags
Date: Tue,  4 Nov 2025 23:24:13 +0100
Message-ID: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series aim is to prepare for future work that will enable the use
of gPTP on R-Car RAVB on Gen4. Currently RAVB have a dedicated gPTP
implementation supported on Gen2 and Gen3 (ravb_ptp.c). For Gen4 a new
implementation that is already upstream (rcar_gen4_ptp.c) and used by
other Gen4 devices such as RTSN and RSWITCH is needed.

Unfortunately the design of the Gen2/Gen3 RAVB driver where driver
specific flags to control gPTP behavior have been mimicked in RTSN and
RSWITCH. This was OK as there was no overlap between the two gPTP
implementations. Now that RAVB needs to be able to use both having to
translate between driver specific flags and common net code flags
becomes even more cumbersome as there are two sets of driver specific
flags to pick from.

This series cleans this up for all Renesas drivers using gPTP by
removing all driver specific flags and using the common flags directly.
This simplifies drivers while at the same time prepare RAVB to be
extended with Gen4 support.

Patch 1/7 is a drive by patch where RSWITCH specific define was added in
the wrong header. Patch 2/7 removes a short-cut used in RTSN and RSWITCH
that prevents extending Gen4 support to RAVB without fuss. While patch
3/7 to 7/7 rework the Renesas drivers to use the common flags instead of
driver specific ones.

There is no intentional behavior change and only a small rework in logic
in the RAVB driver. Looking at patch 3/7, 4/7 and 7/7 one can clearly
see how the code have been copied from RAVB to the later implementations
in RTSN and RSWITCH.

The delay between v1 and v2 of this series is due to lots of nice work 
by Vadim Fedorenko converting lots of drivers to the ndo_hwtstamp API, 
including these ones and I did not want to cause conflicts with that 
work. This series have been rebased on-top of that work that is now in 
net-next.

Niklas Söderlund (7):
  net: rswitch: Move definition of S4 gPTP offset
  net: rcar_gen4_ptp: Move control fields to users
  net: rswitch: Use common defines for time stamping control
  net: rtsn: Use common defines for time stamping control
  net: rcar_gen4_ptp: Remove unused defines
  net: ravb: Break out Rx hardware timestamping
  net: ravb: Use common defines for time stamping control

 drivers/net/ethernet/renesas/ravb.h          | 14 +---
 drivers/net/ethernet/renesas/ravb_main.c     | 67 ++++++++++----------
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 13 ----
 drivers/net/ethernet/renesas/rswitch.h       |  3 +
 drivers/net/ethernet/renesas/rswitch_main.c  | 43 ++++---------
 drivers/net/ethernet/renesas/rtsn.c          | 47 ++++----------
 6 files changed, 64 insertions(+), 123 deletions(-)

-- 
2.51.1


