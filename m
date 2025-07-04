Return-Path: <linux-renesas-soc+bounces-19200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C1AF8E4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 11:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8814C765E1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 09:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C002F270F;
	Fri,  4 Jul 2025 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="b/MMYRSM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YSyIDbcX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F2287512;
	Fri,  4 Jul 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620312; cv=none; b=S/KqNx2/cg6NN/+Jkiaz1q5bP1h4HrwJhzepXJq0xGttHJsMX9uzXjK5goTiYN9aJD+/FHXd7QpFvyIoK3we5gwV1PXG4WT0I+LQV1/8nLewUWHZbSLS+IwXWJV5G0Ztx9baDFalOukQHPh5GRhfde/YegHWMGNRS8XFIAPUsYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620312; c=relaxed/simple;
	bh=yS0QNxwxDu0AiPYpJA1/21h0q6wysIYsX3O6EKPG6k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXa0aTtl+J4twIUrjXtSwbmY+3l6ritd3WBnBta2xBhA93/nxIrVElBUfsb7LIHaYeOAFHXDGHUIiP/sTqxjLlip0bSIFVkNkP9U2rJzqtWM2EbqSa4nHnB0ucr9O1PM+/e+05MEP0/Xz5eSrFc8qQ59MQdntm8AkzTC1X/Yx8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=b/MMYRSM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YSyIDbcX; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9BDDE140034D;
	Fri,  4 Jul 2025 05:11:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 04 Jul 2025 05:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751620309;
	 x=1751706709; bh=TmJ512/Jww3eYylS0I+H6Fl/bUdK5vYqrfOw1lN7BUU=; b=
	b/MMYRSMVqXjxFp9ajb6Iw9ofgC1L9Qu5VTFiZKeTyqnMXlcpBBrxo81mStOwqVg
	fh9jDkLXhxAVYIJ4Gw7IC159hkVscmIz0ocyxWLxlwiJamqNULyV5P5Gzr2ARVVB
	kFfJld7h+exsDId/4UxdN7/uK4eaDCSu8f4brUnxN1h6jvKgbMoemXSzxme7zm6/
	hlLiznRYEXXbzycix4cPVifR1C9KxoiqvLBbtnvG/DGAeNyfhLJ9raeOpjqgHXvI
	efbxC55HdvlOOh3F7s8NGty959k9BLWOZd8K2puut7WkH2Vc6ipTcH2zZsDjDBGT
	7RGDScYzrb1NEdvB0hlRtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751620309; x=
	1751706709; bh=TmJ512/Jww3eYylS0I+H6Fl/bUdK5vYqrfOw1lN7BUU=; b=Y
	SyIDbcXLACNp+qrebj6dqT3lbsdobCILuPiMc79XJu19cfNnDyxhP7OMdOOXF04i
	1oWq57WBVRoD/3ASo2Hr04W7aLPllhRNTzMHJ2WdFFb6YUaJIH7svFLzgWst8t80
	iNp00cezQAJ/OzVnESrMnN4nM7gHcWPr57MuKgE8LKdLyGqG7mlwdyDKJr/U78NQ
	AHJuEa0cAVLW4T6w469m0wysh9wMKQ9MSEo5JWONvEm5EgTAUf9GbJyPEg/NoGeR
	+MfdgDd9Hwjb5KtSZ4WQxPJlgX6SOFwGvfavEsrWTkRVue4AWd2iI1kjvy/+TSsw
	x9XVliCEfDtJX0TxBRpfA==
X-ME-Sender: <xms:1JpnaHsNU4-WPVKJVxtQLxwcCZhGbv-JlenjOf4v73RwE4qcseBNhQ>
    <xme:1JpnaIdb0wPfkFjoYg08ZwoBniw8Jsxbsskpikral8IGqWJr2YotixaSCa30QNPl-
    h8Pky0850dqxLYSd84>
X-ME-Received: <xmr:1JpnaKyaDe-95u9uMoORZaqc_GusjwV6nCpOBoy7BuMVav1broInPlrJ6Cq6ciIYIVEnfVot_8tafoPWqrttYDpJvnGW9RbHNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehmihgthhgrvghlrdguvghgvgesrhgvnhgvshgrshdrtghomhdprhgtphht
    thhopeihohhshhhihhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomh
    dprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopegrnhgu
    rhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvh
    gvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprg
    gsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1JpnaGPPNAU-vY3DZuNwHYUPtfOqodm-H8bpJALe3_IV-2JpaMgK2g>
    <xmx:1JpnaH8DV-91QjMWMGqwzutIvyxiT-R4xubK1SXqe1XWFqxnF3xKAQ>
    <xmx:1JpnaGUzK_GSW4oPYYsf3DbHIQykA0f52R4hIiKCmBcon8WZ_qFrYQ>
    <xmx:1JpnaIcxS-noELVEqMsihqUo43zuT7AK_WtEhAadpC1j_fewMzC0gQ>
    <xmx:1ZpnaKWhUopiowa-Xem54WjTGxiGusGtO1917OruoHWL4zgGB6XV0jPd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 05:11:47 -0400 (EDT)
Date: Fri, 4 Jul 2025 11:11:46 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 1/3] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Message-ID: <20250704091146.GB137171@ragnatech.se>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-1-ff882aacb258@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-add_l2_switching-v1-1-ff882aacb258@renesas.com>

Hi Michael,

Thanks for your work.

On 2025-07-04 07:51:15 +0200, Michael Dege wrote:
> Adding new functionality to the driver. Therefore splitting into multiple
> c files to keep them manageable. New functionality will be added to
> separate files.
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/Makefile                      | 1 +
>  drivers/net/ethernet/renesas/{rswitch.c => rswitch_main.c} | 0
>  2 files changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
> index f65fc76f8b4df8dd9f24af836b6dc0772965366f..6222298bb5582b7091cf8de76acb83ac7dd39c11 100644
> --- a/drivers/net/ethernet/renesas/Makefile
> +++ b/drivers/net/ethernet/renesas/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_SH_ETH) += sh_eth.o
>  ravb-objs := ravb_main.o ravb_ptp.o
>  obj-$(CONFIG_RAVB) += ravb.o
>  
> +rswitch-objs := rswitch_main.o
>  obj-$(CONFIG_RENESAS_ETHER_SWITCH) += rswitch.o
>  
>  obj-$(CONFIG_RENESAS_GEN4_PTP) += rcar_gen4_ptp.o
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch_main.c
> similarity index 100%
> rename from drivers/net/ethernet/renesas/rswitch.c
> rename to drivers/net/ethernet/renesas/rswitch_main.c
> 
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

