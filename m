Return-Path: <linux-renesas-soc+bounces-12917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57577A2ADCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 17:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88BD16A297
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 16:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68074237173;
	Thu,  6 Feb 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ip8dSdgZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CE723716F;
	Thu,  6 Feb 2025 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859491; cv=none; b=TKhyQ5YvOq9tBKZXIQWoSm5hg54k095ePHBwj8+hffnMwghAhrLcVRsAWblnKIyZLSpD0U7CMoA6ETy152Cbakzgx7Ly042+74YcukUDbrIjg/nFa7Q58PY4ORgtt3YG1u+1VDs/JyWhEN3krPj9xopUm1QvA0GEMT918G7msog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859491; c=relaxed/simple;
	bh=O7MmoChRGtc8LpF5Rkcd2RkPAj/N0FC4Lbj3w9f4ER0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWdDwMRZ8sjDpWf6ESeKx44lw3yPPicTgfyoKPjisBOUfXOXQoV16GJE2H6IcUu0+xxKMEg89pPp5wNt3sxAfO4uBzyTHVrvc4C6nLYZ3j4zTk2wTSMc0IvZriPOAP0zu/amOL6fpHl6N5XqtetP0+YNb0dgVNPbMqmnBQ/ACQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ip8dSdgZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7F4C4CEDF;
	Thu,  6 Feb 2025 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738859490;
	bh=O7MmoChRGtc8LpF5Rkcd2RkPAj/N0FC4Lbj3w9f4ER0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ip8dSdgZaiDZe7CzVI/3NkwS4I63q9V9WkOGkF+fHo/t3zXUQ3tAHCffRi92hQLmN
	 i3FzSF8QPnAXcc+siOGmmc02BeDEwUS6y8DEagD5b+dN1H+nk3diOEG/B6YCgse1jZ
	 BgfwtGfRtj/pG1N3tgJSzKfVoYfaLrCU0bI7zraO2lUrwx4e9TIDlJjqgiUbKsOs9s
	 0w3efNRGkP6OUuCWWr2WSyvlmMB9Mb5Noy8id6oSwtY9kmLrx2Tec2N0+X2HV65dYF
	 gRd79u63yCpeFvrEugYaN7YmNDcuBbrBOKR42Ye11VtRQ4QKyKDhheOYhsoiAE3kYP
	 rvGyu3aw3AHRw==
Date: Thu, 6 Feb 2025 16:31:26 +0000
From: Simon Horman <horms@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] net: renesas: rswitch: Convert to
 for_each_available_child_of_node()
Message-ID: <20250206163126.GY554665@kernel.org>
References: <54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be>
 <6d09e337-8bca-4ef7-bbfc-d824829ad211@cogentembedded.com>
 <CAMuHMdUgydc4q-dSsUQ_zLpkvbv9-26T3tpEO6e7OF491jTrEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUgydc4q-dSsUQ_zLpkvbv9-26T3tpEO6e7OF491jTrEQ@mail.gmail.com>

On Wed, Feb 05, 2025 at 05:18:14PM +0100, Geert Uytterhoeven wrote:
> Hi Nikita,
> 
> On Wed, 5 Feb 2025 at 17:15, Nikita Yushchenko
> <nikita.yoush@cogentembedded.com> wrote:
> > > Simplify rswitch_get_port_node() by using the
> > > for_each_available_child_of_node() helper instead of manually ignoring
> > > unavailable child nodes, and leaking a reference.
> >
> > FYI, I have a patch in my queue that replaces this code with traversing child nodes (via
> > for_each_available_child_of_node()) and only creating devices for ports actually defined in the device tree.
> 
> OK, thanks for letting me know!

I am assuming that we can treat Nikita's patch as being orthogonal to this one.

Reviewed-by: Simon Horman <horms@kernel.org>

