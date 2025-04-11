Return-Path: <linux-renesas-soc+bounces-15851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9BDA86301
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 18:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 870471B86645
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 16:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB0421B9D3;
	Fri, 11 Apr 2025 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3DMBe8E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA5821B91F;
	Fri, 11 Apr 2025 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388182; cv=none; b=I4s3JrTqbA02ylxYnB+SAOBCdfr+8A2jGylI/SABggX5j4ohUTWvNq6IDar8/a1beI0K+o4DuEow8eEry+JhiiQj5RBJVLw5Zu9mWD+6XgXXZZs1R7DmeBh+e1W258MbGNOpvQForrK4rGxAct722ocbcBKQzyuv1zel53NDdZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388182; c=relaxed/simple;
	bh=2xLOnobnJNB/BjpuDTwIiL5vfQ3JlI5SqTOn+fLn8Y8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz2BClyC4+EpkmtbGLC50qSKqf3BL17rYPBjSMgN6ykmSpcZptg3p/BOuwK3kt+B4ZlF27q5OrO/1VQKV++P8Dva3A+8A2bBh7DmYqsiAVB5yCZ3M+CnQ01OHE9iBlKZmwLy1hNaNRf6R82ncf7etPKHGnjVvD31KHiN8gNKvqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3DMBe8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C68BC4CEE2;
	Fri, 11 Apr 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744388181;
	bh=2xLOnobnJNB/BjpuDTwIiL5vfQ3JlI5SqTOn+fLn8Y8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=h3DMBe8En4eXq6ouOoXiHBhLql/hno//b0wa9fpaHGgk0bSG0eWvHnixVxt2OGPQE
	 jSx3V3tzBves5w6dYwh0JzC9AE4zaN6LsXCMUTqJ9Ols93RqjETh66/ODLATebQQVQ
	 9w+Q8NLImiE3X/fyBK7tPZ4jwdu/uZPfDhunhOom4n1ybs9llQdL5ktsBluuO1Y3GZ
	 Xq6eRlg7IuRkXXPz1InoS3AL6D6ndHtSEXPsDSSlMEN6Wjvj2JO3wUGtH4tv5g57Pe
	 oxhh1fTyDQYRwvNx3O/taVVMxTRWoxN3aluikAGjsPXi80Kwvt2GnOXvkrzq+lH7uI
	 wK2bsjh2WwUIA==
Date: Fri, 11 Apr 2025 11:16:20 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
Message-ID: <20250411161620.GA3329787-robh@kernel.org>
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
 <CAL_Jsq+sCDEO_n_TLmyNBfhc71NNWWe2UQ21jh8+AdHH=G+KAw@mail.gmail.com>
 <Z_k3JV1dEexJurdc@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_k3JV1dEexJurdc@shikoro>

On Fri, Apr 11, 2025 at 05:37:09PM +0200, Wolfram Sang wrote:
> On Fri, Apr 11, 2025 at 08:38:58AM -0500, Rob Herring wrote:
> > On Thu, Apr 10, 2025 at 3:23 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > >
> > > There is no need to repeat all SoC-specific compatible values in the
> > > rule for DMA-less RZ/N1 variants.  Use wildcard "{}" instead, to ease
> > > maintenance.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> I'll send my counterpatch in some minutes.

IMO, whether you drop the platform is orthogonal to this patch. 

Whether or not the platform can run Linux is irrelevant to whether there 
are bindings. Can it run u-boot? Now, if no one is going to make the 
bindings complete and upstream a .dts for it, then remove it.

Rob



