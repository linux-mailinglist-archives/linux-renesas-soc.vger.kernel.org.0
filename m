Return-Path: <linux-renesas-soc+bounces-26884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E27D26D2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 18:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72CA531531A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB392D9488;
	Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3PF5a3e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F82D595B;
	Thu, 15 Jan 2026 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498849; cv=none; b=amb7XfchM095qfazEWg1LtMD2wPguNcyo1QriQEGVwPtlZ7C5LBCWq0prA3NBEH8SEW7l8y3BQoUtdQQh1OXJELt5eewcKswt70t9yMqiNlxnVW+RaFib9+TZLaRZ6QHLjcs/Z6BEPG/T+QiZ2Fz52Yn+359lGKUuckWaAA4iB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498849; c=relaxed/simple;
	bh=vdsPn0752ZUNlaPfpcfVirjmE9to0sS9ZCmiPv19dTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgrJnJwlB6yvZni6FMElhViNEFwKMbhV36sGk0lqkChSfiRQGUMVi0o5VlZdwYlm3TPo7T2T5dz6AsXNLFf4lL0RunUV4ORreGMMsaKcfoGSWDhRQkKQsYMBknThIt50Zad4Ae1sXcYG6Bu5SfopTT5Tcw97aPZbHdH3bDgd9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3PF5a3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B0AC116D0;
	Thu, 15 Jan 2026 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498848;
	bh=vdsPn0752ZUNlaPfpcfVirjmE9to0sS9ZCmiPv19dTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3PF5a3eshlsBXUXlqRZeJ0irz0rLqZR3slSBrlLLEkXsssx6Iz9BwRG+XJZkSBU5
	 pBE3zDZ8+U6SQcJuJvEada1Z5oTKZvq2x3LS+HaB4JELw6BZYmMT8BEdRyvdCad5Vf
	 CSCBdyAKWvHg6GnbYGFuOf+Sub9mRnsfVj53sHjB6t9fYoHKYv8Heesr6P3n3dBaTi
	 2dkHQX5aYbsaGwrtgH2cS/b0W7LuBRN4AaGnGNGs/TTs42fWeOg6EdaGGYpzfv8OWP
	 v67nLdMMwcdBoym4l29C2gnT1PeTHK0U4yQr5wV1BeEeFT0JEad4JwfJtFSJRO7edG
	 kfzeEwoQV6bPg==
Date: Thu, 15 Jan 2026 11:40:47 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
Message-ID: <20260115174047.GA930768-robh@kernel.org>
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>

On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
> Move the Waveshare panels description into separate document, so they
> can be properly described with compatible = "waveshare,...", "panel-dpi"
> and attached to "waveshare,dsi2dpi" bridge.

But why do we need "panel-dpi"? Adding that requires changing a DT. 
Can't you make the kernel handle these compatible strings as a 
"panel-dpi" without the compatible?

Rob

