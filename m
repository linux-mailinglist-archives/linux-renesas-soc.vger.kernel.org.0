Return-Path: <linux-renesas-soc+bounces-8815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7F96F5CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0AAD1F213EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 13:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03BA1CDFD6;
	Fri,  6 Sep 2024 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dttZ7Hm6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lE0bsu0t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9BF13B5AF;
	Fri,  6 Sep 2024 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630726; cv=none; b=Brmge+9f5uUiLA3hktjUtezpIfcr7+wXWfhTMiBabd/5erb82k5AAfPZp9fnW1XamrQC2bP2S9gJTeFX8ODTjzTCKpOAAkYIG6tvTZ1ZjBKn4+XvXRPAyJLtVgCDSBH5sioED1u56OQRG1anQkSiHofE9v4BkmyfrNgfLaUpqjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630726; c=relaxed/simple;
	bh=akdG8RqNU3qIrWuHfz6LQJ8ze/zpJPmPf/+HNpSAFnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED9FhxBUUBxke3b8A2Iu6jMgMmf+FYsxTGQ1c0hGTpR7XUktXRtOOWu4HIm44FEl6YZ1uMaW8uQ7/qSALgzgbapZznhHcF9BFuTCD9p/Z0vMLVn5+vhKMYX6px2m4xgMMwFd3diyW+mTpJb9z17BDQAuaNMu8FkfXTV8Wzj8Z0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dttZ7Hm6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lE0bsu0t; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8762A1140106;
	Fri,  6 Sep 2024 09:52:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 06 Sep 2024 09:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725630723;
	 x=1725717123; bh=lhMq9rtgK06nAhd8PYNWR3IAuF/dmbHwCkuLYonsdbs=; b=
	dttZ7Hm69GoJwe/kjU2NcWyyVMroMxL6GRPTM7KtECprCYrSFZg2PCLnzuAASwaB
	iIOAsmnsPn+TYNaBf2Kyx8whgoHkvZ+rVnQdCgBlTzKl07rYt3M2kQhgFFCmUhs4
	sijNuAG922meR4AOEW5jb14xy1enUAFg5KBOZjN8YdgYJ6faQGiOg7GJlP4stHT6
	NZO4DIxf4IWx0GthSP3v4qLn2Aa6ERbKOi5FEJqbaAOqq7qzNnxlfjZcpP1fEBxk
	25n2hj1NLioY/67hheAAOK4U22Ky5AW04bnrUdgPYNdaFHjWrW6e2Gbw2vKOG697
	0XVjLcagq/JTkADXsp614Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725630723; x=
	1725717123; bh=lhMq9rtgK06nAhd8PYNWR3IAuF/dmbHwCkuLYonsdbs=; b=l
	E0bsu0t+xulhwkKLB6CpmDREPYN1WySZu5xpeuzf9m0XJZM89qq5kopugNsz9E0c
	HDESyvuQ2R2/hki+m52VgPVo4FsCLPwNxPG7jvEHI94vqF91iVpPoNrTxMwCn959
	dEbk/mvtjCLteIR8/hN0Qa86LJoo1MuVDXk3ZdEYVNoIbo43QMguGOEnu6EBsFkz
	iG/ftOLw1L4F3jqBu44v75HFrmL1z4UaoFVgege1huqcGz9y3nK/ALw1iYhi3Wdr
	hB6h0UMBIw+WPs/3oM5HNyiaIxZdNvJAZGFyzwiEl7V1FxtPYuK5N/R0QoteZxBs
	ZCDmFlRQLGeptHCeVOOrg==
X-ME-Sender: <xms:AwnbZv6pjiE0PWnrSCSrEO4boAaCNrpVyVHICasyNPNy4Q_7XMXRXw>
    <xme:AwnbZk6xlrhq2kXs6hrqWn3vJfsgxpEwISHZ4AXhvFaUMxaZfSpcffhpkt90ubENs
    wpjnwFp-4lGwoFO-sc>
X-ME-Received: <xmr:AwnbZmfqvQqxK0_MbWQHB6TzNQeyPXsrC44FJd0GX1_ialmj4c2Tu2Yg03OugYSADK8x5AFJdjzuzQECOIYWfaTPBvu5a-W0zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehg
    vggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehmrghrvgigseguvg
    hngidruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AwnbZgLETOHo4-jzIGwXlFzB0XDqk6HYWyQrWeyzMY4rtnXf82EeMA>
    <xmx:AwnbZjIF5Y-C_OXfOAQ_SbDmy_hLe_shVmff2KhwY3fyf6ZW4GKgLA>
    <xmx:AwnbZpy-LK4VTcidJk-FY6lwRx6780pEO5U0tg66ZjNcdRrICc9b6Q>
    <xmx:AwnbZvLhus4PTROe_Fqw96EZbwhYuUK4fjL5AXfshY3kuqwba23OFg>
    <xmx:AwnbZgorZ5VOiTaddiLbjjlZ-eW2xQ5L5huK47xJsxvNhnVK_yeDi7cy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 09:52:02 -0400 (EDT)
Date: Fri, 6 Sep 2024 15:52:01 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset
 gpio to mdio node
Message-ID: <20240906135201.GU3708622@fsdn.se>
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
 <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
 <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>

Hello Geert and Marek,

On 2024-08-22 15:56:44 +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Fri, Aug 2, 2024 at 7:16 PM Marek Vasut <marex@denx.de> wrote:
> > On 8/2/24 10:33 AM, Geert Uytterhoeven wrote:
> > > What is your stance on this?
> 
> > > On Thu, Jul 4, 2024 at 5:26 PM Niklas Söderlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > >> When creating a dedicated mdio node to describe the bus the gpio reset
> > >> property was erroneously left in the phy node. The reason for adding
> > >> mdio nodes on WhiteHawk was to ensure the PHYs where reset before they
> > >> were probed, keeping the property in the phy node prevented this.
> >
> > If the PHYs should be reset before they are probed, that is something
> > the PHY driver should take care of, right ? The PHY driver can bind to
> > the PHY via compatible string. Does the PHY driver not reset the PHYs ?
> 
> AFAIK, there is no requirement to reset the PHY before it is probed.
> However, the reset signal may be in asserted state when the PHY is
> probed (e.g. after unbind from the Ethernet driver, or during kexec).
> Identifying the PHY by reading the ID register requires deasserting
> the reset first.

Did we reach consensus on this? My primary motivation for this was to 
align it what is done for the other AVB instances on WhiteHawk, which do 
have the reset-gpios property in the mdio node and not the phy node.

As having a mdio node at all is a new-ish thing for AVB as this was
needed or the mv88q2110 PHYs connected to the other AVBs to function. If 
we are happy to have this here for AVB0 I will drop this patch.

-- 
Kind Regards,
Niklas Söderlund

