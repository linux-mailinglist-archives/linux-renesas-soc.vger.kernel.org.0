Return-Path: <linux-renesas-soc+bounces-34406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id guqkC/IcPGo9kAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 20:07:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067C6C0A08
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 20:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=ojDgyyR2;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="M GVcnIm";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1EDA303C01B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 18:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882173DD50E;
	Wed, 24 Jun 2026 18:07:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE902F7F09;
	Wed, 24 Jun 2026 18:07:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782324462; cv=none; b=Pc6Ee9Q/Gjo9l9LdJEl2doswAL2gLq+vA6Eh//LMo4X8PIbHAZlqazGlRTMWRKIICMfjkLUhr1fHY2JcqRgTApkZvX5s9+dSGO/YhomadRFKUbw3lN3ht2pBm5dTjNUkvfW2o3CfaiImL64jbdSOS3wTqeidSAIp3yne5KOlYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782324462; c=relaxed/simple;
	bh=vIeB7hTO5R/q0aGnn0P1wUkQqXgjBEKmTnkptIBTn4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7oUKYlukfj9TXv+zvs+ubnm8AE0XsNassN4aOhx6IlPLY8o2DwZ04RcoTd8a/noyYfnBhjbyHwnvjf1yrnBfMsr8u8uVSMYnkz6HqsgU9TU+ZJfzDfiOJgJtss6NuShKME4jYc1z1LTHpSF0a5chMjBVt/lXcv3U6ns9r5lEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ojDgyyR2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MGVcnImH; arc=none smtp.client-ip=103.168.172.151
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8D35CEC036B;
	Wed, 24 Jun 2026 14:07:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 24 Jun 2026 14:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782324459;
	 x=1782410859; bh=CBO7oDIF3KnSR35ayUSjsvhUhbG+HEgdxE0c1Pcve5M=; b=
	ojDgyyR2piSWwyY0BBWcUHxyjknFlE3Kpt8VQlguGF66HW7MqXjU4q1Zxr8I5NMI
	9oC6B4gPkclwXe3pRxI30fd0KIz1clenNBI3zLdTpEC8DLtidAWmWVNXJOfrRMD0
	OADZCGpVhpl859hVQKgRTNd0E1XzPvE3rXBWWyJhQAnzGKUX9hmv1D9Sa23uz6yg
	MT06Hk4zemB4hvFEJS+Jgs5WCiZh9nxzGmcnSP8hDE/RuMIu3lQGN5IobaTdyAwj
	zrHeDWBgatclAZ13DBdN+QeO6QtPjhEFbjlN2vk2mfL7Y8mBHMTNyymSLE4FlPsg
	l/OajZHk8rbsgE2u+DTL8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782324459; x=
	1782410859; bh=CBO7oDIF3KnSR35ayUSjsvhUhbG+HEgdxE0c1Pcve5M=; b=M
	GVcnImH5Ud4D54TCcaTcUS5zjyf39hm2O+1/JhvafZflyN7yhU6SsHEMkcL0bQ5J
	9tLyV65f7xn+KKt2lXESUNX9SWMqNDDsFn5Pdyf3ONHrxw7UiYszMxIeRYAbWlD2
	VP0uKHpPAqU110Vqg5VE+iwCeOiZmTeLdtFIGXhhsyOuHxR8enGzLM6uBRQx4jvj
	hPhC4OMvlQN21n+92XYA6P0K6uAboTXL4Ts6KjWe3fN8ViwGgFgmbTK1YCQMUHO5
	2MWb7qeAZug02QW45V+PwN0dmvRNq9Alf+CsS9jLNHxqvAgz+V8Ut4stUwsDkiIl
	rRHwQdciZHMp2POnsc4vw==
X-ME-Sender: <xms:6xw8ajFZBMygWtrg-ng1sLp0HhclCeb4XfAi4Qicc-2x4FX9_lXDZw>
    <xme:6xw8agxz0rAB0YWfD-lEYSfrsbz-NNGz_1z8qBMr9LbQk8pMUWWuc39fL82dJGlNI
    pUEG8r7keWwZ5dK4b8zJpVGA43V-9KE6avyYl2JBWS71RS3efZC2Bs>
