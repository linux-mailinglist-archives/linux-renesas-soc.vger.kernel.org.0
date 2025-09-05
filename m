Return-Path: <linux-renesas-soc+bounces-21450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E01B451F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096B23AA2D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 08:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAF427703A;
	Fri,  5 Sep 2025 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IRyhj3FX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kQecMoYz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0227C872;
	Fri,  5 Sep 2025 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061900; cv=none; b=kvdrwsXKIg0z9p6PByTHk8BjXWyTB7Se2LiO93Ud2sXXV9g33a0LKoG2gkpXAuLqMuQcZWSJ43iZGXnsaMTiwFIigUtU7pLkJF4PDAB1zupFFOEhqtiOF0SWF/vncswOMbNgGX1Bk3f6+SmbAgA9raQavkf9r/5MruXtDHllMG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061900; c=relaxed/simple;
	bh=ivsbKQBh8RLLT4Cus1G5aXePlD0oj9exdgeSIL6OQBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gqVIaaLuZjJE65UYg6qhAtJIMTSpWduomSrMAetHbxRPy3Lx5quprvdNRuj3NgBCExNcGcigBG9vQbgJRD4GfDuVLQaOgWIFYerga2XbQZ9JdsFyjPxn6Ej5Fj+cH6buAqMNt1FOj1P2oFn/8WfqN8wLtMyvidBuFt7INTQA0KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IRyhj3FX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kQecMoYz; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 97DFE14003CE;
	Fri,  5 Sep 2025 04:44:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 05 Sep 2025 04:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757061897; x=1757148297; bh=WM
	faFZZgYvtLLgw3k0SV7cOVi4XNMlOsrKyaxIr5M0k=; b=IRyhj3FXqbRNnRwE31
	ErqAH8jWbZ6V+CvpfkMLn9SCue6c6QHM+/2uI9u2FcOAuFVt5Iw2ZC9p0epTMHtE
	mxrm6ly2hz4W50/+7yCW7UaBk9ZvEKqesD0/L6rRq2XeJyijFdGRNJ1LXpMMPZAX
	jvnQiNNb80rEO7VTMW+pGf2xaE6AD6JMTDOT+xI39+SvFF0DJK3ayn2XNKRWQNm8
	wQIA4DSbai7jf7XgFUXeawu1pJQOOuokhMZo7OHccP+PhdI0GQp+b4sA4/SP5QMm
	yYSOXjdMCUKMIsDZJklTxHlzesbGmwMKZG4wYId8XQvXA021SOLtPLB/iTKV2wJM
	x0XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757061897; x=1757148297; bh=WMfaFZZgYvtLLgw3k0SV7cOVi4XN
	MlOsrKyaxIr5M0k=; b=kQecMoYzsbcLqXq7lVeaz+iQk3Fs/OGkUlRZRAHWLqV4
	krRh+RVRUVOAJwr3+jDM5ivDin8LLzrtAl+QxVvtb3zj8xJD+y0F4XA+PDP7Qumb
	RVijfxm092L1bCxCofD4tAWqr7dHkaSObQDnpfS9J/Dqa6pRLaynZ5k1DXF/83g2
	WCCIAvr4l/AUqbbck4OrVtuMRb8uTItyoxtssae8MqL0Fa+aaB+DqMasJf5m1xR7
	R3I5aib8dDk4MncRqenDHHEkZ6rJZXUjHOalw95GiID+K6wn74j6ylBedsDyBJR2
	QScXnJGchQgOa5ZIyWS3EBE0K3MFfWYzeTCcyccjrQ==
X-ME-Sender: <xms:CaO6aPXc93ENzdpd0f7QD4g4BLTMqyIZPEgr5fbe3PfcwAMTuq1DhA>
    <xme:CaO6aCNiaeCBhAhlqB18hJL2AB1o_OkWMD4c164LNdsryKugoiDZ4LLnP-Z7WxYFa
    TgCeIJiyWVWvWxvq08>
X-ME-Received: <xmr:CaO6aBbx7x4LZF9tXU02WsahZLGq6ELPFvJo33O9qs1m_MAzKTecNevC3wdteBuJzG_wYUU8lMt8bwyUnE9rHNISjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpn
    uggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffefudef
    uedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnuges
    rhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhr
    tghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrih
    hlsghogidrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrsh
    dqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvght
    rhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:CaO6aJ9mEtyYMlRUPiUfD0nqYagI0trlD8kL4EqoqGHXE3zKnKWZDg>
    <xmx:CaO6aKRyaDDhOTigaZVrCrEHzx1FFMT5ERmwgOoPdXTFOflD7Va3IQ>
    <xmx:CaO6aLdgTs53KWEkoKSaacOdXmHiQcpnePpiW3FZ_BpyGjSw86MVnQ>
    <xmx:CaO6aESZbE3rYbnFfXD08BH7ZS7-KDK73D-uwAPuWT_YjPdeB5Kjhw>
    <xmx:CaO6aJNd4C-_YwfKUgScgfueHrVcdBZAyGmtOFzWCiXg-3nrVppXoBSD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 04:44:56 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 0/4] arm64: dts: renesas: sparrow-hawk: Add overlays for camera sensors
Date: Fri,  5 Sep 2025 10:40:46 +0200
Message-ID: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se>
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

This series adds a couple of overlays to verify the two CSI-2 busses
exposed on the V4H Sparrow Hawk board. The two busses are exposed on two
connectors labeled J1 and J2 on the board.

The first set adds overlays for the IMX219 camera sensor, one for each
connector (patch 1/4 and 2/4). A Raspberry Pi Camera Module 2 have been
used to verify the proper operation of the overlays.

The second sets adds overlays for the IMX462 camera sensors, also one
for each connector (patch 4/5 and 4/4). A DFM 36SX462-ML camera module
have been used to verify the proper operation of the overlays.

The reason two sets of overlays are needed is that the IMX219 uses
2-lanes CSI-2 D-PHY bus, while the IMX462 uses a 4-lane CSI-2 D-PHY bus.
To be able to properly test both situations on the board each sensor
needs to be able to connected to each of the two external busses.

Obviously only one sensor can be connected to J1, and one to J2 at any
given time.

See individual patches for changelog.

Niklas Söderlund (4):
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
  arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

 arch/arm64/boot/dts/renesas/Makefile          |  12 ++
 ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 116 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 117 ++++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 116 +++++++++++++++++
 ...8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 117 ++++++++++++++++++
 5 files changed, 478 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

-- 
2.51.0


