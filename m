Return-Path: <linux-renesas-soc+bounces-11749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 713089FEBFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 02:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AB51883057
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 01:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED512F5A;
	Tue, 31 Dec 2024 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVteqDjj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41B4C76;
	Tue, 31 Dec 2024 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735606979; cv=none; b=D6MkP0FVlbuRRrub/9x1MJstXAbxLJU+FoojFJIk2nA8ksgt2iuM5kcbhoiB+4N8vnKeaQqAVHKDZSFjmujL9GpSZ76jxJTpaRyJtQYdy3cOBfu6KplWSxqlBsYDvKbp+u17VURa2aCpqazQF5GZZ7tiwxuW1MDEblZt8OVBd9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735606979; c=relaxed/simple;
	bh=0Nso4K7bG/ECC90KQFKPscCeAVbv1vI+5OCQM4Z3vRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjC42KagdworZqjnKLWF9l8eqlyDbMDmS3kRMToAuVG0Jr0Q7/q43fA3Ti4vCt/lqIQikBc8hX5sxB0gstororOyktttvunIviBDmkrRFVUvojZiIPnL3HV5CNOe5rUdB8m86cuyNgSz1T/fX7FCuW1jPxTCZdzKGSDPEfNamvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVteqDjj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C073CC4CED0;
	Tue, 31 Dec 2024 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735606979;
	bh=0Nso4K7bG/ECC90KQFKPscCeAVbv1vI+5OCQM4Z3vRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVteqDjj3uQon9kc6uaFvAPx9cgmWNXPyuEea51QtODbKG9Ojr1Z0LuxHGyRk8wQn
	 rLemTfzsdjGVGQCZCIP6KzNRM6HsYUdrHrbVxCIAiy7+gjwWUaNw3P8ediJb9TLTSe
	 PKj8TKug2vGhpj4ms/cJ8kuQY8RzYvvsHZlrAcWWNwx8ahJxNTNBo4KVmuMHlXVj6L
	 /Xf+k1PAh2q9ki22SNDt8pTxmEjMwTRiqmu3PsIoNZytf7PEPDob0QEF6cQWVTAS8O
	 DZx5oPdS+8rM0leVPDhZfgp2dpMKn7kXQN8m46ra0jQXM6pwR97PVj66r+rTe514ev
	 SP9AByjTj7dQQ==
Date: Mon, 30 Dec 2024 19:02:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] ASoC: dt-bindings: renesas,rsnd: remove
 post-init-providers property
Message-ID: <173560697655.2855593.5371665252641287355.robh@kernel.org>
References: <87ikrhrfws.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikrhrfws.wl-kuninori.morimoto.gx@renesas.com>


On Wed, 18 Dec 2024 00:30:43 +0000, Kuninori Morimoto wrote:
> commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
> device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
> longer need to use post-init-providers property to break fw_devlink cycle
> (And no one is using it yet). Let's remove it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v2 -> v3
> 	- tidyup missing DT maintainers
> 	- Remove Fixes: tag
> v1 -> v2
> 	- add missing DT maintainers
> 	- Tidyup the git-log
> 
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


