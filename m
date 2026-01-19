Return-Path: <linux-renesas-soc+bounces-27040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE125D3AA2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3DCC3001183
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 13:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB72368298;
	Mon, 19 Jan 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYqOMNv6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4636827A;
	Mon, 19 Jan 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828834; cv=none; b=M5Zg/WBkkP2zAmzxf6CwqbSoo848AOz0W7yPBhINhkfH5NQUQKL8MaqCinFzF3Uc3FcmJBS+AoTG6j/kBJ2MG8Hyr+EcL+HjgFzWOW3PonR6TmSX7OxcyIX1UXPKzkjSe7QfjvZdSCb/FCkKfE6gIo8+qXwEvMcyxTEjwPydGnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828834; c=relaxed/simple;
	bh=Jljzdrq4r/rY5hYR5tbzegDR66TZ8LKmWCEKANj2q0M=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=qH8LJ2zPMPyb0SL0g5EWQMtWhlP9iyvs9OMmAakSLa5y4sftlfOel7BCSWIVAI1D9OTKInXwYzrGzV2GHnzKVAgpenrEP39K+3GIiJmTJ2YpNFRoJKTFr5y2uqC/ynQ6VC9txeLpa7sO7YmLptDNDn4JmzCjBzIG/5Tium5+Cyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYqOMNv6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5023C116C6;
	Mon, 19 Jan 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768828834;
	bh=Jljzdrq4r/rY5hYR5tbzegDR66TZ8LKmWCEKANj2q0M=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=LYqOMNv6K//ghc3wg6xqGAnjEk9y7lgkxB77d8PfRJZ0NgwDf4IdMzIiF2CM+pZTr
	 tp+dNB2zzIvG6F85ubonr1U8Z9HLFwm2La8nG088JaBLNRCnd+oN7MYgTCL/FvpB4z
	 8ZSc4pYJvGyoRhwQsYZYC6fPhbHnH6OFx2mLiCVzliYTY0U5V/z8j4R7oviRAvL35g
	 4dRcVJIVx7nxlu7YPz2cwPbUO1vCu4+J7IpIt+Q6Q8KAqOXPB14fi0nUDP7Eu3bLYg
	 oxfXosJm8l1f6KyAoM0Ufa3ANpnn246RhC+8beVyM1R39hIWt3Ivm926qthW+w2Iz2
	 RDepxu4iYp6Qw==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 14:20:28 +0100
Message-Id: <DFSLHM2ZBRE8.1JDMK08LNYYKT@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Rob
 Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-renesas-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
 <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
 <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
In-Reply-To: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>

On Mon Jan 19, 2026 at 2:00 PM CET, Bartosz Golaszewski wrote:
> How about of_machine_read_compatible()?

SGTM.

