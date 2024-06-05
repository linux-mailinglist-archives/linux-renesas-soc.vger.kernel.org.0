Return-Path: <linux-renesas-soc+bounces-5885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DCA8FD315
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 18:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C14F81C217AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 16:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDB97346E;
	Wed,  5 Jun 2024 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kWpAvP9i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ToeUYAMs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7628379
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jun 2024 16:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717605867; cv=none; b=NhbTFcFgyQA2YrJjzkLzGmctEm5fNRQVJnkCl3qosNViWdrYgYUDr9FjDojwI3CEtrI9G8NyGBLsRoK6KgXtaRFte5A/zfxGuX7k8/l+aGjxZ0TLxSI+u21YZeitVOXdHJGASenN7GhcEliKECH+aE5RfT6Rnm1QDsTw5+87FAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717605867; c=relaxed/simple;
	bh=0k3ZGw+9XJFp8OSwq57yv0WpEFaCWroOOP02CWTKbm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrRO8l3vlNxtVSQNNGoSfYNftHndz4c47OQYOUEiLp/NUk1bwqQVNUPp0OXVQjfyqqzZmCOOcVWgymlElGHjOUV0lwwvwNKF+kxCtcczTMDHkAb4vTk6HgbWZba3Mcmp9eR6uK5fXg4zDZ/inCZdxI5wGsPY8QSpRmLPy/VIbtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kWpAvP9i; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ToeUYAMs; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4EFE311401D0;
	Wed,  5 Jun 2024 12:44:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 05 Jun 2024 12:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1717605862;
	 x=1717692262; bh=AKJJdy66/u/G26/4twIJGgLa9gaCjUQdVlhrNpUdn2I=; b=
	kWpAvP9ieT6NSlrv101z+++LQEKE4n08qaDMFmIdiCHvICO7xMu7sSslo/Q9RAj5
	08RbLwqZjLgrsCwswxHpke3052LuqoDu9TLs3c8R2gUy/WoEFsZ6zrPRvoAcjRB4
	zHJ5/oCrlsnORw9NebaxsNtlXW4PBLwGZgesQAH35V10C0bvFADwNRhHptXaPEbc
	1zNE/zZJTRbvFY9s+hSqp60QAscKwPphcbfzTZID2qUpkVdfRTRsO5JP1wqOWMVh
	LtZXSBCylTdPzqb0RcLZslFqY+6O6VdPIMsTcsTmfuLFNA6896VTfL95GjhWVndg
	NjWRDP9fGssJZX+Q++1FGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717605862; x=
	1717692262; bh=AKJJdy66/u/G26/4twIJGgLa9gaCjUQdVlhrNpUdn2I=; b=T
	oeUYAMsMBm0ZNFZQHJA6rWyrD9/kivt16Oab14QwTpeVeK6sJNithLVHtYAIzGzb
	Q2YfKAcOXFqeDCXMCA1qqqUer0rfjWxDkMKgBN+AuWNrU2hG2Kew8/zJcnzf/xVY
	mWLEa2conM1GhrChDZ7aH2RpB8e53dh4jCE7dalqIfMDvSt1AZL/NyQ4nkpzcaLi
	MI3pAyFOpPEKD40NyYxOLtm6q5vZKBEvUPu7OA0zY4/E7xZ6d+EWrf4a9vuFVH7H
	XH0IF6/HOy29kVfeUboJPvmWvFN/FerrXf8Iwg8h80lXuHEQlO+/NbPv6G4CSn88
	8Y2Xd7bFlkMr+hlHoW4Iw==
X-ME-Sender: <xms:5ZVgZuBf-hWfvk9Mi1AqFJ7eNHGVIGsjOEmEqw8NWNPlI2sUzkq0lg>
    <xme:5ZVgZoguNDhtsY2aVa9GbAronualgc6cco1zFQ0VYpOOo0QgUUX_xy0p65nhFUwFt
    1HlI9uJ9rTe4WjOkto>
X-ME-Received: <xmr:5ZVgZhlYxpwPU-QaWq9zpOMyhVpsCQ6fno_y-wDvqriMLOjM-7UoumbgFzxbyyQK1jtpgl3fx-AZxEpNS88HIImRawdpJ3k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeliedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:5ZVgZsxkiR10NYTOAo6TL1O0fyZ8e6LK2zN-LwM0ko8htrKVVXLhSw>
    <xmx:5ZVgZjT3YhTwzirIDB6lr8l5btmyrn2oXyN0RhkRbwmaChuKvIlpVQ>
    <xmx:5ZVgZnaVEhVDioLGMth7sESPwZ-h22XJB-eYYDZx38q-2Rel5hdUDA>
    <xmx:5ZVgZsQ4lzosYPr1NI_NgILrtimPkn8-bS7OHDD5APWhEeciMfFBgA>
    <xmx:5pVgZiF9P6aleS26I1ntfHFROMg3zEsoEba4LK1XhIx6SB7N_FGHdM8S>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jun 2024 12:44:21 -0400 (EDT)
Date: Wed, 5 Jun 2024 18:44:18 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Create entry for Renesas RZ/G2L TSU thermal
 drivers
Message-ID: <20240605164418.GH710180@ragnatech.se>
References: <20240605155726.264004-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605155726.264004-1-biju.das.jz@bp.renesas.com>

Hi Biju,

On 2024-06-05 16:57:26 +0100, Biju Das wrote:
> Create entry for Renesas RZ/G2L TSU thermal drivers and add my self as a
> maintainer.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 332f452645d6..6deeae42a3d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19112,6 +19112,13 @@ F:	Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
>  F:	drivers/thermal/renesas/rcar_gen3_thermal.c
>  F:	drivers/thermal/renesas/rcar_thermal.c
>  
> +RENESAS RZ/G2L TSU THERMAL DRIVERS
> +M:	Biju Das <biju.das.jz@bp.renesas.com>
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
> +F:	drivers/thermal/renesas/rzg2l_thermal.c
> +
>  RENESAS RIIC DRIVER
>  M:	Chris Brandt <chris.brandt@renesas.com>
>  L:	linux-renesas-soc@vger.kernel.org
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund

