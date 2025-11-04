Return-Path: <linux-renesas-soc+bounces-24056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA13C2FAB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 08:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7635818C0817
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 07:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5489C30C638;
	Tue,  4 Nov 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUMiCcXm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228093101DC;
	Tue,  4 Nov 2025 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241835; cv=none; b=CehpgsbTn5b0wm7DNVTorl53goMjkxJaEasL1g8rxGwctLuNkI8pOdoo6e+sWaYH0I9J3Go203ywO0sySTGPKm9idtLN7L2HOBKnGr1OyoMoK+e4n/khzYvWHneRkk4g7LZe9jqACoB4o1QXJhLEj61Yd+cMjQfDetmR0TUYV0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241835; c=relaxed/simple;
	bh=xhxp+8yUrOqmn3E/ji9PabKENE1tC2sGm1YBQzpn5tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anS/oZzkut2RR3kR9dMQv40YvrL+1w5p8st8Fs3lXXfXGafNyoTMia1pcLsZM0zl6eWgosZ+Ic6t7GHBAXU3tFhjYCfbI/Zup+ttWeUnATLxlrAJBk2KA76qx5ZvSL2ZwizAJhgyDpRL74MRqn2royYxyc9ya6PLDK7u5DgSRvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUMiCcXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0F2C4CEF7;
	Tue,  4 Nov 2025 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762241834;
	bh=xhxp+8yUrOqmn3E/ji9PabKENE1tC2sGm1YBQzpn5tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUMiCcXm2a4mJlNy0ladRJgAMrb6ML4tFYmoNTi6LuQo4JBcfic8fcTg3+RAgRaIW
	 U/09qPu0qgPVvV3YviBldAEOWeQS0XD0eqqwtA4PJ9qdTEph+ShH8fA8gD5G0HTJ+c
	 WvTPbKqI2PcnnO4TyZ1wgqCHxZ6sh9exOaPUIcm+zhnr/y8laDJkkMQpH7UlLM61hv
	 SP+E39ihJ+w46V3iMQqEQxspZ+kJjtL2mGTeF0eaBPc2+i/eAJKQrm/baF66s65QHP
	 Lfv1M3RO8qJBJt9X1HgL7WW8jx5QQ6yRw5F2ieA0Dj5FBCP529yNoMY1RCH8xF/jzd
	 qfaxyogkCibwQ==
Date: Tue, 4 Nov 2025 08:37:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
Message-ID: <20251104-judicious-malkoha-of-snow-6a2b92@kuoka>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>

On Mon, Nov 03, 2025 at 09:07:35PM +0100, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


