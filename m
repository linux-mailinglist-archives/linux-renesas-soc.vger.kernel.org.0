Return-Path: <linux-renesas-soc+bounces-5347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4E98C4211
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 15:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C205B23AC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 13:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FD3153507;
	Mon, 13 May 2024 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="moSZqF9A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570421534FB;
	Mon, 13 May 2024 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715607513; cv=none; b=TJoQFDcl7v+lXPvelX+8q3tbPNqn4UiXjaGoEohOH7GzqgT28urh12s8e4+C8FLuMtGIonb016n180vOqkgCpT+pSql0ob5VwbhZkfwIhRxO7eyKszfEn25Gq1Ou28Avx/+EhVS4MUkTo6SU20U3rTutWy3cfwGiuoG09WBhCn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715607513; c=relaxed/simple;
	bh=mh/t03ZZbzAx8imyqom2xpDGT0pPXCZk5cCoNnf+L/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMAgA3JBcUcAkYVivbNuv7PcSUpu0hpJpZqcAzExOABu7g9SkmrcgyQV89IyLQwtY4EJ7DCK/ys1m+wvpdTw/1fWxGGznX5ytJdcu0nT3DOszBSCOdFbMvZMwwURLCRooDPcC5Vs2UZfJLssfB73WF8oa2pzEDde24UXTkXBcMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=moSZqF9A; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1SnTd9k2lziBSzHlw4brSEyZXyK4FJXbfhkdkXg1tl8=; b=moSZqF9A6T45xFix3ilfY7n/K7
	29DzYBTdt+eKEOZ/ZdA12Nw4iEcqd44+CwsFUetM1F8UfXYlJgMU8KbWHknImXfIi4R44y7+EBwkr
	CceWo240NBUPFoBltYs/BK35TFH8xN7vcKXWJbnszww3Bymr3YozyahX+/bnFaV8uHqM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s6Vsg-00FJBa-CB; Mon, 13 May 2024 15:38:18 +0200
Date: Mon, 13 May 2024 15:38:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev <netdev@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [net-next,v5] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <d0d97b5a-02ab-41c6-8fe5-13bb9d9fc6c6@lunn.ch>
References: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com>
 <20240513100931.GA3015543@ragnatech.se>
 <CAMuHMdVF-szo7An5rXEahmZMu3RAzo6krSnU-qsgtNL0a-NrSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVF-szo7An5rXEahmZMu3RAzo6krSnU-qsgtNL0a-NrSg@mail.gmail.com>

> The PHY never applies the {rx,tx}-internal-delay-ps properties, as
> these are meant for the MAC (cfr. "internal").
> The PHY does apply the "*-skew-ps" properties.
> 
> If you mask any *ID part from the phy_interface_t, you lose the ability
> to let the PHY apply any additional delay.

You should still be able to apply the PHY skews.
{rx,tx}-internal-delay-ps and PHY skews should work independent of the
RGMII modes, since they are meant to be small fine tuning of the
delays, steps of a few 10s of ps.

	Andrew


