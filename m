Return-Path: <linux-renesas-soc+bounces-17124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08885AB7E50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 08:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF264C5034
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 06:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA97B296FAA;
	Thu, 15 May 2025 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZ8DzHf7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D991C27;
	Thu, 15 May 2025 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747291991; cv=none; b=o+lSzBXhAe0KhfnUcF8KdXY5OErY+5fSBxXdgRObBPMZMfrLDRhtR6545K9VSE2aI7r69RWm7KDUd6oIhRBOZsYuHafhgM5hNA/6xRMBcnydgRiLZN19Hf4RS+dZJhoJoj2xCLg6ixijwcne7o5h1dGdOxO4h202hFiOWQjeU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747291991; c=relaxed/simple;
	bh=IDARqzmRC87jrTAbiTa95jja9EP2sda/hbrRU+iqIRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+wGaYwVzjqHsSIv46wyNGMUMp6mCumx0oLSLhhBIXtE6WTsuGpdTLR/EgjjERhsts6MxPNtTAr5nHShBgS6vrdCAPOtx/rnQRRtdSIdOit+PDTdUNHGrppfVqvdCaFdODbeyzTUa2gDgsrK5wVHx1zZh2iDJUtGudnj0x95YVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZ8DzHf7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DE5C4CEE7;
	Thu, 15 May 2025 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747291991;
	bh=IDARqzmRC87jrTAbiTa95jja9EP2sda/hbrRU+iqIRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZ8DzHf7+BZrNUJPiMN6iAqYHC4Fqlqbs8v3exaSGHWNkzKy7EkizIlcodClooteb
	 KeCofG85v19ZpcVH6ZSfzYJBYyW6ptHYGOI9zZULrD53kxtrGBOb72i3qz32+qwJXb
	 /onYFK559CCbUTN47NGinSapo75BcQSCh106h++Ld238Nyf+DuT7QCZdYr9aYsVV/h
	 35PRt69Qdd1Vs+W9Dr77Gz4l6fPND+CUd/ftOEZNpPtVUJ1tD7OHksdjSWjw+AGNev
	 CkRsBaQ7qt/Kl39QitlzfcVKWRz+OS2y2zcrouct/bqiwD6k6UCrcDzFgi6otcaCv2
	 ldjs3/30ue7lQ==
Date: Thu, 15 May 2025 07:53:05 +0100
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
Message-ID: <20250515065305.GB2936510@google.com>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro>
 <20250508134930.GM3865826@google.com>
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
 <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
 <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>
 <20250514152852.GA2936510@google.com>
 <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com>

On Wed, 14 May 2025, Jacek Anaszewski wrote:

