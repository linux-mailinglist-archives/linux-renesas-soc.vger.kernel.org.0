Return-Path: <linux-renesas-soc+bounces-26465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0FD05A9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 19:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF54030115D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 18:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17766310645;
	Thu,  8 Jan 2026 18:21:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE49F30FC10
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896497; cv=none; b=fZkx72JTwW087BVl2FqkNJW2VjEkI75DUb2Mw0TxKD8+RhXM2XrdUVOMVzbvUDa+rvC0KVbJdAJIp/enQVzW6+z6rJ72hJsnrskqEQjc4ZkQ47rcLfX6D/ELWRwsJHd3We6ukJcfdQll7Or/Q0IFBfY1Oo5qA+VaCTprtQWH1nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896497; c=relaxed/simple;
	bh=K6Z6o40ihTPpiR+Kr8j0TVVtfNVmsUN/rw5oBiuRevE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJv7ORkQl8EvzuJebgL2Y+Wttc/ipQvbCKKk4Toyns6hYwEmuaNtouytRgjt8Kjz3kpvuZukVLrUZ9NcNRT02/VtzcsKSt9zjLLhQqHiLus67XRK98ZhjbRN7Ao1Q7H7VKneoC4NavNt0MylDRKzkyc4/O1671RLPMjxyxYTASI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c2af7d09533so2152603a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 10:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767896495; x=1768501295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt3wBCEAoEDXtzh+lfzJmSPYLZ4A0fGF3pcV2qxjAOs=;
        b=QTlrLqUs0sjRJNyn5RLJOyJFFpvkF4j0xC++tTvCRWB+F3Jo7NybOm+dSu53zS/b22
         5/jViqwBHslTt0bDrZKb2tJJ/HkFkx3W8M6sfMmW7M01cwuzF6tbeJ3JXzG8Ti+I/UGy
         bLEqJapVYEk8D0ZLa+QmCBgkLTT15lSCKoeTLhUuSQ/BeQ7IkQlFDia/40806gcal8wJ
         U7g2rBjrfh3qPTC2jnPQvBTenv0aBaAxVPRZVYFQh+baE3I4vp4et3yQ2sC/eDdIBZ6I
         Tp2qaiYk5xtpvoQDR/83SK3rksJtorRAwIL/q/EYMb3/8unSpYaDU7urJHgWzQnE+OcR
         OTBA==
X-Forwarded-Encrypted: i=1; AJvYcCVWPlr/wPMKwG91vursoG8P/IUR4zaLDoYK/BoSHvzLtAUIZZANJEUNuTzR493U0bRN1qj9qIN0jAQCdkQz1YU+2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqYyb47rn4R+LF/J3G23BenNPpyHAE1FSXT9Du7ughUUh6SRof
	GAKe1I7CT8dG1Igz3aSz4LFTvY+MJWNvROTcGO2OLJdvow5o4SP6OiF8tkGboAlr
X-Gm-Gg: AY/fxX4mRxihAS1RWsi2eH/tCtIM5tR0KeMHUVHmYzk2fDwnezCVTb/jiKIQs0/63b6
	I/2hFYfWM/tSid0JjGnqedbw0OtLmVmg/fyz7ptO7yx+XiOBRrRcOyOKYgHm0CE9m6yzMIu1rDa
	PBOynkIhxwhaTGfu8n1TkqR44B20s9tqHzs4pBB4+6wkOV9zfR+0oUvDFQ8HZyFYspOF6/qr8I/
	GjaSlyfmBI+dl9jatEn63b1XQzMG9wvVkSGKsj/p8F2ujgoh8LnPTE+djUivpYFsWzzfSXlcUw/
	wEh2sAMxThgJ7oSPUH0JNUeYzakDdVPSZB3+0fpgKhaXSrd0HagB0lgX9AAEU+PdMvkQZRTmqcy
	0gDr2S/OvnxJ/9IVrPyu3IXJDzVX30fHrYV2vJ5AwIXulqMKtggGy438QSi9pQkM0JZCiDz2GEJ
	gmFawjOB4J89tYfvUee5BANFvIZj7pPt29bIfHfYfRnghusBco6xbj
