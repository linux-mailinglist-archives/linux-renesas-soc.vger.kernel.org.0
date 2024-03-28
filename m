Return-Path: <linux-renesas-soc+bounces-4144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC788FBF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 10:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A34E1F2C696
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 09:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910B264CF7;
	Thu, 28 Mar 2024 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LfyYda0F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U8nfyePA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow8-smtp.messagingengine.com (wflow8-smtp.messagingengine.com [64.147.123.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F22C857;
	Thu, 28 Mar 2024 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711619158; cv=none; b=pAb0sHmN48Y3ofc7pOuX7Xc+bqrdV0SrVaio2zvcCg3xpofWttcgiJF2+6R2fXVbyWG1Azkf5/daDVVx4PnXRt9XH+XBxzJJwlCj9AhPY/4jOJPXmBscSHeJyWm67UxaGjc+uQqI8IW/JfFlPlq/FQvC3eMqy4wutmyL+a++eDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711619158; c=relaxed/simple;
	bh=vYw2zfrzxzlI6F0HNal+2PFuEQnRtbtOCvAcnyyolLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlBqPSSw4t/lxDYe5SDvvxqU6vkuXAZ55VLbKR0B+9vl73wUAC4lvyb+bifTfDd4yoHSa+61mgQaeOb0FUqUs2hUuJ8xgirPjBq3t8GcJqVt+BQ9TL1AwKkoJ6k2Orfu+lL7nE+Ccm8KANzA30vlxabr82+65Ac7/dEGbt2EIoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LfyYda0F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U8nfyePA; arc=none smtp.client-ip=64.147.123.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailflow.west.internal (Postfix) with ESMTP id 9CE692CC0329;
	Thu, 28 Mar 2024 05:45:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 28 Mar 2024 05:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1711619152;
	 x=1711622752; bh=CQCmVmeY0w/oD6haN/Pv1pQc8Cmiyv6cnQX0+bpjZ2U=; b=
	LfyYda0F+XxodMlFr/SKl3AnmLNSkDuCvpN5PtRPLzzHdSRNjV4DpU6McccV0iuO
	tD/QKkXaR+FEWH7NRjwRTZYlETNML/3up7lwTmiXeb81+f++IKm8VI6YBMcyO4nK
	D3nCWAj4Mmy61nvdD+l5emB0YlqsubmxrnZlfJXtZbhna2VCMHkKBbmMFcrbKhAK
	gX1JVdC0GI9doA1re7faCWjPGdCXIRQPRu6VXpBoxIMRuieys4Rp0pQGBzMTT4/7
	SmgvFCt+e9vjTXxtgezxifwG7inuv5NJEVL8nsubuiljcL+vcyyVixsG5AwYb4GL
	L/Ec1bfb/sDTA5xlPB+j8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711619152; x=
	1711622752; bh=CQCmVmeY0w/oD6haN/Pv1pQc8Cmiyv6cnQX0+bpjZ2U=; b=U
	8nfyePA2GtFXmD3TDCbhiJ4bx1e54/3LOyNvba3jsu/9gjfJ0kZ1ojJZpsoyb/bV
	2d3IldcG6ofGK7LPxHckXVuFYmtKINfk5M3qxh89xwaRxKLRKuC6QRkpKbW8AU/2
	KZB7h+e0BwGLmHaOo7KxjqrJTPF8LLA/x0heka63NBOFlPJB/HI+C7u3irLxCTO1
	EcMDm8nTzgYAHapInW53y4ojwhlW3koj6w4rE7IVYxQr/1+7trUdN/PYf7dOmhHO
	e8H+bgyKqJlfYRMc0LtjPy2XgNP9IVbiqtPIAIxh/7gVIIVckCAIToDwXAl8Kwbq
	C5wDFjQPK23GoPPCfN+sw==
X-ME-Sender: <xms:TjwFZhKkDa4AQsQqX84frHAHAK4lLAaGQgiqQyS7JwHwKTWI9yEX2g>
    <xme:TjwFZtIjxYHJwY3HyyF0O8yxhBK-ZOgMz4lfbkUg2FXTxqCHEIIw6-hsB3m8NSTAt
    Vbeez3AeeCC02FF_uc>
X-ME-Received: <xmr:TjwFZptEF3hzSwXT7QxjpBcKaqBnOB7JTNG4VRRuf1LMEGKpAJtCJzQuHLI4Eul2AA0AQ7hMlRKRTNmlWlCBQFY_6fMpH7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:TjwFZibkUvcJy8aORoNspduOcN0X1nzmZ47SLRIgU_PyaSz0GjhPig>
    <xmx:TjwFZoYMkUq2W5h6PvJFVzVqG7yJbQ2fMTQ9cju5bLGMVEvIOy4PGA>
    <xmx:TjwFZmBVcVFbHQUA6gfT4i8_izpw401SDpCGul7b5CrMYepaTXzgKQ>
    <xmx:TjwFZmYrE-czMreDEPxvOD0qX83_5Xid1W6Mo9D-d_eGdxDS5EGR9A>
    <xmx:TzwFZlJWBtkZB_vPqwQmD3vq9aYZN82A4_hfar72yWKS-rWIk6M20wZDMqSWK0d9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Mar 2024 05:45:49 -0400 (EDT)
Date: Thu, 28 Mar 2024 10:45:46 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v4 0/2] ravb: Support describing the MDIO bus
Message-ID: <20240328094546.GI1108818@ragnatech.se>
References: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>

Hi netdev,

This series was marked as Deferred in patchwork. I just wonder why that 
is? Patch 1/2 touches bindings so it could go thru the Renesas tree but 
patch 2/2 touches the driver and depends on 1/2. Should not this whole 
series go thru net-next?

I fear it might have been flagged as Deferred as v3 was posted on the 
same day net-next closed and was therefore closed as Deferred.

On 2024-03-25 16:34:49 +0100, Niklas Söderlund wrote:
> Hello,
> 
> This series adds support to the binding and driver of the Renesas
> Ethernet AVB to described the MDIO bus. Currently the driver uses the OF
> node of the device itself when registering the MDIO bus. This forces any
> MDIO bus properties the MDIO core should react on to be set on the
> device OF node. This is confusing and non of the MDIO bus properties are
> described in the Ethernet AVB bindings.
> 
> Patch 1/2 extends the bindings with an optional mdio child-node to the
> device that can be used to contain the MDIO bus settings. While patch
> 2/2 changes the driver to use this node (if present) when registering
> the MDIO bus.
> 
> If the new optional mdio child-node is not present the driver fallback
> to the old behavior and uses the device OF node like before. This change
> is fully backward compatible with existing usage of the bindings.
> 
> For changelog see individual patches.
> 
> Niklas Söderlund (2):
>   dt-bindings: net: renesas,etheravb: Add optional MDIO bus node
>   ravb: Add support for an optional MDIO mode
> 
>  .../devicetree/bindings/net/renesas,etheravb.yaml    | 12 ++++++++++--
>  drivers/net/ethernet/renesas/ravb_main.c             |  9 ++++++++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