> On 5/14/25 17:28, Lee Jones wrote:
> > On Mon, 12 May 2025, Jacek Anaszewski wrote:
> > 
> > > Hi Geert,
> > > 
> > > On 5/12/25 09:13, Geert Uytterhoeven wrote:
> > > > Hi Jacek,
> > > > 
> > > > Thanks for your answer!
> > > 
> > > You're welcome.
> > > 
> > > > On Sat, 10 May 2025 at 14:43, Jacek Anaszewski
> > > > <jacek.anaszewski@gmail.com> wrote:
> > > > > On 5/8/25 15:49, Lee Jones wrote:
> > > > > > On Thu, 08 May 2025, Wolfram Sang wrote:
> > > > > > > On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
> > > > > > > > <wsa+renesas@sang-engineering.com> wrote:
> > > > > > > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > > > > > ---
> > > > > > > > > 
> > > > > > > > > Changes since v2:
> > > > > > > > > * using function, color, function-enumerator properties now
> > > > > > > > > 
> > > > > > > > > Honestly, this is better than using node names? With V2, the LEDs were
> > > > > > > > > named as in the schematics, now they are called:
> > > > > > > > > 
> > > > > > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
> > > > > > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
> > > > > > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
> > > > > > > > > ...
> > > > > > > > > 
> > > > > > > > > Which gets even more confusing if we might later add LEDs not on this
> > > > > > > > > board, but on the expansion board. 'green:programming-8' sits where?
> > > > > > > > > 
> > > > > > > > > I really wonder, but if this is the official way now...
> > > > > > > > 
> > > > > > > > Good point!  So I'm inclined to take v2...
> > > > > > > > 
> > > > > > > > Let's raise this with the LED people. I don't want to fight Pavel when
> > > > > > > > v2 hits the CiP tree ;-)
> > > > > > > 
> > > > > > > So, if there is no other opinion here, can we remove function, color,
> > > > > > > function-enumerator and just use the node names which match the
> > > > > > > schematics? Basically apply V2?
> > > > > > 
> > > > > > I didn't author the semantics nor the rules surrounding them, but I am
> > > > > > obliged to enforce them.  Therefore "LED people" say, please stick to
> > > > > > convention as stated in the present documentation:
> > > > > > 
> > > > > > https://docs.kernel.org/leds/leds-class.html#led-device-naming
> > > > > > 
> > > > > > Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
> > > > > > that is more appropriate to your use-case.
> > > > > > 
> > > > > > Let's also bring Jacek into the conversion, since I know that he did a
> > > > > > bunch of work around this topic.
> > > > > 
> > > > > The question is if the LED name from the schematics tells anything to
> > > > > the user of the equipment?
> > > > 
> > > > As this is a development board and not a finished product, I would
> > > > answer yes.
> > > 
> > > OK.
> > > 
> > > > > The idea behind LED naming is to facilitate matching the LED class
> > > > > device name as reported by the system with the LED location on the
> > > > > equipment.
> > > > > 
> > > > > The LED naming standardization intended to enforce consistent
> > > > > LED naming, and not allowing to add multiple interchangeable
> > > > > names like wifi/wlan. It also helps to keep LED name sections order in
> > > > > accordance with Linux documentation, which before had been often
> > > > > abused by allowing to assign anything to the now deprecated 'label'
> > > > > DT property.
> > > > 
> > > > I agree this all makes perfect sense for a final product, where the
> > > > purpose of each LED is clear, and sometimes indicated by an icon
> > > > on the case.
> > > > For a development board, some LEDs may have a fixed purpose.
> > > > But typically there is also a collection of generic user LEDs, which
> > > > do not have a fixed purpose, and are identified by a label on the
> > > > schematics.  Imposing an arbitrary numbering scheme on the latter is
> > > > confusing for the user (developer).
> > > 
> > > Using DT child node name for LED class device name is only
> > > a last resort fallback. However if it is devboard and we want to have
> > > a reference to the schematics then I'd say it makes sense to take
> > > LED names from DT nodes. What about the colors? Are the LEDs replaceable
> > > or soldered?
> > 
> > Looks like this option does what you want:
> > 
> > https://github.com/torvalds/linux/blob/master/drivers/leds/led-core.c#L578
> > 
> > For this to execute you need to provide init_data when calling
> > *led_classdev_register*(), omit the; label, function, color_present DT
> > properties and also init_data's default_label attribute.  At which point
> > the DT node name should be taken as the LED class name.
> 
> Yep, I know how it works, I wrote that code after all.

Sorry for the ambiguity.  I was attempting to address Wolfram.

> Here, I wanted to clarify whether it wouldn't make sense to stick to
> the approach with 'function' and 'color' properties if LEDs are fixed
> on the board and the colors are known.
> 
> From [0] I infer that LEDs are green, so we should use 'color' DT
> property definitely. And as a 'function' we can assign plain text "pcaN"
> if you feel it makes sense for that board.

The 'function' documentation specifically says to use one of the
predefined LED_FUNCTION_* entries.  If we are officially accepting
caveats to that, we should probably update it.

> This way you'll get LED name "pcaN:green", that will be according to
> the naming standard.
> 
> So the node would look like this, for the pca1 LED:
> 
> led-1 { function = "pca1"; color = <LED_COLOR_GREEN>; default-state =
> "keep"; };
> 
> [0]
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250328153134.2881-11-wsa+renesas@sang-engineering.com/#26336000

-- 
Lee Jones [李琼斯]

