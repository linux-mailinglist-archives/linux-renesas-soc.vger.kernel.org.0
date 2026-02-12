Return-Path: <linux-renesas-soc+bounces-28168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP7DKziujWmz5wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 11:40:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B512C9DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 11:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62DCB30893DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 10:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647DF2ED87C;
	Thu, 12 Feb 2026 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lc4+cgQR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B532F12A3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892814; cv=pass; b=F29bg3N65VPZNLz0plWsF6LZmGZBoNhUvRczLnRSkojRzBCjTq/0+o21q8eviqa6GDsyZRHvUiC46vR3NDQXcQmzHwxUThaRyyM8HjJINYvqi8cZaCL2XvK1x0h6c9qHFWTpk8iHyUvbDN5NG6RCzkfGEpAoiJw/Vh4lomPZz60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892814; c=relaxed/simple;
	bh=lj0/gjhdUqOPwKmAM6VN//Fw8Q95Z7mUIRimgBZXmW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ct5C+VSV+puL5zJ+vcRJYwi/+sQH2rpOzc8iSjhanWVe0lOR79U9whGHAhJq4+SOMACCkzG9WC+PKFS4SR9sx4B5yoddhUnAqQaFAMVkBEsotmY/8Gs4FlaKtEqSdxiWp0EhRUyuRkol3jscdId5EGfL2I/BKEGuBX9NfabgMG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lc4+cgQR; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e60925251so1824799e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 02:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770892810; cv=none;
        d=google.com; s=arc-20240605;
        b=VhX+jUm7XRHEzdQdJybcN9Qk4540UbeBhr4dHsyq+S4R+NwC4vow3TaZJcxWIyrRLE
         4m2uBrzwXVXOKxZd3OkgBvDe1YxWxlANuvokS/iXM2+Yqg2gw9JLERJfidc83acxF7aJ
         WzaTDcXvZbq8mHiL1JDSLa8JZAO+eUduwG+yL+ZVTwhWc3AK0dUyr9gA6KNhRx1piFsm
         /BMAeSuGVXk8ikbDJkQ1ZRFRn2vm7kLSDA4SzYMWKhRi3c1XwFaYIom7MNBWm71nuuPs
         DA/H2fqFHMija0xOjt/PDK3KO2vnFz+TZQSXbI+SaYI4Q7GBJWcbsOWIbpO9WJGf5Ja6
         NpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2QFiFFZSy2peF3P/wq5YLTidjl6EH3wfnbLnCbW9XTY=;
        fh=IAXeny6hoHAvXW8zQ/qW9W1UYgw0lLhJSe+O6Wb1A3Q=;
        b=Tqr8zxqhm+i+pwE3mUId00RudieZO4XPB0h7ZwWMMfv6MY9LaFT80JuXeQialkqzgC
         gJDFahI1HMYyJWwKpLwFRubSBbX5jUAmJ3GEkiq3oAtYj8FrpHmX3U6Hp7TDoUEv7HxV
         dHbei4EUCOMVfjSnWg9jfB9FFBAYXBkNVUXjFUkhYUemhWFPGx/S1IYO/TZnh5KZr0s7
         PFsNQ5auekSH2PEcaZ7OuKbaxjsO6nqlyTMOd1qz40J2ZFlqMcfOyjvc5MaXvvBcv6BO
         1L6deZnyQAW27cYjc5MBRKW9//215fDdpgvL0E+OJ9XvKCfZPz/OyeqLaltjt4kLbqkw
         FwCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770892810; x=1771497610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QFiFFZSy2peF3P/wq5YLTidjl6EH3wfnbLnCbW9XTY=;
        b=lc4+cgQRHNqrVdvpkYaggFLjowju1ehJ4RRU0gmMdioYhkrtHaX4rhIEyo8MUiP/qo
         NWlGkTpHyihGZWLuBLPfYx0RrR11cRax7k/OZWqK1rUS80FQpO8EMmPWn+NUEysFqbHl
         l07BFreVRNIkEWPwpkaTxomdWHI6eZmKln3DJWH0DolNMB9zLx/f6zQAcZSxT1QWHObe
         CU3dNN7yEv/YwjrHqr8gxIxvqQatOHGdDbfhtdo2VfPpmiIZdWwawG1pLflp89J/RCqh
         CtnuvCCA7eHW5vsg3hFTCxK4WyswjKIhFoxw0Nr1XjF7B6vwpFYMgifFXGDhIuCmk9nM
         Z4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892810; x=1771497610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2QFiFFZSy2peF3P/wq5YLTidjl6EH3wfnbLnCbW9XTY=;
        b=H/eQ6Rr2QVo7Cs3QB+Q6p6s4brB4gKTZgf74B/HVPxZa3YgGU3rbJEgPlFzDJt8Cty
         wpv1eARyvxsK8pKL79GNZg+6E7GMgI6hFzWoh2O7mT7SYnUaBc9J6HOSg3OH4eocPsj2
         te+hodfcFUmPkMCBSPGZwhLU6LePpjPj0USNAQ0olQJS605cFGcX7yhp1QUDlG9kVAgx
         9TYMew0+gCYLk3H/IJXDDW37zqx+WRRmVgS/U71HpeXd1magzqIMbg5iDZPqOveDo46g
         jnYJzeocPo+OMl4nLrKV6jK9SlKPI7jICfII+R/g4p87JJklU29s0qQjtoq1d6mBzxa2
         v42A==
