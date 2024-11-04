Return-Path: <linux-renesas-soc+bounces-10273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC80B9BB3A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 12:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91A4B2824C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D332A1AE006;
	Mon,  4 Nov 2024 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZfRTK+nS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ngpzT2Ro"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29894430;
	Mon,  4 Nov 2024 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730720419; cv=none; b=HE27RnomprWI+RPfqfuQ7ejOOsJ50uP9+3ejQHYAb6V3MedtrrTvQ8wkUxzenzAadANlr+ObyZsK4Kr2W//C4cI0oIfdZkvZzdthtZhIU4nKg9FrP/jgPodOyb2i2KrA62M1MNBxWW10yK2I44wyZm37LrPWTg9m6gZtjvpnrGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730720419; c=relaxed/simple;
	bh=oP6HlThFxLs4XFbw1JoNa2rJAAq8xNotdQDdTtnEFns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LboYw5V2xzw31ztTlp3GZbx6aoaPH6yDvPkPU0X4NGlqhTsd/z7rSEnF1+ERLSPUhda7IZP5KIGbgGasvwo+451RpR3psNJNS7nlKlpHxjaT0mGUlH+A9kln1MCXj/WCTfstk/Zu8ETdv7YJu0ME+Ur2oiVHcg78A7b32pdPoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZfRTK+nS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ngpzT2Ro; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id E67941380245;
	Mon,  4 Nov 2024 06:40:15 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 04 Nov 2024 06:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730720415;
	 x=1730806815; bh=9NvuvEGu3Y4fTmutyF3/3Q9gfOSQU+11sjoTRbXFud0=; b=
	ZfRTK+nSkeMx3RXf2XQuFpxvYZRGie/5Yhg+B5CtJfTucY3IJkVu3Kr3mhGseIkt
	TixKhMIb86u0Rab4gw0osHZhrsLu0QAVUbCIWlK+n2Cqb77OeCMf3zzFTrZc4Usy
	1fxqVFs6X2dp7GRLu+0LyCNiXyy2vzu7t4n/m3qZ16e9MqXfT3NImd36OHUbvcer
	ervWrXQJz2ojyenuEon0CPfootIEDLAvM1rNbvjajiCPVTB8RD/4RxsMu3zCp36h
	eDFFr21BUtciOS6b4jFVve97URoOgoBFreaIqxMgOVTuob9xcdQiyoa7H8KDZAR0
	UgTbh3HkiYaZD859+Yszmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730720415; x=
	1730806815; bh=9NvuvEGu3Y4fTmutyF3/3Q9gfOSQU+11sjoTRbXFud0=; b=n
	gpzT2RoN5LgOBPo4CP6HmzwHuBuDrljq7eAbe8iGsFgP5F/rKfKarrPoQoUBqnp3
	ldpWdKOE9tvXclshdKIfnUTQ7ixVUW5aDmB8vum5TbhbEhZxuUFX1zrivLIWI4Zh
	6JfclzyyagDG6yp3NYoeJ0jnW8KjtiNVx4giaCIKHUDuETs7SL0XoJao9msFNZPZ
	13gUptKidOuSRYyqD7wlmSLTkensrV3hsVPRW1Fg+Q3uz6dYCuSLK/CM2zmy6jWZ
	awE2NIPRkZFHrWr//tAf7DgJGrwK6E/C9syrKXGf06h8+P5XEM1bJ7ow6n97mlbA
	fw9I0a4klDEYZvYE4NBPA==
X-ME-Sender: <xms:nrIoZ7d4JISUqqkav6FmE-wqB6wSDq6F22AkNIry-Qf-OaZoaeVkUQ>
    <xme:nrIoZxPspUrmFkH5lK1zsoF0oMbWrS2swMWew6Rm7iHV-Eh3nabzNsO82553Fdph_
    xpLhsdXEnsNfIeWtpE>
X-ME-Received: <xmr:nrIoZ0juou1mKZgcYByeqTTIhcNp_h5JcNcDcuC41Fsxq1y9c0_KtLGbCljgJac2qeDnqPNYWy-H2Bbf9yMkvfoCvcbYQlyfBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeliedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehgrhgvgh
    hkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehprghulhdr
    sggrrhhkvghrrdgtthessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtoheptghlrg
    huughiuhdrsggviihnvggrrdhujhessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthht
    ohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpd
    hrtghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgv
    rhhshhhiphdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpth
    htohepshgvrhhgvghirdhshhhthihlhihovhesghhmrghilhdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nrIoZ8-Qt--vfk6ocNKhaE2m9iIqgy5Or-xTJcI4Znqw0g397x1SqA>
    <xmx:nrIoZ3tmWjpoifNQagnMtALxGSF5h3PFQmtMem72VRrb-VbocTltHQ>
    <xmx:nrIoZ7HA2rTC_fVIIfShUX_HS6JENNCo51ydAAyh6BB2t8t-a2mfkQ>
    <xmx:nrIoZ-OiDB4x6VOq20qOMa4w5I1eMB4pyV6G2od5Pxii6fyddHANVA>
    <xmx:n7IoZ_Mf5HCqw0hwfyhdJXRFB_Djjzp0i-u8Arfxko5kdqc4I9okRsf9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Nov 2024 06:40:14 -0500 (EST)
Date: Mon, 4 Nov 2024 12:40:07 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH/RFC v2] MAINTAINERS: Re-add cancelled Renesas driver
 sections
Message-ID: <20241104114007.GA1412590@ragnatech.se>
References: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>

Hi Geert,

Thanks for sorting this out.

On 2024-11-04 12:05:07 +0100, Geert Uytterhoeven wrote:
> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
> SuperH Ethernet drivers.  Add people who volunteered to maintain these
> drivers (thanks a lot!).
> 
> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Acked-by: Niklas Cassel <cassel@kernel.org>
> ---
> To be applied to renesas-fixes for v6.12 after v6.12-rc7, unless a
> better solution is found.
> 
> v2:
>   - Add Acked-by, Reviewed-by,
>   - Add M:-entries.
> ---
>  MAINTAINERS | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13f4c23281f89332..b04d678240e80ec9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19578,6 +19578,16 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>  F:	drivers/i2c/busses/i2c-emev2.c
>  
> +RENESAS ETHERNET AVB DRIVER
> +M:	Paul Barker <paul.barker.ct@bp.renesas.com>
> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I'm happy to look after the RAVB driver together with Paul. However 
please don't add my +renesas tag email for new entries in the 
MAINTAINERS file.

With this fixed for RAVB and SUPERH ETHERNET,

Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/ravb*
> +
>  RENESAS ETHERNET SWITCH DRIVER
>  R:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	netdev@vger.kernel.org
> @@ -19627,6 +19637,14 @@ F:	Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
>  F:	drivers/i2c/busses/i2c-rcar.c
>  F:	drivers/i2c/busses/i2c-sh_mobile.c
>  
> +RENESAS R-CAR SATA DRIVER
> +M:	Geert Uytterhoeven <geert+renesas@glider.be>
> +L:	linux-ide@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +F:	drivers/ata/sata_rcar.c
> +
>  RENESAS R-CAR THERMAL DRIVERS
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
>  L:	linux-renesas-soc@vger.kernel.org
> @@ -19702,6 +19720,16 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>  F:	drivers/i2c/busses/i2c-rzv2m.c
>  
> +RENESAS SUPERH ETHERNET DRIVER
> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/sh_eth*
> +F:	include/linux/sh_eth.h
> +
>  RENESAS USB PHY DRIVER
>  M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	linux-renesas-soc@vger.kernel.org
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

