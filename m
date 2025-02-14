Return-Path: <linux-renesas-soc+bounces-13161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1DA35B97
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 11:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0EF188BD20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 10:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA20F25A353;
	Fri, 14 Feb 2025 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PdWtCLGk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268062566D9;
	Fri, 14 Feb 2025 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528915; cv=none; b=bDqRWfwEPFkH8MKwX2V+gyuZVR8Ndk2/LzHr7Vu76bZbj9icxh5zVGta+ZofI2C7nTuX2v2kY5kXjOc0IF3PODVCOJNlzreNaaFJ+BAykmU3RQM3BDj5hkSfdmKw6sfRTR4zDXKvfpz2bdKD6xvu3t8tv4C64xmIOHKpdonGc6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528915; c=relaxed/simple;
	bh=F/ld3zKjk9ZulDNbF8HNo9as7knQEpoPfX13KvAbOUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nbl/4QbMeh4jx9yPAwFowPfdxq/ayAfZqrr0XBCdU0CR04MMJQSPb8/XIDcGvKXWRb6Qt4D/AP/l3cdK2R2kY+znUOcPr2bzh5f6LCcMhMTxbxiZCnTd7PoI5heRsGLJcsm4oxZqCPNB61NFo789AO9EY3Zy2wpE/zPp9C+tbh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PdWtCLGk; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D9DA441FE;
	Fri, 14 Feb 2025 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739528911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WNA6XL5ePnboysrPE+Dr6WobR/NnMEUJhhNDKl0jrE=;
	b=PdWtCLGk2DkpKx2ZqMxJ4eNfXAGOEVOJdJHRNqbGGIpDrqwU5Srh9KL25DVX4dUgAmCIb5
	W8+XF6dZy5zZJmYEAkZsePloSODQz2DF3HmM944MS61SuMBrqVXOJD1U58qV2iZ6D0hQfd
	XwJJJ0xdabc4veUwCtgw4jqHGIQX4GQh91Edm/vluCyHmeicJBBSNPLgfmclf44ZSrLcB1
	GxexAo8TtmRSW4zrGSbnnNd8/gy6Kf/lMPXqgBhaIYddE+lj1J59nMitV7lKi3LvAWdmfP
	ok9phtuEDP0aUagn9QpZ/JGpmesIZvYDvlyD2UpuPrfVko7Tbrm+YHSpB2zV7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-renesas-soc@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032: Drop snps,dw-apb-uart
 compatibility
In-Reply-To: <e290dd28ecb68b4e164172a905da18a5a2d438a1.1739525488.git.geert+renesas@glider.be>
	(Geert Uytterhoeven's message of "Fri, 14 Feb 2025 10:42:04 +0100")
References: <cover.1739525488.git.geert+renesas@glider.be>
	<e290dd28ecb68b4e164172a905da18a5a2d438a1.1739525488.git.geert+renesas@glider.be>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 14 Feb 2025 11:28:29 +0100
Message-ID: <87cyfkq0qa.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdelkedrudeijedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Geert,

On 14/02/2025 at 10:42:04 +01, Geert Uytterhoeven <geert+renesas@glider.be>=
 wrote:

> make dtbs_check:
>
>     arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@40060000:=
 compatible: 'oneOf' conditional failed, one must be fixed:
> 	    ['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] =
is too long
>     ...
>
> As per commit 72b0505f0830df95 ("dt: serial: Add Renesas RZ/N1 binding
> documentation"), the RZ/N1 UART is a modified Synopsys DesignWare UART.
> The modifications only relate to DMA, so you could actually use the
> controller with the Synopsys compatible string if you are not using DMA,
> but you should not do so.  Hence the first three UARTs (which don't
> support DMA) were added with a "snps,dw-apb-uart" fallback, to use the
> existing Synopsys DesignWare UART support.
>
> Since support for the RZ/N1-specific compatible value was added to the
> driver a long time ago (commit 2ff5fa7f742ab0c6 ("serial: 8250_dw: Add
> compatible string for Renesas RZ/N1 UART") in v4.19), the extra
> compatible value can be dropped safely.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Alternatively, the bindings[1] could be augmented with an extra section:
>
>     - items:
>         - enum:
>             - renesas,r9a06g032-uart
>             - renesas,r9a06g033-uart
>         - const: renesas,rzn1-uart
>         - const: snps,dw-apb-uart     # RZ/N1 without DMA
>
> and perhaps extra logic to prohibit the dmas property when both
> renesas,rzn1-uart and snps,dw-apb-uart are present.

I must say that I prefer this secondary approach, which feels more
accurate. I won't block the one that your proposed below for sure, but I
feel like it is more relevant to add this third entry in the bindings
rather than removing it from the DT. Either way, fine by me.

>
> Given the complexity of the latter, I went for the simple solution.
>
> [1] Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml

Thanks,
Miqu=C3=A8l

