Return-Path: <linux-renesas-soc+bounces-7031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 877409256F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 11:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 238B8B22CF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A0D13D88F;
	Wed,  3 Jul 2024 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="s40Vr57d";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZLE2TK+e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E713C9B9;
	Wed,  3 Jul 2024 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999375; cv=none; b=J2C0EmGD7cqBvvK61HcN6T8mLyg6E6LQnPS2fApZjoI/5FWbWr1LuobVaS6jf2Cg6fqANkNMJA0kHqTv9SBtf/hv9ryLf7gHCbh0tbP0FV/hG+j5TVnQroL1dPeEsZp5j+E8/ABsSw6fVloao9XWrO74NnoqZGFfC5KgFpJJp30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999375; c=relaxed/simple;
	bh=AIRTMwWy5FkSM/L7rNBFkbRk0HoKzus1VxHpaOUCjOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQk0DV8waPCXdj7ig4mxoDDwm0tIMvRGzoxh0tQb8IjYjuh+9fheDIYmHnPTLeVYLITWz3PiyOBIUZApOsfE3nREHQ5ThVrPS0LPreyDTVcU+FMoW35AyjbbG6TgKuGRx8Pwo7OTgAjItftv838zHjkQgf/HaxsOe2oQN/xLiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=s40Vr57d; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZLE2TK+e; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CC35E1140210;
	Wed,  3 Jul 2024 05:36:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 03 Jul 2024 05:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719999370;
	 x=1720085770; bh=T3YRRV0u13l2lvIEvP9DrDF1Hy6ZLNQ46QLq5OnUiKA=; b=
	s40Vr57dSDcQ4UZlMxgcu5W6mbq3hFdCgkjxv+WxKVXIjlaBFf71gXXaEUWcjR5T
	Jmx8lbeBosbXvuY3ANiEM5i4GJPa8i3YNnaY8DUUr+S4aLAveH8hiJxGh4AmGrsz
	J89J0K7innS9OXbri6Nt/4uh/l87rXmxQTCmq09YP7twG+rCZ29X3Dn89aEWjrB8
	UrJyrWJCyoO/Imn0qjaekRVuEhIVtf336FzwGNVNBwUT8JsImgeV7LA38ZiF4CCv
	elAQn7BThYQoiy3TfgbR/YIw00jWMNgtuAxM6q3CrmUJMNoIVyN3DWN/W+QvwLmJ
	36tRFZ7fWGQf9V45IoB9OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719999370; x=
	1720085770; bh=T3YRRV0u13l2lvIEvP9DrDF1Hy6ZLNQ46QLq5OnUiKA=; b=Z
	LE2TK+ev5ZD1UuLhf3h7OtoCOoVvRrIMIE5mIpTqMQd9pBvjXv5kwNqVdMkNK3na
	/dU39U+l9m9weypHDPchVlc1PNINhqVhJTx+CyXUKfm9V9K2okyHNl/eZy0RswGn
	wdZA3jRL/h+ygqQydJpPCdJixw0SU7Vj7crLzz0L2RAB8kAVHTF2sm7SzqCU5Buw
	aGORBaOY6JvAZ5ZmLxm35BikaqqxIHry42LTbW8Rw4m5buPKl9PcmDmXSychLa7P
	huXkKXsaMDscRaDgF/MZs5NlknkF3GeGjiOg60o+HNQhxK3zwWShn1WAiSCjat2T
	y2Pm999emHvQAQCFRH95Q==
X-ME-Sender: <xms:iRuFZgeUr3I-WV9M7rDBpvlftrdlKMHywer0zOcR7EmaP37Sbtn6Jg>
    <xme:iRuFZiNtKmTUoajydWuZtEJx7eYwOlgK8uz2uBXkM5zPlQ6at04izXumjkNJ06a59
    r4vVgjJT1sV1K3toOA>
X-ME-Received: <xmr:iRuFZhhCwrGyu9CA5FiKelbJmdXwUDG6ldfgCh4o_PC34NNedELez5ficzo_14_j02Gipv6ybsJKPFng1GTlEGPLLLBSaBM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfff
    jefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:ihuFZl8gGzpK1rjXEWi5WjfQrTjsR1lt_gmL-qmS_AK_cI5hnzQ-ow>
    <xmx:ihuFZsvmeZK55jInbs8N_eEbZiNeL49v82n8EnrTl6kRBh329dLCOg>
    <xmx:ihuFZsFCTDEk5BdaC7fJqX8Xq0SzcM_qlJeiJg6nHzIsvEv6ZZte9w>
    <xmx:ihuFZrNj-9vATh8dZlNA_pGpnUR26swXl9soYy84LFgQskA4LJGtVg>
    <xmx:ihuFZpMYwtK-tP7c3h18sDRCyp5rbkRmqN_H501hVgnW_rgqoQ7hpcOz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 05:36:09 -0400 (EDT)
Date: Wed, 3 Jul 2024 11:36:01 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
	andrew@lunn.ch, kernel@dh-electronics.com,
	kernel test robot <lkp@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
Message-ID: <20240703093601.GA6493@ragnatech.se>
References: <20240630034649.173229-1-marex@denx.de>
 <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
 <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de>
 <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>

On 2024-07-03 10:24:26 +0200, Geert Uytterhoeven wrote:
> Niklas: commit 54bf0c27380b95a2 ("arm64: dts: renesas: r8a779g0: Use
> MDIO node for all AVB devices") did keep the reset-gpios property in
> the PHY node. I guess it should be moved one level up?

It's possible to have a rest-gpios property both in the mdio node and 
the phy node. The former resets the whole bus while the later a single 
PHY, at least that's my understanding.

I think it would be more correct to move the reset-gpios up one level 
for r8a779g0. However as it already was in the PHY node and this 
functioned as it should I kept it there.

The need for the mdio node was to avoid a device specific property added 
in the BSP to reset the whole bus. At the moment I can't recall the two 
different call sites for when the two resets are called. Maybe if we 
move it to the mdio node we can avoid setting the PHY id in the 
compatible string as we could then always probe the PHY correctly. I 
will look into it.

-- 
Kind Regards,
Niklas Söderlund

