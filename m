Return-Path: <linux-renesas-soc+bounces-3730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5283879DF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 22:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901C0281AB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 21:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAE2143759;
	Tue, 12 Mar 2024 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="FkotmeBs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10644AEEB;
	Tue, 12 Mar 2024 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710280461; cv=none; b=hb+BDtUgFBQ8BYxox5h6UGY1bUMJhzsoDg2BJLZvXMiKV118aB7dLKBmOmCba3PMyOCh93FPdbmfFrWYaHC/d8En5ImSDsAQCkN9kspvsr2dzCwFhvPyb8ePNWlzoOt3LWpV+xzrxQH9+aMD/mybBRB/ZjNIKfmKUcRf0Y7tQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710280461; c=relaxed/simple;
	bh=RJOxe9gLykgLJELONd/LUe2kNDyHatJu/03k9aZY7kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV0eDOnlDe4gxzdUjlAmiy8ikumGdRVK8s4kkvJd1Q5YhqeuNB0zOc+gEz8JYvE07ETNwEUqfsB1wzyWyG+OhcXKsEtZn79dWqqDM9GXVQe8v/vGwv8A43UlQ33DGEvtkG33IUoMoAcorAXjz4dhjR8Lf2+c2wGATmaSH0sdFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=FkotmeBs; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iZw8G0SBXNbXErnviCAZsso6Q+3L0/LBlw+My2zDVZg=; b=Fk
	otmeBs0tGrIYPwvmlfT7gWGOO06P77oXWP5wXNy3D8I5579BAXPvfzwHmKCXFAMcfjm7JfhZzbKj/
	LAc9kt3R9/hHW3omv6hJUPsrKi+oL6hAxMZDyJdd6E5Ig7Vp9iIjmr8s7NCGaZhiGsExOtWHjTi+7
	O+fAnRGOjQZXk3A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rkA57-00A5D0-Ef; Tue, 12 Mar 2024 22:54:45 +0100
Date: Tue, 12 Mar 2024 22:54:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas,etheravb: Add MDIO bus reset
 properties
Message-ID: <0f6b36ab-e04e-4381-806d-c20302f100a1@lunn.ch>
References: <20240309012538.719518-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240309012538.719518-1-niklas.soderlund+renesas@ragnatech.se>

On Sat, Mar 09, 2024 at 02:25:38AM +0100, Niklas Söderlund wrote:
> The bindings for Renesas Ethernet AVB are from 2015 and contain some
> oddities that are impossible to get right without breaking existing
> bindings. One such thing is that the MDIO bus properties that should be
> its own node are mixed with the node for the IP for Ethernet AVB.
> 
> Instead of a separate node for the MDIO bus,
> 
>     avb: ethernet@e6800000 {
>             compatible = "renesas,etheravb-r8a7795",
>                          "renesas,etheravb-rcar-gen3";
>             reg = <0xe6800000 0x800>, <0xe6a00000 0x10000>;
> 
>             ...
> 
>             phy-handle = <&phy0>;
> 
>             mdio {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> 
>                 phy0: ethernet-phy@0 {
>                     ...
>                 };
>             };
>     };
> 
> The Ethernet AVB mix it in one,
> 
>     avb: ethernet@e6800000 {
>             compatible = "renesas,etheravb-r8a7795",
>                          "renesas,etheravb-rcar-gen3";
>             reg = <0xe6800000 0x800>, <0xe6a00000 0x10000>;
> 
>             ...
> 
>             phy-handle = <&phy0>;
> 
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             phy0: ethernet-phy@0 {
>                 ...
>             };
>     };

This was at one time O.K, and since we don't remove things because
that would break backwards compatibility, its still technically
O.K. It does however lead to problems, so newer drivers have used a
dedicated MDIO node. The yaml i think only documents the use of an
MDIO node. If you want older DT blobs to pass validation, you might
want to add the extra properties to the renesas,etheravb-r8a7795
binding.

You also see some older drivers which have migrated to first look for
an MDIO node and use it if found, and then fallback to the old
scheme. So that is what i would suggest here. You could then convert
all in tree dts files to having an MDIO node, which will make the yaml
validator happy.

	Andrew

