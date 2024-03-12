Return-Path: <linux-renesas-soc+bounces-3722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FCC879616
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 15:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F98A285F58
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 14:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926677AE64;
	Tue, 12 Mar 2024 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmUtnXNi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679EC7AE61;
	Tue, 12 Mar 2024 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710253637; cv=none; b=oM+GOJc3aTKC537Sm73ePPXMTrawF3whwV0sE5ZQQc9ICFmoavylQ4/tqnZMMfOWdY83jgQSchX27g7RBAI8dbHTEizpAnvrHOT8pzrspsqgBptGRXqPayT+AFMMZH71U115AoOchQBsHzH8aGVu0Kdu6zQ8RKWEoPa86YdTDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710253637; c=relaxed/simple;
	bh=FZ+5E++S07UuTE8kz7UTdkgyz0CeI7NcspBf2t37NL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmCDazwqZD7Mk83cTQ7DS58PbTj/CS4YhhL6Uk17W1AYZbjHmt9sDhoqvNArlqvnplrwBd742W1Bhhen2bR1gQtOEkwf9xiWFBV38W/NO3i/rQg/RwVv3cAr08QKnv2qABeR5bAh8PfhWLNyd0cu03Y0a6383KhxtBcUqsilWEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmUtnXNi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08A3C433C7;
	Tue, 12 Mar 2024 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710253636;
	bh=FZ+5E++S07UuTE8kz7UTdkgyz0CeI7NcspBf2t37NL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmUtnXNi2mqlnhdhfSBJV4Alx1esUEI5HB5dRQYzMXLR1d0gDrfZdimxBMDlEwX0j
	 yh4WruQtXKyeUA6wBMRvN1lSSzXPxsgy5CSEj6im+1cJNJMSUIO8/vK8ARIeo9LCOo
	 m2MODvjQhGLCBhl0j1JTwYhh5hRKLw/NZ40JHnqf2HxxZM71DUlvqwhb+J+VdmkE3V
	 aRbAuiV1pl4DNJ/3L3FiIcHGXpJTGHOR5E7F/ErlwzrbLrbQmi8wQhO+ncZtzRM4BJ
	 0Z18+agiL/tVW9RlTKGNrHnRW14wYD6Ri8FGIFpvyZXIwFUjoZaJOQbyRV8hEXP67m
	 8B0pG43/3ulyg==
Date: Tue, 12 Mar 2024 08:27:14 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paolo Abeni <pabeni@redhat.com>, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [net-next] dt-bindings: net: renesas,ethertsn: Create child-node
 for MDIO bus
Message-ID: <171025363190.2187356.2945804003837370493.robh@kernel.org>
References: <20240311143507.3239566-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311143507.3239566-1-niklas.soderlund+renesas@ragnatech.se>


On Mon, 11 Mar 2024 15:35:07 +0100, Niklas Söderlund wrote:
> The design for this driver followed that of other Renesas Ethernet
> drivers and thus did not force a child-node for the MDIO bus. As there
> are no upstream drivers or users of this binding yet take the
> opportunity to correct this and force the usage of a child-node for the
> MDIO bus.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hello,
> 
> Learn from the mistake made with the Renesas AVB bindings being worked
> on in [1] where no mdio node was used to describe the MDIO bus and the
> PHY was added directly as a child node to the AVB node.
> 
> The Ethernet TSN driver is still in review and have not been merged and
> no usage of the bindings merged either. So while this breaks the binding
> it effects no one so we can correct this mistake without breaking any
> use-cases before we need to support any backward compatibility.
> 
> 1. https://patchwork.kernel.org/project/netdevbpf/list/?series=834331
> ---
>  .../bindings/net/renesas,ethertsn.yaml        | 33 ++++++++-----------
>  1 file changed, 14 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


