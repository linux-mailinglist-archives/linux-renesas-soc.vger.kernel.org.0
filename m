Return-Path: <linux-renesas-soc+bounces-34101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 13ITDMCVMWrVnQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 20:28:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F2694276
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 20:28:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=mMXCNUNW;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=VVsXPiOA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E78D312F04E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 18:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE2C478868;
	Tue, 16 Jun 2026 18:28:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37363472798;
	Tue, 16 Jun 2026 18:28:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781634488; cv=none; b=fA4APbedOGxEHsy2VSo4HFB1vFT8hPLXMHttruYWupAhM7yAfLZ4Ib/bEUcFKj7nH4uvymTm4wrwtx1EPqPJtKJWsohYclr//me/5ws/sWcKA87xsR+IutHua4BtVDqyDWWxof3Wl1oXRkWQ7Oq6UGTR9veJNKwBqb3D0vBi6dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781634488; c=relaxed/simple;
	bh=cauuSKOD9be1nCF8OIXuzJJdDKyjLeHMP9n64X8cU1E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUgyleE2UM2Zipns1npurUyMlB3yqR8Sb/mzoVsRV9Of+yrJQkwZukMQJ3s4CHhkl1TDuUom+OSJZYFPWsV9K1qTrCDEygNCKYKHJ9j1mmEDFvVehm63mXZFcgD5EP59BVb3bub4eoi2Y419WOIH8vH5BZao6TGoMGEPgfkABMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mMXCNUNW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VVsXPiOA; arc=none smtp.client-ip=202.12.124.158
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D51697A0178;
	Tue, 16 Jun 2026 14:28:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 16 Jun 2026 14:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781634485;
	 x=1781720885; bh=VC7DCe11ZyrzA2G7vkYOQT1GcSliXObtOSZKwBmMzRo=; b=
	mMXCNUNWUNg65wsus5Oisk4uOqeWdq87vg0PeR9Xz2Fn4JjPraVN1PFC+aGrNxDS
	BBmiaOvXAl+ILHZng+aRU/XnPR2DJQde5J1zN9fet7S0If4HnH68XXkzTSlBYXw9
	2hFUAJffe3nL0Hld/Vm8erzHgcExKPUjLp0xokmd0eOhENfNacCAzWQPLhr5J+2c
	jOoDOozEJAfF/oLdVepx7V/Uf3axTCJps25FnL1FapYhdKHJGoDVicZuiCAyJ2dN
	1zsEhsOJ8OxCOdLiH+vCQoRsd3tWuXQyavnifdh4G921DbRNmHcB5KvQrpaoAdat
	J33fusBM+G9kXLlri87GKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781634485; x=1781720885; bh=V
	C7DCe11ZyrzA2G7vkYOQT1GcSliXObtOSZKwBmMzRo=; b=VVsXPiOAWff6HReYo
	7U+j2lc3tJeL9fb0eflW8kxp5Dvqez2Q1UgrGMDACP57morRDwXXMvKy4SF4qzr+
	x/NrBvThFgDo8eC8tDyELb5KEn1JVRTe6uydpy/eP7u6uwPbtYGbI7dVhiv7sEFw
	VAIEqBG8tTgFGg4KcD3g/GEfM3s4Gmin38q8DG33I++zgcoEwjLd9sOd1DjY259j
	QLGBBVvkichLTXCLcC9YYjQzBv/IpCOghGNud/MjzML3iQVn6AqMMpzwc+1CJ5jY
	d8+1YpDFuLIFR9yVI7u0X8rMXIkcBugEiZlsrJU8a0yMhW+I6j5QUAbNsZZeugxE
	+ZpDg==
X-ME-Sender: <xms:tJUxajtoRbiRmW1poiSDMiZC1UlZY2lixfA34fldFqhN1uRegCHOiA>
    <xme:tJUxai-hHPEnPbxyCqUm9UQRNxyOAeYQL0kxc5mVNyNh8_XQTpVbrlSTx8U4MOQY-
    m5b3SwULEnMENtoWnHJB_KDRd7zybyZuwtt-h545d8MorTbIBcR2g>
