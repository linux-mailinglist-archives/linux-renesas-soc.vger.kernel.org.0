Return-Path: <linux-renesas-soc+bounces-21183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F66B4007F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0150E5E5EB5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 12:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E792F8BCB;
	Tue,  2 Sep 2025 12:19:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D342FABF0;
	Tue,  2 Sep 2025 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815572; cv=none; b=gtLLZGVa9BLQbSrQD0rWjaf1TAJ16fTVtneRnr3C0fclaw/e7Hdp1Et9OIrJ2a0t0RqXSQTCE/dLSHSsn2iGoS+A5JAphHTUs5ESmzgJPMaHL9tMpcm89kA0nbKo9MF45V/qDuc5KiomUcxvUdCCy2X0yT5xqrZRHEuY9l4yLzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815572; c=relaxed/simple;
	bh=5QW1vVB7wIcQZDDIi2h39/hzIcZpzRDcJJZKI3fypSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+2qJ0KCiEgZXXKRXrRdd+z5P7XjHAtHBzdCGoDPDmYR53rQkvh8exqWsOw5JxUjFufhtVd3euTW0a0EOxTM9ZDm1HhUv0/y/NKLQvfdO1t5tn4/M2IX2W48IYSzTRn+3sEirwdb9D1tfGrwfN2oisDY74dcMXlKWAMckN4ZQhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52dec008261so754716137.0;
        Tue, 02 Sep 2025 05:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815568; x=1757420368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3tc57+yFZ+p+Z1Lew5VurHJFrkSlagYN8YS2+jEgGE=;
        b=N/neI/zCD9IEQV0iTApLzJz2X2Le3kOsujXezd6n6n6xgU+ewDCIpCYuBuTW8cOO3W
         mn68mHx4Nh+bglfJQvpRSz+86AV/1yTTjbx4W+l+VEIVDTidu4lpNdMPnFiX5OlQsxLE
         BUplbEif2DhD+4qSwgmJEt/BzJWxt/QHkf0pxsFapTZV+3gHJgmCaWPKzxl3FBpxtfQ4
         OcWtKaqa4IpFguGDOhIIGE8GAHEFPmwAxwQ1oPd9ZVu7h0l+YN71L/zY4uOeV1OPfMJG
         jd3jV286KPu5pbtjKxtwj/Wrd7Q6On++lqJCONw61LMpCwMOXICy9C88c5oq4xgOFvtK
         95qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI8Gxxwf8O2mNoDfc035ScqFSRPtwNOX0ZmmLk+7ZyKhpAFo1okX6vbGS2sAvqqIeWpv9YiMBKDvY=@vger.kernel.org, AJvYcCVbLTckwtzRL8ehLFQzt0H0VR+coO7CdjUEADdAJFPV730a7EREOIFmpDACTbZ953Zrb0RejhnTcmqNuM+y@vger.kernel.org, AJvYcCXtvp7vNKRbG6QY6cuFJvtR58BC/Cvcvh/XuwvNw+tq9NSAlcBp4kO9Y3Zg51OBp3iLNJ16TDpd6JvSooP3iSCXQEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ULpJ8lmXcz9SD7QLS++t8LQeZwi5XpiQF65UrAplbc3Bmlm8
	GVh1+F1fYBwSaEScCZIGrTVT+LmQPXn2TOQaHDqzGnSrbRRAvSV2m6wjIVZxqnZ5
X-Gm-Gg: ASbGncs2zknVWly4kt0b3sCFsy6vZC0pQWPm5VMgQwxdlt59nlIY5n28tvzgUfhLS0n
	zIX8Erm/N5aEwaI1CEcsoHOgj6/wu+F+Kta9XCriqCVRuOxnzopJ4MMzAqbONzFFzqoco0zSabO
	x45lKBx6A9eWK3Ov7d6jeBx3Nh6KcO95BtF1ZSexdledrLpfe+9B+i3M6VYzpF+6BuuMTZKv8lQ
	QwqKZzIJpEc0G91fnSJpwVfYKwTNVrbNtljDQ290wN51acGLVbFek6NgIrdar6pnRdJY7KxkFaN
	HDRb3/ic82iUqfcNgd3fLujYlaoIvVALj/yzZrRc4rsfLSAj47/ggz0Pt0+mw8v0RhlYz8Ns+M2
	/b/49z4v9CtM9K9q2kkh4ZrYzEDU57Ql0nxNpGTLN1TE6fHliM5Z7cOOPDz01P1Kc
X-Google-Smtp-Source: AGHT+IGiGzzjNyKvRiu0dRDmd2pMKiJsxAE01B9Q2X5U3apIaqe2Vv2LMEDFlPddqZ3hY5ajB6c8CQ==
X-Received: by 2002:a05:6102:5a92:b0:522:3cef:80bb with SMTP id ada2fe7eead31-52b1b3f1060mr2471134137.19.1756815568090;
        Tue, 02 Sep 2025 05:19:28 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89601b67070sm2807933241.20.2025.09.02.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:19:27 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54494c3f7e3so1323660e0c.3;
        Tue, 02 Sep 2025 05:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNGecrBiw586FRQRJzYVOZFLISb+r/gmpJQDJCprfkfXJYVZ5V5CpQK/jeV8hMJMoOCeGyLWA6HVI=@vger.kernel.org, AJvYcCUkk1k0AFwm+K168r1wrKtjFHWSrMYsGGKY2356ZIXM55k08BH23jf/b4wEHyPhaSjIFVLCAgMWAh8xGcQc@vger.kernel.org, AJvYcCX3gX4In1LehofvVRwlhdhe57oRFzJPOPB46ztQ5n/rgyJt3AybO7aCR6OnmmJEKKjvOSWV/XIkmHPI0wD7OH6wViI=@vger.kernel.org
X-Received: by 2002:a05:6122:6d0e:b0:544:c84f:ad4d with SMTP id
 71dfb90a1353d-544c84fb13fmr627712e0c.16.1756815567527; Tue, 02 Sep 2025
 05:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com> <20250820100428.233913-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250820100428.233913-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 14:19:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC2w_EjBt1D8dqDkASo6xB6TUiu2FpX9tbx=zz+tN=Ow@mail.gmail.com>
X-Gm-Features: Ac12FXyrM7wcI-Dz8Ib92qbZ92YNl4tw6LtCS4YiWEVUIJCVkxhJD1TRcqa787c
Message-ID: <CAMuHMdUC2w_EjBt1D8dqDkASo6xB6TUiu2FpX9tbx=zz+tN=Ow@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: rzv2h: Re-assert reset on deassert timeout
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Prevent issues during reset deassertion by re-asserting the reset if a
> timeout occurs when trying to deassert. This ensures the reset line is in a
> known state and improves reliability for hardware that may not immediately
> clear the reset monitor bit.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -865,9 +866,16 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
>         reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
>         mask = BIT(monbit);
>
> -       return readl_poll_timeout_atomic(priv->base + reg, value,
> -                                        assert ? (value & mask) : !(value & mask),
> -                                        10, 200);
> +       ret = readl_poll_timeout_atomic(priv->base + reg, value,
> +                                       assert ? (value & mask) : !(value & mask),
> +                                       10, 200);
> +       if (ret && !assert) {
> +               dev_warn(rcdev->dev, "deassert timeout, re-asserting reset id %ld\n", id);
> +               value = mask << 16;
> +               writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
> +       }

Same questions as for the previous patch:
Is this an issue you've seen during actual use?
Would it make sense to print warnings on assertion timeouts, too?

> +
> +       return ret;
>  }
>
>  static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

