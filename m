Return-Path: <linux-renesas-soc+bounces-4051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D288CB57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 18:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC8A1F81148
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 17:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39471F60A;
	Tue, 26 Mar 2024 17:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="h9Jm6mwr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E20CPKPz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow2-smtp.messagingengine.com (wflow2-smtp.messagingengine.com [64.147.123.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC384D0A;
	Tue, 26 Mar 2024 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711475455; cv=none; b=oaMv69ad3L+7lI3pcgR8ZacpZriJIGUttiOY9tMavIhbxII3cPaGROdZLQUlZGkDm+F/bsGSUY1NpcBRZa2JDmX7l21T1NpBBBOba2v3e0gW0/qEr7P+Us/V5GV1vxH/7eWBtoKa/ymzvVlwkwBwH88Jmo/tqTJtzF65w5hhSoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711475455; c=relaxed/simple;
	bh=Jl3WD44odOpmZNm+pOZH2TXGLLjw2ln0as8nNR7HbIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMt0s5TpMFnUChM66MBE8PXZQJL9m1sDh/Xy9iSRjn4tm53wWxn252cNuGxzIaA3bouD+YqDsDhtctro6QfBVNfYLYepM58/tUEG8qlf3DZEkg57POT/TBY0IME46Vl9iXAkyVkM+nlJFTlIzU7YRFeN0G4fZwa8DCTUHVCMvK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=h9Jm6mwr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E20CPKPz; arc=none smtp.client-ip=64.147.123.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.west.internal (Postfix) with ESMTP id 16A302CC01D7;
	Tue, 26 Mar 2024 13:50:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 26 Mar 2024 13:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1711475449;
	 x=1711479049; bh=gZGDmgj8nj2ad7xBoHJ9IF4hDKH9Qkj1W2vW+FVkizQ=; b=
	h9Jm6mwrpICI2/wKI4gz3CseRxW0Mw2e5vCO3dwkJUWJMPjwrZ3gkffYUaVPSFm0
	wbW0QC3aX55QnPJQsFCjMNlyz04Go+NVSGHGgquLxUwf1OWPBlYiXGhOx55J8iMl
	xdsF0ew5Rc/T3A33lNlFknx099gb1/tbMaTpVKIf1hSva3ITlVLEo9A1yOrN/7uH
	VDfWrdRR7vRCgd29shXN9EJLAhO9Zo2XAYXxk5wwy4xvQopSL/coDpPu6A3DVX8A
	OO1iLhPDMTZ/H7H4k2oBVeasmjvDcZm2IYM3TFV62O6n92Z6gc5yRzNGNV1VTnhO
	O6MeCSf1NfblhRl5o+7KdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711475449; x=
	1711479049; bh=gZGDmgj8nj2ad7xBoHJ9IF4hDKH9Qkj1W2vW+FVkizQ=; b=E
	20CPKPzsPklW8deVUnvj6Kmfry5tlMwDD9G15cA2+/MPIIcAo+RFJUkigUc1zSPw
	XI2Rx83uMqLgYsLm/1OHg18XZ8+JsJ9n0QYDaNffevOO2tHh9PwKz4vTgjGWP7Yu
	py1ulcykWFUBKbCk/HuuPuk2JQbw0VGsr9faYmlK2gTrqqKnVwKitxcPnn0tjd0a
	dt7uTw3GkvyW5a3Tz5ewYmaqh9eA8lW1+oWvXJeFyCySey89cSfYrgCQAF3U3MiN
	+TpEN3KRRTorudk0e4+i6Dzt9kOup469eNa54I44x9KEHWRVNlm0izfj3speIqAM
	vWx5aepYa8u87bBOPdYSg==
X-ME-Sender: <xms:-AoDZn6sa6O-edLg6eKfVL-TeGLWnavKxsMOOCu-hRZdFn74LT-ROQ>
    <xme:-AoDZs7B7-EL40OkqLeHLMAU6VoaHJj45OI3HxYdEyKYWR3CHpIgtpaeUUbCQ6GZy
    uXQuM2Ma2L9S04CAtw>
X-ME-Received: <xmr:-AoDZufwfOBM-SdU-c9b0GhbFza-HaPHoeb23YCMyLzNFK1JHvgH7rcuisAfBdpz8MLjhX1fXz9KwJ4Ys19bVmx-TUgay3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddufedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:-AoDZoKIeYHmXLyHTTE642Nk6cWnXi-9sjzihBwIB1lCgGdaXLVHEg>
    <xmx:-AoDZrKvfyGwc2k1EcujBspxbRRs3cPD6YjyIkBVUg2YQAw9uGgDSQ>
    <xmx:-AoDZhxXNtD0WHs9sUVlU-ADW-cixxYlJW-pexT7-gi-fFcZCdkHtg>
    <xmx:-AoDZnLQ04HcZ4eItv9cPcrj-HV-Ydyjwi9pW2NQ65IHpNebpevzOw>
    <xmx:-QoDZj8tNWrvYUu4Kc9H0htXzkG3qg8WWp-aU7k7fePQ-wBfCbxp39AaYEOg1w9Y>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 13:50:48 -0400 (EDT)
Date: Tue, 26 Mar 2024 18:50:44 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: white-hawk: ethernet: Describe
 avb1 and avb2
