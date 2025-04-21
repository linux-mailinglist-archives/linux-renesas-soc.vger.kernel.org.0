Return-Path: <linux-renesas-soc+bounces-16204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D75FA95622
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 20:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49E0F188EAF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 18:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97051E5707;
	Mon, 21 Apr 2025 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tO9jNT0G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AE8DDAB;
	Mon, 21 Apr 2025 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261308; cv=none; b=LUzYR28Kts/cK7Oqa+wcOhLnA3st42++2LK9Uia/U9nKhHpJf7plwnicHhhpmyyoCNa3k4q6W5J6g+GBLwdwmymxxM6B8ZQMZqhTixaPpPxSOzLg+7ZrBh2LFrbqIauqz80AToBK3FEh0TkqjNf8rURBrpjGxIOKUnAS+zfQk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261308; c=relaxed/simple;
	bh=Ijp7OoJM/SjB6q2/JnLqH5xk2mnKjD6u6f/PtjXw0Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Of+vF9q415G91KMzg69Spd0g1/3yu6qi2yB+ZWj7d7eVuGUKyMMbQNfKguAlG7Ung1L11y7aLR3BIMiTIZQsGv1tdN8KEpiYdA28KHzd2r6VLCvpf8XLD6NnksbAEG7z/0AS5/+nioylzzIiQ1pLEEFKvrV664J92HcqJJWoVR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tO9jNT0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F51EC4CEE4;
	Mon, 21 Apr 2025 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261307;
	bh=Ijp7OoJM/SjB6q2/JnLqH5xk2mnKjD6u6f/PtjXw0Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tO9jNT0GXs+9AfF7VttwbdUVOSuc8TE9HieRsrqdAvjZJGCauWzD6Jcp3PTIhDB1T
	 2jFghVVcKbNU8nZPuX1B5oiS17mWCsKtNI6KL9gSMPhkspTWRJT/AVsYWUPolatrhv
	 cs5EW0f1iNLJ5Li/nW+Zkmf2WDgWfqqcR9ccoGKqMu37/8xnpkWbk3AYv+8Jtr8Gny
	 8R+Da2XRcbWUEbYkj0qBmlblSl2XhpfV54B93RsGQ1UXtufeyd51lrv4EK5se4PjBc
	 1jQKL3B4mf5WG1st5UD6v+I2qaGwYbHZDBfoJFcX+n+26HtBSUkCVwBJ+Pk1wNmOsV
	 UxfoREzuuUg4w==
Date: Mon, 21 Apr 2025 13:48:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: add TQMa8XxS boards
Message-ID: <174526130447.2607883.13343591293403394303.robh@kernel.org>
References: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>


On Tue, 15 Apr 2025 15:32:58 +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@tq-group.com>
> 
> TQMa8XxS is a SOM series featuring NXP i.MX8X SoC.
> They are called TQMa8XQPS and TQMa8XDPS respectively.
> MB-SMARC-2 is a carrier reference design.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


