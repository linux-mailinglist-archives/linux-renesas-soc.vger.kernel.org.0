Return-Path: <linux-renesas-soc+bounces-3720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE77879609
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 15:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AE721C21C9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 14:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368867AE59;
	Tue, 12 Mar 2024 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8YGi1sc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAEB78286;
	Tue, 12 Mar 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710253522; cv=none; b=suqBgVPABkW6486vgeHKSn7E1IiNjh8QSzPQ5HfZqsle9Pzbx3WhVzD9hX4uKX5KLNlWYcN16eA9XpgR/F4sulzunbFcN6FT+BpjpGHHew+Uyzb3Wv8sLvG7lLEJ/XkDt7Yr/E+qkojr52zJxJQC8tNkLJu4zWQ/RR762WMUe7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710253522; c=relaxed/simple;
	bh=YLVKVSiLdzoUjTrvntRxylzzbA0IzEETg0xjBQvOd9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiZaOvKPsHxkfN+YkACA1V4kAkyCTYGNi24JwTXdC7EurgjS5JyPHAvS69kEJ1gxCl09nL9oYDiAGfPes1iRkc/LHMgLJK1N7hB4W2uYZvDaAOsaW9NyrmGux/lX+qHEgCsyyj+wi/IZqDBKNajXSZ/rSDyC6tVXBEADy9mgdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8YGi1sc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516EDC433C7;
	Tue, 12 Mar 2024 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710253521;
	bh=YLVKVSiLdzoUjTrvntRxylzzbA0IzEETg0xjBQvOd9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8YGi1scEIqB63Lg49Bf+zXS3z2Ju3fVhVYxbgOd4paMggt8H/GJNUPyxoy7TIn2D
	 mX8TC87c9tfjdyglZKMrpH8MUrxJaY2pfGRf6c5nS2d1Q2bdYfy66lCm7VSrtYhxIt
	 iRu3XTgpYqe7M1wluzowUB58tgHBIpRT2wbaHKYNxqqZPIi9gGhtMBoZDWkfBWJI2F
	 E1vAqangOty8RqiJvjoiqILzd1bPInvhIojTufXPI7qLOxaq17zsEq7GZzxU8xWML2
	 zM8lAvnKVQ+qkCDLRY+wlZ0vMzSpJOtEHEw/+ewrzrfSwylsBGDL4r4U75UrE1DJkG
	 CAS47MciHXlzg==
Date: Tue, 12 Mar 2024 08:25:19 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Eric Dumazet <edumazet@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [net-next,v3 1/2] dt-bindings: net: renesas,etheravb: Add
 optional MDIO bus node
Message-ID: <171025351499.2184869.13718020615460708679.robh@kernel.org>
References: <20240311141106.3200743-1-niklas.soderlund+renesas@ragnatech.se>
 <20240311141106.3200743-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311141106.3200743-2-niklas.soderlund+renesas@ragnatech.se>


On Mon, 11 Mar 2024 15:11:05 +0100, Niklas Söderlund wrote:
> The Renesas Ethernet AVB bindings do not allow the MDIO bus to be
> described. This has not been needed as only a single PHY is
> supported and no MDIO bus properties have been needed.
> 
> Add an optional mdio node to the binding which allows the MDIO bus to be
> described and allow bus properties to be set.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
> * Changes since v2
> - Mark the PHY pattern as deprecated and add a comment that new bindings
>   should describe the PHY inside the MDIO node.
> ---
>  .../devicetree/bindings/net/renesas,etheravb.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


