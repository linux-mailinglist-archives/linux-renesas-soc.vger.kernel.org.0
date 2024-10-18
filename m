Return-Path: <linux-renesas-soc+bounces-9877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E64799A40C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 16:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5832282D3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 14:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFAB55887;
	Fri, 18 Oct 2024 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qAex1rLi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A173207
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729260570; cv=none; b=oRh+/i8Ov6VY+awRpEYqLuos4E9kNt8bM7EQsR37XSaud9dixbNCbmnmhT0hCsenGTGBmgXtJPGLdb/eFoJaUXlIvqIdue0qfrbVziLFtCj0V2ovGoabL8oMjv6pN0UkO6RNaINlROXN2MqAVu6RQ9Dy8KKBHOXOIlSicJ7bfDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729260570; c=relaxed/simple;
	bh=C4/YmzjPc/7gwlrguDACjSm7qG4ICBi4j44FEcFFiJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXkp1o7MoGCooAIx9PSf3L7adn8UEylqDsL8K5yphvfTkiJo1GMDqiCqCJyDnruzduUQ4caStD4eR0d3FUfNVV9xnzVEiB6eKgwHPpnQg/+eJ1qjg919xVpS8FmFiIPQdkQCtdZ07TIsfrii0RUe07AeisvxPpyLAo0mgyTXyoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qAex1rLi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6025C4CEC3;
	Fri, 18 Oct 2024 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729260569;
	bh=C4/YmzjPc/7gwlrguDACjSm7qG4ICBi4j44FEcFFiJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAex1rLiF/nSM6ahr6psEp73xyqP1jEWlPCeL8IN28waoRXswxWVHfNsyWJ3vodWR
	 uLxRH39inIyELXBiWjI6/XS3mrQw3oSkhnG1+kMIIhhz+Tp8VpBXGHZe9Lksh/ymjH
	 WVujzgtmaTDHMufXIMAOupUa2XflUr88V/Lpgfnc=
Date: Fri, 18 Oct 2024 16:09:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Douglas Anderson <dianders@chromium.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <2024101855-judo-tattered-bc3c@gregkh>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>

On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> CC GregKH
> 
> On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > Each bridge instance creates up to four auxiliary devices with different
> > > names.  However, their IDs are always zero, causing duplicate filename
> > > errors when a system has multiple bridges:
> > >
> > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > >
> > > Fix this by using a unique instance ID per bridge instance.
> >
> > Isn't this something that should be handled by the AUX core ? The code
> > below would otherwise need to be duplicated by all drivers, which seems
> > a burden we should avoid.
> 
> According to the documentation, this is the responsibility of the caller
> https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> I believe this is the same for platform devices.
> See also the example at
> https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> 
> Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> bus does not.

Yes, it does not as it's up to the caller to create a unique name, like
your patch here does.  I'd argue that platform should also not do
automatic device ids, but that's a different argument :)

This change looks good to me!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