X-ME-Received: <xmr:6xw8ak406zSTfrj5VnAJ1MYQ2nkbNJd0p3dFPMVKZ3J49NOYB60ZJ1phamFOkOj1Yy2r1hFPU5hSDmhB6mrGnGVLtImQVNc>
X-ME-Proxy-Cause: dmFkZTEpiQERQE3oBq7W0Xaj6SLWgPNdfBzbhu5hBuzlRNrQlkNxGpmHkE1xEmeA+g4SjJ
    BkJd5R8x21Bb038jK6ybX27YfQJorZaN5a8EsCH1J3yxIhqTRVYYQxxGGt5lVK+x3mtfza
    P5K3IMou3hL2332QWy2d1R7Y1CTBR/L7mukqke7KwWH3j0TxZG0KSI8tEhhiHfPzliRmwa
    6Vb5fZhTypDmHFzDyE9G0/DXZSxP+o9lIk2w+30C4F54KpqaZwvTZpAO8YYN/RJpFbWHvH
    /c2SQOM6ZFKa1HEyUdA/RRBzvIUJoM8oac96K9zzf2qVbP7cdgfLPqrUj6iE1IeES5ADcC
    CGIriOv/FU86n5/Jmusd0Bh+v5gF9auojoR31QeLgsrz5kByM5riE8thbA2qqX0IDsIIYj
    uaNvqY5JlrwGXOKXB6vF0SkPJLf/ZEyWv+ATtJPAHqO64+L4Z9oI6tNF8ebQHc0cfGf/0M
    yXfeGtYkOhiefhLc/ZFbcnDTdswxZO6NJdhIFSMiXC0i1lorTuCUrfBxVQdeT3n+A5vgEb
    5cdSanhL1DuG8DxqFKmRJZRV08VFIQhDXK9dqlygwKw5YFafOmV6fV63ov6S2wV+8D1agx
    bUwhEaks5/CQbH64P9Ve7l25XRgfReevibxq6ShZwOcVTAxeFLB6KAP78eGQ
X-ME-Proxy: <xmx:6xw8atconQuw6tmIf5UphSWSwJZIKry9iroatgOFGZYticpwL-QwWg>
    <xmx:6xw8ajGYeld6oNub300c--FvDHcEyWEf39rkfbgGZ-4KhR9VtZ5gNg>
    <xmx:6xw8al4yzuIFjgwoMMuJ7nYnt68HVBQYinSV2PjmwC_5rwPijW3hzA>
    <xmx:6xw8auttBdp3hIjE2zqHDX_5ucao1aDnukHPyyB6e4VXJsP3UPWnmQ>
    <xmx:6xw8agg2aVWzW4HDPGx2XBn81Hlhm5Ne4qLLOyZJqRoOGxlRYsasKL37>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 14:07:38 -0400 (EDT)
Date: Wed, 24 Jun 2026 20:07:36 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] dt-bindings: net: renesas,ether: Drop example
 "ethernet-phy-ieee802.3-c22" fallback
Message-ID: <20260624180736.GA1325538@ragnatech.se>
References: <20260624150250.131966-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624150250.131966-2-robh@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34406-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8067C6C0A08

Hi Rob,

Thanks for your patch.

On 2026-06-24 10:02:50 -0500, Rob Herring (Arm) wrote:
> Fix the Micrel PHY in the example which shouldn't have the
> fallback "ethernet-phy-ieee802.3-c22" compatible:
> 
> Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 \
>   (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
>         from schema $id: http://devicetree.org/schemas/net/micrel.yaml
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/net/renesas,ether.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> index f0a52f47f95a..dd7187f12a67 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> @@ -121,8 +121,7 @@ examples:
>          #size-cells = <0>;
>  
>          phy1: ethernet-phy@1 {
> -            compatible = "ethernet-phy-id0022.1537",
> -                         "ethernet-phy-ieee802.3-c22";
> +            compatible = "ethernet-phy-id0022.1537";
>              reg = <1>;
>              interrupt-parent = <&irqc0>;
>              interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund

