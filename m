Return-Path: <linux-renesas-soc+bounces-14430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13AA634D2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B50653AF41F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 09:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5CE19D090;
	Sun, 16 Mar 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XHD0azW+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9C519DF40
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742118070; cv=none; b=VX16Rj5qw2GBv6TOGX8ag+QVBUjekQNmoRmhV4LcbHZoq4tJm1+0/k1Zq0r0s5SvEpS5WCIdVbCCbs0AAx5oBCjIq0W/7g1HJluw29ci0N2jWaL9WKcLl5mldShrsOLeoTN96IXQbqn2qJ2/3x7Eumu9s4OyJuTpJXYDBWM6OD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742118070; c=relaxed/simple;
	bh=MH/Dtd1tZ5LmIe8eKGJ4IRY1JEP276qPbtH66K1CJbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qd3AbGUYJNNoWxMMYdnIulEWkz8PgBnLJ3cIff6NcMD+YNqOHiZM7jUCbuyUhvNXZfd9NfHyLO3JoBBEZ7hjz6c8UeqYNqfcN7K/7I/4J+BFSTzOqkGA7KtZ5q95tBN3EEbhvf0RIjwyELzb7+Ap5MILiGZwpdMSN7Z1mu7vwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XHD0azW+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-131-203-nat.elisa-mobile.fi [85.76.131.203])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 626B26F3;
	Sun, 16 Mar 2025 10:39:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742117965;
	bh=MH/Dtd1tZ5LmIe8eKGJ4IRY1JEP276qPbtH66K1CJbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHD0azW+FRvqY7ZnztVe/oK7SZsDKSmH7fec6xB/wO3wpAjTeWubnewRh+rWohqCQ
	 8vw+Q09DJjykcR73DgnMgKJE+pjhhPRN1J2Kl9apB3JzRFw5YqOVoGJR5dxdWci3fJ
	 NdJqVvCA39gsVWpWVSzjaThiXQIVGYTzZRW6sTjw=
Date: Sun, 16 Mar 2025 11:40:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <20250316094042.GB29719@pendragon.ideasonboard.com>
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
 <Z9ZuMzPS8dmQWe8D@shikoro>
 <Z9Z5S7ES8d7mjTsJ@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z9Z5S7ES8d7mjTsJ@shikoro>

On Sun, Mar 16, 2025 at 08:10:03AM +0100, Wolfram Sang wrote:
> 
> > We don't have a practice yet. Keeping dev_name() was Doug's suggestion.
> > But I like your idea better, so I will change to it. Thank you for it!
> 
> Just to make sure: there can only be one bridge, right? Because the
> suggested name is not unique.

Bridges can be chained. It's highly unlikely that a chain would contain
multiple bridges of the same model, as that would be quite pointless,
but in theory it could happen.

-- 
Regards,

Laurent Pinchart

