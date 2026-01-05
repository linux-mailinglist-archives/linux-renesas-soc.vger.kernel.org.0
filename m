Return-Path: <linux-renesas-soc+bounces-26266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 486F9CF19CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 03:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 796E43001184
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 02:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9512D6E6B;
	Mon,  5 Jan 2026 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uUIE7nEw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uuk28qZD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC63F1CEADB;
	Mon,  5 Jan 2026 02:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579234; cv=none; b=Q1kmu0zEXkBAbF71+2aWP35eZr3c8IS1aBOZk+S/VDzZOsWtpVB+0XY0k2HVwOtYy20dkPugPyOt6zMKK3GC0EgDnLBPRV61gMpnHVKMmP9k9d8ig6HJ/TscnsmdR/pBLracnY2WUsohHywsxVfFonTp/KNojozxHx+MP885c0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579234; c=relaxed/simple;
	bh=Ta9OaqK2IBAvC5m51kuEDDHu9mdE7I9N51r0MpJG9wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RSRZU5zOmeo7ZmSNB9SiA5PwRt1sIRVp6OcK9B8j0ouSsNe8ehJ+ESc11OctR8tUTFXAa9V8zTDwi+t/k6JpKITc+aPXmDAToZDKypE9zIwxv0lZyxvEBPF2o440Y8GtVdF4RJygVs2BYwxKOAoNKFn5La7u+OTSXYIQs2iJqfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uUIE7nEw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uuk28qZD; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dkyXG4DChz9t0l;
	Mon,  5 Jan 2026 03:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767579230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUECMuqTPTti9Ot6WKiCSLREkvP/PSjUrsLYS0gj92w=;
	b=uUIE7nEw3HzG/JFECxTLY3A8M8W3sWxH/2pqxddIfrenRGrQsVFRVRKPmKMdRGecfhKXFu
	lkrvomg/r15r/XTin1lRDwBLjA9+Mi5KHN+89FAlTPxGCCjUnqR757VAS2/Ts5hnk82ebm
	jvjH5E6KM+mTL9dXVgCDeAQTCn1s/Cs2KWm5Z24MX6KIDa1aRrxwqCB44OJh7VtfDa+B1j
	WFD/f+4yfytSGLwmWDFE4nzldkragMBmULc+2xbQ7heM45NrDPjGNhhyQnGWKiK8ELNv7d
	3W9If+rJzBNwkFR2GTICLmbRWk1F+nCj/UCaR9IOxSWM5PtQl9CeZsntPDsx1A==
Message-ID: <dec21ad6-c87f-451b-bdab-9227d457a166@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767579228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUECMuqTPTti9Ot6WKiCSLREkvP/PSjUrsLYS0gj92w=;
	b=uuk28qZDKMnJhI3Owfbv0IzmBf2xE4iGmD+q/qhu+7V8Uo30XiDayu/65ciYu9xtldWdTU
	4SgbmQ3FwnqMIV5LYfDwdFAI6TYAGVz8BoxUrxe06BKoGWQ5Di6qM/PpGpSn92h2VPh9KG
	FFA4UowtTOwm70LIOk/u7oPbGwO2dpwgI6gEIgwEJYyW3RaOQLNQA/Rqx6s6wraIA1rOf5
	nEXRl10uhMsZboMfLQUCYmSmls4IiuG7aATqIUY0KJ5wh2LQJ9Dy4ZlnEfgq16ZIF8BzzB
	+UZ1rCTazbslmCkx4uRh3BZ+BQNVqOx+TRNdPlY5KRRVwxOQL5wkzYEZnKMY6A==
Date: Mon, 5 Jan 2026 02:30:59 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE8300
 GPU in Renesas R-Car D3
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
 <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9c3t8gm3gacrsr9u4o75s1myppzmoz1n
X-MBO-RS-ID: c84e245cb2454d947dd

On 1/4/26 11:26 PM, Niklas Söderlund wrote:
> Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoCs.
> 
> Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
> it is always on. Extend the list of special cases for R8A77995 to
> capture this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   .../bindings/gpu/img,powervr-rogue.yaml       | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 86ef68985317..2122380561e4 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -25,6 +25,11 @@ properties:
>                 - renesas,r8a779a0-gpu

> +              - renesas,r8a77995-gpu
                                   ^

Keep the list sorted (995 goes before a0)

> +          - const: img,img-ge8300
> +          - const: img,img-rogue
>         - items:
>             - enum:
>                 - ti,am62-gpu
> @@ -111,6 +116,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - img,img-ge8300
>                 - img,img-ge7800
                             ^^^

Keep the list sorted, 8 > 7 .

>                 - img,img-gx6250
>                 - thead,th1520-gpu

