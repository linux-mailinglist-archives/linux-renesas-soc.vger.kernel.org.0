Return-Path: <linux-renesas-soc+bounces-10174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAF09B212D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Oct 2024 23:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913842812E8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Oct 2024 22:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9105188003;
	Sun, 27 Oct 2024 22:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9qNVWKN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F313C809;
	Sun, 27 Oct 2024 22:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730069922; cv=none; b=EQ0aDncLefSocfY0jF6wJXU2RwbQ//qZFZAkGLvVNH3ukieD2uA1y2qZFUKk3zYnbbSuVowx/0gv0iXln4EPYrSvP2EHdHcfGTNrubg+mXjXeOB+JmmX6swn4egD4pGKW9BVSxeJEiUwrBrJB0qt7WD0GwHzRBQgRJT9EX3qYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730069922; c=relaxed/simple;
	bh=xuZ/RwXA2qKEAq4GmM+cR8f2tW1uJp93KvkIixG0wWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyPNWJnuazSRf1qcOGZy5u00UURcNiRf0MIt6cb9Zx8/yAuflSA9UoWRfyB3RTTckMlePeolgWFAbrd124JXdlMnRTMY4FyPPrLwEy4GkMHXzZwM/RnN7fmMc8E0OWXYSsGtNp55vQfC6B0arf7hJ0dmq45XuKYkENMkVG0JRfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9qNVWKN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E54C4CEC3;
	Sun, 27 Oct 2024 22:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730069921;
	bh=xuZ/RwXA2qKEAq4GmM+cR8f2tW1uJp93KvkIixG0wWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9qNVWKNvskfCzKxkyEN3/N6JQpyIKtYn1oDXSZRIAmUpOnT2qL8EPGTRXqziW+P2
	 Zbn7us5r7iy/llP6Gw2BqUEEewVziTYDhjxXSoYV+9TQJuoY6x4YN2mKF9dYptr2AK
	 D72FF8YslE/WMdc/CJfidcOSsoVDzGXM7JWJMxlAlNPGk5AZqr9zfPkULMFYg7huTF
	 WpuUfToOuDjDHvpwU4K+rlnL8IgZ2dXKGEp/VeevQTwLWoGWPX0PyIwr7MhO9hIlZp
	 MGIT4GuCYJfwuHfTbPrxQJFPXRw29IVduwjNbSMIvKs7MSQRl3a+auOvDpDhQbB+IF
	 GISV3U6vTct0Q==
Date: Sun, 27 Oct 2024 17:58:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"David S . Miller" <davem@davemloft.net>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH] dt-bindings: net: renesas,ether: Add iommus property
Message-ID: <173006991975.199814.10779693537983750319.robh@kernel.org>
References: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>


On Fri, 25 Oct 2024 17:12:24 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: ethernet@e7400000: 'iommus' does not match any of the regexes: '@[0-9a-f]$', 'pinctrl-[0-9]+'
> 	    from schema $id: http://devicetree.org/schemas/net/renesas,ether.yaml#
> 
> Ethernet Controllers on R-Car Gen2/Gen3 SoCs can make use of the IOMMU,
> so add the missing iommus property.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/net/renesas,ether.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


