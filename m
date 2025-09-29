Return-Path: <linux-renesas-soc+bounces-22429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B5BA7D80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 04:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06951171C5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 02:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8070C1F5847;
	Mon, 29 Sep 2025 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="KBaxehw5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E931E9B22;
	Mon, 29 Sep 2025 02:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759114457; cv=none; b=d29PtDwsrClyg9EUYVQaulYveGmjBhm/iMBJJrd66Qdreiul4vOsssdiQhdEtdzhI+obEoaORbz6+JvK4JBpw37l1H69R8x/bEbCLW+2j9DaDBiEhgOwklz5Udy7Vuc37dXglWu6no/lqe3+fzVyAZL0mE5TPbmLiDnFEL7zatg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759114457; c=relaxed/simple;
	bh=pojgk9Z1+Q/NV0nIiFV3uH3FiGs9bdHkXE4OeUOO3Q8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MCXQDHznlD38LnL2vZ8waUHP+/vh6kusQuzz3ff10kMfB+UkrPCJM9QQFaJx2ifM3ObOu1tn7YTaEtH+9MhrcOlK64SpEGJWeKYGoDHWQyN+NaPHxq2P+m51kGn69ODZRzYT7HhCzY9mSsaMSUlwe3oMk9e7Nztq2aBh22BiBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=KBaxehw5; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1759114447;
	bh=brjNCibui1BunD75iFMB/zhDYfVCb5iddYtyuRU7tNg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KBaxehw5FTRBVnzcCNHJ3aAdKfn7YaIwpgMkzt/GIBNODs9itUtYsHSvrk8qN/Sf1
	 ymRxkd1wPN83MvkP0lVUV9pBS9gtIDR1oeksM8vAf+ZJ5/rXLFWCC7iwQhaS2hf1FF
	 Whhuy4kG77LxXwLheG8qLpvSG/QpBJWay9oeot/yR/VkiyaHCBESslUl+ZNWX1K+SS
	 7FvCOgaUXjt9yPSw9BbmgFKnAoIXsiz4EN+bivEoL/4PKpRbUWeT6PO1ce/DOZo5GW
	 i+gDePAUNVYdv9OObxIpt4lmuM6nKI7U0a5EpKw2wODRn2U6P7fRvktX+jHpHmEeQh
	 QfS8p0FuGUBCg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2413864782;
	Mon, 29 Sep 2025 10:54:04 +0800 (AWST)
Message-ID: <dfd8160f015b405623aa7a4b9e69eda2ad1c5df5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5
 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, Leo
 Yang <Leo-Yang@quantatw.com>
Date: Mon, 29 Sep 2025 12:24:03 +0930
In-Reply-To: <20250924-yv5_add_dts-v2-2-39a4a8e3c9e6@gmail.com>
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
	 <20250924-yv5_add_dts-v2-2-39a4a8e3c9e6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kevin,

On Wed, 2025-09-24 at 20:28 +0800, Kevin Tung wrote:
> Add device tree for the Meta (Facebook) Yosemite5 compute node,
> based on the AST2600 BMC.
>=20
> The Yosemite5 platform provides monitoring of voltages, power,
> temperatures, and other critical parameters across the motherboard,
> CXL board, E1.S expansion board, and NIC components. The BMC also
> logs relevant events and performs appropriate system actions in
> response to abnormal conditions.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=C2=A0=C2=A0 | 1068=
 ++++++++++++++++++++
> =C2=A01 file changed, 1068 insertions(+)

This misses adding the devicetree to the dtb target in
arch/arm/boot/dts/aspeed/Makefile. Consequently I don't expect this was
tested with `make DTBS_CHECK=3Dy ...`. Fixing the make target and
checking the DTB yields the following among the usual concerns:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: ethernet@1e6700=
00 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('ncsi-pack=
age' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac10=
0.yaml#

Can you please address that? You may need to update or introduce a
binding document as part of doing so if it's not a matter of removing
the property from the devicetree.

Andrew

