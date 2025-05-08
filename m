Return-Path: <linux-renesas-soc+bounces-16809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCBAAFBFE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 15:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240084E2D89
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 13:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4714E22CBF4;
	Thu,  8 May 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWX5qHs4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17826227E99;
	Thu,  8 May 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712176; cv=none; b=lgagtN4udiuZC7VuuPFkBbSg7oV86+aoA1SzrwQf3cFr6GDM6yjIMn3wVD9S8L9Yvu4z/sFQkpmvAAL+irpbrY5RPBy61qHp1VLDet7pQpKA5NNQWqU8wEhOj+LbURfeeOig706zqett/nKlupJU6pAP5e03MGjcFMT9TIURBf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712176; c=relaxed/simple;
	bh=idCcibmkhRqSa9P+8RNhfbUG9+k8tsBQFf79Ul0o27Q=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2oPfrPkDfP0KPG8McUK7YmRcK1J6wZuDg7T+W9w4wGQBT8abh6xPL97OoshhnK1uUEAdJpvVR7mwpuCaetzbQuu2jDwATzfhX1rnaqpWnJ0lXkGvlVcXGpQWqDqUa4s29ZTeItUmAkuIQ8zWbM177Rj1VVZZDOizIACp9avpbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWX5qHs4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58430C4CEE7;
	Thu,  8 May 2025 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746712175;
	bh=idCcibmkhRqSa9P+8RNhfbUG9+k8tsBQFf79Ul0o27Q=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=GWX5qHs4CBM1a+jTqDYrpWLaPwXVld7S6ZmoHghki34g8CAhl0somM2AjxzImYgxG
	 hyc1PPKKPlwJ21MbxFI0O8zVNWfyXxe4YEZS4dpiQ513ImBAKNMt9cfq5omvnav3Iw
	 Old6kP6JCYQFVnUnDL+iGZDnrLR0/vJ7725S2C97X2dw1L3UAhhj9gbnGvX55FMN4U
	 tn+0jz2QVbmiVPJVAfNDBWvS2WhWWO1h14einrEal4qvW9ZIx6TK7D9BxwFn1OlsbS
	 Pa2BLyWHD5l7XiVc2+WCBnJiXBkOAwmuxfUMJL3KKleVXd7LllpDdMvp7Oe625mXnk
	 JCOEDWTlWpc9Q==
Date: Thu, 8 May 2025 14:49:30 +0100
From: Lee Jones <lee@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
Message-ID: <20250508134930.GM3865826@google.com>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBxjvofZCEi_1Fna@shikoro>

On Thu, 08 May 2025, Wolfram Sang wrote:

> On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
> > Hi Wolfram,
> > 
> > CC leds
> > 
> > On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >
> > > Changes since v2:
> > > * using function, color, function-enumerator properties now
> > >
> > > Honestly, this is better than using node names? With V2, the LEDs were
> > > named as in the schematics, now they are called:
> > >
> > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
> > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
> > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
> > > ...
> > >
> > > Which gets even more confusing if we might later add LEDs not on this
> > > board, but on the expansion board. 'green:programming-8' sits where?
> > >
> > > I really wonder, but if this is the official way now...
> > 
> > Good point!  So I'm inclined to take v2...
> > 
> > Let's raise this with the LED people. I don't want to fight Pavel when
> > v2 hits the CiP tree ;-)
> 
> So, if there is no other opinion here, can we remove function, color,
> function-enumerator and just use the node names which match the
> schematics? Basically apply V2?

I didn't author the semantics nor the rules surrounding them, but I am
obliged to enforce them.  Therefore "LED people" say, please stick to
convention as stated in the present documentation:

https://docs.kernel.org/leds/leds-class.html#led-device-naming

Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
that is more appropriate to your use-case.

Let's also bring Jacek into the conversion, since I know that he did a
bunch of work around this topic.

-- 
Lee Jones [李琼斯]

