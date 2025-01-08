Return-Path: <linux-renesas-soc+bounces-11943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74070A04E2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 01:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D7327A06F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 00:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51EC6FC5;
	Wed,  8 Jan 2025 00:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="LWugbcXw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA5D25949C;
	Wed,  8 Jan 2025 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736296523; cv=none; b=pdlEsFNf2O5iAd+ZiWYjbfBLH/t2q6ROsXzzTnFHsJCDSdqdn/VT/8KU2HCs2GIJwF4mLpUpSha49jL3kPYFE+qX3cu2MYEtNl/22IQ+sg56GBJmcKvL0oVQOrb5djlR6dS/LWkOzQIT5pS05QxcKQR2E7ZsfaH4ipollRbnyCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736296523; c=relaxed/simple;
	bh=CGtf0U2QWath+kQBWiGScXsK40BA3Bpp91eZ5jHTv+o=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oMmNkbpYLsY1g8YdwKLNCR+wt6QDc7kGQgjmaTUmFwi9s7bd8kR5wBNmXiPfGHFxUJ1TRPPn4Ymo/VjDh+gwQDvGAR1E/nI4Bmki9KeaaTCnT9/oT8wTsL2VCg4++AsaHBsq7GqeUmCVoeqfrvXXWTGDozYLiWEJZxzf7aGkK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=LWugbcXw; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736296518;
	bh=CGtf0U2QWath+kQBWiGScXsK40BA3Bpp91eZ5jHTv+o=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LWugbcXwyQ2jmJE0FpuMAzMD5WQrpJxWPGSomgMn6vElvDZGGzvzADUdG90a++wCa
	 ti+EOrg14yaVMAFkiLk/FCoTcpMTerokvinOMT/TZuesb+Ukx66Qc2oYOYVCu39wBU
	 7cTWBtpDi6GYuSYp2nPAwiKge9cCPo3pN9LwJY/77pj93i2eRe3Il6Qj5U/6cfUpF3
	 Ns5leRi97JmVr9IiiBTCfBq/g5eqC94V6zKhaPLWmKat+DBDz+Dn90bySdlpm8H+bu
	 SQ9BYe+zoTct0QqFM7azgR6JydzCvf4zuwpeceC9j00oNR+RjcsemHbbICWO0YRb83
	 GZeHxlfd3QwCw==
Received: from [192.168.68.112] (ppp118-210-64-24.adl-adc-lon-bras32.tpg.internode.on.net [118.210.64.24])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 93F8E70801;
	Wed,  8 Jan 2025 08:35:12 +0800 (AWST)
Message-ID: <cf3d472b843eeedcb718013c38612cfb33cd0cdc.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Justin Chen <justin.chen@broadcom.com>, Al
 Cooper <alcooperx@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thierry Reding
 <thierry.reding@gmail.com>,  Jonathan Hunter <jonathanh@nvidia.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
  Florian Fainelli <f.fainelli@gmail.com>, Benjamin Bara
 <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, Ahmad
 Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,  Del Regno
 <angelogioacchino.delregno@collabora.com>, Tianping Fang
 <tianping.fang@mediatek.com>,  Jassi Brar <jaswinder.singh@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Date: Wed, 08 Jan 2025 11:05:11 +1030
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-01-07 at 14:10 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces
> and
> aligned with opening '- |', so correct any differences like 3-spaces
> or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0.../bindings/usb/aspeed,usb-vhub.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 40 +++++++++--------
> --

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed,usb-vhub.ya=
ml

Cheers,

Andrew

