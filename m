Return-Path: <linux-renesas-soc+bounces-27038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A834D3A6F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 12:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D18CD30011AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8084B313291;
	Mon, 19 Jan 2026 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7rEkfzG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA43128CA;
	Mon, 19 Jan 2026 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822575; cv=none; b=OeckNzMfN+6WMA7VtuFOQmAGEodWaURwCpaL6d4o7Z7AyU/lDz6x2G4s/tnDllzZBYWeC4GP3yrE8et2pGZLteQFA7Fn0k77g4QO/wlC5thvM90ukelt9Js9fauXxql8TiBsVhUkrqgLtaYfFq4v5wCViANSpLHOxvhPM/XnF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822575; c=relaxed/simple;
	bh=OQinx1qBrX1pwq31acCG+L+3NgEjuiriHQfON/AY/rg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=s9EH201aO2KgXqY5Q/KNcunMTZfCYwaoKXtxI0DhuFjN0d8LtkSSKdrwrVidrmDO+LmtV9JsevtQpoSd9c/xMWwrWJu1gc7AYF5KEO0pxpd7daHMw9bwCMBPm6fERF/DTxbZ84i3hktAjH7FAMYgnHMfQdA8/Y8VOt6yIAs13lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7rEkfzG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9E3C116C6;
	Mon, 19 Jan 2026 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822574;
	bh=OQinx1qBrX1pwq31acCG+L+3NgEjuiriHQfON/AY/rg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Q7rEkfzGjUkdkLUMw2ZzG/zLwSm9pxB9UUK4Zq2Vvsh765XsoyJRENkSFrQycIObl
	 UjIhmRCXCsiKzSUo7mxsWiC3hBoe/LJfFTWvwXQwDC7XwSmACPI06b4qv+pSNrhOgl
	 09sixcXOxnbd7EGd20DKDKUmMchA9DpWntHdNA3XJaawRA65n/PaisNRh2vKd4JbFd
	 VYTqzJgFLx6mpYG4nfUQWGVtU4TAP1eEIdjwAYR/gcD/J52wMH26ARBt4Pqea5KzNP
	 3nz7ojLpYAQLVFUuiR90PbSI5WZ4SCKH/F3KkgIByMQSEUSMAwyA4bNzSqwQli6vie
	 prijfAz8KLjCA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:36:09 +0100
Message-Id: <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>

On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_=
attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -	struct device_node *np;
> -
>  	if (soc_dev_attr->machine)
> -		return;
> +		return -EBUSY;
> +
> +	struct device_node *np __free(device_node) =3D of_find_node_by_path("/"=
);
> +	if (!np)
> +		return -ENOENT;

This should never fail at this point, no? Also, can't we just use of_root?

> =20
> -	np =3D of_find_node_by_path("/");
> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
> -	of_node_put(np);
> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);

If we want to export this, we shouldn't reuse the existing name, which is
misleading.

soc_device_get_machine() reads as if we return a reference count of somethi=
ng.
Additionally, it operates on struct soc_device_attribute instead of struct
soc_device, where the name suggests the latter.

Instead this should be soc_device_attribute_read_machine() or if we want a
shorter name, just soc_attr_read_machine().

