Return-Path: <linux-renesas-soc+bounces-10932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB99E4CC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 04:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF50169382
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 03:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32443191F8F;
	Thu,  5 Dec 2024 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nx+tAZ7M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C63191F89;
	Thu,  5 Dec 2024 03:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733370021; cv=none; b=cvzSwisvG8owuR+hbPVbhGFWSo6/6omtvB+oAyFrXcWRvGn7RY6Y6MCwP+GPMQZzOuxMEVKjVOAmi2plMlB9dybUp5U3IDO8nnuOKB2Mvw9bq6KPdqTPsqU2Tyxo0nTyRYyibKw4OBhNudipbC2B6ImCgzAGMHTckpKM6G98gaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733370021; c=relaxed/simple;
	bh=iF2fjdiCHpWohu+0NvfCAWvY3XLkHumHKpTgNNkYLkY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPk/SwSkZDTuxVI7RIpnv5OQZ9oNL4Q/ZoOwIe3RP+Jd8zXnmevA2llrk58HI0GKK1PwKJemmrCrlE+q4aUeWLWgAXdlrP+ThTUjVvKvTnUD0Mhn3kFlLhIBpcGzejDTFxS1CiUzftefkDAeExhn3117KeWmiwTjRcsOx9PkcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nx+tAZ7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0902CC4AF0B;
	Thu,  5 Dec 2024 03:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733370020;
	bh=iF2fjdiCHpWohu+0NvfCAWvY3XLkHumHKpTgNNkYLkY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nx+tAZ7MWtnAYoaji5upipw0Qylr74IkEG1Nad3xoMbktPaiR6uPOAR2j2qdRhX8D
	 tpv235kT0ooPt1zVt72xoVa8CiWjlS/mA5Qvv1fnFx9zjuowCyNbfAd4fYHFPLboC1
	 yOfasKxhOWYP3fvMd3IYemxBA8pSHQThplyGYLJhIeuoHu6ladbhdlK3aE7/j2/nzq
	 TaVjghR1knVCJGJfppzIUwPJKY7ZA0yGkcL7ELXvXyUDIdVkzTqEiiTe+BL6jz4k8u
	 ZedvCiHJJiciQPvi8LrYdpGjyM+bRVc55VBiOmkaAC1DcM3oKsdNUplwU5ydDtsXKF
	 1Wj5jJ+1BiaDw==
Date: Wed, 4 Dec 2024 19:40:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Michael
 Dege <michael.dege@renesas.com>, Christian Mardmoeller
 <christian.mardmoeller@renesas.com>, Dennis Ostermann
 <dennis.ostermann@renesas.com>
Subject: Re: [PATCH 2/5] net: renesas: rswitch: fix leaked pointer on error
 path
Message-ID: <20241204194019.43737f84@kernel.org>
In-Reply-To: <20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
	<20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  2 Dec 2024 18:49:01 +0500 Nikita Yushchenko wrote:
> If error path is taken while filling descriptor for a frame, skb
> pointer is left in the entry. Later, on the ring entry reuse, the
> same entry could be used as a part of a multi-descriptor frame,
> and skb for that new frame could be stored in a different entry.
> 
> Then, the stale pointer will reach the completion routine, and passed
> to the release operation.
> 
> Fix that by clearing the saved skb pointer at the error path.

Why not move the assignment down, then? After we have successfully
mapped all entries?

Coincidentally rswitch_ext_desc_set() calls
rswitch_ext_desc_set_info1() for each desc, potentially timestamping
the same frame multiple times? Isn't that an issue?

I agree with Jake that patches 4 and 5 don't seem like obvious fixes,
would be great if you could post them as separate series, they need to
go to a different tree.
-- 
pw-bot: cr