X-Google-Smtp-Source: AGHT+IE+aKKiRANxmhyNFtSAGhKu/yaWQQhmmZ0AKPdI6Rjxego1vcOaRkj/fwsAR7V4WgbsPSuCCQ==
X-Received: by 2002:a17:90b:1f8e:b0:341:8ac7:24d3 with SMTP id 98e67ed59e1d1-34f68c7ff8emr6296580a91.34.1767896494674;
        Thu, 08 Jan 2026 10:21:34 -0800 (PST)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com. [209.85.210.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f88e968sm8608084a91.9.2026.01.08.10.21.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:21:34 -0800 (PST)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso3693689b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 10:21:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPQ7jDsCa0ksyAuSAwJrfT4C1z7sTPHZUFRABtYZQcUonGzgkR3c1plSGKNViX3pEWIXdMITj4tbq5muQTx5RgEQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3908:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5eea6f90e16mr713176137.8.1767896182056; Thu, 08 Jan 2026
 10:16:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108165324.11376-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260108165324.11376-6-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX0G92JmwneZp1h+AOF-Cit2scVGGWXCBZGwBVmJjUAVg@mail.gmail.com> <TYRPR01MB15619ECA5180E6F630798DDEE8585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB15619ECA5180E6F630798DDEE8585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 19:16:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUs33Y25xV2ML2hMfi=9oZF_qunf+iBytWoCVK6wB9eXw@mail.gmail.com>
X-Gm-Features: AZwV_QhXsBpAEocXJbizxDMe17TBY897URMAJavkibcXrlE9she2ISf152UrKmI
Message-ID: <CAMuHMdUs33Y25xV2ML2hMfi=9oZF_qunf+iBytWoCVK6wB9eXw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] thermal: renesas: rzg3e: add support for RZ/T2H
 and RZ/N2H
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 8 Jan 2026 at 19:08, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 8 Jan 2026 at 17:55, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs expose the
> > > temperature calibration via SMC SIP and do not have a reset for the
> > > TSU peripheral, and use different minimum and maximum temperature values
> > > compared to the already supported RZ/G3E.
> > >
> > > Although the calibration data is stored in an OTP memory, the OTP itself
> > > is not memory-mapped, access to it is done through an OTP controller.
> > >
> > > The OTP controller is only accessible from the secure world,
> > > but the temperature calibration data stored in the OTP is exposed via
> > > SMC.
> > >
> > > Add support for retrieving the calibration data using arm_smcc_smc().
> > >
> > > Add a compatible for RZ/T2H, RZ/N2H can use it as a fallback.
> > >
> > > Reviewed-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > --- a/drivers/thermal/renesas/rzg3e_thermal.c
> > > +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> >
> > > @@ -362,6 +366,21 @@ static int rzg3e_thermal_get_syscon_trim(struct rzg3e_thermal_priv *priv)
> > >         return 0;
> > >  }
> > >
> > > +static int rzg3e_thermal_get_smc_trim(struct rzg3e_thermal_priv *priv)
> > > +{
> > > +       struct arm_smccc_res local_res;
> >
> > Missing #include <linux/arm-smccc.h> (on e.g. arm and riscv).
>
> Ack.
>
> > > +
> > > +       arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPLO,
> > > +                     0, 0, 0, 0, 0, 0, &local_res);
> >
> > Can this crash? E.g. if this SMC call is not supported by the firmware?
> >
>
> Default TF-A firmware for RZ/N2H was missing this exact SMC call as it
> was on an older version. All it did was return SMC_UNK, which is -1.
> I checked the code and SMC_UNK is returned in all failure cases.
> So, no crash. And -1 is caught by the 0xFFF check.

OK.

> Oh, maybe I should change the 0xFFF check (the one I just moved into
> rzg3e_thermal_probe()) to use the TSU_CODE_MAX macro too? I just
> noticed it.

Yeah, sounds good.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

