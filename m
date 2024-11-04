Return-Path: <linux-renesas-soc+bounces-10269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD629BAC38
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 06:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DB811C2092B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 05:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFCF18B491;
	Mon,  4 Nov 2024 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0l2PahRp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E4718BC2C;
	Mon,  4 Nov 2024 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730699321; cv=none; b=tTHwBw8BA7OHSvnLsw7nPzWrfSTraDsc41rSQ4kCvDYUDvxqWe3YpON1IQe2oCPBxvZf07i3Zu+nS17tveHuleN3oYG0KLnlNPUTaxo8gTVSkMzcFPNSFPchX+orPI+7YrokjPKOyCwsnH/mLHM22d+b0lNebV2reZy+m5y4JBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730699321; c=relaxed/simple;
	bh=5fy6xKs7vhmUZBinU8ERiLTywxLCmF+rAnpbE/Um2aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIqyFLaiZRRkIXtvBQCXGbdTQPoGoeUFkk39vA3uKe+zmAvoHrHx36RhhD5xi8hsvBGw1MA98cYjIJA5QOu+hO3Jc3k9EI0Hcp9l4tkgh8b234PdsJXj5C7eY3lSB33xFS9VxE7fowVENyZdqh7wV6HiBxRbhJr5yY79M4o6C7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0l2PahRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BD5C4CECE;
	Mon,  4 Nov 2024 05:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730699320;
	bh=5fy6xKs7vhmUZBinU8ERiLTywxLCmF+rAnpbE/Um2aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0l2PahRptpiEAyN4wodVq4nyyBKrG2iT6AhSssgSZs12x9aXjOxFaAP3N0pwTcizi
	 0hjt3vxUg4eg/t6fBn4ehlSbmIKddGTVTRJHCIzG8Xp/Y9VybmzsMblzQ7dGLO4WKI
	 QD7fOU4iUdeofngSjTc8KUEXUZUkpAG2PYLruDZQ=
Date: Mon, 4 Nov 2024 01:34:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver sections
Message-ID: <2024110457-enhance-arrive-b781@gregkh>
References: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>

On Mon, Oct 21, 2024 at 01:56:51PM +0200, Geert Uytterhoeven wrote:
> +RENESAS R-CAR SATA DRIVER
> +L:	linux-ide@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +F:	drivers/ata/sata_rcar.c

You can't have a "Supported" entry with no person assigned to it :(

