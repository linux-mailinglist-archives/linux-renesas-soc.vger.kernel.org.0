Return-Path: <linux-renesas-soc+bounces-17153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E158DAB969F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 09:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3B51BC3857
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 07:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368B122688B;
	Fri, 16 May 2025 07:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="Bm84IcrC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5032C9A;
	Fri, 16 May 2025 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380954; cv=none; b=AHagMWMHjGnQCnWvST/fWNTn4iY/ILOSjrT9gXcvhPHqVBfHyP113HO6uB1Fb3p/vGFuiEPb7oNnafX5U/wILV0EY/b6Eb8Pe8/mT6yOAeA9lIvbAG4hBah6Z/DgGxcnjuEcGCN/gHUPlnBIHpGG6mNfVH8szo2TD3A5tqHmt/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380954; c=relaxed/simple;
	bh=1e2xtFXEPaPp9GMaGKThPETZb4pOiT8CFXf0wz0rJss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxrkVSaDKEL4JAjRlskaYxOA414g6ZmxR9l4Tzk2yVH4jr3sAZyamaTWbYCaJR8XVnfXbQEFXM7Ang62cGrtvriMEUIlP+oTUn6JBTWoRyogzpRL3SkFHew325isXt/zoY/JRu4XRfWQ6FWEor16x4I9ot40ifGYb5wDUarcXtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=Bm84IcrC; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17DB51480139;
	Fri, 16 May 2025 09:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1747380941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RPlDE3SESAb1KytQ9rzvzkVVF/heV7prKhtxffESNBg=;
	b=Bm84IcrClyS89h2sDLrgDwI5ZDXYEr8nYrlcl2NWaJ0WlqpLcHfKMkWJ/3UACKe/mYhXrs
	fVnziJj9N26Uo7KUrTPdh2YKuW+pLEzr1YrhQpcHjTD7dgHtbTqGYisGlVJ/pfPh3KTVMh
	8/GnJeJ1Lk2qcVNcoJ9gCQcc2ewa6pvkqyV9NlvviYMEUgdqsMIEmlj/XTFNvMqWpmwBu6
	1GqijVzJ7Zi4dpC32kPSUMiXUqqv1qYtLx4z4Dc1p9ZVU+hmHUHTwjlIXKjpmlc6tf7Ywv
	deHYaEkKdXudFL5Xkh0LbL+SJ9lnUrwEB1W4AbHGsI7LbGf2MoKre/F9Tzm03w==
Date: Fri, 16 May 2025 09:35:34 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
Message-ID: <20250516-plating-early-c5f8017b7466@thorsis.com>
Mail-Followup-To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro>
 <20250508134930.GM3865826@google.com>
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hei hei,

just wanted to create a new thread on a similar topic, but this is so
close, just hooking in here …

Am Sat, May 10, 2025 at 02:43:45PM +0200 schrieb Jacek Anaszewski:
> Hi all,
> 
> On 5/8/25 15:49, Lee Jones wrote:
> > On Thu, 08 May 2025, Wolfram Sang wrote:
> > 
> > > On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
> > > > Hi Wolfram,
> > > > 
> > > > CC leds
> > > > 
> > > > On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
> > > > <wsa+renesas@sang-engineering.com> wrote:
> > > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > ---
> > > > > 
> > > > > Changes since v2:
> > > > > * using function, color, function-enumerator properties now
> > > > > 
> > > > > Honestly, this is better than using node names? With V2, the LEDs were
> > > > > named as in the schematics, now they are called:
> > > > > 
> > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
> > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
> > > > > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
> > > > > ...
> > > > > 
> > > > > Which gets even more confusing if we might later add LEDs not on this
> > > > > board, but on the expansion board. 'green:programming-8' sits where?
> > > > > 
> > > > > I really wonder, but if this is the official way now...
> > > > 
> > > > Good point!  So I'm inclined to take v2...
> > > > 
> > > > Let's raise this with the LED people. I don't want to fight Pavel when
> > > > v2 hits the CiP tree ;-)
> > > 
> > > So, if there is no other opinion here, can we remove function, color,
> > > function-enumerator and just use the node names which match the
> > > schematics? Basically apply V2?
> > 
> > I didn't author the semantics nor the rules surrounding them, but I am
> > obliged to enforce them.  Therefore "LED people" say, please stick to
> > convention as stated in the present documentation:
> > 
> > https://docs.kernel.org/leds/leds-class.html#led-device-naming
> > 
> > Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
> > that is more appropriate to your use-case.
> > 
> > Let's also bring Jacek into the conversion, since I know that he did a
> > bunch of work around this topic.
> 
> The question is if the LED name from the schematics tells anything to
> the user of the equipment?
> 
> The idea behind LED naming is to facilitate matching the LED class
> device name as reported by the system with the LED location on the
> equipment.
> 
> The LED naming standardization intended to enforce consistent
> LED naming, and not allowing to add multiple interchangeable
> names like wifi/wlan. It also helps to keep LED name sections order in
> accordance with Linux documentation, which before had been often
> abused by allowing to assign anything to the now deprecated 'label'
> DT property.

You see devicetree changes frequently which change the sysfs path of
existing LEDs, last example I saw today:

https://lore.kernel.org/linux-devicetree/20250513170056.96259-1-didi.debian@cknow.org/

Consider this change:

 		led-lan1 {
 			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
 			function = LED_FUNCTION_LAN;
 			function-enumerator = <1>;
 			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
+			label = "LAN-1";
+			linux,default-trigger = "netdev";
 		};

Before the sysfs path probably was /sys/class/leds/green:lan-1 and
with the addition of the label property now it's probably
/sys/class/leds/LAN-1 … so it changed.  This might break userspace,
which relies on certain sysfs paths, maybe.

The main question is: Is that sysfs path considered to be a stable
interface for accessing a particular LED or not?

I've seen this pattern also the other way round, were an old dts only
has the node name determing the sysfs path, people change the node
name or add color/function properties, gone is the supposedly stable
path.

New idea: what about making this somewhat more flexible and less
suprising by _always_ creating the standardized sysfs entry based on
color/function by default, and let label only create an additional
symlink linking to that?

So in the above example /sys/class/leds/green:lan-1 would be the
canonical name/path of that LED, and /sys/class/leds/LAN-1 would only
be a symlink on it?

Or would that be too confusing?

Greets
Alex

> Regarding expansion boards - we never have control over what
> LED names DT overlays will define, thus LED core adds numeric suffix to
> the LED class device name in case of the name clash.
> 
> -- 
> Best regards,
> Jacek Anaszewski
> 

