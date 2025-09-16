Return-Path: <linux-renesas-soc+bounces-21902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484BB59325
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A4387B3976
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6822F83AA;
	Tue, 16 Sep 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bBq71d6l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZFu787o9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94727702D;
	Tue, 16 Sep 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017812; cv=none; b=UjjlMGvrYitt9lVyD9y6YwBIdiRUrYK05OSJ+4sB2UcePrI/XNsb58OU4pw2HRYrvIxDw6Rf40lws4s8b1Dm/YuwPj1lpvp+Ph9MxLkeXF4CrorluUdARcI3cXGuMs497Wo+1hGXmSlYNSAC2ONBbfODSJlUynUq66rOt7Iz0iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017812; c=relaxed/simple;
	bh=C0ZWblkYFEwPlhz/BgAPn+BzsFIpT5YJP1wepEkt2Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q+RiJddMHnk2auESiTLTvd9W89mFSQ4Q2x+o4jKHZAK12DF0HOpXbtqm3cznYpsWJ6Tpi2Tjk7zENr3osGqszf0BpCszMALrhLjH9hYgUDeVoD5Iyah+9tUPChjxsNd07VYkL+iEEv1xh69tBg96ZQgcs/+EyLKM/Lzt41PpuKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bBq71d6l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZFu787o9; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 56F381D00146;
	Tue, 16 Sep 2025 06:16:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 16 Sep 2025 06:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1758017808; x=1758104208; bh=wl
	Kyp5KrKOjfpOspxvWidIC78o3iUxOJ5TCVXGPQsfU=; b=bBq71d6lojYbTJv7Jb
	8e2n7RncBXQgLJrsd3xEGHokqjxQBSH/9/S61E8atDicSM1CxEa89cY5c5vx8jj1
	ZfmGfP3OhDKr/rVSpMN7qvYYGiq5FCZaDKjVzinVa2n1WNL3piXinmUCOOwmG0Wo
	KU0C+3Zl5HSekyMvziz3T7Z/oioHk4iVDB0xuyF/KlW44/GhEEDrCkJWeWvBgJNp
	rajt/YrDNJut+pjCgzkf6C8ihs6XWMYylpBcY9E1EyYhnJGRDql7W4IG0UKl05T8
	aJjusySrP6rAf4CLfegk8zQ9K4oI1Qp5QcnTvCl3lI2mAAC2X8qR7GdFGCLK/haF
	GTcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1758017808; x=1758104208; bh=wlKyp5KrKOjfpOspxvWidIC78o3i
	UxOJ5TCVXGPQsfU=; b=ZFu787o95GDM5HkmExYed0naIC5nmhGtzSGkrX8mJld5
	dzXNhIxjBDyVCqV1y44ZT2mlYKejPwi4A6I24qvtGp99BiZAhyMJRJ+CMI/XIA8Y
	CajpBAAICtCrc9qdlitsQqX5zk5WJMEfOqcuuwOlaOB2yJhBTA1sgeOB7iQM8Ub2
	mqRj3xVdG4wtq+ygkMoVeeYalkzwHL9qEAPdAshHkUgsdfrHGgy6GbfTSHZ9K6Sy
	YFO7SHTS/X7k1R+KdyrhrqxESIdIw4U1ycEm0lxoseQ9NJcDAvgKm3gBBbovjYjw
	K/jfvu0PEFANK///huoaaCHsIkQmZnuza+hnPAp5nw==
X-ME-Sender: <xms:DznJaIM7oNJjejETrGVYpWeVVu95xUTcXGrhIq_JsB7_3EKt_u-xPA>
    <xme:DznJaJATX7Nfd5ia5wztp5WHacd6ATktcwJHGZ1mj1yNNCPjyEieroEJApdfpeFbs
    20HmpPvOm3V5E6myuc>
X-ME-Received: <xmr:DznJaEMAecGx-RFObcEAvxJv2Sizj7p6lZJ8hUHBCvElfj8fe6YgcsvBE7R8SBJ3lC89_8kIsv4dGcuKAd8Hp9Vzog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthho
    pegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmh
    esuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephihoshhhihhhihhr
    ohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohepghgvvg
    hrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdr
    uggrmhhmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:DznJaIcxc-jTjZLYgoF41AkWS4AGL81IEX27D_dIsCK7Y-eFu6PoFA>
    <xmx:DznJaN5Txc_osfKhUcuKrOaxaaGs7xGAGKP0dT59H9uScvSbCJOOAg>
    <xmx:DznJaCJ3fVxlS5k7IdCEKid6YV50IwqoBpE9vz0hY81kXXl7aSd_BQ>
    <xmx:DznJaPWMTJpqU4hCqy4Lb2A9DNivbPA7Q1DQcoaR60-s1dP4dV5G3g>
    <xmx:EDnJaIOooiZG9C1_Xkxynj1UMpG3u-w4q--WmnEoG2QMelFAK8Rjc4AV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 06:16:46 -0400 (EDT)
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
Subject: [net-next 0/6] net: renesas: Cleanup usage of gPTP flags
Date: Tue, 16 Sep 2025 12:10:49 +0200
Message-ID: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
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

Patch 1/6 is a drive by patch where RSWITCH specific define was added in 
the wrong header. Patch 2/6 removes a short-cut used in RTSN and RSWITCH 
that prevents extending Gen4 support to RAVB without fuss. While patch 
3/6 to 6/6 rework the Renesas drivers to use the common flags instead of 
driver specific ones.

There is no intentional behavior change and only a small rework in logic 
in the RAVB driver. Looking at patch 3/6, 4/6 and 6/6 one can clearly 
see how the code have been copied from RAVB to the later implementations 
in RTSN and RSWITCH.

Niklas Söderlund (6):
  net: rswitch: Move definition of S4 gPTP offset
  net: rcar_gen4_ptp: Move control fields to users
  net: rswitch: Use common defines for time stamping control
  net: rtsn: Use common defines for time stamping control
  net: rcar_gen4_ptp: Remove unused defines
  net: ravb: Use common defines for time stamping control

 drivers/net/ethernet/renesas/ravb.h          | 14 +----
 drivers/net/ethernet/renesas/ravb_main.c     | 62 +++++++++-----------
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 13 ----
 drivers/net/ethernet/renesas/rswitch.h       |  3 +
 drivers/net/ethernet/renesas/rswitch_main.c  | 41 ++++---------
 drivers/net/ethernet/renesas/rtsn.c          | 47 ++++-----------
 6 files changed, 59 insertions(+), 121 deletions(-)

-- 
2.51.0


