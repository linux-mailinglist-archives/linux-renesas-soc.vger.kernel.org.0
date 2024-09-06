Return-Path: <linux-renesas-soc+bounces-8807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5496EFE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 11:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 978731F243C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2CD1CBEAC;
	Fri,  6 Sep 2024 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VHDT9Qdy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xu7hD7dm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C41CBE8E;
	Fri,  6 Sep 2024 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615658; cv=none; b=pDzN+hl7uJ8KyvKgIok1GzjzdFB3SnS1VYv4Q6nDIfNYpT/KNfq2SndZQJB7szXrWpYDdyszt6tSYK319VOGQgROtQ25BjlTU3eCi1b7RxyaAAQNmux+hjmWcz53hveniwPPGrJwzUUyquVdXTY2D7eV/qjpxQXKCbU4yQhP50w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615658; c=relaxed/simple;
	bh=bbwj6CDjD67KTml2nsZKiirHbKdrdnCliMqLdtXd5TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FoY18zK6imHFoV7LKjyOomuW1/C1CsjkninUxtAXiHICJ8U5fmsBKMcmPNS2Ns1DqbawOZDZQHNt/yDer0NKF5RseOd6RjhXeq/C4wrxs6fCKal6pIjbDzF8WM8G6aI/zHDuTndpiQyxvNbfnr2c8HpnRa60PeADejK6ciyh7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VHDT9Qdy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xu7hD7dm; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 73F871380405;
	Fri,  6 Sep 2024 05:40:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 06 Sep 2024 05:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1725615653; x=1725702053; bh=OO
	MKVNy0B22j03Xgg33UJvIiiIzkklxLiD49wmo2U6k=; b=VHDT9Qdyp2WImy8NIB
	hqXHaz5J2xpu2ke2qfLqoOdmVqpm0o6PJ73ki/WIRjKMKTgtk8N4egbK2i5Q8sHT
	yiOpHkF28VPU9d0yjLKgzz281mUI26c/QDAA21TnMW6HNoyNi8ugBEFnd9bIhHRG
	1J6TinYnpWxhZm2QZne5rNRWCBO2XEqMXn+FE32LjIjrCwIEfDuhb1EKatH3J/eL
	aiq04ZaA0GL/2m/XSvLpnhvLyFaK/50AEFjMiOPy1+kbNUEnbKUsaOyAyTR62Xvh
	W/MHtwHTo10Nz07Le8eamH0senlWzCHiyNCF816QtJk6S5YXUmgcamAwPARzkUNO
	mZ/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725615653; x=1725702053; bh=OOMKVNy0B22j0
	3Xgg33UJvIiiIzkklxLiD49wmo2U6k=; b=Xu7hD7dmuJ0Bzs3G1+sxqYf34ZfWl
	eWHf3VlVbGsXu/06AHasEFelYFJ2vXsNb2duIf1zkiUDlrCmfaP8GcLKt1qJ6KN6
	4/25ewjkt9xCXvKm7RBa6TvvRBIsGeNHx1TbmptAfEymlYqg8TQClhILbuK/s/WC
	bQ049RajUIrtVxd4oyufiRqZGzjOaSB37pEZh0BNNYbmhQ0IEQ7oniUIS5cw5N3C
	S8ZMj3PcOKTloVHSCt6hTj7tslqvAvk9gSyYi/kfvkI7ZQn+W5pB+SfLeG7zzYjm
	zTdEReHGZ/nFxvm25K3vhZHDzLT2eXnJU+CTnia/IKhYrKw5kXIQmzD9w==
X-ME-Sender: <xms:JM7aZkP_0Ztu0bSnAeNwawXm1vBGW1f8tnvFM77q7ApnKTDOUht_eQ>
    <xme:JM7aZq_9ebdiaaaXiwVuEo6G8_HQowIVHtk2oCbzbtgZLk0g_WOfDnEGY6uJCYou5
    SVJji9yvg7z7UQTbVc>
X-ME-Received: <xmr:JM7aZrSVkE_XvaENBUlbWKRLBvJBLBnW-MfnWrdtFAQk6F7K4LUKYMGX1szYlwAwBUNGtqA-BZQ_e2VMJfxk7B2OSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifsehluhhn
    nhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtg
    hpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegu
    rghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtse
    hgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshh
    hihhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthho
    pehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JM7aZsvh4iWcYqOHU0Yb-5vwsPK98UZny0Xd2ajvnQEZgtUMTqhJKg>
    <xmx:JM7aZsdJ3mWG0JsLQymxa_ZK3zuLxIDHmNptBfMh1BfdiyINi-oEHA>
    <xmx:JM7aZg3QSCwB9EcE7btVz3UQ3f1HyMQ76NBNaTubZWXh6my1K24Zsw>
    <xmx:JM7aZg_VhcrBwe0r9WkVVEPTRBoK4sDqjWTpzG4S2Ca5R_ESX-dNzA>
    <xmx:Jc7aZg0AlzREvZcjnCBYKc4obvv_-IXxsxRM3z4E9Re6-gR9n7b_1EFL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 05:40:52 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/2] net: phy: Fallback to C22 for PHY register read/write
Date: Fri,  6 Sep 2024 11:39:53 +0200
Message-ID: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
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

This series extends the behavior of the SIOCGMIIREG and SIOCSMIIREG 
IOCTLs to use the convenience functions mmd_phy_read() and 
mmd_phy_write() for C45 access. This brings the benefit of the core 
falling back to indirect C22 access of the underlying driver do not 
itself provide C45 read/write capability.

Patch 1/2 exposes the read/write functions making them available to the 
IOCTL callback. While patch 2/2 changes the IOCTL callback to make use 
of them.

Without this change using tools like phytool to read/write registers on 
a C45 only PHY using a C22 only driver fails as the IOCTL callback don't 
know how to talk C45 on the mdio bus.

Niklas Söderlund (2):
  net: phy: Expose the direct mdiobus access functions
  net: phy: Fallback to C22 access if needed in phy_mii_ioctl()

 drivers/net/phy/phy-core.c | 10 ++++++----
 drivers/net/phy/phy.c      | 18 ++++++++++++------
 include/linux/phy.h        | 12 ++++++++++++
 3 files changed, 30 insertions(+), 10 deletions(-)

-- 
2.46.0


