Return-Path: <linux-renesas-soc+bounces-7132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0359291FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2024 10:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612E328186D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2024 08:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B3E41A80;
	Sat,  6 Jul 2024 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dlXoDY4m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xi/nFfp8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12171C69D;
	Sat,  6 Jul 2024 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720255190; cv=none; b=SxRfvCACWQUoNvjAuNByHBBNVcvCivu3dTBmX0pa/uWCBZmBscB3LN5c8i1EJZSljzGbEZtjZZCQ3YTad+kzmCjqFyRMDff1zPVNnuXhOhQdS+MquW+igjcj58vtQXeTLP08kNeO6vtVsNOEo8+u7c1iUf8jTYcUyqYCCQ1z6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720255190; c=relaxed/simple;
	bh=4mmW/ixGVCtiwQF+/k9RAFIivf75MKuQG5FPUIXvMnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idgHQT2Am3Mq31WYpVw3Yz1CIIG38dmMFmAYMCCqRQoyKJz6Of4OfffWeSkLQ4vYiRU9P7W66NM/Cm5ONuaVJnjDnZDg3XZjQt+NarThIfnDuQF6vhpWsibjo9hkpdYZBcQ/OyIIzRrk4vz+YdXDz6Nie7LhEk3BNYdMj//aqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dlXoDY4m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xi/nFfp8; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 855411380651;
	Sat,  6 Jul 2024 04:39:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 06 Jul 2024 04:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720255185;
	 x=1720341585; bh=wyH5ITGH73BgbNDhAYSW71/jWvMw5CdCjpRmRCSjMig=; b=
	dlXoDY4meUin/wyJfeQ1WI5vie/h/bL7HnMiV6G5rgdaNytTVN5jOyCmR1YiNaMF
	zzVq+EiJfKc6/0JnhQ61BYyrHOEIVhTa92WYObcCCe80I9VwcSUueuEr7Y9Mkglh
	p41JK1wVdcehOKryiqBN76tmCcQf8iMW88N7TyW25HJP+/pMiI93YTx0u1yXLTyS
	ERuGXpkjxGsUxxSuOrNhQGy3HPw8sUhZzsltcFESIIsFdTxk+kEf7ffp5W5i0JoR
	UiuSEtyLCpps4ftkoxi3AUZsx9Rc4gbKsHAo1pDtdDg3Dpzk2yosZFK+mhQIRILt
	Xgynk35qNzT8YtxmF09oXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720255185; x=
	1720341585; bh=wyH5ITGH73BgbNDhAYSW71/jWvMw5CdCjpRmRCSjMig=; b=X
	i/nFfp8FxETayp4KZBRpUUvOiF6RSzmekWM9ZDb5oOzdCnWfveDMWAx2StkFha/j
	UjNMhmpV21fhibJw/EJH4JRT+zaSsbuB0Jq7/Ee9SLmd6cDZ0SZzQWebvxb9TQmz
	15Gn89nx/mY4yCzbiUKfHDFzsqdKNWvBVAzQO5iXnxqZdaZDWjxHNRiRy3zQeOhm
	6B7TNT5gr/fFyAnHFVU8POm88oH+934Q59JRpw3qs1BGO14hWBCECa4f2m9cqI7I
	3YcV2ppduWOv8yU2wPub3zf+BxN54B2PGWXbeuwKm822kVWKg7G69avdQEkxKG8D
	G9cyq/5Y9Uv/iaYBfqW/A==
X-ME-Sender: <xms:0AKJZuKX0kaxJrFDFT4leGHRyVdJn4FRrXe9qlAraUNZOG3PcEN2XA>
    <xme:0AKJZmLTbaQcoA5fw19VEKEDM2A2bHvVUvG-TQGtDKYjhjavYiR_e4B5AcvVB-QxO
    HWVzjIiQClntYJ_Wg0>
X-ME-Received: <xmr:0AKJZutkZYB7tKee7dVNUeiwW43I53taQRTCe_bZPGniuYvgXvMPgeYL-mkgz7BsVq9_TgQ5G7s5oQKk39j-igr22YtJGf0XvV38ZNN5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfff
    jefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:0AKJZjaGXttGjlLTnMI3rSLCMBHrNwr3B5wA76Y3GmwN8wSzVlKLRA>
    <xmx:0AKJZlZt3x37qY95lTiHFMNkVKJTFymZWhjEJlV-RjZ4ImBPrXLNiw>
    <xmx:0AKJZvBti1RvlNHPSlQQsi1VrEF4fkA6JqzTmEtLZiWuf6yFF274JA>
    <xmx:0AKJZrYAATBQ7g5ikq0yiWP7a0BVeBUqDIvwaYuOMVNrdqrlBRRiVw>
    <xmx:0QKJZppEYixoA6kwceYIezARaUOZ7id_ui46AKspvoK2TLEZA5yEswEb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Jul 2024 04:39:44 -0400 (EDT)
Date: Sat, 6 Jul 2024 10:39:35 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marex@denx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
	kernel@dh-electronics.com, kernel test robot <lkp@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
Message-ID: <20240706083935.GA2366@ragnatech.se>
References: <20240630034649.173229-1-marex@denx.de>
 <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
 <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de>
 <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
 <20240703093601.GA6493@ragnatech.se>
 <fa6db116-50bb-488b-a48f-c34f918424a2@denx.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa6db116-50bb-488b-a48f-c34f918424a2@denx.de>

On 2024-07-05 23:49:56 +0200, Marek Vasut wrote:
> On 7/3/24 11:36 AM, Niklas Söderlund wrote:
> > On 2024-07-03 10:24:26 +0200, Geert Uytterhoeven wrote:
> > > Niklas: commit 54bf0c27380b95a2 ("arm64: dts: renesas: r8a779g0: Use
> > > MDIO node for all AVB devices") did keep the reset-gpios property in
> > > the PHY node. I guess it should be moved one level up?
> > 
> > It's possible to have a rest-gpios property both in the mdio node and
> > the phy node. The former resets the whole bus while the later a single
> > PHY, at least that's my understanding.
> 
> My understanding of reset GPIO in the MDIO node is that it is used in case
> there might be multiple PHYs with shared reset GPIO on the same MDIO bus.
> Like on the NXP iMX28 .

There is a use-case for a single PHY on the MDIO bus too, at least in 
Linux as I understand it. If the boot process leave the PHY in a bad 
state which prevents it from being probed. A GPIO reset in the MDIO node 
is used when the MDIO bus is registered thus resetting all (in this 
use-case the one) PHYs which later allows them to be probed. A GPIO 
reset on the PHY node is only used after a PHY have been probed, at 
least that is my understanding.

This is the use-case for adding a MDIO node to the AVB driver and 
WhiteHawk.

-- 
Kind Regards,
Niklas Söderlund

