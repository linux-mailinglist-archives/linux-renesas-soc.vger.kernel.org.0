Return-Path: <linux-renesas-soc+bounces-8411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13106962065
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 09:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AA6E1C20BAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 07:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA64156F39;
	Wed, 28 Aug 2024 07:13:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737D2CA6;
	Wed, 28 Aug 2024 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829188; cv=none; b=DCOhIH5xVLB/ldNkTdIpWL5BIll9V3h+JMxBwCKQixiWjuP3e3oYCsvb1AtWuR5I4UeT+ooynSL2viSGXUJUmPR54ZnBMf8bLVoo0QdoX666o93BVE4EmYcky8T416g77K4OWwMG1G7FCRzeIRY75kOSo8NvVzpVgiKnlIv2Fe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829188; c=relaxed/simple;
	bh=UZYnlznxHgHahL9IgW5qk4LVk7i/ozJ7tT74Y/giKNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0YZLngeWovC44lXpb1pIJSnoTYdCrQVJKbi2kd9a0jSCkUpQqDdLRzhjijUpeHF+ilFjVCQUmq02bVbXKSUyGm5WI1VLScHRcUHpguDB3ynRBro0D65zHdsWjGUOESJw+B7/+Xxh8gWHpI7hvQA4bO5Ilooi99g1s3ts7cUxgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6b99988b6ceso62918747b3.0;
        Wed, 28 Aug 2024 00:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829184; x=1725433984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRttU90cGhHvxq7l+2uEOOgIlDZs3J8W+eir8dqoS4M=;
        b=Qlx3Fj/V8cqro+ewMLurSetAOvj63OOnd84039UsfjziP/OAdMXNzOCUh2xXZSvuiT
         9o7TlLmrSQmsAKOsY5p0WWcYK+qEkkJrQan3BmTWc3Cv2U2mOXcqJmfi5nDfx9LJNmET
         ANxQY+wCi5KAq59NCxi/lNim8p7yh1IdU1w/rDhWGJGLcRMMS5lVJhZM9A/ahkcmhz0j
         kv6TfF8JyPmR46PaxXknzvpQYR10PYFQmoWrC8x6jiQQPWPvuNSlyFCtw5rQvrBzf/mT
         v42socvkrPgxOXGphF67rk8ROa3kSpnkKq+Tm1D5B9/HF5dPdQW2h9E/It/Ps8bLXsVF
         j7nA==
X-Forwarded-Encrypted: i=1; AJvYcCUDJFfuAlkAqJVXOGLsDyHKpFexSZWa+uUMY4ARLC3AUwNLWEWE65d0IEXjrstSAs4huvdLsxCD@vger.kernel.org, AJvYcCVYdBD5yf//tg4D+aBDC7b3QsfsSMjQQswWzAZ0KPw/iouIcqTHohWvflrwLD8XzCxctITkfKoectfCMbs=@vger.kernel.org, AJvYcCX9zHUdx6MdjeS40L82gqfPNzesCCThoy0jEDcBxKG8m840KvcmWZynVa3xkoFqaSPXs3+oVeeIMWNHqyBlOc5jkxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rlg3sVbcfCkkF4ztYZz4ooGjTmjxPx/OpuBSV2Otw3XnuGGu
	BXUVuZL9kG4mZSvcy4LfPptfmvRfr3MrFrCL8EjbPm36fHS75vJDet6rs2aA
X-Google-Smtp-Source: AGHT+IF7INMxQFSKNupD65V2J84remS1RXbzWpoys8br3CUPNOfL5R9+j/yYCyph3CoFbvEBRwI6Lg==
X-Received: by 2002:a05:690c:290d:b0:6be:8c:691b with SMTP id 00721157ae682-6c62557db60mr133642167b3.17.1724829183785;
        Wed, 28 Aug 2024 00:13:03 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39d3a9f9bsm22365517b3.78.2024.08.28.00.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:13:02 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b99988b6ceso62918477b3.0;
        Wed, 28 Aug 2024 00:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4x7NcJf9caucByhM7d8b/nxQofzLyLpOur+AhEXa2OmvnOd189TeQwfWBNX2kvahueYfYdbBq@vger.kernel.org, AJvYcCVL0KerHIi9epFO4dCBbp+J7F3I5C6OPnv27vU1U75Fp0wtXLSYEhJr5IhK8dkclwZ/PSgzSf0C2I7CdUBLrDnyfcI=@vger.kernel.org, AJvYcCViV+RsFC9lhw+ooUgp/fglg67Lg6vWbMvadvGgCiN2Xm+6g4osENV6SbHwb5WGtU48pqQipIanHUc51DU=@vger.kernel.org
X-Received: by 2002:a05:690c:2f0a:b0:6b0:cad5:2239 with SMTP id
 00721157ae682-6c628a9f1c5mr129690527b3.31.1724829182652; Wed, 28 Aug 2024
 00:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com> <20240827095712.2672820-9-frank.li@vivo.com>
 <20240827120953.00005450@Huawei.com> <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
In-Reply-To: <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:12:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
Message-ID: <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
Subject: Re: [net-next v3 8/9] net: mvpp2: Convert to devm_clk_get_enabled()
 and devm_clk_get_optional_enabled()
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Yangtao Li <frank.li@vivo.com>, 
	clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, 
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, 
	u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, 
	justinstitt@google.com, sd@queasysnail.net, horms@kernel.org, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marcin,

On Wed, Aug 28, 2024 at 8:26=E2=80=AFAM Marcin Wojtas <marcin.s.wojtas@gmai=
l.com> wrote:
> wt., 27 sie 2024 o 13:09 Jonathan Cameron
> <Jonathan.Cameron@huawei.com> napisa=C5=82(a):
> > On Tue, 27 Aug 2024 03:57:11 -0600
> > Yangtao Li <frank.li@vivo.com> wrote:
> > > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> > > to simplify code.
> > >
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>
> >
> > >
> > > @@ -7745,12 +7710,6 @@ static void mvpp2_remove(struct platform_devic=
e *pdev)
> > >
> > >       if (!dev_of_node(&pdev->dev))
> > >               return;
> >
> > Given this makes no difference any more, drop the above dev_of_node() c=
heck.
>
> This check is to not execute the clk-related code when booting with
> ACPI. It should remain as-is, unless the new devm_clk_get* api is
> capable of not exploding in non-DT case. Can you confirm?

As per the removals below, there is no code left in this function after
the check (i.e. the "else" part became empty).

> > > -
> > > -     clk_disable_unprepare(priv->axi_clk);
> > > -     clk_disable_unprepare(priv->mg_core_clk);
> > > -     clk_disable_unprepare(priv->mg_clk);
> > > -     clk_disable_unprepare(priv->pp_clk);
> > > -     clk_disable_unprepare(priv->gop_clk);
> > >  }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

