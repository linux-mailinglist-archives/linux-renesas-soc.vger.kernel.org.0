Return-Path: <linux-renesas-soc+bounces-25947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95633CD2576
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Dec 2025 03:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4A2430213E0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Dec 2025 02:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C492E54BD;
	Sat, 20 Dec 2025 02:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="siwcFFo4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788231CD2C;
	Sat, 20 Dec 2025 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766196256; cv=none; b=dLaijne1/oviMqm3d186bk/KY4OnAmbgLNEK/nnnJBhceEgb+GkcsQ1apc8vW9nANVQqceVkl2JYa7CJ5P89vAnbadSrbDRkJgvC4IzLGj/8d1Uk4/5oIZGmqHZvzGum0kNXzXESBpXN5XHrA557MPui/qFBPliO6UusDDcMuLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766196256; c=relaxed/simple;
	bh=+f45ASUs6uxPlPjAzNUfH9w2mweBPgnrH0B9YPOsNA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqfPBSxJfUf4Kd1jNKaXGIC0SaM7HA/2kUN+GfPrP5iS/86Cgx/LGHEvWK8lZrZ9qoYSLF10WXYUlO5C07vVZnq+G81GdkMq6+WiuXZlNxT8VivUjcl5CCGpL8UzJH+4+qG8OO7G21V0zV3glHk0kFI9aBVIEowdM8zs87O9a4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=siwcFFo4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A71C4CEF1;
	Sat, 20 Dec 2025 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766196255;
	bh=+f45ASUs6uxPlPjAzNUfH9w2mweBPgnrH0B9YPOsNA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=siwcFFo40CbtP7/pe33SbwB9Rh1v7UxEaK7iWddHdWGtAJzG33vOzuQyn04Ubj2bl
	 B9jRHpvdoNThYCVg8mNhCnMDDYAxkk1ivptcejhTWgnCJOJAOFSmC3kB9+nwSS8vVt
	 iYhp0KyNd5OvPjxpSri7hr0LorzXkCIl3nV/u9Kfzl9F7LuhQYNpfxDAPna1Nlorq0
	 n8610pblQb1rhPqO1jSnutZF845oPJT4FiN0Js7sIJRLocRmmnBMLUoCziB2+IY++q
	 JMU1Q6b05gCuZA7/wuFy8/53hJG3ittQrdqy3nlVmFUYRMj04DpJZ2vQpnXkXbjJCy
	 x39R/iVelfYmw==
Date: Fri, 19 Dec 2025 20:04:12 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names
 property
Message-ID: <20251220020412.GA361483-robh@kernel.org>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
 <3357591.tdWV9SEqCh@steina-w>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3357591.tdWV9SEqCh@steina-w>

On Fri, Dec 19, 2025 at 09:09:23AM +0100, Alexander Stein wrote:
> Am Donnerstag, 18. Dezember 2025, 16:26:10 CET schrieb Geert Uytterhoeven:
> > Hi Alexander,
> > 
> > On Thu, 18 Dec 2025 at 16:21, Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Add "clock-output-names" which is a standard property for clock
> > > providers.
> > 
> > Why? Isn't that property sort of deprecated?
> 
> It is? Oh, I wasn't aware of that. Maybe the property should be
> marked deprecated in dt schema then.

I knew it was pointless, but not deprecated... I guess not much 
difference.

Rob

