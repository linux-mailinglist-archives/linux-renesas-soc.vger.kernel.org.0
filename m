Return-Path: <linux-renesas-soc+bounces-19389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA1AFCFB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 17:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A606F1C207EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 15:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74DB2E1C6B;
	Tue,  8 Jul 2025 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXHf9LPd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D992E1754;
	Tue,  8 Jul 2025 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989861; cv=none; b=I+eSxkSVuX2ZqnAndjcoP9FOg+RxD+KP5lDsNvvcpiCsZ79W7M2Xee4P3MTB5AywuK6LTb8YmfoLabQQ91kfQJ68in+UYIa4v4WoB5K1bBpw2wRAf8qDQtnKfi9rtywKuFIz0L1IGpW0v2V8QYN1qGjQDzJCF0hLXzlUcSwYLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989861; c=relaxed/simple;
	bh=ERjmfEJJ+8BiOWJ4NbjXhd98XbBC0ZAG9dCdkIK/JfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGZtiHbcD9po1Sxtaua3OwD828yhFN3T6XJ8l37tn7bE6AQQzM8yTqwOwrMlCpJed0meNurPp7NhxZpQ0fflFoqqVjeAKlu98qkxvM1mJA5gNHuTCCEkDixd7IFi7EjITRyXlI0zrtGQ+eOijcMw94Rj5DgScwegYm7XG6SRjsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXHf9LPd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42D4C4CEED;
	Tue,  8 Jul 2025 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751989861;
	bh=ERjmfEJJ+8BiOWJ4NbjXhd98XbBC0ZAG9dCdkIK/JfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXHf9LPdX+YQ9xWyO/m0D2xPcjchi02EO05gQ4u2qRaqPjDvEewfmtUA0rTpzoSOJ
	 tCU17bvbh0cuIY5HYTdWZWZkZHASF2sEipdgj5ROFlhdPkXQkazoGJj9UkctqOnKxP
	 c30BL7+U6tTr9mBjuF4B4R362DpAPlKggWl0ApgQ++Fe753+dKHOE0j8VwNlJG7lPE
	 4Zj2GD+OJlDbblL1PhpNhM6o4nCEc+24SMDM0S02Zg0wXKeb7Oz4wskBgUGOWwuHnm
	 r2wVcBTyxHC3E/xS97bIoY39ORTFkSHICvJQrd92s87fr/7WYzHy6fMJfaQj3Bt2n5
	 /aeqlvyfreZJw==
Date: Tue, 8 Jul 2025 10:50:58 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document after shutdown
 fan settings
Message-ID: <20250708155058.GA477029-robh@kernel.org>
References: <20250629220301.935515-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629220301.935515-1-marek.vasut+renesas@mailbox.org>

On Mon, Jun 30, 2025 at 12:02:08AM +0200, Marek Vasut wrote:
> Document fan-shutdown-percent property, used to describe fan RPM in percent
> set during shutdown. This is used to keep the fan running at fixed RPM after
> the kernel shut down, which is useful on hardware that does keep heating
> itself even after the kernel did shut down, for example from some sort of
> management core.

This sounds more like "don't ever let the fan go below this RPM" or 
"don't ever turn off the fan". IOW, it is more than just shutdown.

> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> index 8b4ed5ee962f..a84cc3a4cfdc 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> @@ -31,6 +31,15 @@ properties:
>        it must be self resetting edge interrupts.
>      maxItems: 1
>  
> +  fan-shutdown-percent:
> +    description:
> +      Fan RPM in percent set during shutdown. This is used to keep the fan
> +      running at fixed RPM after the kernel shut down, which is useful on
> +      hardware that does keep heating itself even after the kernel did shut
> +      down, for example from some sort of management core.
> +    minimum: 0
> +    maximum: 100
> +
>    fan-stop-to-start-percent:
>      description:
>        Minimum fan RPM in percent to start when stopped.
> -- 
> 2.47.2
> 

