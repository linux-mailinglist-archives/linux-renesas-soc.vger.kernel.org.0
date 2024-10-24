Return-Path: <linux-renesas-soc+bounces-10034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B619AE457
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 14:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9926B2198B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 12:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E22E1C9EDB;
	Thu, 24 Oct 2024 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gM67LttW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710A14B08E;
	Thu, 24 Oct 2024 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771489; cv=none; b=biBiB8pwJj4e1I4UzDGdXl1ucAVza79FuNtI53ON/0kKFWs/MAHS6jr/rQfIeWADangIUVyWIYsOkxrhMcumDrihyphBiSlx3bR3bvnQSUe+UaMG/nqC1FyrmIrkJcLBlshx0WSWYAoajUAkDbhqDlHOvn2ah6KOUa8QXbZOCQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771489; c=relaxed/simple;
	bh=FcMCiaFRo3kGba187T7zojUyGGnsDRGiyR/wfrL8rQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQKds04nzPAaOcezxhXT8taA8vAiSMKmJBLMspO/f8I0HiS8+naLCp75Mho9DMNWpPiZEINQGwnmINFT9gDItCzDoHY9gbY74j5nh3BlUc94rHS+ASjkE257lPd+O1j8PkA15UairlepXZB9a52Tlmmg321bI2l/VdEVMHt4nmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gM67LttW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612F8C4CEC7;
	Thu, 24 Oct 2024 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729771488;
	bh=FcMCiaFRo3kGba187T7zojUyGGnsDRGiyR/wfrL8rQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gM67LttWJEQYE6fh7e1zWGzK4TBOPLNh1MNYpoAY3pVgzeDCXqysQv6ANOia7vGu0
	 3oc6jDoWGUTPh5H9FfO8dti8QbFgMYmqru7PlR+RdCCeh/DQ+pIuKhenHzkZbylX+f
	 y64/MtahT4QZB/Tuu2ZCXPeQTPC19RBxL+68JA1WyhIynRxN8Ce3okxdtcFEvPuHyO
	 I239lqzH6tGuUFrgssWS/8KGM86i9m6b7QgBphVl5oOa9xQkAWYqud2X6py6K8XqxK
	 WiI2TtsUC4QExCW8zh1fdwvn7AzyF3uuhq4GoLQwD6Wo5U3/5gP4sKbijwjsYm/wBq
	 2b6NNush6atMw==
Date: Thu, 24 Oct 2024 13:04:43 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv2 net-next] net: dsa: use ethtool string helpers
Message-ID: <20241024120443.GI1202098@kernel.org>
References: <20241022201629.139244-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022201629.139244-1-rosenp@gmail.com>

On Tue, Oct 22, 2024 at 01:16:29PM -0700, Rosen Penev wrote:
> These are the prefered way to copy ethtool strings.

Hi Rosen,

As it looks like there will be a v2 to address Geert's review:

prefered -> preferred

...

-- 
pw-bot: changes-requested

