Return-Path: <linux-renesas-soc+bounces-9324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C698E413
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 22:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0732C284AA1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 20:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBC9216A2E;
	Wed,  2 Oct 2024 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb7mC8X1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122E1D0E3F;
	Wed,  2 Oct 2024 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727900565; cv=none; b=WmAmQGu5DTcSgmLzShNrbsSkxWSkhKgFtEKy2Gt6nwRDyuEm2OoZ5F0FCkq45t4XhcGj3E3fGAqaeDpDyqigAIyx9bAOQLUbTdDadmf8+V6ZSrB1I5yx/adODk5QqDuQ/HPmDRArWO1TmrgCCh7NtBemg33cox0nnPpwgO0zNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727900565; c=relaxed/simple;
	bh=5mirx+w0giWivTiCczjZ4St1KZn8Y7G1mWA2ta+R+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u60He2q6ov/Ws0bc7JFeQxOj/vActYEted5+juIUukiIaJ+XyOHQ7a9XUtkn5jtJEruDeCQUjMxCZJzlKJ7A01Dt4mP8KsY1m1PoWx9DSxdFGmnEOVPdhSIlQj8AYtkKltjOxwb4oxeyI8tCt78f5xHVU1RIzhmkLDBPgzJhTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xb7mC8X1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B601C4CEC2;
	Wed,  2 Oct 2024 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727900564;
	bh=5mirx+w0giWivTiCczjZ4St1KZn8Y7G1mWA2ta+R+9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xb7mC8X1itwdzADqSi7ovgr8I7lecQm2VLcHhA5SA9fj6h0ZmD0PhwJXnuu89ybdv
	 DQv1bSsVaT+ejXB4+2uJwVaw6YV+ZL1f/oBy7iRqyYSi9lz5c0c7iL7IHM72bTmHPl
	 b05ekSNeGs8q9cz+Y5iBAA5Aousysa6lV0GvEiatjlLlfVrpOElXQHuY5JG1r7JvMJ
	 alwpaf6SdGh0NfhkneDT4k/arfd5OLoeK6EbYpk3JL0SfmWsgSvnensjBcfP/XiWQ7
	 Zp2kywVXj+8twkqJhhxtt82TjiaY1hP8tMdkuiDCnc138mPgjX5hErU5Sp3tj7iZjM
	 OBIygt+zzcPbw==
Date: Wed, 2 Oct 2024 15:22:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/V2H(P) Interrupt Controller
Message-ID: <172790056297.1264669.8900769160450310875.robh@kernel.org>
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com>
 <20240930145244.356565-3-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930145244.356565-3-fabrizio.castro.jz@renesas.com>


On Mon, 30 Sep 2024 15:52:41 +0100, Fabrizio Castro wrote:
> Add DT bindings for the Renesas RZ/V2H(P) Interrupt Controller.
> 
> Also add macros for the NMI and IRQ0-15 interrupts which map the
> SPI0-16 interrupts on the RZ/V2H(P) SoC so that they can be
> used in the first cell of the interrupt specifiers.
> 
> For the second cell of the interrupt specifier, since NMI, IRQn
> and TINTn support different types of interrupts between themselves,
> add helper macros to make it easier for the user to work out what's
> available.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * Removed '|' from main description
> * Reworked main description
> * Fixed indentation of #interrupt-cells
> * Reworked description of #interrupt-cells
> * Dropped file include/dt-bindings/interrupt-controller/icu-rzv2h.h
> 
>  .../renesas,rzv2h-icu.yaml                    | 276 ++++++++++++++++++
>  1 file changed, 276 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


