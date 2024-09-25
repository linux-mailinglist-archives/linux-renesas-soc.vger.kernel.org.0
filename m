Return-Path: <linux-renesas-soc+bounces-9032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D50489850BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 03:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CE18B22D5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 01:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E7B1369AA;
	Wed, 25 Sep 2024 01:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLX+JqqT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA1E2E83F;
	Wed, 25 Sep 2024 01:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727229412; cv=none; b=lZNE939XZMfZZ0paPltjbQ3J1zZqA6HkVKl/y7y+fgXcjxVky/mX9wtwgtXD5hrR8J3MjRLQVYVAZN3VRtdj1FqmawalCKQJRUFbW+nVlX54rXesfEHRW+kyqx6Qu5eZA2mKsCrSBT8BxoiGqMtlgAbhElk+fbO94/JKHRhp/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727229412; c=relaxed/simple;
	bh=gwZoGgu6joQKepI/nFtly2OWY1FeRY6640Y3Dt9N530=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=BKoGspyRlYol0r0qOZTKdft8MuJnOAkFrvvB4QIF9LKDoetp8dfLvYlL0evEBJOes1x0367mDR8B876/ARk5jgnvpxdlc01LoaX0eEJuCx5EQ1E9MhZjHpoOQCUoHuF7yoObrK9olbD1DjdARuJlN78zeregzU6LBUh+H4g7Urk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLX+JqqT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF3DC4CEC4;
	Wed, 25 Sep 2024 01:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727229412;
	bh=gwZoGgu6joQKepI/nFtly2OWY1FeRY6640Y3Dt9N530=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KLX+JqqTerFzjda/uy6fuBlvOGTcJfU5bG49B0UrpAOpDLTyDWmPIHMkX5M4E6bRq
	 /1CI1cxojsPFNH6bgWVJOmkgr9S1XY+iljNJd7FxxQ+//PRBZ+IxHfwoSymZ4R+OYE
	 yVofBANJvJ2r7NobHOhG4k8nTfz/JA7x9gFGTHKTyCOVA0nEmKHqzoLLsL/TlZYnRc
	 Q1SRKxzB32+F4kvG9J1UMkAVY3BUg4MYWFOseP8jQYyXJYQkYrFZhGMIBbjqh+Kcwr
	 q9LbpeLMqVzpRbBdydMjkunPzV3hJG/mTnIM84J06OUJC128cfDDC9JSvBYTkvGjl9
	 hfFMuDqS408cA==
Date: Tue, 24 Sep 2024 20:56:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
Message-Id: <172722909822.835713.6559556227241563232.robh@kernel.org>
Subject: Re: [PATCH 0/5] ARM: dts: renesas: bring genmai up to date - the
 easy stuff


On Sat, 21 Sep 2024 13:48:12 +0200, Wolfram Sang wrote:
> I recently rediscovered the Genmai board as a great platform for
> regression testing (RIIC, pre R-Car SDHI and MMCIF). Its DTS file is a
> bit outdated, though. This series adds the simple stuff, and reorganizes
> it to be sorted. I want to add SDHI and MMCIF on top of this, but those
> didn't work out of the box and need a little more work, probably.
> 
> Let's start with this seris first. Looking forward to comments.
> 
> Happy hacking,
> 
>    Wolfram
> 
> 
> Wolfram Sang (5):
>   ARM: dts: renesas: genmai: enable watchdog
>   ARM: dts: renesas: genmai: enable OS timer modules
>   ARM: dts: renesas: genmai: sort nodes
>   ARM: dts: renesas: genmai: sort pinctrl entries
>   ARM: dts: renesas: genmai: define keyboard switch
> 
>  arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 136 +++++++++++-------
>  1 file changed, 85 insertions(+), 51 deletions(-)
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y renesas/r7s72100-genmai.dtb' for 20240921114813.4124-7-wsa+renesas@sang-engineering.com:

arch/arm/boot/dts/renesas/r7s72100-genmai.dtb: keyboard: 'interrupt-parent' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#






