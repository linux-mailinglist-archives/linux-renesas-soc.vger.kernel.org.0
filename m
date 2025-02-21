Return-Path: <linux-renesas-soc+bounces-13500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2DA400ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 21:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA644412CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 20:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEE9253B55;
	Fri, 21 Feb 2025 20:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjumTcQE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D89125333B;
	Fri, 21 Feb 2025 20:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169753; cv=none; b=MPz7q+4zR++d751wqXjSd1ooRukctdTxeWDn97w9Vub8m8hO2rXVfM06KnXTVi7I9LwR/H6x0L9JvocmrRUQl0wYBsIxEuboWsSEJz/W8hgf+0XwY0aATpnKB+DXs0g6OjJvyINH12TsKhPnMbiO7ELj4VMN4isO+bo5BXfYZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169753; c=relaxed/simple;
	bh=dVquMpewX/+NkVDUur45gc/Yc+Kf01Dyu5/+irO3VQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUIYg7PQL3CzouPp9Gtzm/AuY+QXD98XfsW4tNqYUohoy5Xosc9mD8Nl7MrnJARWUH7m+TVo3DVWhz2ZxGkzzbCMWvvFLixmHYeHY9tCeKqs3fPSbTMT0Guj7XIZaZBhb3A0diJDvReEPFUh80pbITMWRadzGSlqx0+PazUwEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjumTcQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFE3C4CED6;
	Fri, 21 Feb 2025 20:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740169752;
	bh=dVquMpewX/+NkVDUur45gc/Yc+Kf01Dyu5/+irO3VQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjumTcQEe3AkEx1htsLx8vIkarGUhMuyiJN/Y7/yuFH+aEk9JVLZiXlUQpoxscDQN
	 nl1JurFoUMGGamq0lPlyRGP6+oQHdTFJ5PLY41+fhsD3Yf0islbtygj1mqFHnsG7mU
	 OjZFMU3TJTJql8pF5wZfMXW3l7v4PNUFJHxPaBFz95rYCk0QSyHL9gcJ2Ma6+NGTyl
	 bu6TKCukf1mcoD7Qkj5rA2i4jmvxmzH+2+d/egMUqjS8NlcItPdhALD23WPl/DvWLT
	 GVREGNQjzhE7gVSIOgnIIWS3yqe9qhJyg8gWLSO/WBRnWhhPakwnjGcYk3mULXRUI9
	 XpGW5nhWfYGSQ==
Date: Fri, 21 Feb 2025 14:29:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/V2H(P) SoC
Message-ID: <174016975012.24654.2096409843196384969.robh@kernel.org>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218115922.407816-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218115922.407816-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Tue, 18 Feb 2025 11:59:20 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a compatible string for the Renesas RZ/V2H(P) SoC variants that
> include a Mali-G31 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