X-ME-Received: <xmr:tJUxatn2UDE9O17qYGRdNPUibemkUX04LFE8Hv5Z_fpX-XRCkGR9RMdMvNfRdGJqCA9E5t_QN4zcjorSbs-8H57iFb5Y>
X-ME-Proxy-Cause: dmFkZTGrC5DYJP9mSxqJd1fDXc0Oh1AGx3JLF0BRoNGPbCwDKFsaw0D49sQCZTbacGELJP
    NPTNfLWvLgiPPk8vfyWDXR9pvW4cjmDKY+4hStnqjC00ax5yRqzEy7s74FV3Hst0oRau05
    +ZOMSZTUF108LlkZ2bYRXRXyXUJeSS8XHpZ+B6zsfyqUVuJYZ+5HIS98pyiXjS3nRQlNe+
    ZjHbBYR5RgivqZj4ZTUGyl3488WbqeP2qTbAGbkO61UP/cMkWZvsgOuuB9JTEbsBXmiGDy
    dOAAnO+9yWExe3+wxZw7oKyr7SKFr6rnJQISOhv7KbwSDOJwPFjdu7d/V6aiFdPml6XCrS
    R3JqRpkUv/4qoe+0fvmTytcOSlFdsKxpKg58u6aYZ1z2A3fSQCnTWefZ7HjiUwuE8hQC4p
    G/S2m8yrTFEuKFnGlmbqljvKuVc4mAf+rhAiyDy+56MoV2x5W9ScAn+N3UFkqMBOEWuWKs
    s1KiXcknlIA1fYSBCXyT82MmaoJeODLfHNnAA4C4Aj66F/UzmJot110c9VuWCAPk8gIFqc
    39cazJKohx853+MZmwELfMmd4I63YViLryT7pYGNiJ6oxH3RsuFHnRYhsgQ80XhvZG0bun
    OdKWBXU4jTx2h2XZ8ZkIrmuHQC/plGNTA6FFsJ8tesDFJ7uRuYAjilFy+eIQ
X-ME-Proxy: <xmx:tJUxaiNcskzLMEK9Oa4ndBu1OwgYuJIrLUAIiDoo4HCVgda1wh4MZw>
    <xmx:tJUxasLq-wBc_WmQiFYIfvkEeQiO87MJrIWsIEZjY-nXrCiG2P2ldw>
    <xmx:tJUxatG-PaNMzX79RsuzDlf73S5K2776QWiJy45vAH0PPrkYrX_WEg>
    <xmx:tJUxatAKEwAlT0SKZCJlMNWm-i3LYQHDuShGmKhdGhq2Qkyt58ha3A>
    <xmx:tZUxaoXRy8ZHUNEoYu_jK99k0OMhk0rJEh0xohBXEX_-uKrw9VAdShL7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 14:28:03 -0400 (EDT)
Date: Tue, 16 Jun 2026 20:28:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: img,powervr-rogue: Document
 GE8300 GPU in Renesas R-Car D3
Message-ID: <20260616182802.GB1662668@fsdn.se>
References: <20260616175835.2109336-1-niklas.soderlund+renesas@ragnatech.se>
 <20260616175835.2109336-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616175835.2109336-2-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34101-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[mailbox.org,glider.be,kernel.org,gmail.com,imgtec.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:geert+renesas@glider.be,m:conor+dt@kernel.org,m:airlied@gmail.com,m:frank.binns@imgtec.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:matt.coster@imgtec.com,m:mripard@kernel.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:geert@glider.be,m:conor@kernel.org,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:from_mime,messagingengine.com:dkim,fsdn.se:mid,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B76F2694276

On 2026-06-16 19:58:34 +0200, Niklas Söderlund wrote:
> Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoCs.
> 
> Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
> it is always on. Extend the list of special cases for this to also cover
> R8A77995 and update the description of it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Changes since v1
> - Sort img,img-ge8300 after img,img-ge7800.
> - Fold special case for power domain into an existing one and update the
>   description.
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f3..b93f49f1fa0a 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -25,6 +25,11 @@ properties:
>                - renesas,r8a779a0-gpu
>            - const: img,img-ge7800
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - renesas,r8a77995-gpu
> +          - const: img,img-ge8300
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -114,6 +119,7 @@ allOf:
>            contains:
>              enum:
>                - img,img-ge7800
> +              - img,img-ge8300
>                - img,img-gx6250
>                - thead,th1520-gpu
>      then:
> @@ -159,14 +165,14 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:

The 'contains' node should have been kept, my bad. I wonder why 'make 
dt_binding_check' or `make dtbs_check' did not catch it. Sorry for the 
noise.

> -            const: thead,th1520-gpu
> +          enum:
> +            - renesas,r8a77995-gpu
> +            - thead,th1520-gpu
>      then:
>        properties:
>          power-domains:
>            items:
> -            - description: The single, unified power domain for the GPU on the
> -                TH1520 SoC, integrating all internal IP power domains.
> +            - description: The single, unified power domain for the GPU.
>          power-domain-names: false
>        required:
>          - power-domains
> -- 
> 2.54.0
> 

-- 
Kind Regards,
Niklas Söderlund

