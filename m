Return-Path: <linux-renesas-soc+bounces-11372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EA9F2EE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 12:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 331E1188527B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 11:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2690720457E;
	Mon, 16 Dec 2024 11:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n4SJcHtw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5F204574;
	Mon, 16 Dec 2024 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734347409; cv=none; b=p7E3tsnwr6YNpKCZ3uPm5VwFhNjOgI7shJOxpP8YaPNVpN6BihpUgne6CgRmJetQE8VHzkoI9KdY1OpnGf3fOnBNvPHlG5FN5jvoZV/Nutbk2s6kgaVO00ognlrbon5TMFJn2M09cs5HiA9LJle87O+YRXsrXi9W4DdAuSxzL2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734347409; c=relaxed/simple;
	bh=4SGBuLlC7yvLtIze+D8oqUF4k9KT61/1jVHbgR573mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjBJoEuygfroA09t8liZxRanzdgaXuqyEmfZ1jEnLfarA4A6u2Kp5TJKNvusPgzzo0sCzT0f9Nj/2H7YHfJ59HrwODXCWWvRh3T7qS0dC70Z9l2UO8Jo/cXXHIqyg8SCMASgOswBYl2dpxRtR95jfdDL2yZQxkA8oLe9l7hiSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n4SJcHtw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFD3A13C;
	Mon, 16 Dec 2024 12:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734347367;
	bh=4SGBuLlC7yvLtIze+D8oqUF4k9KT61/1jVHbgR573mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4SJcHtw3ny1CmDDyfpsJ3a4KvZIeooLjKlX3qwqxHhko0jXZLq5C1Gt8oVKSMl/C
	 emR5QFaljbmd9hJilhNyxG/qcuVQ/lepDskEtG/D5G2FDEipDk+nM5XrBwVfMfDh5y
	 VG2tW1veQMnSgfXyHF/FtIoH7ibC7Hwtz/pcDajQ=
Date: Mon, 16 Dec 2024 13:09:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: display: renesas,du: Add missing
 maxItems
Message-ID: <20241216110946.GJ32204@pendragon.ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
 <l2r53ipif43k7kkjqc66z2mq6tyw6niiz4t4nnfge23hygx2pw@xrgk4mv5ljzx>
 <20241216083239.GC32204@pendragon.ideasonboard.com>
 <d560cde5-6689-4933-8a42-3986f1a7b861@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d560cde5-6689-4933-8a42-3986f1a7b861@ideasonboard.com>

On Mon, Dec 16, 2024 at 01:02:26PM +0200, Tomi Valkeinen wrote:
> On 16/12/2024 10:32, Laurent Pinchart wrote:
> > On Mon, Dec 16, 2024 at 08:58:49AM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Dec 13, 2024 at 04:02:59PM +0200, Tomi Valkeinen wrote:
> >>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>
> >>> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> >>> properties. As the amount of cmms or vsps is always a fixed amount, set
> >>> the maxItems to match the minItems.
> >>>
> >>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>> ---
> >>>   Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
> >>>   1 file changed, 10 insertions(+)
> >>
> >> The top level property should define widest constraints as well.
> > 
> > I'm curious, why is that ? I understand why a top-level default would
> > make sense when it's optionally overridden by model-specific values, but
> > in this case there's no such default. Every SoC has its own fixed value.
> 
> Looking at the file, shouldn't we have minItems == maxItems for 
> interrupts and resets too? Well, I guess for interrupts we could in 
> theory run with just some of the interrupt lines connected. I'm not sure 
> if that's the case for resets.

Unless there's some magic handling of min/maxItems for those that I
wouldn't be aware of, I think it makes sense.

-- 
Regards,

Laurent Pinchart

