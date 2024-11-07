Return-Path: <linux-renesas-soc+bounces-10383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB519C0246
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 11:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 182EEB211FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 10:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7471E25F5;
	Thu,  7 Nov 2024 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZoO3a2k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356B1DFE30;
	Thu,  7 Nov 2024 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975058; cv=none; b=BSiQp6GY/+J/nUOOtqcV2u4DjPi3zjlIRPT+cXYu5CKTsN37wyt/TChwLhVt4paN9klLOJUsrIYjPe6PPJiQW1BWzIciaO/Ob7n10PRV2sjU0TqELyCy91iv15jkMja1yd0ZCN7ZzhAIPGVyY/GpqDcF3cYWOld6WfqOzvCKs4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975058; c=relaxed/simple;
	bh=DBeMWR51I+1Rtf9+Dq6nWXoymfTOOib8j5IglKwsQx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDmj7BwSLS1s3nD37AgUesWRQ71EFbyIHVRakJta036DaGWD6mWpr7SoCP0HRYCSGO90HyV+v5f/owcmD/ctx2HuZlUMih7Mc1zbm01ZnooOG+22XPVfl5y0FcPNt4v/3GJdpp6nA/l3pgqMMRGp+mU3k+Umg8K4cp91lenCQY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZoO3a2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E92CC4CECC;
	Thu,  7 Nov 2024 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730975058;
	bh=DBeMWR51I+1Rtf9+Dq6nWXoymfTOOib8j5IglKwsQx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZoO3a2k3GiD7E0k2KNXFJKBYN7H3XjbtLl5YjFrHrJ+pCwxt2ML5ZKBA1YIEq/Ad
	 RmUK7rny61kbhxM2hySFecSKl9fhr4W23uBHs0aj7gmPmvRoAWgNvx8XNNsoaIlui5
	 DfKiteqh9Zpw/Z1WTz6oxyMR0EyWwLY87mFS2aoEjx+kpdEW33iLQShKTFaHvFKe7O
	 iSN6o+q9KuolB1qocr9ahke+7tM9dob2mABztaWR3uQWSoT9CCK3HXg+fWBU5zc6cM
	 UcxQPCLb0C7EbCDdg2O48iy61+0C9DL9RBOIcwG5DhUWbG1ua3/nNxJWL4w0DlK8Pe
	 kUyN/yS8K7qLQ==
Date: Thu, 7 Nov 2024 11:24:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
Message-ID: <3cs6rkd7tdsvqi4aqagpfmexeikustpnzoq3yfxjidnegruvns@pinbsj3vfrs3>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106184935.294513-3-biju.das.jz@bp.renesas.com>

On Wed, Nov 06, 2024 at 06:49:29PM +0000, Biju Das wrote:
> As per [1], ADV7535/7533 support only 2-, 3-, or 4-lane. Drop
> unsupported 1-lane from bindings.
> 
> [1]
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


