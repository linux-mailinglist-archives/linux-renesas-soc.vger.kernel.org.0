Return-Path: <linux-renesas-soc+bounces-5671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 844078D3C62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 18:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8D71F26863
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 16:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4A61836E3;
	Wed, 29 May 2024 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="o6kE6DNB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ip8GNY/3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4F1836D1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000090; cv=none; b=URnAnAoOS9ABIgqrCMXut/Rcm7zjdZbsl81XMOSzUNLHki452hMw8TpNH93Mo9SE4E6k5MYDiCmHgFG5n4kTwWRXC086fMhqjajbPVSXEpiEc0/Ftvf1DEltMoZi+9oX/wlVvahmLERz4ynn/8BdfNlD+dipNC8qoDFzAtWbVDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000090; c=relaxed/simple;
	bh=ResXvAlVy2uOHH+DYTwBSawbPrmDz8nxf3AM3qOKuVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2ij8vxtBbX2/KH830lz3WUeMxW5nxWSSrXE3J9KaaYmJG9CpY6wSrSoE0z3BJHMl1xQ/oD57stZUIyuB6mPvZiBdEPePAcxb7IBAIBfcdvN3M62SVmsb25BjKCC6PhWpqX/2UjFnIvHeExfRV/8lLzBIiNVCEf28OId0AyUUMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=o6kE6DNB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ip8GNY/3; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id A8DBC1800110;
	Wed, 29 May 2024 12:28:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 29 May 2024 12:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1717000086;
	 x=1717086486; bh=jmbmvyCCNV7phqa2dhf0B3A3jQXpedZHlzeCbL+rHdo=; b=
	o6kE6DNBqpRmN9QVI5xsVJJHayqUnbiFMBTeM7dGLVXLi/W9uKjPeUEsCJxSKOBm
	hbiTpZ7RJBGycnER1HJ8KI1tM3ahf1vt6vMMUM8Sl2iMms/wGa9LVR+dK/nrCdu4
	RAwd918Oa1fd/sIFUbGhpog8gcghxMjrVzpnxz/Q8lFRBrW4Klvj2zIDkFB1RADu
	PSNKiavknvn7Eew8Ln20AuOj2AVSx7Q0WZ4j/dueMH69hch+ZevntsAKuroQhhor
	e98i8r+Si+CQRBVZ0arTxJ136Bu1pdL+n91Ylpiez/Qf2dG1mvIUkn0d6cHfdIpC
	b3VZ/EnLLYldM0+Pg5GXJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717000086; x=
	1717086486; bh=jmbmvyCCNV7phqa2dhf0B3A3jQXpedZHlzeCbL+rHdo=; b=I
	p8GNY/3ujX6c/IJNbiwv2InpylaOwGnoelBl7RNGFS/KXvi3R4MOifZpB3RRn3nG
	5L9nbSRW928NhoMwyho+fR43GtGadVC74t0tkL+zDFQXZReEXv02mwOtzS/g9Jf8
	QhtlW7eY4XdmxYwROetQ9+gVEM18Pc5z+ELNtV+avXitak63z/sdeLKOmNME6qtj
	q3S1tK9cCTPSbAPOP3bPh9HtKO1CIJWU4J3EUUcqz9Emi/PUgYO4DsJu8fbbGR6B
	e9ZXpr72RbS4TJHG2lpX6wEyuvQVGlpRqeVZiqCWpgvCHPHGKs2klDN44Ej3fT7a
	s3DvnxqcVhAnE6aQyIzFg==
X-ME-Sender: <xms:lVdXZqayArm86ky1xNNQbN8gG_X6lDZuRVwYwKaJGVIUcwjMAOYuHg>
    <xme:lVdXZtZQpR8GAeNKA2kCPKEy6a26km00GFde4MgESNsY9oBgB-XupCEIO-qZtcPew
    iQrdQC3eVdm1C_3IR0>
X-ME-Received: <xmr:lVdXZk8HrBCLY-SUDi_5bYrd7sudf-mDs1qeiTS53QCl3xB4F_R1xCzfS_wWWs7MNkxw07-YVNnx_rKt9zj5yzvcpHkOIBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekuddgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:lVdXZsqChyu4dKWfEwlDG8EPzUTcg3C12QLjGbB6VEGFYj_-g4TQkg>
    <xmx:lVdXZlrwr0J4oI2MJseszP8aEQCGHXWkqcHGI-w0v1nlAsVJw5vHIA>
    <xmx:lVdXZqTOuJaHZcHCNgbC573feAkl7CVJI3I5DshXePAG8rtuD3gBoA>
    <xmx:lVdXZlrlJGAz3gTRR63g4hX2oO-z1GHZgVpBGu2JeAXZumq3NzalNQ>
    <xmx:lldXZuCZ-zRNmFD18kCsJ7z3D_dWU95Bny1U1tGOgem8X_duBpAorG3->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 May 2024 12:28:05 -0400 (EDT)
Date: Wed, 29 May 2024 18:28:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable Marvell 88Q2XXX PHY support
Message-ID: <20240529162803.GC710180@ragnatech.se>
References: <c5dcf03facd05e8b9c5ac89b2b81b005b141f086.1716998320.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5dcf03facd05e8b9c5ac89b2b81b005b141f086.1716998320.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-05-29 18:02:16 +0200, Geert Uytterhoeven wrote:
> Enable support for Marvell 88Q2XXX 100/1000BASE-T1 Automotive Ethernet
> PHYs, as found on the Spider, S4 Starter Kit, and White-Hawk development
> boards.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v6.11.
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dfad1cb8a072fa98..66d779547f0f6d66 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -377,6 +377,7 @@ CONFIG_AQUANTIA_PHY=y
>  CONFIG_BCM54140_PHY=m
>  CONFIG_MARVELL_PHY=m
>  CONFIG_MARVELL_10G_PHY=y
> +CONFIG_MARVELL_88Q2XXX_PHY=y
>  CONFIG_MICREL_PHY=y
>  CONFIG_MICROSEMI_PHY=y
>  CONFIG_AT803X_PHY=y
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

