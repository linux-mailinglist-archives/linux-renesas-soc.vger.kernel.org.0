Return-Path: <linux-renesas-soc+bounces-25233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65DC8D6DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 10:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AAD3834D30E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3318231E0F0;
	Thu, 27 Nov 2025 09:02:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5B2EB876
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234162; cv=none; b=XDG9BoCzU9+0bmPhCnoiyOR8is1qNv7nXCPiAFEDbg2iIztuy+hgdFtWVin+lFty3Vn3vrXxo1Ciw8DPcM/49UFDxBEQobTgz8pUmvgRUrhHdjGt/Y26E4mi9E9UWRtgNXMbvOtxmNkr1NmENVJwTQbiZuw0dvyy5ypm0LDg7X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234162; c=relaxed/simple;
	bh=wBnN8Y419gYK57sA8+xqXwDBtmsISzDIBeFML/t6rWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIdEOrO5pWAxlPGK8nTtPoCu44RqKEH+LvGCYu2/YpcwaHYPUeGBdjJoVFWm4SZwLuqq8BOiEzlJdFMQale5dB/jJ2VqNCciU5tIwCTNlor6S13zmwufqrNCVYq0fs45YJP1vXWH9xj08xpvk9829Ji0r0BPYt0LmU9SlIxqHWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso384824241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 01:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234159; x=1764838959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSY12wujyQqkN0s0ZCmyYYswJOo3iF7QtRvGpJcpmMY=;
        b=niwvZkMwWX+tKe3sj1ygElruTqanUIafWEqf8rHW0oFOo4AHokCXg5eEDb1nQXOK+e
         NNlj4/eun01n02eZvX+mHOjdI/6xPTKXdvc1E9O8BekoH/AViXCNYyU0WvYKNhW+uB0E
         a2V9X9gnB8IfklxGE0ItNOObu4h+Rr/GwZhlaTBK0JNogaarWvfqQQGVsg8Vh2HjDe/E
         3KtDERLVyyZyuxGIwBwwsYTdkrk4ZLT1qEqzKkVC2vdu5F7Ux0XZkagghu+ViFaMTvX7
         QUB+z8+M1lWFlUcJcBUE0ubuYy6rpT9LxDNyTcU8c2HDkTcboc0rqjrxvW/x7kTt/z7k
         MJkw==
X-Forwarded-Encrypted: i=1; AJvYcCXztVZb0asWrxn+0M/yKlxK6dDkioqSaLiGgB0WwNSDZo9acAIaC/gz05QpLuDFVqCoy4HthbE3wvKao1t8AWOsiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzquTIkclgEJc0/h3XWLw3nJvNUDTYKfhO1cbmLb1IU1C4Iy/Tp
	oyl390VGAJvJHlFaJUVS3J7XHuehf4OtQmymDx0q6SFIyHvdg7ZHgrUpSbqqShvZ
X-Gm-Gg: ASbGncsCNrd0hwQmHVZJe59hLQSqtDHLFt6Ke+gjGzCL+GwaFarE9H6afYUpgeanppc
	EVPNrXFC2mvywKXJ+5XKOCYTxp36zq5ebYtbppn5spCYrISL3I3CwpD8+QKNtOWfGkNpoxj5Cqj
	RDOIz6di3XLLL8GGQ2Sj34aatoBF2UMxwLjYijsalDQ2x9GiCyi8n0pW06vl1d+GmQMeXk+mrHA
	VTONWXDRlZlyUnXJelYicZUUYF8HuOWpLwTO7gPVna56wG+tQFBZhyXpbHuknMKI+N7CYbMDLA8
	1BnL6TpLKG4lQYO5qJVoUyBCS3HRpk2Ngkmzu/HhM5985nmOJjegS5Lr9oTM+dz3GDXljzT1paw
	oXXIDaCl8efIV6drxmyxo3VkhvptvO8liJ2jmIWuoS7JGS6IsNRdkS35bzlvkpjoK++j2STMOhx
	prFucTVeThqGSqFmT84jVI0Sp/N9IAebTC1IDMf1YKfPSL/eeu4gdO
X-Google-Smtp-Source: AGHT+IFaQzavb6WcnBFipp4pkz0jPI8uFWVs/YkpKdBbUn9XAqA+vakPLWInPRBvMypdZtGAuV6QCQ==
X-Received: by 2002:a05:6102:946:b0:5d5:f6ae:38f0 with SMTP id ada2fe7eead31-5e1de34b1edmr8233095137.39.1764234159270;
        Thu, 27 Nov 2025 01:02:39 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd6e50baasm353038241.7.2025.11.27.01.02.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:02:37 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b1dde0961so481659e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 01:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUF6ZN+YNo8qaM0XgdyZH2graj57C/P2g74o00ioIlU6smkzVXeGtF0oVGTufjyZy9pVRdA6PskD3A1LWdPj8Zc+Q==@vger.kernel.org
X-Received: by 2002:a67:e108:0:b0:5df:c33d:6e54 with SMTP id
 ada2fe7eead31-5e1de0099d7mr8404976137.3.1764234157141; Thu, 27 Nov 2025
 01:02:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com> <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 10:02:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
X-Gm-Features: AWmQ_bmLgGar4dfe4FpC2atA-pkz10WbT4MOeIioGse4jPHnHaBNPYet7pQnslE
Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 26 Nov 2025 at 19:23, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
> clang and W=1 causes:
>
>   i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>
> One of the discussions in 2023 on LKML suggested warning is not suitable
> for kernel.  Nothing changed in this regard since that time, so assume
> the warning will stay and we want to have warnings-free builds.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch!

=
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->io))
>                 return PTR_ERR(priv->io);
>
> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);

Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
The former seems to be the least common option.
FWIW, the most common option is "uintptr_t", which torvalds doesn't like...

>         init_waitqueue_head(&priv->wait);
>
>         adap = &priv->adap;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

