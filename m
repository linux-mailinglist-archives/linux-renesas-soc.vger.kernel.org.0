Return-Path: <linux-renesas-soc+bounces-21541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81FB47E03
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 22:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E8A17D5CF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 20:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8F120D51C;
	Sun,  7 Sep 2025 20:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZKDkWWXD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A741212560
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Sep 2025 20:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757276345; cv=none; b=mOS74EiV2NH94FOfDsx103KKsV4gi7oo9Ufwz7AYE1YeFvy1qCuLmaM5tmi7Frb/EAWcRvdjQQ5RxiEVfGWVwmlr90IS22USY60rnmy68HkmYLhoh5brd7nXJLN2HEd0vpxjm2lc9Vcgb4xhk9vN1jIGAGlEP1bALXKEYREG8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757276345; c=relaxed/simple;
	bh=FcBRCOgBzzkxmZrLKOt0qsxWKrgd4Aljxao8iy/HEhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGpxe6+aayzh2CeJKh3cFacoVl1PTLzZRPB7l+vVd+EthBFYdfxkClks+J2u/gAK67bP1tcEmtk2l0GJNejtFeMWl4Q0eIoHl+k9DIjUWW6BeSq0wYeVOMsI0WViGht6gqdi67Yu3pydWtR13lqOxTP0PI+t7xhQP2ZYlmgqeOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZKDkWWXD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BkYE
	sQGADtfjEQqkg0ky53aCfLDAmEGyJ2yLOYX7e+0=; b=ZKDkWWXDdqev7r3ujExl
	vRbb12pNdrb6DOczqkm44D6Tq7aIu7P+FTdA5wkN7u6D+9SVMq277jkPUO+E/j7r
	Oldud7dTEw9sjq7qHulGEU2ttFIld0Hf0pszXOvn6AD/oduMDp8zyH0qBYN9xzWa
	0cESUHOzA51bFtgzl41TemZmS5faAeTE2hXPjlHurDkxa7/xQtjrmZCs1+Xj1Zwa
	ATZYjGzAUCupJBtvA0/FPZy8E8f+IFYKYcjDGHJhLj9AFzUfGS1LxHdI+JYesRT+
	9XwTkuKXm9SEB5bv32k+ax0oryUkTvwfp10+ICIMBd6dExV5dAIP7PuYpvbuZ1MQ
	kg==
Received: (qmail 574771 invoked from network); 7 Sep 2025 22:18:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2025 22:18:53 +0200
X-UD-Smtp-Session: l3s3148p1@wyOXxzs+LMAujntE
Date: Sun, 7 Sep 2025 22:18:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <aL3orDHZDLri0LJj@ninjato>
References: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>

On Sun, Sep 07, 2025 at 06:10:53PM +0200, Marek Vasut wrote:
> Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> been tested.
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> + * # Localize hwmon sysfs directory that matches the PWM fan,
> + * # enable the PWM fan, and configure the fan speed manually.
> + * r8a779g3-sparrow-hawk$ ls -1 /sys/devices/platform/pwm-fan-ext/hwmon/hwmon?/pwm?_enable
> + * /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1_enable

Great solution!


