Return-Path: <linux-renesas-soc+bounces-23450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D5BFED14
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 03:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174BA19A023F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 01:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC931D5174;
	Thu, 23 Oct 2025 01:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t90ryWUD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E217A305;
	Thu, 23 Oct 2025 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761181986; cv=none; b=mBdLdQjzA0CHYI5wBnzAyNJE4Th6R//5d8yfsuLKQ6ua/k2Ak1mSPG/r2r/hZyDuEZsvuFvoohwGqjkPuYWLrXZHvP0Cp2BrHLGH1ZWlZLlBanzPozjtxAdQkC117k/Wr4sSMOoEfx9nCR9Ry9mLRYLORm43SS244UTASVug07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761181986; c=relaxed/simple;
	bh=jd2RQXnIrWi/0UPAGodHVow/J7/N5lZwqIISJWkzUls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=brdoRNgll7z/nk5p+N/zgEDr0e4hFD1YX0SXH4IL5xFRcZIWELY0gGkSju9mRJAcSlPJYAb3CVqWhDQA3EcxFZ3heo1M3lymgPI4d+vhBTuFr6G+Hnaq/43mWZSlj5E+X1AGp7ectFjoZ7v5mgt3hnm02Z1YkURk1dVnHIisdXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t90ryWUD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C58C4CEE7;
	Thu, 23 Oct 2025 01:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761181985;
	bh=jd2RQXnIrWi/0UPAGodHVow/J7/N5lZwqIISJWkzUls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t90ryWUDFgo0LESriCzY7nJDdQkw1zsv4O+AOoHLLyx+eNhQZiLYiuYFR16M3dZSZ
	 xHWZEt/YY/MjnJ0xypJHjpyvGI5ao9PNccPkLtu73sx2Yzpm5Va4L0Z6w6oGdrdNcy
	 Q9xGS5hpWKo40CDJG6ivcVrmgYb4/bLZeZu7MlrrYHJtnwu2crV7PC1fOJWQ8c0o69
	 peOmPLZl/qvzKCBxm9khXMC8xTl9jd/2C7K3ZvblIlckjgmwKLJ3HCJtsacjB43Ahp
	 iy3Y1sGPD64qBJJIXSI+2xXhFwNOg0ViN8+gf1pDI+/yhesx6dZ6J5Vqwv3S8UwzLJ
	 KFWp/A9WPn+Kg==
Date: Wed, 22 Oct 2025 18:13:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 1/4] net: ravb: Make DBAT entry count configurable
 per-SoC
Message-ID: <20251022181303.3dc4f41c@kernel.org>
In-Reply-To: <20251017151830.171062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20251017151830.171062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 16:18:27 +0100 Prabhakar wrote:
> The number of CDARq (Current Descriptor Address Register) registers is not
> fixed to 22 across all SoC variants. For example, the GBETH implementation
> uses only two entries. Hardcoding the value leads to incorrect resource
> allocation on such platforms.

What is the user-visible problem? "Incorrect resource allocation" could
mean anything from slight waste of system memory to the device falling
over.

If it's the former this is not a fix..

> Pass the DBAT entry count through the per-SoC hardware info struct and use
> it during probe instead of relying on a fixed constant. This ensures
> correct descriptor table sizing and initialization across different SoCs.
> 
> Fixes: feab85c7ccea ("ravb: Add support for RZ/G2L SoC")
> Cc: stable@vger.kernel.org

