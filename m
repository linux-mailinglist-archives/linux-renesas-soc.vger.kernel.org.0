Return-Path: <linux-renesas-soc+bounces-4510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319E8A0AE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 10:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4E2B1C2194F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 08:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E60913FD64;
	Thu, 11 Apr 2024 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snxnioA1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060092032C;
	Thu, 11 Apr 2024 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712823168; cv=none; b=cwsqW8YK+Lw7Ewx2C9J4WpsjXX6usZoJEO59oSzOysK0PiXOkr6kRaO+LL3esWTmmaBL08/ede/IlR9zZBqd+OxDDYC743enkOlwTDxxNsJzTIAldq65c/IYUJypiwjeE/8A7GRTeYledh1cTKtTZ1kjVu541gE+A/XQsR+6AEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712823168; c=relaxed/simple;
	bh=2KXJC0mnz+Y85p+OkgNifLbFv8nJbqJOIlKkx/u62WQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tQ1TeVt+Zx87l3Jnx240h4o8MqUvI6hhii9zOiQSmxs7VV+/KduE3q/LtH5J+5Jq/n4Bu8SZc29W84Tmtmyhn4qlAtkSKo4x2ro9v+kC4KCG3opLBQl0vmS9dN5sTudeIzxzgVQYv/BKp3WevfDKQmoQc7Klr1mbAtYGNKbuCjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snxnioA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8C5C433F1;
	Thu, 11 Apr 2024 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712823167;
	bh=2KXJC0mnz+Y85p+OkgNifLbFv8nJbqJOIlKkx/u62WQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=snxnioA1gprBQqKzbQBKiT08vbhxVQg3LNb3M2LPqNRjpT+BgKzhzbeEwv8supACh
	 2JtQEwcQJjt6isZ46KdFxwaVePcwGy7YwnXsCzz2FjczB8zT3yd56TxvYXw/pc4CPp
	 0WL1/HLIxre7XJHrfYz9ezYlCGmsNz/TL8aCn+9fShmFfJu9YLXB9W5ty+HQ11PMUv
	 raXsvuorcWyk2ldLFKnmXPqiI8OCZvrBdNNg0EZ1IwFDpOjaOk9Bu5FkAc+XYf2nsu
	 pwU7WnTOkkYFrh1w1beXTKDYxdkBmyTpsUsUD7zu0+2LF8aN07OsX5PE1v0aEWFSza
	 L3bpDvA46yT5Q==
Message-ID: <52ac3a1e06c384a839cbce96add50575.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240318225546.GS13682@pendragon.ideasonboard.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com> <20240318110842.41956-3-biju.das.jz@bp.renesas.com> <20240318225546.GS13682@pendragon.ideasonboard.com>
Subject: Re: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 11 Apr 2024 01:12:45 -0700
User-Agent: alot/0.10

Quoting Laurent Pinchart (2024-03-18 15:55:46)
> On Mon, Mar 18, 2024 at 11:08:41AM +0000, Biju Das wrote:
> > +     int ret;
> > +
> > +     clk_disable(clk);
> > +     ret =3D clk_poll_disabled(clk, sleep_us, timeout_us);
> > +     clk_unprepare(clk);
>=20
> What happens in the clk_disable_unprepare() case, if the clk_unprepare()
> function is called on a clock that hasn't been synchronously disabled ?
> This is ill-defined, a clock provider driver that implements .disable()
> asynchronously would see its .unprepare() operation called with
> different clock states. That behaviour is error-prone, especially given
> that it could be difficult to test clock provider drivers to ensure that
> handle both cases correctly.
>=20
> One option could be to turn the .unprepare() operation into a
> synchronization point, requiring drivers that implement .disable()
> asynchronously to implement synchronization in .unprepare(). That way
> you wouldn't need a new API function for clock consumers. The downside
> is that consumers that call clk_disable_unprepare() will never benefit
> from the .disable() operation being asynchronous, which may defeat the
> whole point of this exercise.
>=20
> I'm starting to wonder if the simplest option in your case wouldn't be
> to make your clock provider synchronous for the vclk...

Yes. This all looks unnecessary if the device using the clk always
requires the clk to actually be shut down when it is disabled. Just do
that for this vclk and move on. It _is_ tightly coupling this specific
clk to the specific consumer, but that's simplest and most expedient to
implement, i.e. it's practical.

We would only ever need this API if we had a clk consumer which
absolutely required the clk to stop clocking upon returning from
clk_unprepare(), and that clk could be any random clk. It sounds like in
this case that isn't true. We know which clk must be off when
clk_unprepare() returns, so just implement the wait in the
clk_ops::unprepare() callback?

