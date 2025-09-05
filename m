Return-Path: <linux-renesas-soc+bounces-21483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D090B457EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9593A468A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 12:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFDA350845;
	Fri,  5 Sep 2025 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FITpli11"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490325557
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075413; cv=none; b=JekxHc0t56MbPl3QptI845GYY6xc6I8oHy3X+kTWvJv3LPC49ZiClkb5QCp+dxAGGnX8kMU+2CQkJ2Dk7qNS1VXbOHk3usRozJzKClrYdHsbsPN77d/uX6T/hOPPv4HrfJe6WTOVJNi4EQkZbaywZlGOIrXNYYmaVlvuw4jC2VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075413; c=relaxed/simple;
	bh=QnlGz4SE8SGva9QHMYtLnC6DHXlUV9RlaLGRDycgt8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X692JsETmDVDfFaSS4ur0iZQmY2UfQ/JPEfhCP3PXH5cY/krSSAeJj0FZ/a4XyoOsh5WKod5c8YNsAdK30MVABN1uuHxx8y/PSIDC9WL26GVSbNBIHx5Gbz5iQR4aVee4JviQJ9QkqTks9e3XiOFkInChoJqVUKA8tv5tKQpJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FITpli11; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PTsO
	6mHmSDWEul6mnh764nhyZdJRTGDuIEcsdYTIvD4=; b=FITpli11m6qi37TNv+pY
	izqc0WnQsSaXmNVnXvwD1/HuGX9a2Ozv7Bnqutm0O38s/PRMlT+h3IwL9XM4vDrV
	2Yq3TXZLghUSlBfJXtPaQZ5Js5nZHTeBkVcBN8aX5JbA7eGqW6gjT6jGQGn7Ym3B
	VvLkITNAOhbqwkw/gSmqWpZB5zc3mzqaz5NEIuBh+8eCXnq3BZrK79dK3akGAFi7
	VKv0GvmQFpK7wcmE8NqU8YdARQUTJGEbe7VJ5vZaRjL5RJH03MdsWk3kIYJ2Gro3
	6GfgHq+l1Ni6NTsmLvdeLNRuaeLahWzFLjR91vke/Fzuk5WalmgBu8+rAmAaT6Ka
	6A==
Received: (qmail 4044840 invoked from network); 5 Sep 2025 14:30:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 14:30:07 +0200
X-UD-Smtp-Session: l3s3148p1@44x7/ww+MMogAwDPXxPDAOCjMSL5jkIv
Date: Fri, 5 Sep 2025 14:30:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <aLrXzl38OUhTJgxP@shikoro>
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

On Fri, Sep 05, 2025 at 04:00:57AM +0200, Marek Vasut wrote:
> Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> been tested.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Basically works for me as well, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> + * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
> + * /sys/class/hwmon/hwmon0/name:sensor1_thermal
> + * /sys/class/hwmon/hwmon1/name:sensor2_thermal
> + * /sys/class/hwmon/hwmon2/name:sensor3_thermal
> + * /sys/class/hwmon/hwmon3/name:sensor4_thermal
> + * /sys/class/hwmon/hwmon4/name:pwmfan
> + *                       ^      ^^^^^^

For me, the output looks different, though:

/sys/class/hwmon/hwmon0/name:pwmfan
/sys/class/hwmon/hwmon1/name:sensor1_thermal
/sys/class/hwmon/hwmon2/name:sensor2_thermal
/sys/class/hwmon/hwmon3/name:sensor3_thermal
/sys/class/hwmon/hwmon4/name:sensor4_thermal
/sys/class/hwmon/hwmon5/name:pwmfan

hwmon0 is the Argon, hwmon5 the (unpopulated) on board connector.

I hope the naming is stable, but in any case, the docs need to be
reworked a little, I guess?

Thanks for your work!

   Wolfram


