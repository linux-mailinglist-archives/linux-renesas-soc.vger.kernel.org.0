Return-Path: <linux-renesas-soc+bounces-8811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D444796F598
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 586DC1F25354
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 13:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D871CEAC9;
	Fri,  6 Sep 2024 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lCxbcrb/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fEUDkDdV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD781A2C39;
	Fri,  6 Sep 2024 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630035; cv=none; b=NRbviiynYAXdDaS/3mSAJFHKzg/w6bnFOiKXbFz8Nw2X7TMJFEwhwlATSThGfGNnYQchUyr3fRL8xElela/oHPfQeAFMkGV2NSYZQxq31CbebC/QaPMYr+BAK6bsxVCe8Pzm4QLGJYwhU+KcrSTgcpybWRym1Xv0YiGQ86Ge1sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630035; c=relaxed/simple;
	bh=xxdUBQQrPns9zFiQUqEnys3sv8D09KD91ngH9un1ZnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MBUpIwMd328PmT/Bgdzoh3g6DC0blAeOQVf94xIHPxTe1ESNmsKtHM1lyYFcTeMSFgkOmUPm8/SlPI+Ezl6c3+1qVhcZuujzXCTA3l4Chm1U7NICW8OEVVxLWkROI3u59MzzSLBrXRED0DriEXCZEB2H7pmr23GCWZ3ay06WPd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lCxbcrb/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fEUDkDdV; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AEB32114020B;
	Fri,  6 Sep 2024 09:40:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 06 Sep 2024 09:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1725630029; x=1725716429; bh=zh
	mf1O6PhbKzp2qB6+u2nKIIQyNQ3nWUfMw+xvpo0r8=; b=lCxbcrb/y+n3qqZMxc
	uzCA5Hzo3ryIxjy9r+opEM2l3tIHGQlb6rGo1t2a8OL3BZLE5IgTYk7EgHsIVdHX
	QiJVD89Y+l2BcaQUjN7h0f0Gj4YsVaOiRvwPT2KNjtpP6p3W37BX9hAwSn38VXhl
	Vx0pEIm6zCUTEIm0+8EWS+QlaNLT8gWBdx6PvYGfB3vQfycaL0ybjan4dQZj65FG
	c5cIkc8J6+CNpnDWLNCFgyi54pFGEFrsi4tcC6DFXCyfnBWsK5WDXoecNHkdnWOD
	g59JIeIEUJWEVaS0YnYHReWNdOMU4xoqQQeDY04N989XM0zjAFA5uKbMTLb0Hk7F
	LHVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725630029; x=1725716429; bh=zhmf1O6PhbKzp
	2qB6+u2nKIIQyNQ3nWUfMw+xvpo0r8=; b=fEUDkDdVOZuB+bJfjqMpcFj5e1DYQ
	EcevBJi34bLQdIH3WkX+tXOLyG2Uo09wbeuDbn7z9zkjP2f1i0U610y6uWMawFqL
	io7LMsIeg2ny0y0W+o4QTcGcidmQNHysqQ4cwgpa81SEQxfMRjh76+UAKsvfFgP5
	odXTJj7ko71c9oe+Z8/bcEfseoU9gPNJBeVrrcjb0qhNJdIalrt0rPL6fmDptjTb
	7qslCuo7CjaxVdFLDYdS1iSNTEGH/UuwabQqngeg+SfHr/X6Z1YS15OgUz0mI+6S
	A82+Gnr1gzKDNj4sj7GqEgKYMLH54wPcDEmkxbK2oNqnOaiKQgPiRaioA==
X-ME-Sender: <xms:TQbbZoSCUT8kS1OF4--r4wE4cBHc71H5igMu7A1LHH9_mz3es-S9cg>
    <xme:TQbbZlxGnUIegEL_hfLTCXc3O0Z_PB-rk1RGiUTaJwhDjYkhKyMPR3sQT03-ADywR
    WMjgx4cp5DHDKrs5Aw>
X-ME-Received: <xmr:TQbbZl31XUaiwib50LLOzIL4Nm4flORcTPQkhxxUuChsLviTREd9GWU-NlsrKMdPXDjMhWSWIQnAmhInDEjdORKiSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeetkeduveekteekveetvdejgedvueduvdfgieehkeehvdehveelieetgfevtdejgf
    enucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrg
    hgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlh
    hlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhi
    nhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnh
    gvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthht
    ohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvug
    hhrghtrdgtohhmpdhrtghpthhtohepvghitghhvghsthesghhmrghilhdrtghomhdprhgt
    phhtthhopeguihhmrgdrfhgvughrrghusehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:TQbbZsByEn2xAcy6D6O4wp9wmWiTWbPShodgSWHc6tOgWYphB6eJ6g>
    <xmx:TQbbZhggN1nVrsJ87UPScQv2LRuBQx0ALpubHrP70PB9qynGSPd6sQ>
    <xmx:TQbbZorWVGoYAy6RsK_1--NBvNMjx16_uVh_DIrta1mjtHcYtB2_Yw>
    <xmx:TQbbZkjmtGSyLaxQEI4c7rbJbu_gysx52chUgE9vLMex-oP53wLcwg>
    <xmx:TQbbZkROLYtEhxD5sJGwg3i632dLLjMzPjJgQM85omUTDDctfSYE9bFJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 09:40:28 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/3] net: phy: marvell-88q2xxx: Enable auto negotiation for mv88q2110