X-Forwarded-Encrypted: i=1; AJvYcCUoxQ4DykRR4Xaj+Dei937VD1iyTYxddnpENcv4M88pcq89p2QcrJhdGtiSJUj2YlOEFoY4Oj5MpT8pm0YQ6szTrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwROS8Kk7F7KpJufGy0A3vuTCuLt+c/SuTByvVQHJQvi1Xw7//o
	UqK8OkWLT3B6nEJdat6hozx6unI6ZlBMWllKuDO0csCJYMGhwS8lvMFB57Z03swH+7bf7V2pgH0
	DJMj/jxTZ0kIzX/GnbFvK/SkKekzIsnNYZbZ5aMBVog==
X-Gm-Gg: AZuq6aL/SnMdaDMYix+0Z7S4c9ybnWQ2l337qBqh85DNHDtqTI16WWoB/1LC0gm15u8
	kSUQjN4qsbZOJ9wFgpIX9HhtflMXoFFCiGxbjN5ehfuzI6wgRhmhvtt15oXX3kIiyziqJBO6rzx
	ZxEmZBN85XnwTqjEdUvXnSH0CVRQXjQno7cb6FJRj174J6ye8oLuCHcMXz4d7E+qN3Cs14XOs16
	f1xbZ+TuAx0tbKHzPTvXDlF7LhVqiqYFVZenzgY1fIbjMH/LaQIoep2oMW/S57luxc9SqjXn5fW
	PMtkVzCJ
X-Received: by 2002:a05:6512:3d1b:b0:59d:f69e:16c2 with SMTP id
 2adb3069b0e04-59e640214bfmr777362e87.12.1770892809915; Thu, 12 Feb 2026
 02:40:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
 <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com> <aYyrsPTH1923jV7y@vaman>
In-Reply-To: <aYyrsPTH1923jV7y@vaman>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Feb 2026 11:39:31 +0100
X-Gm-Features: AZwV_QgmPkOET-FDUx-HmcWBF5gAKY3tXEOlKsTxUDKVx9vpnPTXKu6513pj8u4
Message-ID: <CAPDyKFo92pOimvtGdN4yvFtFkc3vB+ex2OH10WmoKXcVSS+iAA@mail.gmail.com>
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local devm_mux_state_get_optional()
To: Vinod Koul <vkoul@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Vladimir Oltean <olteanv@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Josua Mayer <josua@solid-run.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28168-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,renesas.com,linaro.org,solid-run.com,sang-engineering.com,bp.renesas.com,lists.infradead.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2C7B512C9DC
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 at 17:17, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 10-02-26, 14:34, Ulf Hansson wrote:
> > On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > >
> > > Now the mux core provides devm_mux_state_get_optional():
> > >
> > >     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static dec=
laration of =E2=80=98devm_mux_state_get_optional=E2=80=99 follows non-stati=
c
> > >      declaration
> > >       944 | devm_mux_state_get_optional(struct device *dev, const cha=
r *mux_name)
> > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20=
:
> > >     include/linux/mux/consumer.h:64:19: note: previous declaration of=
 =E2=80=98devm_mux_state_get_optional=E2=80=99 with type =E2=80=98struct mu=
x_state *(struct device *, const char *)=E2=80=99
> > >        64 | struct mux_state *devm_mux_state_get_optional(struct devi=
ce *dev, const char *mux_name);
> > >           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > Fix this by dropping the temporary local wrapper.
> > >
> > > Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optio=
nal and selected mux-state")
> > > Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state=
 for phyrst management")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks Geert for helping out!
> >
> > > ---
> > >   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
> > >     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linar=
o.org
> > >   - 8bb92fd7a0407792 is in phy/next
> >
> > Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
> > or do you prefer me to handle it?
>
> Should I drop the 8bb92fd7a0407792 and it makes things easier for
> everyone and then we can pick fixed commit for 7.1 cycle..

Well, my pull request for MMC was broken (the mux patches didn't get
properly tested in linux-next, until it was too late), so Linus will
not take it.

At this point I would say that 8bb92fd7a0407792 is still a bit
problematic as it uses the same name of the helper that the mux core
intends to use. It would be better with a phy specific name for it, so
it becomes easier to convert to the common mux helper, later on.
Although, at this point it's still okay as is, as we will need to
defer the mux core changes to v7.1 anyway.

So up to you!

Kind regards
Uffe

