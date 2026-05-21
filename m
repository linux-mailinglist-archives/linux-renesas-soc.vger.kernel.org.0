Return-Path: <linux-renesas-soc+bounces-32901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH38G7TMDmpoCQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:13:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 172715A2094
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D04D3076ED3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 09:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CC330DEBE;
	Thu, 21 May 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcFpV4QA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED0C3644C1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354562; cv=none; b=r3uN8Fa9/VLPZCClvjBT/Ro/A4srxN2L4LVoplMvh3CLWIyWYzYQHGkKMpqa6rzWiPyjmsSmJc6H2ytoaKkZFZ+mIMfRMZM9dadiz/ztLybTqe0aJu3R74Ba+GD5f5mi6I+2+zCuXNXbiL7PeFNOn3Qmxyi9yVrOvPBiMsyFbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354562; c=relaxed/simple;
	bh=HpvRBY8lbmiyzUWTmQ6mLlMu3Ab39ZXALE9sv15k+3w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2xOc/mVKudViVrI8qfvwv/ub5KDF5wyoSWPlYqj8AkOzLdmBLTZzXbpmOfDdTFvm2qY9IEJyzfXPDh8vsHY1oVU/97mnxWIRFoLzn9GEaNjgS/fiN02I4JcYGA4vFWr4/wW1j7kNmth73MgiWRNXrT4cf1MgcZfK3SMQR684ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcFpV4QA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA31F0155C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354560;
	bh=tZQ+ChGAmDE+uIHx0cmmqJIG4xuBBt/oi0plyigfTmc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mcFpV4QASf5he7XkX9GMiYvVKUp7RMFoHYMX1oX2w7udhqLGXIjgE2qxJxVNG7pv5
	 xJdiPnCpGwdY+yvMGJo4gySH2yPII7slIDmMg9TmTkhPQs5YqoejSJeh/Jn4/XUMna
	 aaIpzq0QNfdEXLLKb2if34+5+NodrnF48pUBoUfiNOqkb60hY3hNs/mOq0Q7+8Gevm
	 2rLvdQG1kGdXntl9Iv+21S1jWEmz+msIW6rpYfFkUJhTxwXNFynxRJMieD/cj19Ih+
	 uzD1zWxQGpx3S26EGx3d+8044Nt2hOEsQ1fngvfhRIP6rLMDfr31xodUK/DsjvJcjh
	 xuH+iaoUY13fQ==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1329fc4bf77so2877017c88.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 02:09:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ804TKFrLilw5SiX+2lHNcFXQW70gpSPb+ZgK9OHdcRCYLyU6LxSbfiKGsI8I4bw0GF5l1qEh4cJMyEa5VLUZxfag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNe8oPbPICFQ1xV1Ir0wiSpsNsbkYQu6NQPIFv2gNZj8+Nbm1B
	3vAqW6a8wAPvKKsMJ5V7/UZLjtHli+R0G6k2F72wQzDlM1vMIQkebK0M9stUSa9fqSdkJlahlFs
	BIgjw+WkK0tGp9edvIb0hwsWy5W5+2eiJuXKJbxRc0g==
X-Received: by 2002:a05:7022:2392:b0:130:ca3d:fa74 with SMTP id
 a92af1059eb24-13632f5e0f3mr1015599c88.42.1779354559846; Thu, 21 May 2026
 02:09:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:09:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:09:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520-rsk7203-properties-v2-1-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <20260520-rsk7203-properties-v2-1-465f3308021b@gmail.com>
Date: Thu, 21 May 2026 02:09:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcu+UTGz5keKgHqo4BdWMtK87CLiVU1jWBoLHNABJc2sA@mail.gmail.com>
X-Gm-Features: AVHnY4Jr7rGL-1AgbjdFR6Z5eqHof0x8iAqjMz8AFfw842n9_b1NuawDkEv0zms
Message-ID: <CAMRc=Mcu+UTGz5keKgHqo4BdWMtK87CLiVU1jWBoLHNABJc2sA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: gpio: isolate function gpiochip
 from parent fwnode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32901-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 172715A2094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 07:13:17 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The sh-pfc driver registers two separate gpiochip instances: one for
> real GPIOs and another for function GPIOs. Since both share the same
> parent platform device, gpiolib's fallback logic causes both chips to
> share the same firmware node (fwnode).
>
> This causes ambiguity when using software nodes to describe GPIOs, as
> gpiolib may apply hogs meant for one chip to the other if they share the
> same node.
>
> Explicitly set gc->fwnode to ERR_PTR(-ENODEV) for the function GPIO
> chip. This satisfies gpiolib's check for an existing fwnode and prevents
> it from falling back to the parent device's node, while ensuring that no
> actual properties or hogs are found on the function chip unless
> explicitly assigned later.
>
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/pinctrl/renesas/gpio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
> index 2293af642849..4e59dadb7364 100644
> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -278,6 +278,12 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)
>
>  	gc->request = gpio_function_request;
>
> +	/*
> +	 * Explicitly mask the parent's fwnode to prevent gpiolib from
> +	 * reusing it for function GPIOs.
> +	 */
> +	gc->fwnode = ERR_PTR(-ENODEV);
> +
>  	gc->label = pfc->info->name;
>  	gc->owner = THIS_MODULE;
>  	gc->base = pfc->nr_gpio_pins;
>
> --
> 2.54.0.669.g59709faab0-goog
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Should we document this behavior in struct gpio_chip's kerneldoc?

Bartosz

