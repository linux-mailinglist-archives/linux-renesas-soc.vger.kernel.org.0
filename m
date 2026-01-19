Return-Path: <linux-renesas-soc+bounces-27037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7ED3A6C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 12:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E04D3003191
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9D7311C1D;
	Mon, 19 Jan 2026 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5ZSURRT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864193101DB;
	Mon, 19 Jan 2026 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821991; cv=none; b=eJdM1y9SyXKPJ05qLwrYFEYtA9refKMd4WhZRXH1eJO7/cYQSBVpkgMb/FEOOg6HqYN3CIKIgclNGHso+XODqGOXqIx0O5YB+VTYr3dMpYXJrfZwrIu0xa7XsAFTeNJTiiHIgFpsMCeB9XGj46m/r0SVtEK/3R2UwrawZKSgHl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821991; c=relaxed/simple;
	bh=TRoYFafhv6XYbtQkSQrDP1VuW/VHQIo2+i4Os6bLwHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=nQ7g2Mvg/io9rwJgxHZ45X1mXOPOQCtLxz4UqgEPYjybJNCu9pmmM6AGlgcdoRLJPfhGs3pHWIbk2JhtWgjBQJ8gDJKAV2spZoYjKklU+3LI9Ottxku5wUtK9ePHUwWnh//waSjlBQiVFHAAIsZXzuy2pOd2L9ItMsrmkz9U1f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5ZSURRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE914C116C6;
	Mon, 19 Jan 2026 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768821991;
	bh=TRoYFafhv6XYbtQkSQrDP1VuW/VHQIo2+i4Os6bLwHs=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=l5ZSURRT9nh/iNJP+CEEkjm7D6tFTPPkk6CKCVRdP2iiQf85uUvxe3+WZYtnyIFk9
	 rpI5wivHag132WVnVHOYItMfj1s1t2M6bJM6MqF/VIaQUI74kAWww9I1X0uScXLGIA
	 QuLJaY7iyJ1ghVoNbJVvO1jAeakYmazsiAtd99FuayT/yWM70YaAV9ZBM7AbmgShUw
	 uhCBzpfV2sVtxNg1R/IxbZx6hlPkoEXnBjj4LkatT2DEIQxIT/6hBWvUWH4gySFxc3
	 S3qWf7aJsJ4gkrmhF0iJa0enabfTojzMWOvehsLySEGIH9rYKpCRT601kLyQtvBbyy
	 ElAwngxihO8cg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:26:25 +0100
Message-Id: <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
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
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>

On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine
> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)

I think the name of this function is not ideal. 'get' usually indicates tha=
t a
reference count will be taken, but this is not the case here.

I'm also not sure about the machine prefix. If we really want this helper I=
'd
suggest something along the lines of e.g. of_root_read_compatible().

> +{
> +	return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);

