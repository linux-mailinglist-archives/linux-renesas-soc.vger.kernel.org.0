Return-Path: <linux-renesas-soc+bounces-8667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE04696A53D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 19:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96B82284E1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 17:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07AC188910;
	Tue,  3 Sep 2024 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QPMzELJD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UiddwpuA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pfout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2799E18BC05;
	Tue,  3 Sep 2024 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383794; cv=none; b=DqFedFtRQfDk5uRUDOaHmNP84NDN7X4NojWtDNduLybNWOwOLgfN6Rzi6kx8i1x5ETZSAYffSu662cHwLPWFMj4jq84lULWXk1R1Z+UNhxnxv53ePXV/cE417NJ5Sj5hU57XLc9PK2ATvDcNRBxRTkwY4gWgIrUFkok9p2mdwq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383794; c=relaxed/simple;
	bh=yqz4auR2r2nOIK9l3JvtHCUhXTTdVukOaNSbBKtxgbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l6g3oJyBAMe7febzXTPw7lmdEIw5+qtGvBbpHGL1iVKR8f8rHvQxSCBtACpYzqOgeLuWCjZyFrmW/gmgc6cc3MXrRdbFHsFsY50up9ZkrKyahvdWKi/xMuKKkNSBQM9qvoLZuDrhH7FbfsrnNel1cW6EQ/TEV19y5ETYS2Z0nmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QPMzELJD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UiddwpuA; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 950FB13803C4;
	Tue,  3 Sep 2024 13:16:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 03 Sep 2024 13:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1725383789; x=1725470189; bh=q8
	I1edYloIEgRwqv0J0DQGpvJdW9FEiNQ8f3Ow1OKlo=; b=QPMzELJDHyeRpXX05N
	vFYnr+RaH2QiFlun6xmSvsNJU+2lgrsFT7t7Tpq46Uz/kQB1pwLIgKQcD91JL2A2
	rk7MIhuiGL2mMdTVqD3/P6z6w3P6aFLozDaqPKFgKxJ/V6nRythZBX3mE0PeuuM2
	7wdv9LQS3+HEWJNqpUe0MBupaWqUXZP2pZopC+zcJRR3Q0xj2McPGRDKuqlttlL+
	jy8p17e6hQa8AA7R8Zpg9SzwupfVh7KsuH+o6t5Fiqqib9NwkN4ERz/RgGIdMv5k
	ScFk4euAsGS+jJORs+5lFNNV6EstQj0iPYRlnqsiNVxG4KiqS63CF5ST0badfQhf
	bVRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725383789; x=1725470189; bh=q8I1edYloIEgR
	wqv0J0DQGpvJdW9FEiNQ8f3Ow1OKlo=; b=UiddwpuAOz6X0b7eFGC9w/ld+pjTq
	r8SYDju6apWdcHMrEJTnecKlt1bjJkSuJA3FYj8jnHOKlbWoFwHMh7oN7ATnID8c
	4jTrA4lyFgOmMZPwYjUn67JOtyhFNqn/POUnGe5MkgrwnfmqPcMM4irLpqSj6gLL
	XlCj6XnA43IsNJn7xoanx278beWbDSIFPH4Pz8f0Was7cDmspMis0e1z6O5xtWRj
	8x71SJXxoWblzspjlXxembYjTx2aG3DAzAKnQRgAqv6s9WqKbDEFYeWgQwyrdcJN
	JApQ0MgpFp75Caq+4bs/kANZuWAdvDh8Fazkic0OWh+zPuj2pe1FOksxg==
X-ME-Sender: <xms:bETXZr9BnLgivFfwJNP8Yn_ZGTygtN8aUsIaZxoS_0Y8XN2b22hciA>
    <xme:bETXZnu0o4PgZ-dw9vfueAI_qydtJcAH4Xy4w_H8AeX0NMNlYoWUZHEMOzSV6_OAE
    NG--UhZ3KennVRoUsg>
X-ME-Received: <xmr:bETXZpCyniNZJLvUa3FdlEkkQmcwwutNyepfyVi7R2dFCyvJ4odKh3K7JWVVH_H2JfP_mEG8XR8bISS83N3rlM0M2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhu
    nhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohep
    uggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvth
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgvth
    guvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgv
    nhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bETXZnfTooAy0TFHNOiD_jrt2-7AC7p80vYuobMh-yzwmqyM_JFAxg>
    <xmx:bETXZgO4SG9XnpEVS2_-M1xyMtmR2rbN0gSCwzUsXYiTFhBmL-dvAQ>
    <xmx:bETXZpmn83Q5Rzgd_sjw8RUW3RtqqMGnELlhn387RUCedZCp4EzcqQ>
    <xmx:bETXZqtj-1ULkKagC0svomHuj9or_dBN3HUg75rKe_whWvgEgKyOCw>
    <xmx:bUTXZhFRqeRIANJggHJRlzdDP8XizaSTlMrzhxwGS1fh94nxg-hNnAZK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 13:16:28 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: phy: Check for read errors in SIOCGMIIREG
Date: Tue,  3 Sep 2024 19:15:36 +0200
Message-ID: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When reading registers from the PHY using the SIOCGMIIREG IOCTL any
errors returned from either mdiobus_read() or mdiobus_c45_read() are
ignored, and parts of the returned error is passed as the register value
back to user-space.

For example, if mdiobus_c45_read() is used with a bus that do not
implement the read_c45() callback -EOPNOTSUPP is returned. This is
however directly stored in mii_data->val_out and returned as the
registers content. As val_out is a u16 the error code is truncated and
returned as a plausible register value.

Fix this by first checking the return value for errors before returning
it as the register content.

Before this patch,

    # phytool read eth0/0:1/0
    0xffa1

After this change,

    $ phytool read eth0/0:1/0
    error: phy_read (-95)

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/phy/phy.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index cba3af926429..4f3e742907cb 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -342,14 +342,19 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
 			prtad = mdio_phy_id_prtad(mii_data->phy_id);
 			devad = mdio_phy_id_devad(mii_data->phy_id);
-			mii_data->val_out = mdiobus_c45_read(
-				phydev->mdio.bus, prtad, devad,
-				mii_data->reg_num);
+			ret = mdiobus_c45_read(phydev->mdio.bus, prtad, devad,
+					       mii_data->reg_num);
+
 		} else {
-			mii_data->val_out = mdiobus_read(
-				phydev->mdio.bus, mii_data->phy_id,
-				mii_data->reg_num);
+			ret = mdiobus_read(phydev->mdio.bus, mii_data->phy_id,
+					   mii_data->reg_num);
 		}
+
+		if (ret < 0)
+			return ret;
+
+		mii_data->val_out = ret;
+
 		return 0;
 
 	case SIOCSMIIREG:
-- 
2.46.0


