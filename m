Return-Path: <linux-renesas-soc+bounces-17127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC1AB8242
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 11:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5579A3AC47D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 09:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B2228C847;
	Thu, 15 May 2025 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+xmHdrS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DF4B1E4F;
	Thu, 15 May 2025 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300561; cv=none; b=rO1h/I3vn6sfN2+Is1edANwBhvufZSvALX25GazqHrM/Lgpq4/xAcgPdx/FSO4mnNhFeIQjxlRP7npyfXf6tWbhyD7ar5Wk/Uu1gATRAY/aoF6SyKpHWdYBcEA9Ln3Smz/Syu5sGTMS+E2/H0ZFvwsLt1X6U5l8ltKIiw9Js7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300561; c=relaxed/simple;
	bh=OrRGwHR3T+yZqMwu+ZI2ZRtcEyZ6s3tyQEG8nevlPZM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCmyzndM194YfGOoOiIf17jgRUZC9eGig7nkgLjjvoAleMNiegSVcXMZSTMRwmYALX9AJZX4+zm5L36sJ198l3qUVnRfZASZblAV53xVKRExXbg32DmxWxe0pgPgqkEZDEHkxonXg0tAPRhH3KAEbj3KPgYjRQa6276PIZwvD1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+xmHdrS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910BAC4CEE7;
	Thu, 15 May 2025 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747300560;
	bh=OrRGwHR3T+yZqMwu+ZI2ZRtcEyZ6s3tyQEG8nevlPZM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=a+xmHdrSv1DsG7cHKp5gfpRKPGPlWx9Re+rlqjzahK1ktoxpHQ88pc9vWAO+QirnJ
	 DXcxODiswqIaMKxgqM2kNchIKTTUPknbdUaswq3q8xtEG3DHgUgNfT+TDiLoSrHv90
	 C1x2roa88lHPh0jlMkKh54ssNLDQYnF5a228UWMab2YdgoFLKTaoykLR0jmmw1usWG
	 ukkrM3r0ZQY7YhZKc5+i5RoFbRyJ+P3j36uqvNn6/JL5HKJY4H0qRH5gCK031NJZE8
	 L8g95FNrWke9PIVfyckSo3Pyt3uZ488EcUc9UIMOHLGSX5sPuy7IFGFm7SQ3PPPTE7
	 qlrUILqtw2MRA==
Date: Thu, 15 May 2025 10:15:55 +0100
From: Lee Jones <lee@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
Message-ID: <20250515091555.GE2936510@google.com>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro>
 <20250508134930.GM3865826@google.com>
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
 <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
 <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>
 <20250514152852.GA2936510@google.com>
 <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com>
 <aCWlenAtx2uaQhcE@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCWlenAtx2uaQhcE@shikoro>

On Thu, 15 May 2025, Wolfram Sang wrote:

> Hi all,
> 
> thank you for providing all this input. I appreciate this a lot. And
> please excuse the slow response. I am currently at the EmbeddedRecipes
> conference which needed a bit of preparation on my side.
> 
> > So the node would look like this, for the pca1 LED:
> > 
> > led-1 {
> > 	function = "pca1";
> > 	color = <LED_COLOR_GREEN>;
> > 	default-state = "keep";
> > };
> 
> This looks optimal to me, if this is acceptable. I totally understand
> the advantages and desire to unify LED naming. The main problem for me
> here is that the GPIO-driven LEDs have no 'device' part in the generic
> name. And only 'function:color' seems suboptimal for the board here in
> question. I kinda arranged with the option of using "LED_FUNCTION_DEBUG"
> for the above LEDs and some other function for the LED on the carrier
> board. This seems OK enough for a development board, but ideal would be
> the above solution. So, if you can live with the above, I'll happily
> make use of it. If you want me to live with the different
> LED_FUNCTION_* solution, I will survive this as well...

My only fear would be one of setting a precedent for bespoke function
strings.  However, seeing as we already have some that slipped through
the gaps [0], I guess one more wouldn't hurt.

FTR however, my preference would be to use LED_FUNCTION_DEBUG as
previously discussed.  If you can fight your slightly leaning partiality
for a bespoke string, please choose one of the predefined options.  If
you cannot live with it, go ahead with the bespoke option.

[0]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts                
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts          
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts        
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-tplink-archer-c2300-v1.dts


-- 
Lee Jones [李琼斯]

