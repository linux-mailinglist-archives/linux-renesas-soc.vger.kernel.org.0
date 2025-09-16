Return-Path: <linux-renesas-soc+bounces-21886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA85B58B48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 03:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A92324E27CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 01:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333EF19AD48;
	Tue, 16 Sep 2025 01:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fR/ML7LF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D0132117;
	Tue, 16 Sep 2025 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757986644; cv=none; b=sO4Mp626PFNXSME/afmZQlz4C7TpvDKZjuGZkt6qd74nQ1r9DPx+wE1ib6wmc/EByAnTiEIxshOPOhRVZp/zusBO0UF3bBz1KlHwjH931LQB7mt+EVHIZB8RaTxwfRvIDJ8zwK3ln2/J3CaEyKRfyFKZ4ikScY1gChdf3tOGHAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757986644; c=relaxed/simple;
	bh=7HwG7iGKyKIIChKcO1I+A2YrFISPv1gEMBtMTdiCqds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jlVUJjbS6bYfcmCWP+eKv0BUWA4j6iftdLAI6CJf7qXMc+7KzT1Qc1Kvsvd8DTvLuTIiFLljHl1OmCgvD6FJGK4NtxysMaJeifIWh4Sc4RnqXYlBi0IezyTYxrBE2iz1jNL0ZBOM16lbbLUvCAZDmR6YZrqD/iTrKZbEP8tug6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fR/ML7LF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330E5C4CEF1;
	Tue, 16 Sep 2025 01:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757986643;
	bh=7HwG7iGKyKIIChKcO1I+A2YrFISPv1gEMBtMTdiCqds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fR/ML7LFO+0xYXsreQmJ6E9a5P/y4H6ListzR4l8tO/1sF+8YBm2JfnR6PDvkmriX
	 xqeu9PCMCPAHRtd0Y7bhI+7Ny/jnPt9k3HwwKO+kb6r0EThML38uWNtKBk9fcdVsGs
	 sPDOkQNlHbpK0R0U5N5mIPSPoevmXH/H1N9eMbiRQnixQu9U60Wrey2XPvQDoFOY/1
	 3RcCAkq4G7Nu/seQU/9f330kOMn8DOzf+AIom0Am5qud1EiKTBCyO1r3cGKYdaX25G
	 PydZF5Sj3i6M9v5q3HKTtnLflZM2kIfXWjBeNkV7NTXNL6FYrKhBNaLipdUA7y/ejp
	 9mGkcKcanLkhw==
Date: Mon, 15 Sep 2025 18:37:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>
Subject: Re: [net-next,v2] net: ravb: Fix -Wmaybe-uninitialized warning
Message-ID: <20250915183722.50e83484@kernel.org>
In-Reply-To: <20250913133229.2087822-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250913133229.2087822-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Sep 2025 15:32:29 +0200 Niklas S=C3=B6derlund wrote:
> Fix a -Wmaybe-uninitialized warning by initializing the variable to
> NULL. The warning is bogus and should not happen, but fixing it allows
> running the check on the driver to catch potential future problems.
>=20
>   $ make CFLAGS_ravb_main.o=3D-Wmaybe-uninitialized

FWIW this is why kernel only enables this warning at W=3D2 for gcc.
Clang appears to suck much less in detecting uninitialized variables.
Testing with both compilers at W=3D1 is usually better for one's sanity
than trying to fix W=3D2 warnings.

