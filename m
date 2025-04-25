Return-Path: <linux-renesas-soc+bounces-16367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35090A9C058
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 10:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68FB41BA034C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E374B232395;
	Fri, 25 Apr 2025 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fR9CKlAQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55CE26AEC;
	Fri, 25 Apr 2025 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568213; cv=none; b=uoOyws+pKm3KlC9ywBJx2HL5xB5mxcT4GzdPTPLJOfbIxd9wzK2ro2YeEMzNdiV1wCNW/HEu7SZczkl5YT4bU9OYll0wsmiVvsuVw2puVjKnPh4XzxMwK93sATHLT1PED4u7DdEhS98Ddw83r3e+L85JM883DSGH3xCXTRei298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568213; c=relaxed/simple;
	bh=V/aZKo/kbrH7DW3xRvjGxaOgR/ER63WRNmKUVOtjXwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuwtoBUSB9ZFsn+mujQr8siF3VOIHEyphfksc+xavGNlLBspONSkStoCXFdNXh9vSrthG1DMPrn2+rLPWjsJfNTC9gfwyPgPyZCzI1BDY3tYNbNaVbc5VWIlLEAQnmhDIpuBlYWofMfDzTc0P14gr6gU2EUPorzvNcxxQrBczNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fR9CKlAQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959F0C4CEE4;
	Fri, 25 Apr 2025 08:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745568213;
	bh=V/aZKo/kbrH7DW3xRvjGxaOgR/ER63WRNmKUVOtjXwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fR9CKlAQkb6ekb620tMQnHmkuLJ0XrhZeGArAtLxdPSZI4NN4aNdWSl9ryGK8JHK8
	 /e3PA+x4PR/4LQjuR+lfDUCO5kvaKwjmxKjywAkpUbb+6gu2iMGDUBppkQTAe4P7tf
	 cFs8Q88+GIwvcB6Cm2DcyC5C9J5tC7quCPWmp6j3CySE4wKgHKUEKtYm/NkxQ7PhoF
	 X+Eu8wVpbl692XxLAh3IAAQUnQmtosn8N5b3Ic7rrrXNTcnkxut7NWxsMgQxnrg7xP
	 Stj5DrsTmQNEvprlY92gMnSMvkzrSvsaabiNDthoCCkVuwGb8Oyn5YudtL6V5Iu46C
	 mW79HZ7c7fsNA==
Date: Fri, 25 Apr 2025 10:03:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: renesas,r9a09g047-cpg: Add
 XSPI and GBETH PTP core clocks
Message-ID: <20250425-ludicrous-zealous-pudu-5b5c7f@kuoka>
References: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
 <20250424081400.135028-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424081400.135028-2-biju.das.jz@bp.renesas.com>

On Thu, Apr 24, 2025 at 09:13:54AM GMT, Biju Das wrote:
> Add definitions for XSPI core clock and Gigabit Ethernet PTP reference
> core clocks in the R9A09G047 CPG DT bindings header file.
> 
> The clk_spi is modelled as a fixed divider clock with parent clk_spix2 and
> factor two as both parent and child share same gating bit.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


