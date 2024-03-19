Return-Path: <linux-renesas-soc+bounces-3919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E9880809
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 00:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DA53B210B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 23:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5773453E1B;
	Tue, 19 Mar 2024 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Sd79gRaW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aETGC43y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from flow1-smtp.messagingengine.com (flow1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734940BF2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 23:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710889447; cv=none; b=UftGFf6PWhGd2C47raBFQdx9DA87NxGtxz1y829xnGEh+lnGXvBUjHh7eUJgIz11bRG7nQjdj9ox3jCdCD46WSK5JzQXZKI7a8bstSxVIXp298AKCTXWrS/N5G5RuUFVhGfNulv6xC/CDfdGSkgPjz05c1E1YdZAPuux2v1J9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710889447; c=relaxed/simple;
	bh=PRjw2EufwMtWX7oVJ3qi501mLsyW5TBKBelckCSZa2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd4fphOOCe9DDz1mpVyYww3sLXXmhXw45ooxyXepe2hbZtU4W2uy1GfNbdrpzEHafWBHJVKctbrrjFiPYMaxmbYe3qFTLhpP7s0QcuJBWqSZptS5mpqyEARumLjCweQOSStSBERZRALgDAyAA2QSEQRNtPe6Z8jmbUh02q1AojU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Sd79gRaW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aETGC43y; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailflow.nyi.internal (Postfix) with ESMTP id 643AF2002F2;
	Tue, 19 Mar 2024 19:04:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 19 Mar 2024 19:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710889444;
	 x=1710893044; bh=qCaBFuHZq1OhYbnC6cf0a0cyJUxoCKbvno9p0mBxHRw=; b=
	Sd79gRaWr0sa8+S6LmAhLQbuyzQNADVj+WKvxjo1xEOKiLDJIkRfHlqeyANfoMc1
	/9RuYYVhgN2ixpxXJjFOqMnXTehoE6kdjnzolNZslGqJvsnArvoeBwEHVtOn0nzg
	ZZjkKQYfqMrDMHHaW0va46758mYV7z/NvTHWOH+mP4HoHiTBFoQ50kR1nG3u3iOu
	x6y2iJ7XeUcLClelWMR71pp9BNCZIg8O1Y/DtwlRJxBTdQQpUuUc2FxW3G9CoyiO
	5jjlMWqfZLFv46BGBL/O1VrG/PX7iyQIW2+ex1EN8QuACOtX/vtrQgXwfQwM11wZ
	P7ovB6lyPJm18t6YdD26yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=i80c9496c.fm2; t=
	1710889444; x=1710893044; bh=qCaBFuHZq1OhYbnC6cf0a0cyJUxoCKbvno9
	p0mBxHRw=; b=aETGC43yMXf3rhJ6Ukvu91UdqwiXyuZnTDQGlrRCza0Fp/7X4W7
	baI/N4j+I3eooT0iFtI/wszH5XQbpJHQkRgnhIHV6JDMZ0k/+SifLj+vZQZuYsCL
	/qefFMrkU/Vze7Hh1JQDxwjq6QZfzIbiFxIHm6EofuKesICPm0vkpF0c6CCw8jZb
	IlgNkhQIppMzO4nkv+vU7RMKG5bJmgEC6UD6fUxxwbfE2B/LlzjfmBSXYzda/tcZ
	9PYt9sgTAwPrjeSmOXtxwoCVGOHHA/NR8UG7JGNpRt70dYU/KQ2rUzjqxDsqDsCd
	NKRSIfpmP0FOpktiq1h8EFvuPKcaq/zYs6w==
X-ME-Sender: <xms:4xn6ZREDOArS9NqriXr72k_47JO19_ENE6zbiWwnhHSb-LxPJXIXNw>
    <xme:4xn6ZWWwPIZLaUX_rISXEHLQermXsINsGtcs7U-fP9G65mX6irUtX7cOa7YakHj95
    u6XoNN9E3QYdHg9etI>
X-ME-Received: <xmr:4xn6ZTIxzthOWgnR3jWfnODBtZGd6e_6O_dOxTFKT0_6aomxkQMmtVDvmDNSM-XUsPmnxQtmw7lgGmhglSAwmUMyRHk5z8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrledugddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfff
    jefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:4xn6ZXFK-YosEssJV_8Em0SpWrSW2ODAw4U0E9Fz7x8m2SiwfCkfSA>
    <xmx:4xn6ZXX8df8j2PPyQJzViBpq22Nuqa75gbWXUXObcuZIhzq_p4Hetw>
    <xmx:4xn6ZSM40HgC-JOyemIiEoYj9k7tel9IQv2M_hmMrlYAO4GBBro9Qg>
    <xmx:4xn6ZW3q-A_gIfGqHNrGPK8QOj_xijGP9K0H0bqHIA6P6gb1hKyLSA>
    <xmx:5Bn6Zdx5YpImGcwjFtfz2_JZSDy6sP_wDucNaHNlTHJ0BMrBD1xtt2H6mac>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Mar 2024 19:04:03 -0400 (EDT)
Date: Wed, 20 Mar 2024 00:04:01 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: renesas: Enable TMU support on R-Car Gen2
Message-ID: <20240319230401.GE3438308@ragnatech.se>
References: <b7b9fdd6f517a8b29bf5754e7f083d3b71805130.1710865761.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7b9fdd6f517a8b29bf5754e7f083d3b71805130.1710865761.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-03-19 17:29:55 +0100, Geert Uytterhoeven wrote:
> All Renesas R-Car Gen2 SoCs have Timer Units (TMU).  Enable support for
> them by selecting the SYS_SUPPORTS_SH_TMU gatekeeper config symbol.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 90df78027995d9b1..3125ab575b60b8d1 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -28,6 +28,7 @@ config ARCH_RCAR_GEN2
>  	select RENESAS_IRQC
>  	select RST_RCAR
>  	select SYS_SUPPORTS_SH_CMT
> +	select SYS_SUPPORTS_SH_TMU
>  
>  config ARCH_RCAR_GEN3
>  	bool
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

