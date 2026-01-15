Return-Path: <linux-renesas-soc+bounces-26878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3E4D25BC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 17:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2A3E30C4C5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 16:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D393B95E7;
	Thu, 15 Jan 2026 16:21:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC96339E6EB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494112; cv=none; b=S6lkQbRuGx8bb4RSNJazLgJ4QBfzFZ8CcuCW6KB1EZXPStPLULjEYKaS4kIk1DYOK1iiGWDvF17rteYZSKLAisUz812NbEOmj1E/EyTx/tGH3LO6+SPqVwCsssjGH0qpnZykLv6yymPLKl9WPXK43wPpbvcO5yCI/MNCXOESOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494112; c=relaxed/simple;
	bh=hitHd2IIQqesxEsJnpDWb44stsIjIR62E9k/vG2AAV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fopDvUQrkEkbLDMm5J6dj36XHGT60VsTBCKyHnVeDt6IdTIiGNkO3K8YTAuqk1H0nCjbmA9ecY8PkRPylrpaIqwoK+aG/ZdLc7RDz0IlzeBA/BoTmo6+/VFTNf6y1ejoooSfIiblRcXkgBb9L8FfpKm8Igovkkq3YM4LDlXlwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-563686df549so933789e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 08:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494109; x=1769098909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRbj20xJBk8ykfBXjY0ZjfkbgaBRPnB6+tkn0mmWYmw=;
        b=enTLhvGdIQf6A41qPaenRCQxr5baUO7x7loDHf77IcasDdXv2wZinkpk2kuNj9EBva
         ZXX1yWp7CXzTE3btew2EK71SvhdpK8HlY0Bd2sZXfqlZY2ApcW1rKB6bdNdUh45ba3fj
         r2hkNhFVK5EPy1KaZVoT8FmGf+66iCgasAPn8XlE9O0Pc5thvdhNm0lQDLEOgo+zWJ+/
         JOhv4s6QwKsEO/OJaCvxJknIMG0BgpwlfIKM6a9mBbu9jsgx9NLYPHp/sdpBda+DW3ij
         M5+y2/gWHoyj+OUcDOXaIWm8l8Ud2mgNsHnwIhcyuC1G3ztS5SO6aXHrtp/Ej0HhvLFe
         bgXg==
X-Forwarded-Encrypted: i=1; AJvYcCUrvQ73i/NLz+CwvKCCb4088m5/maEZ5WrhpNRI2a9emoH7kDoM1nP1ctLmMcMZoLncP02Pj+kOqm2GP/R+HACueQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf2sAEgAcOoMKHohFvwV5F+oYhdaSaIpFHl5RxwKJI2EAURly/
	uTMy2tnRARWs5uCk9NY80wUwMcOBWAkEoqKOE4Qnfrwv48OHo8RXNY0+qS7f1JcavqI=
X-Gm-Gg: AY/fxX5nhUqJuRIaMhABw+khnQDWfBT7FWiXWVYS8wicefAMhQ4tqq7HBirp5MoJvq8
	Kj98hoybY9ULbKyJ5n/3qADk0ItsyRNSz8TUJWZIw667QVixuQ6AafyZBqNqyNK2bdncl+Iv1/+
	v+5RwsW/D1QdbXHcs3s2uECGNMnZBlIh/1zKGZwPC+x9cVxtQhDmBFoBBgbrxdvsRQ3WvgLtMse
	sxLoHcmvH/g8jtW3uhLAM/C1Qf9rVRykdsjgBeu5hlSWeN7tvX25rZTGuW/E/CislbYUFwAsuuy
	CKgOks3UTFrQUnJhckhjjp7qyj1VN2yvEO7p7/eQf1/tRx9YUOVqud5bkN7o6F3in95XXu/QGcp
	jliQHKz962Q9uyH8xSllJg58+43vr/vunoFuMOAkaJ9YUCHqzAsIvaTMx5ew0hhh2HyJ99XoIOD
	Lfi21W3zcLUP6K8jgBfDZ+O+HFNUXhEeWlH9W4XNd8/eF3l3SxtYKPJgjWjlFUOuk=
X-Received: by 2002:a05:6122:219e:b0:55f:e72a:7fae with SMTP id 71dfb90a1353d-563b5ca86b9mr191829e0c.16.1768494108500;
        Thu, 15 Jan 2026 08:21:48 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563774362bcsm14967924e0c.22.2026.01.15.08.21.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 08:21:48 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56373f07265so881119e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 08:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaghDIdW+E2h6RkgJxyVN5mp3Om3I6iRuW/S7JSOmcx7jTvm5TH0O670xX/0WYBmdvNdvySHd/ufeWyimfKg9OTQ==@vger.kernel.org
X-Received: by 2002:a05:6122:4589:b0:556:9cb9:65cd with SMTP id
 71dfb90a1353d-563b5bc906bmr213478e0c.6.1768494107680; Thu, 15 Jan 2026
 08:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org> <20260115161858.20226-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115161858.20226-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 17:21:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUd9TNWixxEYjEdOVLoR982tn4jgZXEnWKhnUTObYXuZQ@mail.gmail.com>
X-Gm-Features: AZwV_QiAnYTQRClR1ygbi92hWJ4Px5AfRbcO4422KM0HMSiCwiA5sOF5jHCdcfA
Message-ID: <CAMuHMdUd9TNWixxEYjEdOVLoR982tn4jgZXEnWKhnUTObYXuZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Input: ili210x - convert to dev_err_probe()
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 15 Jan 2026 at 17:19, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Simplify error return handling, use dev_err_probe() where possible.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -942,15 +942,11 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>         chip = device_get_match_data(dev);
>         if (!chip && id)
>                 chip = (const struct ili2xxx_chip *)id->driver_data;
> -       if (!chip) {
> -               dev_err(&client->dev, "unknown device model\n");
> -               return -ENODEV;
> -       }
> +       if (!chip)
> +               return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
>
> -       if (client->irq <= 0) {
> -               dev_err(dev, "No IRQ!\n");
> -               return -EINVAL;
> -       }
> +       if (client->irq <= 0)
> +               dev_err_probe(dev, -EINVAL, "No IRQ!\n");

Missing return.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

