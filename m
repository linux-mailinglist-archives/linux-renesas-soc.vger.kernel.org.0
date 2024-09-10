Return-Path: <linux-renesas-soc+bounces-8934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27420974649
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2024 01:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FF3A1C24BB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 23:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B27717E8EA;
	Tue, 10 Sep 2024 23:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdcww5dU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA91E498;
	Tue, 10 Sep 2024 23:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726010376; cv=none; b=hpo0lvJ7VMYo9bat07PW7EVE/hlNmTYy7VGqh05F8+voG+1wE+CTQJ6Z/4beLA7pSZQDVppJ+uwIzkqxqH0O/99fqYil7VCqGwQ8u68Iiq/s0XXssyrBdpgef2LZZ9BkirSWEPcl5wghOj4S5P3PEwLfGvqOd+lMuT0F7SSrq5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726010376; c=relaxed/simple;
	bh=82RncKb57cg5IqIsBytvGm2QGPMkZQ1nTHVaecGNaEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTiTRdszVkwUQOdUQBYhWy8OgfboBUQB/IOgz6iwOJzNueUpmv8cgnkw3r03r85UQ3eM22b7TNCuGC+5BLwWRp6D7WF6o6C5gcgbLC5//dSzVCPJykr/WtTKwyYpdDG3vT0Sk4en0yRvGXwaY1OP9MRqsylncEJl+uZONz8Fl+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdcww5dU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55338C4CEC3;
	Tue, 10 Sep 2024 23:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726010375;
	bh=82RncKb57cg5IqIsBytvGm2QGPMkZQ1nTHVaecGNaEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sdcww5dU5CZUVgZHS+8ufxg8jndSgQ1DAR+MsLnhyL2rYBWqzrX59uTCW/zjZss1R
	 IYJ4APtM8KaYD7cfv1zezC+GB4g9f7ZXCusJ2Nm9t4uSJy1fNDR2BLs93wUTCxolJ0
	 YVl2wQ82fsoJpK8Kv3GbqxqiFlIzisz67+tw+Iw75oYh51J+SIWF1sICWa1Sf6KRFQ
	 N03CYGQoZ034vEAPYOxqEVY/8xLoLySkP9XrB2qwMhe09iTUbewBx+AJS/Csb1EAmv
	 vPvXq06jAXZhgEawEDaTzEs9Dxa5kix5k5p9xH9R4YqdCzoUTyqeVGuH12Xd+QSFDa
	 q7aAzlofOv0MA==
Date: Tue, 10 Sep 2024 16:19:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 1/2] net: phy: Expose the direct mdiobus access
 functions
Message-ID: <20240910161934.7fafc5b3@kernel.org>
In-Reply-To: <20240906093955.3083245-2-niklas.soderlund+renesas@ragnatech.se>
References: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
	<20240906093955.3083245-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  6 Sep 2024 11:39:54 +0200 Niklas S=C3=B6derlund wrote:
> Expose the direct mdiobus read and write functions. These will be needed
> to refactor the SIOCGMIIREG and SIOCSMIIREG IOCTLs to fallback to
> indirect C45 access if needed.

I'm not sure Andrew is convinced in the sub-thread on patch 2, but also
I don't understand why you need patch 1 at all. The callers and callees
are in the same module are you're adding non-GPL exports, or am I
misreading?
--=20
pw-bot: cr

