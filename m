Return-Path: <linux-renesas-soc+bounces-9487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA277991667
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 13:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E3B4283617
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 11:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B71149011;
	Sat,  5 Oct 2024 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DwdNINtL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gOvYDMWr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB294F9FE;
	Sat,  5 Oct 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728127502; cv=none; b=b4vvT3eTuDki5470MCNYwvMPUN8Q5W+6WvdrRKSIRSyn9G2ykx3sLqSG65hwMew8lWcHkb+Npy0FBfU99K8PlGQW7a881mW9ITUIDM5MShIMK8xW7b8CG5BAdDd8oYApaW7pid55p33EvOLTkbSRRtPg2J4LT3fTRf/RXTFP/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728127502; c=relaxed/simple;
	bh=5fkbxDFdZ1RnwS675sva01h3A4hhNeqR7dB8HjXX92o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C1PjZuSdw2qU8odmZpTehd+tybd+KIgzBZ84ycDoNlw10cXvAWMHAMD6FgOKnpa5hAxb+1LzEorsFgEwE/qvTTWmXLodfdmjWLvlaQ9uXGduafg5HDAHSwIApjTjOKEBsjHNilu0ynwhpXx/Ku88QOh+VYPColNEY2nHYwktZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DwdNINtL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gOvYDMWr; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id C649013807F7;
	Sat,  5 Oct 2024 07:24:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 05 Oct 2024 07:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1728127497; x=1728213897; bh=Gm
	j3KQJR9DSqhv7YH3H3wm30YLk2kEIGVqjHzYRL7DQ=; b=DwdNINtLTzB9zl1NZt
	gKZb0HmnPKj1bSQ5yqGYGLhoWvgAXN2ZSfepGMKNnY/TReXA7zp66c96eUysrpJ7
	lfqHb/K6rP7oTu5IxwYmrABpFxIj326pIPK0SEbv2AaYwZQiiNgmWabmqq9WsAG8
	/+kpZ168/JA2hXzbhsxF5n2XFQTJLLXk9NiHA8vw3yYN685axgQSAfknqQCGWzu6
	OccU621Kww9uzh+ToTVb4z9/Ce2LpzXobFX184iNd+MX18WfDi0ssUjO9+qAKE5c
	Cf1kkiN5qkMUuyJPf9FOshpZdCg72uVuGkH2OTYtOZUKfNPFAGc/IE6UNkHUCIVn
	4pOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728127497; x=1728213897; bh=Gmj3KQJR9DSqh
	v7YH3H3wm30YLk2kEIGVqjHzYRL7DQ=; b=gOvYDMWrlIuesuiQ/1t1NtA+oQok+
	M5Wmv7ZSNMPpGKr3rtI/ZAflV9iWumhE8aM4LdDnATDTMpQnF77Y1swOPnLhDG1e
	5TFCfSA03YKI6+NGDuWfLXp5u5QeetyEb/hZHJfhDG9IzfIvpHSPA4qrG05G/Kov
	UE4/AhC5Apv8AFNW1DzSQMCa/xXUo4kQzGdIOc7ScaRNAW6EgTDf4jBzIK5z9868
	hIHL5/Oor5iSp19pYbDrrg7eSutgImnb5tMKprFiWIeT9naXb2CH0QRq4hD1tiHg
	Xt0a5N93HcNxoBf5Feuw27rqks26+PbVfl9T/hQ5ZBcUJfoIA8Nr86hxQ==
X-ME-Sender: <xms:CSIBZ6G4AidKtasmwO63F_vD2PuZVKTiViUtLL-Icu94_6e_Zbzfqg>
    <xme:CSIBZ7Veayj1ZpJxfLR83A1ZootmB4EPv5YGDgNa8EzG1dsBT4x1BqQT_AqlHCemG
    8RN_-vkiMooqg0bIeM>
X-ME-Received: <xmr:CSIBZ0JJCulfYTYc3zS9Hkv40jg-ITXIwlaXGBIsTq0u85TXPWZoHyTcttiXgl3KqpB8Qxb3scfxMgeLqG6oGjcBvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvhedggedtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:CSIBZ0Hp7YAR8lcFb_rzhSp1RWT6ZjxrRwDG5yhr0YcHXlMnv8DFTQ>
    <xmx:CSIBZwV7DEeHV6upffe_dW_DvkCMVg4JGOjaQmwbVDe3d4ptpnpUXQ>
    <xmx:CSIBZ3N7WbaQehYWdZzN90WDP0dOWrIWA09uMeJESCrOPPlDUs-AFw>
    <xmx:CSIBZ31zpAPt7b5oAce8FW58aP-7aQ9rYYmqTRh1THE7OKnF2hr_3g>
    <xmx:CSIBZxWSRDj56qFXcsY5vd95bJJIP7vQNERWW6P_cjtCpZ1OjFsH5mzK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Oct 2024 07:24:56 -0400 (EDT)
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
Subject: [net-next,v2 0/3] net: phy: marvell-88q2xxx: Enable auto negotiation for mv88q2110
Date: Sat,  5 Oct 2024 13:24:09 +0200
Message-ID: <20241005112412.544360-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
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
2.46.2