Date: Fri,  6 Sep 2024 15:39:48 +0200
Message-ID: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series enables auto negotiation for the mv88q2110 device.  
Previously this feature have been disabled for mv88q2110, while enabled 
for other devices supported by this driver.

The initial driver implementation states this is due to the 
configuration sequence provided by the vendor did not work. By comparing 
the initialization sequence of other devices this driver supports and 
the out-of-tree PHY driver for mv88q2110 found in the Renesas BSP [1] I 
was able to figure out a working configuration.

As I have no access to the datasheets of either of these devices it 
would be super if someone who has could sanity check the initialization 
sequence.

With this series I'm able to auto negotiate both 1000Mbps and 100Mbps 
links without issue.

    # ethtool eth0
    Settings for eth0:
            Supported ports: [  ]
            Supported link modes:   100baseT1/Full
                                    1000baseT1/Full
            Supported pause frame use: Symmetric Receive-only
            Supports auto-negotiation: Yes
            Supported FEC modes: Not reported
            Advertised link modes:  100baseT1/Full
                                    1000baseT1/Full
            Advertised pause frame use: No
            Advertised auto-negotiation: Yes
            Advertised FEC modes: Not reported
            Link partner advertised link modes:  100baseT1/Full
                                                 1000baseT1/Full
            Link partner advertised pause frame use: No
            Link partner advertised auto-negotiation: Yes
            Link partner advertised FEC modes: Not reported
            Speed: 1000Mb/s
            Duplex: Full
            Auto-negotiation: on
            master-slave cfg: preferred master
            master-slave status: slave
            Port: Twisted Pair
            PHYAD: 0
            Transceiver: external
            MDI-X: Unknown
            Link detected: yes
            SQI: 15/15

And the performance is good too. Without this change I was not able to 
manually configure a 1000Mbps link, only 100Mbps ones. So this gives a 
huge performance boost for my use-case.

    [  5] local 10.1.0.2 port 5201 connected to 10.1.0.1 port 38346
    [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
    [  5]   0.00-1.00   sec  96.8 MBytes   812 Mbits/sec    0    469 KBytes
    [  5]   1.00-2.00   sec  94.3 MBytes   791 Mbits/sec    0    469 KBytes
    [  5]   2.00-3.00   sec  96.1 MBytes   806 Mbits/sec    0    469 KBytes
    [  5]   3.00-4.00   sec  98.3 MBytes   825 Mbits/sec    0    469 KBytes
    [  5]   4.00-5.00   sec  98.4 MBytes   825 Mbits/sec    0    469 KBytes
    [  5]   5.00-6.00   sec  98.4 MBytes   826 Mbits/sec    0    469 KBytes
    [  5]   6.00-7.00   sec  98.9 MBytes   830 Mbits/sec    0    469 KBytes
    [  5]   7.00-8.00   sec  91.7 MBytes   769 Mbits/sec    0    469 KBytes
    [  5]   8.00-9.00   sec  99.4 MBytes   834 Mbits/sec    0    747 KBytes
    [  5]   9.00-10.00  sec   101 MBytes   851 Mbits/sec    0    747 KBytes

Patch 1/3 and 2/3 are preparation patches that align and move functions 
around as the mv88q2110 code paths can now reuses much of what is done 
for mv88q2220. While patch 3/3 adds the new initialization sequence and 
removes the auto negotiation limit for mv88q2110.

1.  https://github.com/renesas-rcar/linux-bsp/commit/2a1f07d0e722a18188cfe62842b61f2fbc0ba812

Niklas Söderlund (3):
  net: phy: marvell-88q2xxx: Align soft reset for mv88q2110 and
    mv88q2220
  net: phy: marvell-88q2xxx: Make register writer function generic
  net: phy: marvell-88q2xxx: Enable auto negotiation for mv88q2110

 drivers/net/phy/marvell-88q2xxx.c | 124 +++++++++++++++++-------------
 1 file changed, 71 insertions(+), 53 deletions(-)

-- 
2.46.0


