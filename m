Return-Path: <linux-renesas-soc+bounces-10626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A79D36DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A58B41F2667D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3661C1A725E;
	Wed, 20 Nov 2024 09:17:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E35419CD16;
	Wed, 20 Nov 2024 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094227; cv=none; b=QKIrvxMsH1TCjRTtSnUirMuglTbyTnppyuGaYf2tzbFfxrBMzHW88epQiYerSNuqeuzC+a1jaB7M9RsOMlPNADDvsL5qpzzulgdCwa+DqSDWXjR4oNmxdAYDMsDpsD9KeUlEO9kJYtgTdPTATOWcY4TldbZu0BH3fjsrNWHHNyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094227; c=relaxed/simple;
	bh=RUakz6Kg3+UaDDkF++HLrGwFFKS2Q47pTaXnWGvKDu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mZtsxLI2Udhwo+UrWGOKGuHpw0u9NSVLrgdBZqMDBJhAzNfcj7itKannxSApi/KEgfxpQMUdegXKS1Eb+97RcH1TEfK2JyH/nfpovQzKxZrRgR8fC01IZdHVm2WwtaFAFum7/gVh5XBvuGcK/m5s/YWpVzLu1ZXJzaRWHhYAXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee9d50efaaso28877647b3.1;
        Wed, 20 Nov 2024 01:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732094223; x=1732699023;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyNvoDpuD4afUjwqDy4vHQONc3NwBMuzbrHi3+f+zCY=;
        b=QRicTJ4V+ATbNk9By/5SKsx1Qp8/3yeiYNipVcPuKYf9F/qiIk2NiCxRzeQRnWa8ln
         48iQOE+62TEVozUWT2BVgPOm9Jk5kohWmhF4UCB9bDMvjqLjtPnBCYD0jw5KmYo6EUqU
         ZLWslDEu4p5DAaESDm2TQ4r/qAQyw8vR4gcu8Fw5vJC/DXlHpd9/6VOWQ72tRTubt9MJ
         ReUwYFI5T+LhRoJvTPStWD81Zvnztd2lnpwoGoccqGqhl7eb2dw2JrXS7IemB+CdpRJ0
         lxAAQulW7VedHu//yCHGRoKZUaEhATLon00kjVtZ+nhZklSGJ1Ue21VKkP6FRIeFcMO2
         PnXg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ38t7aZj/Ym82allJ/WFEP91JXXCxJN6moAtZ7a0lQcGsfg/kiZg+rdvAXNhY5jvpX/nyFwYo6Idl@vger.kernel.org, AJvYcCXstKHsvBPIJoGDJKR30ZcRcjkZ0A/oMPqOW6qSbVWofSeI0BF8xsG1dgMOB/G5dYHQDKkNfq9W+EnSvntse5kbyaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIoKH3h0rvI46JdLRB620X2YpbV5iD8KLvlfg2FgjKGpGT/9qn
	OQ20f5Mfjvg95kFEYpMDPOAQrrKQJGdimyjbiu1S/HvNcmGn8H0ENG3Yn/fs
X-Google-Smtp-Source: AGHT+IHLtSehDKgRCjPd/Blfv/GuZYObF4vuOfgYxVWKfhUsAf5xbB+IKcgnsufQ67/f5QeqDcDunA==
X-Received: by 2002:a05:690c:998d:b0:6ee:65ae:2184 with SMTP id 00721157ae682-6eebd2ba30dmr19746827b3.37.1732094223086;
        Wed, 20 Nov 2024 01:17:03 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee7129c735sm21853657b3.35.2024.11.20.01.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 01:17:02 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ee7b886b5fso38093187b3.3;
        Wed, 20 Nov 2024 01:17:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1uEeU5+KudLrGldYk5aQ4y6NYCYRHzgOmIQ6i8OSUQdelHQ5vLC3S4D7cYVI5ktgVPlJtyqUJdc3c@vger.kernel.org, AJvYcCWrDfWFeFoShFcAvop5hodaV8G51oHKftagYZTZeVtcP/regqwN96LeLKoUp3kgalgCI030qSvpAYb502P8I34S/Lg=@vger.kernel.org
X-Received: by 2002:a05:690c:6902:b0:6ee:bcdd:b1fb with SMTP id
 00721157ae682-6eebd132ffdmr16948347b3.19.1732094221574; Wed, 20 Nov 2024
 01:17:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346DB1A6D857AFD968DA9FB86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Zz2oIcGGmRouvZNK@shikoro>
In-Reply-To: <Zz2oIcGGmRouvZNK@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Nov 2024 10:16:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAsWyw3X51A_V1yc0w4PojEJMJasTWiMRaz7i05CdawQ@mail.gmail.com>
Message-ID: <CAMuHMdXAsWyw3X51A_V1yc0w4PojEJMJasTWiMRaz7i05CdawQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Nov 20, 2024 at 10:13=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > How do we test this interface in linux? So far we use windows app to mo=
nitor the current.
>
> It exposes values in sysfs. Check 'Documentation/hwmon/isl28022.rst'

It's a pity this driver is a hwmon driver instead of an iio driver.
Else you could use iio-monitor, even over the network.
I used that before with the max9611 on Salvator-XS.

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

