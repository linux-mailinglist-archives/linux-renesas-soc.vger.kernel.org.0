Return-Path: <linux-renesas-soc+bounces-18106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 710DCAD56A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 15:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05562188A4B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 13:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B8328314A;
	Wed, 11 Jun 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaJrDBYF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F825BF08;
	Wed, 11 Jun 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647508; cv=none; b=tZNmcPKDWXvE9ShkkBLeRpBg7peEv8sIP4VBiuFAuNKICaz2A8A5t+znk2kcFoA+F5+SgF6MrfUKNDMYPb1Y3nJkZReG+Ioc6DuD0Dl1mjLw3bm8HgomLyDASMGqnPEH5+BTwdH9S6jlYXpJ85ynaQamht7JKNXfRXu6S0YTAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647508; c=relaxed/simple;
	bh=ZWJSub589iDrGZ+60SCcmXF5iQtLYyYprZ6GcJ4AcI4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QWZAyrm2iveRT6Te7WDAZ18RoNzRJBm8N04oCroyXwpbddpSLB61A3nq6hxfLQQTSUZOhErsiautiy9sak8IwoL0ZfSJKR7rhMmV1Fr4tbeu67DpqYchh6uMmX8qcMwWb0N+mc5inQZ/OkYKqQu+ljRo9658XCsJtxHDytt/1DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaJrDBYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02C5C4CEEE;
	Wed, 11 Jun 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749647508;
	bh=ZWJSub589iDrGZ+60SCcmXF5iQtLYyYprZ6GcJ4AcI4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VaJrDBYF4KTGovaBs6YwgoZBUq6BRiwemvL7WXoKQJXgVU+rdBs6RfRoCH2EVQ/WE
	 xZpKOz775xPF8adjXJpiOics45NO12ytvIAfPoAy2U12mtYBt0vAcrITiyCjfbBLfY
	 BZEjyN+3u7/vQeZLcTPtavAN00HoP0WE0lVM7zLYOZb+LuDuLpf2EcKCA7HPEBBKrY
	 SLpTyh+Qvq3zBdLc/yDUgPT50OvEMDz5IpCzxHFmn53VAs1li5fP/VSwsX4E4TS9Lw
	 QpZ3pAK/j1g0yMpdijXwiVvqOdUzbWEmM+qWFPLMMwwlhUvkcj+rkdPt3TegcOOPrS
	 GiXazWlEx4+dA==
Date: Wed, 11 Jun 2025 08:11:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-hardening@vger.kernel.org, 
 linux-i3c@lists.infradead.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
Message-Id: <174964724485.330045.2181706921272138816.robh@kernel.org>
Subject: Re: [PATCH RFC 0/7] i3c: add driver for the Renesas IP and support
 RZ/G3S+G3E


On Wed, 11 Jun 2025 11:39:24 +0200, Wolfram Sang wrote:
> Here is finally the first RFC of a driver for the Renesas I3C IP. It was
> created by merging two versions of it from two different BSPs. Then,
> improved according to code analyzers, cleaned up with regard to coding
> style, and then refactored to hopefully match I3C subsystem standards.
> 
> It is a basic driver for the I3C IP found in various SoCs like RZ/G3S
> and G3E. Missing features to be added incrementally are IBI, HotJoin and
> maybe target support. Other than that, this driver has been tested with
> I3C pure busses (2 targets) and mixed busses (2 I3C + various I2C
> targets). DAA and reading/writing to the temperature sensors worked
> reliably at different speeds. Scoping the bus, the output from the
> protocol analyzer seems reasonable, too. But hey, I am still new to all
> this, so I might have overlooked something.
> 
> The first patches are needed to enable I3C on the RZ/G3S and G3E boards.
> Once this series loses RFC status, they will be sent out individually,
> of course. All is on top of 6.16-rc1. A branch can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
> 
> Why is this still RFC?
> 
> - On G3E (but not G3S), we get a spurious irq during boot. We are
>   working on it. This is just platform dependent, though, kind of
>   independent of the high level design of the driver. For this, we
>   would love to get comments already. So, we can fix things in parallel
> 
> - G3S has 17 irqs, G3E only 16. The way we handle this might need
>   discussion (see patch 3)
> 
> - On G3S, clocks are named 'i3c' while on G3E they are named 'i3c0'
>   I don't have all the needed docs for this, but Tommaso can surely
>   figure this out meanwhile
> 
> - There are some open questions regarding the driver itself
>   (see patch 4)
> 
> Really looking forward to comments! This has been quite a ride. Getting
> a suitable test setup was a surprisingly big task. If someone knows an
> off-the-shelf device supporting HotJoin, I am all ears. I couldn't find
> one.
> 
> So much for now here, some patches have more details.
> 
> All the best,
> 
>    Wolfram
> 
> 
> Quynh Nguyen (1):
>   arm64: dts: renesas: r9a08g045: Add I3C node
> 
> Tommaso Merciai (3):
>   clk: renesas: r9a09g047: Add I3C0 clocks and resets
>   dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller
>   arm64: dts: renesas: r9a09g047: Add I3C node
> 
> Wolfram Sang (3):
>   clk: renesas: r9a08g045: Add I3C clocks, resets and power domain
>   i3c: add driver for Renesas I3C IP
>   WIP: arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  |  186 +++
>  MAINTAINERS                                   |    7 +
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   35 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   35 +
>  .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   33 +
>  drivers/clk/renesas/r9a08g045-cpg.c           |    7 +
>  drivers/clk/renesas/r9a09g047-cpg.c           |    8 +
>  drivers/i3c/master/Kconfig                    |   10 +
>  drivers/i3c/master/Makefile                   |    1 +
>  drivers/i3c/master/renesas-i3c.c              | 1441 +++++++++++++++++
>  10 files changed, 1763 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>  create mode 100644 drivers/i3c/master/renesas-i3c.c
> 
> --
> 2.47.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250611093934.4208-1-wsa+renesas@sang-engineering.com:

arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i3c@1005b000/temp@4a: failed to match any schema with compatible: ['adi,adt7411']






