Return-Path: <linux-renesas-soc+bounces-12443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFC9A1ACDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 23:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77DA616C175
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 22:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCE41D357A;
	Thu, 23 Jan 2025 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFj+mfSU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DCD14A4E1;
	Thu, 23 Jan 2025 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672835; cv=none; b=ECjMDS1H3h9wsbafrJzKliKPq4Dlu8ZkLXh9lb/+v/fEBqReXkgigkucXEe+e2lcRsgyiT3liIC+XkLRnRzWZEPZysHFBARhmMBVDcKpWI7LDzCJHyOgx8KJYEqJLhH04WUD5oJnADB+T3xNzgF1ScpJiaSW5UvrTyl6LE+lzdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672835; c=relaxed/simple;
	bh=Efgoub5yr7oiXDXFJqrAzL2ptBIDMx8u5nImdzs1AHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WP+7q4TKLasb5KfCiJ3GiDHMa4CADwRqFXntR1Qh8ZtyJRLMzDM09uuwQDywWoK9Db223kahW/WJo6xaGCFvhedzbAxhQa4sa//b1DLsFCa13WFib41X/RR1BpSs4qvXgtPXMYm7iyAVLVLaBFoBUYvvJ5CsXC85AijOh21SSso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFj+mfSU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8EFC4CED3;
	Thu, 23 Jan 2025 22:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737672834;
	bh=Efgoub5yr7oiXDXFJqrAzL2ptBIDMx8u5nImdzs1AHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFj+mfSU8qm/PSYit52sQ1w3cX9Q5EmnJFPfDkK6LpXpdMylr66unj7o8nvuXNyYr
	 gUFJLXANp3pVx3Inu8DWXKFYU/z3y/8BunmuNWjYv5NXK6RSXdZt5mJFC9bXu8qRFv
	 rDzZpzxTM72AU4xXzbRA/ckQnPAzIQ1sMzajm05lQO5KNzWcNvctRnvmf9Lxw+DDsC
	 JmPf1RMhp7P0q9lFLIX9nufPfXgyqEGAwfui2/h8vIoqHnyeMsF+APWWQfmHU7fzlM
	 uzM/e4fK/XxjzN3i4wAR2rM+7uYN9trrLsGFfPdd6K3vwziWEMfWBBCeT91sr3btrp
	 U9EA+FVuhs3ww==
Date: Thu, 23 Jan 2025 16:53:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH 01/11] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/G3E SoC
Message-ID: <173767283211.496309.8370798411204868028.robh@kernel.org>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120094715.25802-2-biju.das.jz@bp.renesas.com>


On Mon, 20 Jan 2025 09:46:57 +0000, Biju Das wrote:
> Document RZ/G3E (R9A09G047) ICU bindings. The ICU block on the RZ/G3E
> SoC is almost identical to the one found on the RZ/V2H SoC, with the
> following differences:
>  - The TINT register offset is 0x830 compared to ox30 on RZ/V2H.
>  - The number of supported GPIO interrupts for TINT selection is 141
>    instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 15 instead of 8
>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
> 
> Hence new compatible string "renesas,r9a09g047-icu" is added for RZ/G3E
> SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml    | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


