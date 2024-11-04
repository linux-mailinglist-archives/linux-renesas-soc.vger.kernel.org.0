Return-Path: <linux-renesas-soc+bounces-10286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B09BBDFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 20:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40781C21F6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 19:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3BA18D63C;
	Mon,  4 Nov 2024 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihP8pJgs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2AA1E89C;
	Mon,  4 Nov 2024 19:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730748563; cv=none; b=l89uKIWXFKu6RiaDNXAaFp+obcEw//cNImBZEuDgUVx9EluHOWhTrWp9CNZ4wrIMFcRUTTgfDu2vu2eGvYho3+X2vzJujncpHO0APINbkE/CcEWFuEQ5ereW2OW5873rvZfIVwA5/IZKQZsh4nl7LK7KP/DOe2pdC5kd7LftCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730748563; c=relaxed/simple;
	bh=G5F0GT2JJaXeVR3AnLTQpq3wSD2onPZCQkFb6V3jPHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meUGKKfKO1h4gHd1//WPihtulrgOnn0aLhZdTXcvdSxv8RJed6iHPzfSs6kiWaO4aVv/QqBn9VX+nknzu8AIxUOel1F1caek8/WteiuVUowUuoWclI6+gr2hrER3jCia2R/Fe8eDWJolY1d5BpPlsGCdKS3SlM4hzzz/ru/23Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihP8pJgs; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so46973541fa.3;
        Mon, 04 Nov 2024 11:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730748560; x=1731353360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XjSlsiNOh57JxX3lBao2jdi0q5lpdDEDtUd4aqmXE4=;
        b=ihP8pJgs++X4//HAQY5TYbU3EicUwrZLFzxHfky7isTlnsuLK8VGIy7xHTT1s28UiR
         kUg5nZdLOJJWZJB9Pwb/KHNZl9QMIc9jYMJwP+gOAaljFSBFk25D2Ico8+k8cl+Yi3oG
         9DijN8j/Y5xirRj+K6ll/l7cTtcxNuYfWsxq3lNqZBKz7OEcGi6gejGKq1L21xLBOQ5Q
         fOzOyTuQIH0jNrHjIkEyi/CWAcPsrO20qEDmTdjrgoxR2DSM3jU2vZT32XOVZEqoUc15
         8/N8r1puly4nIn86FaReUneI7hmwNOMHzSHFWD6tu82iRXoQgz0rOf+j28qTOMN+/Zi8
         SxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730748560; x=1731353360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XjSlsiNOh57JxX3lBao2jdi0q5lpdDEDtUd4aqmXE4=;
        b=BrN0Fq5kmhmci8KZfrg+xqsL/0eaL/8t1bW/9fTTq9p2e2a2pPxY8S3U86sZqpVHuG
         3pVlgJqoODdHyNXn0El/z9Lr/LgtbqwuO2Wa+iscbJHPsX3qKPNN8/bmqyfVEtFkOvSo
         QmqHMWCH8I6civu2fZMm9P/u1iBKWE8RO3URyVVN4OKfjE6VAlEpUsWaJrspjYYVJxuI
         KztAhgZ2sKYqLMXQEOjokX4p9YXssCG85Blt4sBxVJxr73/9VW0oLnlw/peQtSXtF86U
         Y78DCjSTeInHFUHxNObyAdWDzo0Dq0yc6U/eixBx0Vt0RpixZr/fJuCDjvY/LTdU4mah
         NqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUem1OUX+otvDe6259jPorXAk9CD+JkW9p+cJg9rhso6ZqLntM4LffX/WWuYuJhNkaJ2ZZsrJduj73LboQ/@vger.kernel.org, AJvYcCVxrG2lU3rqj5iaDnEA+PFSQYam3jC9h9QFNEWnGGOdmSFuBXTKeKJdHkalx1VC7NdejXIetyQ1@vger.kernel.org, AJvYcCW+sey8sOxTfdIS6QtO4krtIyiSY5Npq3fhJHxXazn23EeP3ZyrM9O7aDdjFem9uD7RJK5vlKkACmc=@vger.kernel.org, AJvYcCXBNye7arLqa0nGTd2CBgZbYT68usr8EZ3kv0YzlfYlX0M757Q+6B3YOYZieUcF60dGyRHM5gDZaxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSA+yT68UnBHrd/Mc8zpyTGwfbrV+QHnjD4W6AWwjWlmnjboOW
	6o+aW/eeWYnTpUrSTYYGUq7w4QVpA1LtWSYra3bBF5JPUmFx8/WG
X-Google-Smtp-Source: AGHT+IFjlt0vsot99zI+uSrpDWCgbIgG0OV2Eap+Ti+Za6yzEb/ER2ZWZFujJxZR9wcOHFVIQY317w==
X-Received: by 2002:a05:651c:994:b0:2fb:5504:794d with SMTP id 38308e7fff4ca-2fedb7ecb76mr60144821fa.44.1730748559796;
        Mon, 04 Nov 2024 11:29:19 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:101:3021:c7c:ed77:7717:fcd8? ([2a00:1fa0:101:3021:c7c:ed77:7717:fcd8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a6627sm18226061fa.98.2024.11.04.11.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 11:29:18 -0800 (PST)
Message-ID: <e7123fcb-048c-4415-adb5-97b9f032e6ff@gmail.com>
Date: Mon, 4 Nov 2024 22:29:16 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC v2] MAINTAINERS: Re-add cancelled Renesas driver
 sections
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Niklas Cassel <cassel@kernel.org>
References: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/4/24 2:05 PM, Geert Uytterhoeven wrote:

> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
> SuperH Ethernet drivers.  Add people who volunteered to maintain these
> drivers (thanks a lot!).
> 
> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Acked-by: Niklas Cassel <cassel@kernel.org>
[...]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13f4c23281f89332..b04d678240e80ec9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19578,6 +19578,16 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>  F:	drivers/i2c/busses/i2c-emev2.c
>  
> +RENESAS ETHERNET AVB DRIVER
> +M:	Paul Barker <paul.barker.ct@bp.renesas.com>
> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

   M:, not R:?

[...]
> @@ -19627,6 +19637,14 @@ F:	Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
>  F:	drivers/i2c/busses/i2c-rcar.c
>  F:	drivers/i2c/busses/i2c-sh_mobile.c
>  
> +RENESAS R-CAR SATA DRIVER
> +M:	Geert Uytterhoeven <geert+renesas@glider.be>

   M:, not R:?

> +L:	linux-ide@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +F:	drivers/ata/sata_rcar.c
> +
>  RENESAS R-CAR THERMAL DRIVERS
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
>  L:	linux-renesas-soc@vger.kernel.org
> @@ -19702,6 +19720,16 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>  F:	drivers/i2c/busses/i2c-rzv2m.c
>  
> +RENESAS SUPERH ETHERNET DRIVER
> +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

   M:, not R:?

> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/sh_eth*
> +F:	include/linux/sh_eth.h
> +
>  RENESAS USB PHY DRIVER
>  M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	linux-renesas-soc@vger.kernel.org

   Niklas, Paul, I hope you won't mind me re-joining the sh_eth/ravb
entries as a reviewer when the fog clears a bit?
   (Besides, I'm still on vacation -- till 11/11...)

MBR, Sergey


