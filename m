Return-Path: <linux-renesas-soc+bounces-27035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DED30D3A672
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 12:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29FE330D022B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB51A3590CA;
	Mon, 19 Jan 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOAvqiNc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971EC34887E;
	Mon, 19 Jan 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820846; cv=none; b=LN6lF9IQROTzduTFzFe0Eg5bxpYuiCACg7R+GduBiNzXT0wkrUZ+xGrH41CLGrQ0jfGW6EjlyGvhAps7ExQFD295UA0RxQ6sy1a9pCI4WKmfEEJvhJ3bxf1RW8ghftGSkXsRYxNS8BJKfz6ZZNoMXMg0Gvw6jpBCVdnfs1CKo50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820846; c=relaxed/simple;
	bh=cXrQIGq8ghQgg/2tKSWr1ulwNeEYtyDoK9Rxf5XR8Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0f+pnG8TdQlPzKVt8aaujNrjz68nN0zaVT/D/1+KqgZ/Le4cOocbkobsEGWaCQ73B/tw4bUoNMKn3Nwyxb37TMPCg+KBFTDbhzEXBVQlg6ApTi/3lixvHejVuWVRHwZhEuDMHeZF9f6gnlO/frQlJX0Q0nN4GdWs57XfiPTlJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOAvqiNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C991C2BC86;
	Mon, 19 Jan 2026 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820846;
	bh=cXrQIGq8ghQgg/2tKSWr1ulwNeEYtyDoK9Rxf5XR8Yg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EOAvqiNc4GCvpD1yjoAwVDRZs2iT3IOHlR+F2UAQgOWkMSzesel6Wo+CtWlDfgLIb
	 qqHUdETE4YPQTAgxHXz2Oi1pooZondcvSnLIQAJQ3VA4HAXzzNdikqzVnvH6Xp2Jiy
	 jGUZZrqJnKUSiqvJSxLoBLPuqA09ZDrUfeptW+ykgZvtNOlFtE7cWeGQvgLNRN9Rps
	 aiBTNnR7reEZiRE+bvdOBbOodjPBb6QCyxISi5V15oNoJMi9e8XOC6wQoxs/mKjUxg
	 5LhAd/bl1GXRdTVXfeezwp7e7H/AV+WWwSvtEDZtnnkRvV4e5W1O3AK19Nte89q32h
	 5yUGiBiFsW5BA==
Message-ID: <70d9ba17-59c2-4fc4-89f8-598667daea73@kernel.org>
Date: Mon, 19 Jan 2026 12:07:19 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] base: soc: order includes alphabetically
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> For easier readability and maintenance, order the included headers
> alphabetically.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/base/soc.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 282c38aece0de88049dc1e6e9bea00df52bed1ea..6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,16 +5,16 @@
>    * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>    */
>   
> -#include <linux/sysfs.h>
> +#include <linux/err.h>
> +#include <linux/glob.h>
> +#include <linux/idr.h>
>   #include <linux/init.h>
>   #include <linux/of.h>
> -#include <linux/stat.h>
>   #include <linux/slab.h>
> -#include <linux/idr.h>
>   #include <linux/spinlock.h>
> +#include <linux/stat.h>
> +#include <linux/sysfs.h>
>   #include <linux/sys_soc.h>
> -#include <linux/err.h>
> -#include <linux/glob.h>
>   
>   static DEFINE_IDA(soc_ida);
>   
> 


