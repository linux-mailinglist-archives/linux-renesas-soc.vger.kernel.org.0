Return-Path: <linux-renesas-soc+bounces-7524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E634993C349
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234E61C219BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8287619B3E3;
	Thu, 25 Jul 2024 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4k1BNqH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBD1DA4D;
	Thu, 25 Jul 2024 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721915297; cv=none; b=tjaQmuE0iPjoihqFB2GNPM9oy5itWUA5Eno9eyloQVo1566J6uT32gPqDqVIC8lIAxKZCrh585mYtv8B4NqpD+m9cpWrR0Ms2gFnQKrgNWXEKu+Q403jI/3CqyVjFNOtMhsZXvRcxp6imSjGHza1Nq4S/GCdzGfDpCNTagahz70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721915297; c=relaxed/simple;
	bh=B0+N0R0oO64HJHIWBCEG3XspO07DEgkcIacwNkawAzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVYy8ip1VM/zOSsq/IJJsKYnKC3F3jT+7aRGMC/wEf5cs33cYqK8/ZbB6ka6PrSoVlJ+z3cqEHs8BT2HR5uCCCfXpwwOF5buSNgQKDzDl6Tb8wNhyfc5nEANhvu5YFBsmTNuHzc0hZrzAbRWX7oVbo8ERwp/MfRhPC+tr8c8IUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4k1BNqH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA60C32782;
	Thu, 25 Jul 2024 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721915297;
	bh=B0+N0R0oO64HJHIWBCEG3XspO07DEgkcIacwNkawAzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O4k1BNqHVdR5cRpUkI8jFRZQYF6Jh3v6M4jW0IsJ83omCCEglNqA+s3T/C39jT7qk
	 juNBLZExrbTFQM8hWN7TUaiOGsdi0kFiAqS8HMhbwSa3d+17M16C4VXgJtHofKz4Wg
	 2+1sLqsq/2DlaDg6dQ8dXQTX63dJmcixz4iystEc7TtU0hq3bJ7COp90uDMJc9uXmU
	 3NYxo4WGVSW2/1p48QNW+fGt0sa5oBgI8HxtHkFo4c7RTk43r0/vNq4imnRgie9gKz
	 VHbdT3IamZ7GaTJYyq+LS4XbepkdCcohnoLkv3p8xWyYrHruUCg74MNPHN6YTez+DM
	 m8tD4XNAfVPXg==
Date: Thu, 25 Jul 2024 08:48:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v5 1/3] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
Message-ID: <172191529451.1986364.4998552420592163246.robh@kernel.org>
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 24 Jul 2024 19:21:17 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> of the R-Car Gen3, but it has some differences:
> - HS400 is not supported.
> - It has additional SD_STATUS register to control voltage,
>   power enable and reset.
> - It supports fixed address mode.
> 
> To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
> compatible string is added.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5
> - Dropped regulator node.
> 
> v3->v4
> - Dropped 'renesas,sdhi-use-internal-regulator' property
> - Moved 'vqmmc-regulator' to the top level
> 
> v2->v3
> - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> - Added regulator-compatible property for vqmmc-regulator
> - Added 'renesas,sdhi-use-internal-regulator' property
> 
> v1->v2
> - Moved vqmmc object in the if block
> - Updated commit message
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


