Return-Path: <linux-renesas-soc+bounces-15277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDAA78869
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 08:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A41816F12C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 06:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C9B233148;
	Wed,  2 Apr 2025 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUO2iYpD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD20233132;
	Wed,  2 Apr 2025 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577025; cv=none; b=jIjFAI5V+MZ/gpJ58C2j3qIvBCXGJk/VW8d1uVQZewybygJkg9WRLIF6AfxJ27qUWU5eZTJ16kTrANruhAzGFc1YSI1Xn/xCfzGiOl66YSx4NN9qMDN6JA6KjkFyvYAC6GvPD7kSZSOx5j8NR76VF/zht2P0Sf6Xk/FJ5BDRHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577025; c=relaxed/simple;
	bh=ZjxKa3EH5gnYVi2rRzveSeRufpa3TKGNMebTJ5cbVlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDRksj40aoELXhgatPbSUBThsVwq8HdinwiCefU1eAg7oxn1QTf/NPD0n/5RTWrM+HRLrej48ZmEMEUsjNSNz20rvPTTdUZE5TrzmP3dlBffAAuHA5YV2hVNwcliVhEd6nQkY98/yOYf0UhGOK13AFcKmrma13P9Hah+y1/st3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUO2iYpD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60683C4CEDD;
	Wed,  2 Apr 2025 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577025;
	bh=ZjxKa3EH5gnYVi2rRzveSeRufpa3TKGNMebTJ5cbVlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUO2iYpDJZOOtPfFrJVEMMnzvp5DimyzjA5oK0l2o5lXOeWFUFciLkAjZvmWXjV7J
	 x+RERJDOIhVmBfZPYAX7Mz5N4dkIfuVYCL0b9XIxQySmZhIA22fCjszjPR7XqFwBUU
	 yIYyhVSb0zMfxzgO2gotJsAWagOMPM+Z5fiBHXHqB6/jcLwA/RtNPJewdyKeAQCmVe
	 vkDFi0p7sSLZv2LUjR1LgRzJMdJfEcdBwJiCJh7TA5bn1UyzAJBpuOAIdAU/yPFifL
	 PHLO/aczJI4c44yvttagWdGyGI6XejCRpgbfG2DswBF4Q83PowkfBTZyP0iBQfBQGs
	 4SAvJca6V9ivQ==
Date: Wed, 2 Apr 2025 08:57:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/3] Add USB2PHY Port Reset Control driver for Renesas
 RZ/V2H(P) SoC
Message-ID: <20250402-adamant-myrtle-raptor-40e19f@krzk-bin>
References: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Apr 01, 2025 at 06:14:29PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for the USB2PHY Port Reset control driver
> for the Renesas RZ/V2H(P) SoC. The changes include documenting the USB2PHY
> Port Reset control bindings and adding the driver.
> 
> v2->v3
> - Dropped Acks from Conor and Fabrizio, due to below changes
> - Renamed binding renesas,rzv2h-usb2phy-ctrl.yaml to
>   renesas,rzv2h-usb2phy-reset.yaml

That's not really justifying dropping review.

Still not possible to compare it:

b4 diff '20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com'
Grabbing thread from lore.kernel.org/all/20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
---
Analyzing 4 messages in the thread
Could not find lower series to compare against.

Best regards,
Krzysztof


