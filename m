Return-Path: <linux-renesas-soc+bounces-11200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EAA9EBA88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 21:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27EC1883938
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 20:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC70C214221;
	Tue, 10 Dec 2024 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pelv31Vc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0823ED5A;
	Tue, 10 Dec 2024 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860881; cv=none; b=XVTl0Z/Km2w2EpY15PcmdToFkra/FF4K+mTdWU4cOmY3r1yHhQdPptvANYSJo1mqYO74NRTJ1EYcud8+csfeE7wC6eyKbFPH5NZr56eO1ZYfGF5thLmOwU3Fo3nGHwf34o3+b8e7eisr7z0aOQEOO0QMHG/43vZxTicPF++66Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860881; c=relaxed/simple;
	bh=YXV+agBAHaQx3JUMim2czM+in4PUNgRqxhtN1zSl5OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiKfnoF+SLpjtAQfLv/2s2AAUcS3jqLQx0D1F16aXsmNfZXcLUlFTJvs1s4qEhVGRWDaHPVb7gTF7UOSw8SLQxLzfXV56wiCZaOEw7h/PTnx73n2DCnur9g2NZWfO7AWSS3OUQos3S0M/3S2IqO4FPAy8NWBeCuMCqtBNIMijQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pelv31Vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EE8C4CED6;
	Tue, 10 Dec 2024 20:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733860880;
	bh=YXV+agBAHaQx3JUMim2czM+in4PUNgRqxhtN1zSl5OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pelv31VcxFqNTcIbe39dodlW9atq5X/iCdE9Q7tkluic/0p/XsfEw+n5bbqWmN1AH
	 pvbyiELRKo0Y9npcupyI1eusdy5Nj6Pkk+ANPUTY52oqw32uktdOTvUpD2DrJGfevR
	 zaJbh17OeQDR6u+R7vCV4qM02F2TaSfN6DnHfsgGzZz26502PSPiW3FHSJxYNgVG78
	 1l9WaFeXQbw6sZHRTA9YQQJ6uJ1PiP1LaT5hozlIGqVD6/zHIxhXzGIm68qzmKUon1
	 rrHHIgdpvHR3k+RBwGpZP06yMsgLttL9SwxY6jEYICLCBWtAfe+7j6nYpQbjZRyosB
	 ITbEUWlSj/tdg==
Date: Tue, 10 Dec 2024 20:01:15 +0000
From: Simon Horman <horms@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "nikita.yoush" <nikita.yoush@cogentembedded.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net] net: renesas: rswitch: fix initial MPIC register
 setting
Message-ID: <20241210200115.GC2806@kernel.org>
References: <20241209075951.163924-1-nikita.yoush@cogentembedded.com>
 <TYWPR01MB11030BB4AC02261FF655A13CFD83D2@TYWPR01MB11030.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYWPR01MB11030BB4AC02261FF655A13CFD83D2@TYWPR01MB11030.jpnprd01.prod.outlook.com>

On Tue, Dec 10, 2024 at 06:30:41AM +0000, Yoshihiro Shimoda wrote:
> Hello Nikita-san,
> 
> > From: Nikita Yushchenko, Sent: Monday, December 9, 2024 5:00 PM
> > 
> > MPIC.PIS must be set per phy interface type.
> > MPIC.LSC must be set per speed.
> > 
> > Do that strictly per datasheet, instead of hardcoding MPIC.PIS to GMII.
> > 
> > Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> 
> Thank you for the patch! I could not apply this patch on net.git / main branch
> and the branch + your patches [1] though, this patch looks good. So,
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> [1]
> https://patchwork.kernel.org/project/netdevbpf/list/?series=915669

Hi Nikita,

I agree with Shimoda-san that this does not seem to apply cleanly to net.
Which is a requirement for our CI to run. Please rebase and repost.

-- 
pw-bot: changes-requested

