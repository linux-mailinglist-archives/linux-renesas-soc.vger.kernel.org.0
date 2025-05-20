Return-Path: <linux-renesas-soc+bounces-17277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C009DABE3F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 21:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DCB14C56EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 19:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4026127FD4D;
	Tue, 20 May 2025 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQ+s0uJw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8BC211710;
	Tue, 20 May 2025 19:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770290; cv=none; b=FhxkI1FSHSMsBHBKJ7Rlt4FO/Db1GpszzSAGH/AjuKoTHmkKHCoSWFL3Urj8sRYsZk2dxHa6acp+TiVZZbDLsbp+rxpYxy3ZJWJsrICVDX0XekPLStaZPymOeze9QdToZOWZDPBfZTuy8y6IwIjTEUsWSwrjuTlKkzYBJS40kqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770290; c=relaxed/simple;
	bh=tyB8bM25Lx88UIlFfLPvpzsA6oH222+P3KY3XVdZCD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwCMH+N5o0P1JYWtoR/iyGqG95DBsFpvZx2VbhXLKXlyLugFmecruGagBT2FIxdvgLT7C+5zotAIstR6lCRrhMeBCc+wERgQuCBEQlV//wjZ3V1gFgoVqc4mR5Kq7wIGilwAmh2sfKYYUdECtEdJ66hutrSGvA6snn0NJC6K2ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQ+s0uJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3841FC4CEE9;
	Tue, 20 May 2025 19:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747770289;
	bh=tyB8bM25Lx88UIlFfLPvpzsA6oH222+P3KY3XVdZCD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQ+s0uJw+DAGmRPrd44KxUoDRsHE10cfsTm2/lPwWlO/EN4fqu7gbS98tFMx7RmYp
	 Pj0b+nlPE8D9pYbVRy5Erhg+Xpks/Gz6yxqADe5xxS4K0SzspbASqUitxZRuD+Zk9l
	 pd3/z9eiDgE56TCMo/SG/fYD6akLTr1pYybCoNdm7y/CzgCi1K1yKJKLD/1yum13dI
	 qdIBTCWXizphNAB2/4o0THYVC/JCvZ2bgx34R9TSu8H4RkF9DeF8NPcOVsPAFWzWDT
	 ACizlv1KsOOtYiOC/KaoY+L1KwsKdkvEEC6QI4MnB0sj/9E0SZf7l04nQ5V9R2kNdG
	 W2//7OlXAKN5Q==
Date: Tue, 20 May 2025 14:44:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <174777028582.1243201.5153635156225821461.robh@kernel.org>
References: <20250520151112.3278569-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520151112.3278569-1-hugo@hugovil.com>


On Tue, 20 May 2025 11:11:12 -0400, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Allow to inherit valid properties from the dsi-controller. This fixes the
> following warning when adding a panel property:
> 
> rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do not
>     match any of the regexes: 'pinctrl-[0-9]+'
>     from schema $id:
>         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> 
> Also add a panel property to the example.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
> V1 -> V2: add separate example
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 

Applied, thanks!


