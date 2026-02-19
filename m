Return-Path: <linux-renesas-soc+bounces-28317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ob1I5gcl2ktuwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 15:22:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B64115F70F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 15:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 931DF300D154
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 14:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBBF33E368;
	Thu, 19 Feb 2026 14:21:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B31DE3A4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Feb 2026 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510904; cv=none; b=RLg8IVlIxSXFxQLi6j8EyIOw6qPVjNV6xGAPcY4y3EORUySf/tY+kt+mb1+HJhsl6OpjpUKjWiemzNfuHg7/2hXFTR7V7qf9+7ktUwaRoBZandLcFZNxktm5jZNUKd0eEjoQIvI5am5SWkZXTmn2CM+ugTFdDat+4g5xna3F2pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510904; c=relaxed/simple;
	bh=/ZYYXgtgPRKj1olgFBbWehbpGHm+uMISOKI3+DRNfa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmWaGA7aqYsic2IwGjEfq1aM6vbUGGcVDzyvEX/jkwCGMOKyflgTo68Oh4YvSzYiIKqpNUdQLJsz5FqQSaJO94bvo72PWLBTjA5GJePG+a5rVvEm9C/eviVvZ5BMeR3nu5mOlyQbJC0VfO6YRkDDms7LiiIZjSBcjGkb+IDQSjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5674f3e80edso1370430e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Feb 2026 06:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510902; x=1772115702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnT2E6qzZtv6m4RxT1fh4Ezu4L7LN5MU6W5pzU+vKVg=;
        b=qQdZIKVhahxWWDO1O7sJycuzf43UiyvWfnpdIrcWtfTpj4zlz2WJcIOhTiZ6SjxSfL
         H3b54fV3tmk1FA8tBLLvWn1ufGKLwtMysR66pk3CA6+a3hMhcRtvnGN5hIXLJpmz9LRM
         AHtKArHnsfHEyoB1uTAG02sVdnGD+yQB+Ro1fdc4y72ugvtGBH3wDOjmWa2Bs27ve4XV
         V+aH1btX9X8bgInsg6CyKvevDaklLX7L6eRjMNzlMa5deEeAUTxaMFo8qtOI8VsMXBtJ
         tA1mj7XUBDyMrUVeM8u+QD+hocVlGxGrSTTL9Sutpp4taALbGFq5fSTgOUxH/Fl1v/TM
         7Ong==
X-Forwarded-Encrypted: i=1; AJvYcCVCfzGrihE3qBMIeHLDcOcgPbKCuSJoLYkoaHSaES/zKanKGEFPU2IeBrrvENXp8113+5U7aX8pEd8iUdnGdhc7CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9jMFXOmk/1UbRfQ0/SOJYOCCZy3l7RmGBEECMnISDWeJWuuv
	uvAzsnpuz0giYBAtHivrAB8gFviJAdb3J+/UssJAr/x8qRslmKUGqRCK8LyhT2E9
X-Gm-Gg: AZuq6aJgGl6RVR+Q+yzTZ3Wn/ytlsH/5sucFG6zfoLiJRrjNgj7j/GkrQdi4NcaBpxJ
	3gWwIT7Tx3JSJfpXR6zyQJk5tt74xVbzAnMvqAag2gvIKorPHAoThc23tx9v8POD0LH5+yXJtuJ
	DZDfWq4J8P7hgykjvBEhg/iraO9l48VCwCIPPTcWxtFw84R2J3W52VIaqgiSP9CTXESEQyL4Rl4
	phsZKogyl5Kyueq2HQvzVvnvaVfvKWEAVWFgeG94nN7/aYSsHgv9JcH5akkB6TOxy0zYvDMsZ1K
	m068hRxvLFSkml03/2F+turlyqBx1ggAZAc6kPaP/XqTykxwHfbb/6kMMz5q4q3yBc/UHjgQqOj
	po8iDYwtZiRMgeNeAn97/VgyCZoocG77SVZAZiH992P1/aYywkgkryU0uDynOEBs3lcsH9ajJzV
	86hNHFADw6NUrCScZIH7dhlNYs+h/QkQyKKWY8tQNgW9C0K3L7cCA1L8chViwG
X-Received: by 2002:a05:6122:4193:b0:567:d49:da64 with SMTP id 71dfb90a1353d-568cdcbe536mr700012e0c.6.1771510901939;
        Thu, 19 Feb 2026 06:21:41 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56767276f8bsm13240387e0c.14.2026.02.19.06.21.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:21:41 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-948e5592c9eso665464241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Feb 2026 06:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWG4ZJ8PCdAGz8nGlKgj4Rf1lR/r6j9cWJl0CCb3D0aJ0bF3JtJvuP5g3T3kz3MoBywdKHZpY81Ol7HVeGbaDz4XQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0f:b0:5f7:246c:7d59 with SMTP id
 ada2fe7eead31-5fe90c29394mr965190137.18.1771510901101; Thu, 19 Feb 2026
 06:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Feb 2026 15:21:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
X-Gm-Features: AaiRm520qeQadKACmPUSOomPwLBIUK1pbrc4MXCEiEjLJYebeqKw7k_Necoay4M
Message-ID: <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>, 
	Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,carsten-spiess.de,roeck-us.net,glider.be,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28317-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 0B64115F70F
X-Rspamd-Action: no action

Hi Andy,

CC devicetree

On Thu, 19 Feb 2026 at 15:06, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Instead of checking for the specific error codes (that can be considered
> a layering violation to some extent) check for the property existence first
> and then either parse it, or apply a default value.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -337,21 +337,28 @@ DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
>   */
>  static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
>  {
> +       const char *propname;
>         u32 val;
>         int err;
>
> -       err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
> -       if (err == -EINVAL)
> +       propname = "shunt-resistor-micro-ohms";
> +       if (device_property_present(dev, propname)) {
> +               err = device_property_read_u32(dev, propname, &val);
> +               if (err)
> +                       return err;
> +       } else {
>                 val = 10000;
> -       else if (err < 0)
> -               return err;
> +       }
>         data->shunt = val;

IIRC, we have removed superfluous presence checks all over the tree
during the past few years? E.g. of_property_read_*() is documented to
return -EINVAL if a property does not exist.
So this patch looks like a step back to me...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

