Return-Path: <linux-renesas-soc+bounces-12120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8DCA10810
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 14:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9AEB1636D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 13:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212122309B4;
	Tue, 14 Jan 2025 13:44:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DBC23244B;
	Tue, 14 Jan 2025 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736862298; cv=none; b=dc2Oyk8BlzMcqhBMnodUbhoNqtpixCaY8UH4+C0oNGxBH7equfWwhbNn4ld9E0Zm2DlveEaKCJZhv8HN9x8FWH8YbSEqFfurk12IywjI3ogEAE7+7+sQYurUbIvpK/U/+rMsUzvwlkDrCsJ+5YT7FhiOvE/1HKbRu6++H2lblBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736862298; c=relaxed/simple;
	bh=bFwsHYKFoUCpJGj5RfAzhXYvTamOV8wtuDAyfjiZShY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfYIZAkJyTeeMVIlcfhKIEN65y4UvPoZ9yx6xB5BTE5I/OBc+lDKiAFfdfZX8z50t3+UDz5jlkVZ5FTrOmS9IW3LltR079Vi3J7Ktl2+zHWC6C+aErnLu9DQE9d+hPvITOjDUid1uSt84KTb2VCdonEwvileAi5Aw2Z83TFhmts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so3384867137.2;
        Tue, 14 Jan 2025 05:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736862294; x=1737467094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0pS7oh7owziCb8mJaAPcCkYTgzflc49RF0XrmULU5g=;
        b=YO0GiZ8os/eEQ5L5mdIpAXSnB0OEslzY5HI8LMlTBstMaMu8NVjmAL9zGUHyS6x0Gs
         opWbbda34dxeSxZxs4lB+AMXP1C2z8ZPt86ZxUoyj4lXml5TyrsDDGkbXOJkEnAKzePs
         qCwuxKvnIDvzFQxvIK+s/Cnzgz4LZjcmXWoett3T1vT+dSzKrl/f5TE6ByVaHRRZVE3Q
         /mHfHLxAiz5YYAjGAvzct+ZLtU0W1KCVAs+y1MqzLQtcKu+H/T2sjjKPgZkTxr1YFFHW
         eKDZt80xabE6Jqvzz9SFSVH0R/kUyAhqCTk51jhUFfDRKJrO1eYOPFNVaMgeyRNqOuuY
         fKww==
X-Forwarded-Encrypted: i=1; AJvYcCV0wV2WX7cfT4wYrdt73K6MRRmSMIAwNXVX7yn6/Uj6Pf1TLYcMNJe1NQGZLNWQYXqXmSU8yop49Qks@vger.kernel.org, AJvYcCVzjePtE0O7oWKQEg3Ea1IPPXeb8Kprxka+I1/NAxuEQlNYPkInkKrmR92asVBTZ7X/i4SrCS8I3g7mjqDN@vger.kernel.org, AJvYcCX6KbboLDgCAuHrj/Hv+8DIwUub+iEP52iTcyhnPpdI1JZcW3PqhnmUw3KvhNl+C+5IO/pR5ahv0YaKJjRoAJxi8cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFafQ4eYKbtAyrr7Mv476pYFuDO8NBn8zxQV5qMyrzi2/hV4ma
	zBe1i2Lorht3AlY2mE4IsLy81CnNSufeQ2qohQdHwToMVHyB16hSmIF2e7Ce
X-Gm-Gg: ASbGncvaSr6YZDGpc74r/dI5ltvwL8Cj6dIlH8FiMN8atqH+/ZR4BX5f4rxNk+b9Ay/
	GlU6tto5wKVtD6U3xdpenDethagZqB9Wr/xFIqM5moXpBL5/CFHZkcps1Ti95+8VhmHhh75TVUF
	b4LkuR6RHbDNYIK/NKz2VJgbBIurCgVGyHcrQKE9RWjHbayMYDm5wnRp2NAf0Lw+pbZlPjyuS4/
	9je/HdQ0hYbpyTnuzQ/8GXv9JzPk/vJxlljlKRRxZBo5R90d2ZvIsVJdnJWS49KHjZnRRm1T8Za
	NVObP2nbEznBafTuGdA=
X-Google-Smtp-Source: AGHT+IHoyrFjL4LSCZy8LfMJetw5A/59MoBz/Y1otjsX2Q+5QNjW0FY5VR0LTvIyfb7grpn2AQoI1w==
X-Received: by 2002:a05:6102:3582:b0:4b6:20a5:8a13 with SMTP id ada2fe7eead31-4b620a58cbdmr11661480137.13.1736862293345;
        Tue, 14 Jan 2025 05:44:53 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86231362217sm5239456241.12.2025.01.14.05.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 05:44:53 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c5eb83a7fso2768659241.2;
        Tue, 14 Jan 2025 05:44:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAn+LPKIzyqfIoifAuQQZIeMm8pfMMe3E5O4bgfo+LSf9sp0dXOlB94Ug/BESSzrLPTSaGxSN9H4AaPy1hSKY76zQ=@vger.kernel.org, AJvYcCXsF0sGmTX1vSsc3UuCscCh88EGo3/gZOGr8qo150qrWe5AuHpZ/wewosB9Q6xG2tcu/tDNuwqX1SCOIofG@vger.kernel.org, AJvYcCXzpVwZDnu4H9vaHcLbansQe2V0hQPNdzejquAWoHt+o/kwIx+LTDg9+viKZ/KfFzmEdcUOcqoWtehA@vger.kernel.org
X-Received: by 2002:a05:6102:548f:b0:4b2:49ff:e470 with SMTP id
 ada2fe7eead31-4b3d0ec6b9bmr20687951137.21.1736862292937; Tue, 14 Jan 2025
 05:44:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111080903.3566296-1-iwamatsu@nigauri.org>
 <20250111080903.3566296-5-iwamatsu@nigauri.org> <467573be-f143-4cfc-a04e-86be092d1b58@kernel.org>
In-Reply-To: <467573be-f143-4cfc-a04e-86be092d1b58@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jan 2025 14:44:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsHrcWdc2LD=F1keJg0ZPgq19g3uZEgFGs499SQhCd2w@mail.gmail.com>
X-Gm-Features: AbW1kvZOMosU-xkCAZNt7DYcZvHltcMVcsFtl0xoGq3yTEeEIvdqEywZlp_0C7I
Message-ID: <CAMuHMdVsHrcWdc2LD=F1keJg0ZPgq19g3uZEgFGs499SQhCd2w@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: Add initial device tree for
 Yuridenki-Shokai Kakip board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sat, Jan 11, 2025 at 10:35=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 11/01/2025 09:09, Nobuhiro Iwamatsu wrote:
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     memory@48000000 {
> > +             device_type =3D "memory";
> > +             /* first 128MB is reserved for secure area. */
> > +             reg =3D <0x0 0x48000000 0x1 0xF8000000>;
> > +     };
> > +
> > +     reg_3p3v: regulator1 {
>
> Keep consistent naming. regulator-1 or the name as in bindings:
> 'regulator-[0-9]v[0-9]'

Please use the latter...

>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=3Dv6.11-r=
c1#n46
>
> > +             compatible =3D "regulator-fixed";
> > +
> > +             regulator-name =3D "fixed-3.3V";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-boot-on;
> > +             regulator-always-on;
> > +     };
> > +
> > +     vqmmc_sdhi0: regulator-vccq-sdhi0 {
>
> regulator-2? Why different styles of names?

... i.e. no numbered regulators, as these tend to cause hard-to-debug
conflicts.

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

