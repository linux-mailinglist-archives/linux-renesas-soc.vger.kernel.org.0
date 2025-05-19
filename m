Return-Path: <linux-renesas-soc+bounces-17185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE7ABB64D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 09:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B4D1892036
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 07:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2E6267B0C;
	Mon, 19 May 2025 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="hqcCkUB5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1332E22DA14;
	Mon, 19 May 2025 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640291; cv=none; b=OXyNUREY9ZJa+yIf4fhX+46GpJz90P6iCeDCth/ZbRqQAcCfsu/OFKayIqrpSPLxvRhciLz/HWe0XX0fNCEnRUGBqhJYnJ40woDjyxj4ZfF7wojXhIoxJ3T0lH05L+9RxQOHEXcc271QBcXeqGxNMVZunoFdQOKajTh4BsMOklU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640291; c=relaxed/simple;
	bh=aekiaaIVwGh/l4+vFE4Mo4VxStF7vu7b8Mkga9q6bA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI4B8ZkzdRgEQJ5O2Le+aVOUXA0rxQc+00rZDh/lEjlXMWJoS706jK8i7PT5TLrVw5CD58a25mwgTWpN6sPQlHYkCucDLXISWXrIj12+wG911UHvgr+yciy117iQ5IIbB0q3b2vPvYU39eyvlG52gDP05i4PsIMI2vRFue/kCsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=hqcCkUB5; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D27414804ED;
	Mon, 19 May 2025 09:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1747640279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wQjoma1O1OdtzetT7SXR46sOWzRddqcETMnqNiXd/5g=;
	b=hqcCkUB5lu87Z3pEGL6RMrBGnBZJ9C12udPhO7zjiRG/X8BOH0qFdWdZUEfBDTyQjp4EI/
	h45y7cw/nQg4NS1ML48oc/9ciF1ImuNZ6ypA1BDfJNPFapQskukWdB4y3CJgFTjVQcYxCs
	kU696CfLg0wF8V/yqWWQzQWMSDr19J49+7v2tiCvDDrSo7epUkpnhcSEixwBJJB5Givs0W
	iG3RAXB8kbxWJLv3+9VgsbprkqdNQqHHvY09jtfdSyA/tsayoT8k5qxgCgB9YpREyzPoDh
	fI4krkx+E8McBBQXWRKjPTfB3s3KDHPTn6ZaJLwvpGOTO4GW8Mfb/9oY0Qiuow==
Date: Mon, 19 May 2025 09:37:52 +0200
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
Message-ID: <20250519-crudeness-hatchery-3c9f02fc95ad@thorsis.com>
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
 <20250516-plating-early-c5f8017b7466@thorsis.com>
 <c9c6b734-30c4-467c-bd5b-b73784aa0f27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9c6b734-30c4-467c-bd5b-b73784aa0f27@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Jacek,

Am Sun, May 18, 2025 at 04:36:52PM +0200 schrieb Jacek Anaszewski:
> Hi Alexander,
> 
> On 5/16/25 09:35, Alexander Dahl wrote:
> > Hei hei,
> > 
> > just wanted to create a new thread on a similar topic, but this is so
> > close, just hooking in here …
> > 
> > Am Sat, May 10, 2025 at 02:43:45PM +0200 schrieb Jacek Anaszewski:
> > > Hi all,

[…]

> > > The question is if the LED name from the schematics tells anything to
> > > the user of the equipment?
> > > 
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
> > You see devicetree changes frequently which change the sysfs path of
> > existing LEDs, last example I saw today:
> > 
> > https://lore.kernel.org/linux-devicetree/20250513170056.96259-1-didi.debian@cknow.org/
> > 
> > Consider this change:
> > 
> >   		led-lan1 {
> >   			color = <LED_COLOR_ID_GREEN>;
> > +			default-state = "off";
> >   			function = LED_FUNCTION_LAN;
> >   			function-enumerator = <1>;
> >   			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
> > +			label = "LAN-1";
> 
> So this change was made without understanding how LED naming works,
> and without reading LED common bindings [0], which clearly states
> that 'label' property is deprecated. It makes no sense to add 'label'
> when there are already 'function' and 'color' properties present.
> Label takes precedence to keep backwards compatibility.
> 
> > +			linux,default-trigger = "netdev";
> >   		};
> > 
> > Before the sysfs path probably was /sys/class/leds/green:lan-1 and
> > with the addition of the label property now it's probably
> > /sys/class/leds/LAN-1 … so it changed.  This might break userspace,
> > which relies on certain sysfs paths, maybe.
> > 
> > The main question is: Is that sysfs path considered to be a stable
> > interface for accessing a particular LED or not?
> 
> It should be stable, but since LED sysfs interface is influenced by
> DT implementation, then the responsibility for keeping it stable is on
> given dts file maintainer.

Okay thanks for clarification.

Follow-up question: should the linux-leds list be included in Cc if
someone changes LED related DTS properties?  This is often not the
case, like in the case quoted above.

> > I've seen this pattern also the other way round, were an old dts only
> > has the node name determing the sysfs path, people change the node
> > name or add color/function properties, gone is the supposedly stable
> > path.
> > 
> > New idea: what about making this somewhat more flexible and less
> > suprising by _always_ creating the standardized sysfs entry based on
> > color/function by default, and let label only create an additional
> > symlink linking to that?
> > 
> > So in the above example /sys/class/leds/green:lan-1 would be the
> > canonical name/path of that LED, and /sys/class/leds/LAN-1 would only
> > be a symlink on it?
> 
> IMO it would be cheaper to keep DTS implementation stable.
> 
> [0] Documentation/devicetree/bindings/leds/common.yaml

Ack.  Sounds for me like it would be okay to point users to those
bindings and the deprecation notice, if one stumbles over such changes
on the devicetree list?

Greets
Alex