Message-ID: <20240326175044.GG1108818@ragnatech.se>
References: <20240309155608.1312784-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXBhpbH2=21e26BeuknpW08eoX_yG4UQg-Ep5TijY3Vfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXBhpbH2=21e26BeuknpW08eoX_yG4UQg-Ep5TijY3Vfw@mail.gmail.com>

Hi Geert,

Thanks for your report.

On 2024-03-26 16:54:49 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, Mar 9, 2024 at 4:56 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Describe the two Marvel 88Q2110/QFN40 PHYs available on the R-Car V4H
> > White Hawk RAVB/Ethernet(1000Base-T1) sub-board. The two PHYs are wired
> > up on the board by default, there is no need to move any resistors which
> > are needed to access other PHYs available on this sub-board.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> When accidentally booting a kernel without CONFIG_MARVELL_88Q2XXX_PHY=y,
> I am greeted with the following warning splat (same for the second PHY):

I can reproduce this, but I'm not really sure how to deal with it and 
it's unrelated to Renesas AVB Ethernet driver.

What happens when when running without CONFIG_MARVELL_88Q2XXX_PHY=y is 
that the core fallback to use the generic Generic Clause 45 PHY driver.  
And the generic driver don't work correctly for the PHY on V4H (88Q2110).

The splat happens when the generic driver tries to enable auto 
negotiation. This is known to be broken for 88Q2110 and the 
CONFIG_MARVELL_88Q2XXX_PHY=y driver disables this. From 
marvell-88q2xxx.c

        /* The PHY signalizes it supports autonegotiation. Unfortunately, so
         * far it was not possible to get a link even when following the init
         * sequence provided by Marvell. Disable it for now until a proper
         * workaround is found or a new PHY revision is released.
         */
        if (phydev->drv->phy_id == MARVELL_PHY_ID_88Q2110)
                linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
                                   phydev->supported);

If I hack the generic PHY to also not try auto negotiation the splat go 
away and the PHY binds using the generic driver. I did not test using it 
further.

I can't try to submit such a hack as that would break all other PHY 
where auto negotiation works. So I'm not sure we can do anything about 
this other than make sure we have the correct PHY drivers around, or use 
PHYs that works with the Clause 45 specification.

> 
> -mv88q2110 e6810000.ethernet-ffffffff:00: attached PHY driver
> (mii_bus:phy_addr=e6810000.ethernet-ffffffff:00, irq=POLL)
> +Generic Clause 45 PHY e6810000.ethernet-ffffffff:00: attached PHY
> driver (mii_bus:phy_addr=e6810000.ethernet-ffffffff:00, irq=POLL)
> +rcar-du feb00000.display: adding to PM domain always-on
> -mv88q2110 e6820000.ethernet-ffffffff:00: attached PHY driver
> (mii_bus:phy_addr=e6820000.ethernet-ffffffff:00, irq=POLL)
> +rcar-du feb00000.display: removing from PM domain always-on
> +------------[ cut here ]------------
> +_phy_start_aneg+0x0/0xa8: returned: -22
> +WARNING: CPU: 2 PID: 55 at drivers/net/phy/phy.c:1262
> _phy_state_machine+0x120/0x198
> +Modules linked in:
> +CPU: 2 PID: 55 Comm: kworker/2:1 Not tainted
> 6.9.0-rc1-white-hawk-02587-g577b6a49a6d4 #235
> +Hardware name: Renesas White Hawk CPU and Breakout boards based on
> r8a779g0 (DT)
> +Workqueue: events_power_efficient phy_state_machine
> +pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> +pc : _phy_state_machine+0x120/0x198
> +lr : _phy_state_machine+0x120/0x198
> +sp : ffffffc082dd3d10
> +x29: ffffffc082dd3d10 x28: ffffff8440089c05 x27: ffffffc081090000
> +x26: ffffffc080e03008 x25: 0000000000000000 x24: ffffffc0815603d0
> +x23: ffffffc080e03008 x22: ffffff86bef98100 x21: 0000000000000004
> +x20: 0000000000000001 x19: ffffff84435b3000 x18: 0000000000000000
> +x17: 0000000000000000 x16: 0000000000000000 x15: 0720072007320732
> +x14: 072d0720073a0764 x13: 0720072007320732 x12: 072d0720073a0764
> +x11: 000000000000033a x10: ffffffc0810b9ac8 x9 : ffffffc081379ca8
> +x8 : ffffffc082dd3a18 x7 : ffffffc082dd3a20 x6 : 00000000ffff7fff
> +x5 : c0000000ffff7fff x4 : 0000000000000000 x3 : 0000000000000001
> +x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff8440a98000
> +Call trace:
> + _phy_state_machine+0x120/0x198
> + phy_state_machine+0x2c/0x5c
> + process_scheduled_works+0x314/0x4d4
> + worker_thread+0x1b8/0x20c
> + kthread+0xd8/0xe8
> + ret_from_fork+0x10/0x20
> +irq event stamp: 16
> +hardirqs last  enabled at (15): [<ffffffc080913144>]
> _raw_spin_unlock_irq+0x2c/0x40
> +hardirqs last disabled at (16): [<ffffffc08090d434>] __schedule+0x1cc/0x870
> +softirqs last  enabled at (0): [<ffffffc0800800f8>] copy_process+0x698/0x1924
> +softirqs last disabled at (0): [<0000000000000000>] 0x0
> +---[ end trace 0000000000000000 ]---
> 
> Is that expected behavior?
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

