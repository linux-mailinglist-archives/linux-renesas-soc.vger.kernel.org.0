Return-Path: <linux-renesas-soc+bounces-17109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4EAB6FE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 17:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55E43A3A05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 15:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081D1B043E;
	Wed, 14 May 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXDgCZfV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF319D880;
	Wed, 14 May 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236537; cv=none; b=Vb0w22pU9t0p0xhd0HQVsuVuhBXWV3vGeAMcyCOYTl8L8ugcEehUl/XAp8opBUMeWp9IPZ5narfEVIgg5QlxPm4x5E+OxhusEYZ1t2Cbz88L5EqzZ2aXnqUFdBjTBr+vA0Aj3dyB/VyrHyPAFJKT1m9sSMkyQ738mOMpcRPXeow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236537; c=relaxed/simple;
	bh=n267JmLeNs0lXlBCr+bj7ApMfDHUYHHdfIIKKiuXCcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQCd9Bl3wggiIK5kGkiUvvA8z402WMz87eEwKW3+1KGaAAy8kkoMj1ys11xJgCQWCO3QlCflZjsn5QfJyLo0vfDXAM58uy1mV71uV2nEQDQoS5zJ5FgZuyM1Li7fVtka95KsqPJfHpCIqaNIP5Fr+tRkqWtvtnvbcHRMVnBpC6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXDgCZfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A38AC4CEE3;
	Wed, 14 May 2025 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747236537;
	bh=n267JmLeNs0lXlBCr+bj7ApMfDHUYHHdfIIKKiuXCcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXDgCZfV/Bkx2sROlz8IP8HNpT6sX+8dfPZqPSq+oiB1Oatq7lY2FGdRNUEo6WPQ6
	 yDWZVCKdxM9MkhoD/WN5vGRBJDgjxoNxvMG5nzwyi9Rk5quOa5xikViqYE5sdQc61z
	 xiBoBSPJvRCF0zZVWXKz3g649w/ylPIkUGABO8nPFPWMCaprOB/9/ydazEPHB3JzTH
	 CEuIwlsFGziWVX3hXX/SFieumb4wFrQMmbUlm7bjVw5CdfCXdge+Chx27CnEgmntYf
	 LkQ+C/rytxXkV017MiW8D9A+/T06Wts8Db/KENnq+5xTSle3WhlRvGAVC3oMrtTKS9
	 zBVfJscXfdi7Q==
Date: Wed, 14 May 2025 16:28:52 +0100
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
Message-ID: <20250514152852.GA2936510@google.com>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro>
 <20250508134930.GM3865826@google.com>
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
 <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
 <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>

On Mon, 12 May 2025, Jacek Anaszewski wrote:

> Hi Geert,
> 
> On 5/12/25 09:13, Geert Uytterhoeven wrote:
> > Hi Jacek,
> > 
> > Thanks for your answer!
> 
> You're welcome.
> 
> > On Sat, 10 May 2025 at 14:43, Jacek Anaszewski
> > <jacek.anaszewski@gmail.com> wrote:
> > > On 5/8/25 15:49, Lee Jones wrote:
> > > > On Thu, 08 May 2025, Wolfram Sang wrote:
> > > > > On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
> > > > > > On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
> > > > > > <wsa+renesas@sang-engineering.com> wrote:
> > > > > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > > > ---
> > > > > > > 
> > > > > > > Changes since v2:
> > > > > > > * using function, color, function-enumerator properties now
> > > > > > > 
> > > > > > > Honestly, this is better than using node names? With V2, the LEDs were
> > > > > > > named as in the schematics, now they are called:
> > > > > > > 
> > > > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
> > > > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
> > > > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
> > > > > > > ...
> > > > > > > 
> > > > > > > Which gets even more confusing if we might later add LEDs not on this
> > > > > > > board, but on the expansion board. 'green:programming-8' sits where?
> > > > > > > 
> > > > > > > I really wonder, but if this is the official way now...
> > > > > > 
> > > > > > Good point!  So I'm inclined to take v2...
> > > > > > 
> > > > > > Let's raise this with the LED people. I don't want to fight Pavel when
> > > > > > v2 hits the CiP tree ;-)
> > > > > 
> > > > > So, if there is no other opinion here, can we remove function, color,
> > > > > function-enumerator and just use the node names which match the
> > > > > schematics? Basically apply V2?
> > > > 
> > > > I didn't author the semantics nor the rules surrounding them, but I am
> > > > obliged to enforce them.  Therefore "LED people" say, please stick to
> > > > convention as stated in the present documentation:
> > > > 
> > > > https://docs.kernel.org/leds/leds-class.html#led-device-naming
> > > > 
> > > > Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
> > > > that is more appropriate to your use-case.
> > > > 
> > > > Let's also bring Jacek into the conversion, since I know that he did a
> > > > bunch of work around this topic.
> > > 
> > > The question is if the LED name from the schematics tells anything to
> > > the user of the equipment?
> > 
> > As this is a development board and not a finished product, I would
> > answer yes.
> 
> OK.
> 
> > > The idea behind LED naming is to facilitate matching the LED class
> > > device name as reported by the system with the LED location on the
> > > equipment.
> > > 
> > > The LED naming standardization intended to enforce consistent
> > > LED naming, and not allowing to add multiple interchangeable
> > > names like wifi/wlan. It also helps to keep LED name sections order in
> > > accordance with Linux documentation, which before had been often
> > > abused by allowing to assign anything to the now deprecated 'label'
> > > DT property.
> > 
> > I agree this all makes perfect sense for a final product, where the
> > purpose of each LED is clear, and sometimes indicated by an icon
> > on the case.
> > For a development board, some LEDs may have a fixed purpose.
> > But typically there is also a collection of generic user LEDs, which
> > do not have a fixed purpose, and are identified by a label on the
> > schematics.  Imposing an arbitrary numbering scheme on the latter is
> > confusing for the user (developer).
> 
> Using DT child node name for LED class device name is only
> a last resort fallback. However if it is devboard and we want to have
> a reference to the schematics then I'd say it makes sense to take
> LED names from DT nodes. What about the colors? Are the LEDs replaceable
> or soldered?

Looks like this option does what you want:

https://github.com/torvalds/linux/blob/master/drivers/leds/led-core.c#L578

For this to execute you need to provide init_data when calling
*led_classdev_register*(), omit the; label, function, color_present DT
properties and also init_data's default_label attribute.  At which point
the DT node name should be taken as the LED class name.

-- 
Lee Jones [李琼斯]

