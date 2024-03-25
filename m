Return-Path: <linux-renesas-soc+bounces-4008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42888AAB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 18:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B02571C3AA08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 17:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E171DA26;
	Mon, 25 Mar 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NWXn+bSK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PaaYe2di"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow2-smtp.messagingengine.com (wflow2-smtp.messagingengine.com [64.147.123.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F718EB8;
	Mon, 25 Mar 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711380976; cv=none; b=iSPFWTMMpC6V/+0LFeLvX4n9w71KGgwAzP7aV323Ms1ArjK2W4wa1Y1tGv7WqcVqOHbe8Ter6K7XOTRX2/7vNXw42DN6gS0DYdCxL5IcD/sMCKdjlTCCDRIjpjIKe/FQKN3UOb2mR5jCjJK7R3LaxznhdctcJbqCzprrqAx1DLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711380976; c=relaxed/simple;
	bh=y0YBOhKfsbV8uAOt8notX758x95HAI2drqMGctzG7Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S8vXO1HDfrWV6OoUiBHmUU2oZQeRamwlzvgSPQqaXSxtxjibL+YVEk0Eub4wlO9lf42xxYHPthhhH311Zlk9ke3ILVxXVEb0OkCb+Q0BhRCjK43oS3JfXREXfaClx+/DQ+rBlBkbawVWwPZXmWMaF8B+odUf2AlU4Xes36LqKwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NWXn+bSK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PaaYe2di; arc=none smtp.client-ip=64.147.123.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.west.internal (Postfix) with ESMTP id 3D74D2CC0521;
	Mon, 25 Mar 2024 11:36:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 25 Mar 2024 11:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1711380967; x=1711384567; bh=d0
	dvJmQIQfye1imnVs8CcjRWqczhUMat/+HUwY7kQKY=; b=NWXn+bSKdKiGa5TqGc
	Sg3JXih7dGDMdn/NlU+SHiW9WjBN+4eGs5Szr1F2laVsdXQfsVChidMlm0Riz96e
	QwBRUlb2glwkBrePnAmj1iqN4tDa/707WxEGUxD9w2/p4SPK6sTNdpy/7QxkFECL
	0zMzNh1gGMVeReHB9HZHvQzyD6vAdWo53SjFpj2UP5hoKIdgzUS0OSnhbEHVW7R6
	BKEsyTcM4X777KeWkOqlW2Xpkd22jhgDNvRrDpLcuIia/4fT9N62B7BoJwbJwgwH
	h9H3AS7PQoMe39rIV5mUlVeW5cw0+Qr3YDSCBmqwwjtf91xzJjASBjxobcgWTjI+
	9AHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1711380967; x=1711384567; bh=d0dvJmQIQfye1
	imnVs8CcjRWqczhUMat/+HUwY7kQKY=; b=PaaYe2diWAxBc2NRb4+K10o/UFk1G
	agFFnPNUSQe+mbdQaXoRcX97KTp05JFKqzcWOZ3ep3kEhBThECKaqsAXGe4f7ASN
	2pFY1r/yQLW5Ypgp4L8nUFELXuANdxcZVWgun5biOilv4e33mjJnobZvtNzyAkpc
	gPp9189llCh3VBYGS33tZ7mR/bYHdjPWiHOmqS/SZSGWf+V0ZKNlwlxIKpVbmNvh
	6VkRyma2zMiHkK4blTUfPtAfOtkpPlscnkJubC4f8UlKG0iNgXX58SSyLPR8ge7j
	G33RXLpGd0CWLEksvvIjbFXPmuCtPXFO0QPUWRvudu4m80mO+TxcApSyg==
X-ME-Sender: <xms:5pkBZuJAXfTdPvEzs0yByrXVVQmeDOswVCJoJuKflwmFpSOs5nQfVw>
    <xme:5pkBZmLITej98jdVe5XhemaYgsx_cZlISwk7pjAzk4ydn4AS5JxNm3ryCNEXfCQjx
    zHAl3OR22zYkrWbMUk>
X-ME-Received: <xmr:5pkBZuu13njiGrytg-n3Nkvr77sfKJv8GbyAdQBcDt7Hz6pXhXYCroFgpSG5ZWccHG9bi4hB8iY8KBe_jF5_jhIwUGyyAad8DY5m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:5pkBZjYDzFH6FxaVXoifNBKEwdYO18iyhASJ2po9P3EaALLx5FhiUw>
    <xmx:5pkBZlamyyQMFHUYNSc51ZpNlSj3mZelSe0EuQFSAUaouNEOdq8XUg>
    <xmx:5pkBZvCyVQ5liW1TgINbQO5IQrCzC19Qb22LP5zGbm4yoNF7vbqCSg>
    <xmx:5pkBZrZhHqFlono_3jX7xlzL_JgNVzmPm7JyM5NWwmY_SUS-QtY8-w>
    <xmx:55kBZtLsFgztZbfEiyRgbSfxuY5ENCOUmKzXC3MC54uLrGishFNvR-wemnJoTsM2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 11:36:03 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v4 0/2] ravb: Support describing the MDIO bus
Date: Mon, 25 Mar 2024 16:34:49 +0100
Message-ID: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds support to the binding and driver of the Renesas
Ethernet AVB to described the MDIO bus. Currently the driver uses the OF
node of the device itself when registering the MDIO bus. This forces any
MDIO bus properties the MDIO core should react on to be set on the
device OF node. This is confusing and non of the MDIO bus properties are
described in the Ethernet AVB bindings.

Patch 1/2 extends the bindings with an optional mdio child-node to the
device that can be used to contain the MDIO bus settings. While patch
2/2 changes the driver to use this node (if present) when registering
the MDIO bus.

If the new optional mdio child-node is not present the driver fallback
to the old behavior and uses the device OF node like before. This change
is fully backward compatible with existing usage of the bindings.

For changelog see individual patches.

Niklas Söderlund (2):
  dt-bindings: net: renesas,etheravb: Add optional MDIO bus node
  ravb: Add support for an optional MDIO mode

 .../devicetree/bindings/net/renesas,etheravb.yaml    | 12 ++++++++++--
 drivers/net/ethernet/renesas/ravb_main.c             |  9 ++++++++-
 2 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.44.0


