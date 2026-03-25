Return-Path: <linux-renesas-soc+bounces-30251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEwBF+Tww2lZvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:27:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF300326C0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AB7B317DCD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065333DF016;
	Wed, 25 Mar 2026 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acB6yhhg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7B63BD645
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448463; cv=none; b=IQ10BLCknn2Xq9Kodp16CjTB9qkaWso+U0hqa63a9MHiYKlM1L+JjliU41lrhDk+fquyxOT0meHKAyEGS4HVwbwXZnpWHv3w/rgioR2vaYzIQKuKV/3JfDoaafFnhRQ77tyKtlosOAC9gYx4Z4zpNYfIfB0VgJmlA8HUV2cy5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448463; c=relaxed/simple;
	bh=nyIevaqXhT3rwmENRdoKTBDLBj1F8IcBozyA4s/q8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCb/wm3sOEXBZXHpSjwvGw4KFQR46YIZikAmzv92Y6xIqnBdE6E/X7RgtLCHCBeQ1ESUCvKPxR56ONcXjKRxOKmW1dR28qlP8SdEr7ZRNXEbUGfOagpiAZwOZQ/v+whQoYBB0am6wFkS+BcVdzacpVdhC18rgEc53CMEajiKqb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acB6yhhg; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c11c43aca0so732180eec.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448461; x=1775053261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S5mOriTguhW1xaEQeXyyeJMvod6MSEvAssopruD0u8=;
        b=acB6yhhgAJAwkzBErsun6FFDwRd0OT55HQ4LqThv7zpb9chNU8h3IOIm/fN86ElMDD
         5tNKIYGqiQ1aNzQ1BD0RNyN5E5kTLuwT1Li6LLqWNAhSUbwuwXIqkvXRmVJKfj+nrepP
         rrcqdpPpFyrkXCVRbo3OSspCs+PNo3rhpXqdIrC1LZFsDba7HIC7R8dEFPje4rmwaQtJ
         Ox/b1XMP6EZB0CUUic6PyeKUExGZSSlzSWzUoyyEOIV2waD4KrUq7BIka2vUnZ5Fps8Q
         KBk4KOQrtfLa/ZHFLHriEBi18zpBLq7ouY1+iUeXOjO0jr3/Nxc4BAtRHb+9beHgSlWd
         xiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448461; x=1775053261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/S5mOriTguhW1xaEQeXyyeJMvod6MSEvAssopruD0u8=;
        b=B0FAmGp8a9XPQgn5efsCvabSlJGKbIWmftsvnwyFETFDxw0w+W1oDTAcHko6MbBAqa
         wk0OFgAMnzaJWUlrwaGNJHH+1H4bOFY6xsDaR3CKHwtMuZydGN0S6OWohjjZZgn+Aj3w
         smJ6Ss65kYMZT5DcbqMWqgWAMBO5VZ5vPMSUPYHpTnSYK5ieQY+FsLCsxDuTRRIX7Cb/
         VXnaoWkn/LisRuMPdpwY1Qv4wDQ0gY1NO4ihBIbR6n0MIDPEUlVxqzm+FyEVzs7kkITG
         pbDQTF+6bOVkXPb0lk/PJO86HTN1XPFf3GV8C1/ehg/z/tpmZS/itDKT8Ktm+vEtQCeV
         gXwg==
X-Forwarded-Encrypted: i=1; AJvYcCWYdCaf+cz0RUGyCCFNiPAL0qp8OCzjmT0HgcUkFpqpjRHSbI9SqomtQYVphzL9p+CWYr230HCJ+u3QXQVVM5yFZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXT1Mia0QXyhRuxr3Eltp5vzfr04laqugyY6Ao/pJkFlK/R1Sw
	QVEZG/Y7RY66zp6+aDcfylUvEnXpGyPX7K3EkCgVllaXRwymhChDlHir
X-Gm-Gg: ATEYQzwY2qiGdPwb5DrvmFst6V+a7pV5weo09x2S61VUJ4R+enaqEMnZo/NU5AcfEa8
	8eFq87nDactPBqqNuGwzG31iCzNgoJxaX984kmCTMc2NWwnrU4QkWKSqduMbCLd2MHebFocGOu0
	NPKDkAh8MumMjRI+TCGczG47XoUcsM+1ba8fLHdWtutMPadBBvg4Jr3WiUaNnYJ13PE4FjLw6Ld
	h2zFwLt2Wzw8+YF7NJeBe8G49dVBLqXm8yi4a7VoYdNNUZmcFkmzZr3X9EYbb2kRIgDhZa4tF8N
	6DmBEm2W6gFvtVzAmtE/BKhwNcb+m1rPxSOCaSxlzVdXTlG9aLLOUn/yr8868Y/TwlnTa1HeT4f
	HBeslKO/DHMlQI56nfKtOr7bI+rQ889TdF9G4h9pBgJMEjy09IDSN6Z5hUYdkVEQYk8CtkccmZ+
	1lc84BWiPNDFT/ZE+oVW6S7moGAN2xoT44EixF
X-Received: by 2002:a05:7300:371e:b0:2c0:b92d:267d with SMTP id 5a478bee46e88-2c14b46dc8emr3673818eec.2.1774448461293;
        Wed, 25 Mar 2026 07:21:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d01f7sm17923085eec.23.2026.03.25.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:21:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Mar 2026 07:20:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
Message-ID: <4e5107a3-6fee-42a7-9911-3d50a3557241@roeck-us.net>
References: <20260325090208.857-1-dawei.liu.jy@renesas.com>
 <20260325090208.857-3-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325090208.857-3-dawei.liu.jy@renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30251-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF300326C0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:02:08PM +0800, Dawei Liu wrote:
> Add I2C device IDs for Renesas RAA228942 and RAA228943.
> 
> At the Linux PMBus hwmon interface level currently supported by this
> driver, these devices are compatible with the existing 2-rail non-TC
> controllers, so devicetree will use fallback compatibles and no
> dedicated OF match entries are needed.
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>

Applied.

Sorry for the v4 noise. Upside of AI reviews is that it finds lots
of issues. Downside is that I now get flooded with lots of patch
revisions. Still, I very much appreciate and prefer to get both.

Thanks,
Guenter

> ---
>  Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
>  drivers/hwmon/pmbus/isl68137.c   |  2 ++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
> index e77f582c2..0ce20d091 100644
> --- a/Documentation/hwmon/isl68137.rst
> +++ b/Documentation/hwmon/isl68137.rst
> @@ -394,6 +394,26 @@ Supported chips:
>  
>        Provided by Renesas upon request and NDA
>  
> +  * Renesas RAA228942
> +
> +    Prefix: 'raa228942'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
> +  * Renesas RAA228943
> +
> +    Prefix: 'raa228943'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
>    * Renesas RAA229001
>  
>      Prefix: 'raa229001'
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 3346afdf3..03c9adc0e 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -432,6 +432,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>  	{"raa228228", raa_dmpvr2_2rail_nontc},
>  	{"raa228244", raa_dmpvr2_2rail_nontc},
>  	{"raa228246", raa_dmpvr2_2rail_nontc},
> +	{"raa228942", raa_dmpvr2_2rail_nontc},
> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>  	{"raa229001", raa_dmpvr2_2rail},
>  	{"raa229004", raa_dmpvr2_2rail},
>  	{"raa229141", raa_dmpvr2_2rail_pmbus},

