Return-Path: <linux-renesas-soc+bounces-8365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4559609B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 14:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096822811F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 12:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470111A072B;
	Tue, 27 Aug 2024 12:10:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5919EEBF;
	Tue, 27 Aug 2024 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724760621; cv=none; b=cnWaghk9owj8EWsaWUUbWDpNZzM4ddXefQ3QStYdYQbLJxxRGRrhc4TErUUlb5bA8LLFwcBeqKUq47zZtqSHfdFR9tEIVLAYuDAEMgRxy86dsMDyf4AD7yAQmGNtN2e/KOEzcs0dQ3h7EwUhzPT5x50zIZvhNfPS/HH9mx9JS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724760621; c=relaxed/simple;
	bh=F33G64sSxOt+QVRxT0KFzMzo62bODyeLCi2VwOq8QO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LU+uF12GC41PjdLloqrC8qmhK5wV8YcQgPVvXA+Gl80tp/j5gL3JrMHRONViA5ZroNsiDM96YckT2g8vwyYYDV+yaNToEWSTYUBAZ02ynNHv+be034qxTiHetAz0BxlLXo1a2KPvgG9TH01G1NuGnCARmElGJ9etqfp37x312rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2705d31a35cso4768311fac.0;
        Tue, 27 Aug 2024 05:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724760618; x=1725365418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1y6MVpUHGHncGeq7J2eB1au+7eWBsmfRUGHQOxkYTA=;
        b=c1GB/tem0Y5jdx09sUm58WR7bbV7vommzd+4bf4m5gXGrGXO8b2xBp9f9zDrriQP4T
         rA06V0MMw6OcdaBNDEoyanrC1qb0P7otx75XJzV3FH7P5mE+hR0uwszwav7wFQs4RgXO
         9o39AlhFH33Oq9ThrWcVcIJz9DKx4JMbyANJNyTqEMYsZLwpuLG1qtl/UPuwyGy1IIH9
         EjAPTa5K010QDcUb7t0CQM4nqf3/4xJZXsDyxFMm13sGVemLZeyOlD1nDZiIDBUpOpCl
         RJn1GGNELPbHKHxDmvouHiLfNtO3S3zk/1NktHjPVZzKq242y2MC8QTw4uoObkOnmGp3
         D4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyuLxy31YYEA/VTkkBbES+VovJjKZtRYI3MMTYFPLNirQaKGnQK/X1o0feKM2nkGKNMwYSII3ZX/wnuBw=@vger.kernel.org, AJvYcCW66k8RlmFppqSs6t80zMwiXrcYT4sqNgNhIR4YFpu1YMM9UtvKKR0nBjco3L6WmCksSPFB+pEw@vger.kernel.org, AJvYcCWMXrk2G3llLCapnyOLaWew72WDQiHaMHE5UxZC0FkNY37b02awKVQ8RH2z0FX/538kqucqiEvdluR1fNumjWoyUss=@vger.kernel.org
X-Gm-Message-State: AOJu0YymrB2lKtYoZ3MbyOtEuahRyTZC2j2UYnuoIscg4xszoiltYZD4
	U8GU3e5K8TlQL7XWdBZp1eUwztGxwq2FhlSMukVZYpTHpEox4U3a6+PLWfkm
X-Google-Smtp-Source: AGHT+IHXOjW1T7FUoLXgthnxuIveKpp8XF28luyoV++xiBr/G2MFTnsaCYHQH357nBQzpDRLVDZ6cw==
X-Received: by 2002:a05:6870:8323:b0:270:205a:4070 with SMTP id 586e51a60fabf-27759e15d10mr3031917fac.14.1724760618265;
        Tue, 27 Aug 2024 05:10:18 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-273cea229bdsm3042850fac.26.2024.08.27.05.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 05:10:18 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3db145c8010so337542b6e.3;
        Tue, 27 Aug 2024 05:10:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+3JRP9xjCzi/0Ruw0HA7G2IMgFzjw962CruG1qULYHSBShZ6g39cnNrvCZkfi0gJEjN2xKmj3@vger.kernel.org, AJvYcCX5pBUAkpS/+qfBy6PTqiYoQOZlunF2oFhA79UeIaWnG1SgvTw/cPasy3Bm7pwgG9PIz3n/5kPJhUwg2I9Zcbp2/7s=@vger.kernel.org, AJvYcCXTGfUKxzjrHmgO8lu/ZPPcyRXUdSUB8s2tP9V5h5RoQ77hgud4GiEVwhQZjbdvAb7RhbRbnxPREatzSkQ=@vger.kernel.org
X-Received: by 2002:a05:690c:ed2:b0:64b:52e8:4ae3 with SMTP id
 00721157ae682-6cfb950a4e6mr28198917b3.3.1724760235154; Tue, 27 Aug 2024
 05:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com> <20240827095712.2672820-6-frank.li@vivo.com>
In-Reply-To: <20240827095712.2672820-6-frank.li@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 14:03:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2NxBqBxkSXo8pnsDk2BMgrunwNhtb75g-17KOZ7RSEQ@mail.gmail.com>
Message-ID: <CAMuHMdX2NxBqBxkSXo8pnsDk2BMgrunwNhtb75g-17KOZ7RSEQ@mail.gmail.com>
Subject: Re: [net-next v3 5/9] net: dsa: rzn1_a5psw: Convert to devm_clk_get_enabled()
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, 
	marcin.s.wojtas@gmail.com, linux@armlinux.org.uk, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	hkallweit1@gmail.com, u.kleine-koenig@pengutronix.de, 
	jacob.e.keller@intel.com, justinstitt@google.com, sd@queasysnail.net, 
	horms@kernel.org, linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 11:44=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wro=
te:
> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

