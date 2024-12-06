Return-Path: <linux-renesas-soc+bounces-10982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 709FB9E6264
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 01:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0001677DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 00:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41D518E0E;
	Fri,  6 Dec 2024 00:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAi9e/7M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950562F32;
	Fri,  6 Dec 2024 00:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733446030; cv=none; b=hCBUVZogzlhIgx31jDdERr3LoMUMpu7809s9E+4cIr8gOls2RX6sFUi26hPl+dVBXVOVfPl3FGUFo5qHVb5cuTPguWxLWKl6zH1SZJqedPz/2qMzNgOd5HBRYm6yHE5PkcapdLGVqxtVQusnyQC3pw34kxhC3+/uSXw0AaB9xw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733446030; c=relaxed/simple;
	bh=qTk619EP8BquDWI3RIvDV3o4XR1pfGCPvLu6/s4l0AY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXPntNt6U+lM7tI1ykU1auCZ3tSoMf5kDOceymC8v/ft61UOyiaQeD3Qweunm8z5HjAaOR8DV9jbLQZqZQjEdYZMTVRTADLhPDISnLv0oFoy8zduCkqZonyMUvZw4ARhVlYrPj5z2iC75wcsBhQNzRjsIyKki4nBwiRcs8OrcMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAi9e/7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874BCC4CED1;
	Fri,  6 Dec 2024 00:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733446030;
	bh=qTk619EP8BquDWI3RIvDV3o4XR1pfGCPvLu6/s4l0AY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SAi9e/7MlKc7iAR11XIPgE/t2nmmfRtA5qBvhR+r0QOwpfNFKv689H+WtkF0NzMVu
	 Eu+ViNh69njOGN4T8eP1X3DwxZdbBq/s3Nrm5q2mpvrjvKf5359QlC1iH+UqBuRlCK
	 2M2KhknAOEFVx1Vz9DMAPB88EJXKpGPI1nJ8wNQZ5SAKTX/kM94QTEPZNJOH0tPSmf
	 eYGu4JajSKA6LJd4dAfDGGufiNZkwKWCpA9x9jmpK+FLp7t/39RODkPV0DNohOcb70
	 F78woE/QqBG3075kZt3i/YgW21l+kqwtM3ZKOqZtMHy2jDfq+aaZwjpmanbh36IUwf
	 3CGmbErfRTipA==
Date: Thu, 5 Dec 2024 16:47:08 -0800
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
Message-ID: <20241205164708.319cbb92@kernel.org>
In-Reply-To: <9b2607ac-a577-49ca-8106-b82b25723439@cogentembedded.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
	<20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
	<20241204194019.43737f84@kernel.org>
	<9b2607ac-a577-49ca-8106-b82b25723439@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Dec 2024 08:46:15 +0500 Nikita Yushchenko wrote:
> > I agree with Jake that patches 4 and 5 don't seem like obvious fixes,
> > would be great if you could post them as separate series, they need to
> > go to a different tree.  
> 
> Ok, will repost.
> 
> Shall I use [PATCH net] for all?
> Or [PATCH] for fixes and [PATCH net] for improvements?

Ideally [PATCH net] for fixes, [PATCH net-next] for improvements.
But it's not a big deal as long as they are separated.

