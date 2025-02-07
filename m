Return-Path: <linux-renesas-soc+bounces-12935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90306A2BFCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 10:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D3F43A50F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 09:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A921DE4FC;
	Fri,  7 Feb 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uh+gqnGw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790EA1DE4DE;
	Fri,  7 Feb 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921538; cv=none; b=Bf8jy8j5/BouG/ccNhi0CnIIrUJHQHzN4shFLW/8rsXjFMzkXVG0MYBHCyMqLedhZCHhY3osil3/4HTZf7toocRkt9L0XtkfaWJNZegqsntasLhc5yOH0rIIYZe2KkkP8UGxdDHG8IQewNEBHIiRM6M4ssNYHXd11ZATtKIaIzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921538; c=relaxed/simple;
	bh=2yXTnTL/bXuF3D6pEtpjFcCuUAarvcwiHZw/29DwNFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIEkpEAbgM9mIutvLBPzXQ+MFYOFiw3/dehQTabAlClegwedBHLRdMdZ0yJszJ/NYqzu7JPj2M2GqBuUzZPb/jRT1KJI08EVCIu91oX1yE8BzmE9WOlju0fZJ0HYnAYM+emx/Kj6uOULWU2w0MUDWfLmkuG6uyjJU2pR2NHE6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uh+gqnGw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C756FC4CED1;
	Fri,  7 Feb 2025 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738921537;
	bh=2yXTnTL/bXuF3D6pEtpjFcCuUAarvcwiHZw/29DwNFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh+gqnGwX7Rgd+VqSkE35en8UrA3LvK1XzrjQxjPslAabA5HotNmerHww2bu/UPU2
	 OvZM1FqQmymvotTpLlMeA/e6VQs87buE24cKVjRNe12GdM6SHXIm9VD9Rkncrj6Ts4
	 CKvUSMd9uo6aIuW9wO8yJRn/fhe31o7+qDIUnX9smGC0Qsam69KZS1VPziwHJFXvfr
	 CewuPK6l2hep2ZPIxcN8y23T8QBAjXyUjKpo4LuQ85mo4nBWhXWcN+MYr1LHXmf1aw
	 /UABii0jTrdnLXqybg1RB1tr45YnZPvf1U2Mr72etOouikRRUnqmYySdgEK+7z2snO
	 lGyojyt0c1FIQ==
Date: Fri, 7 Feb 2025 09:45:32 +0000
From: Simon Horman <horms@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/7] of: base: Add
 of_get_available_child_by_name()
Message-ID: <20250207094532.GC554665@kernel.org>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
 <20250205124235.53285-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205124235.53285-2-biju.das.jz@bp.renesas.com>

On Wed, Feb 05, 2025 at 12:42:21PM +0000, Biju Das wrote:
> There are lot of drivers using of_get_child_by_name() followed by
> of_device_is_available() to find the available child node by name for a
> given parent. Provide a helper for these users to simplify the code.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> previous v2->v2
>  * Added Rb tag from Rob.
> v1->previous v2:
>  * Updated commit description.
>  * Updated kerneldoc comment block
>  * Avoided code duplication by using of_get_child_by_name().

Reviewed-by: Simon Horman <horms@kernel.org>


