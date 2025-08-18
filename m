Return-Path: <linux-renesas-soc+bounces-20602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4FB29A20
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 08:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7975417B9D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 06:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480F8275AF7;
	Mon, 18 Aug 2025 06:48:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9AC274B47;
	Mon, 18 Aug 2025 06:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755499731; cv=none; b=RaaBRC9TLsDTI5rgZ/2oHOCJjMDIZx8Z3sEndNuLv/x846A5xRMZo0ZecauNspAaq8Vg2vi/3qU4SGNC2vkxfXSaZv/GDddwNiPT/Gv1xtaJEv4rMF9lag9FdMwsQqX+I3KlAn3tgt5bdEh134SVx7GnDGjrQ783PMibgJUMetM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755499731; c=relaxed/simple;
	bh=xP7Yc1LWOKLrINsqigqDTW/z8sbU181HlND1UjOuKHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRC1plkQUBhkr1wuNpOMtj2P+aRah1KNlAWgyWsoeTBwLluSf8PCoeES64+2bcJ9sxmY+wlRsw1pVf+JkixsjvJzHVYwTcvdbkMa5jO1ldIBSQDiF5aQy7V0t/iZLJimbCozziYWBfGTnlQSDfRAgqk31GzLialwqHgnHoNPhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-53b173841deso2994554e0c.1;
        Sun, 17 Aug 2025 23:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499728; x=1756104528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g090mOLY0GjseIayblfr6BbC1w37mRK2LGnf4ra15ms=;
        b=pOk1psvY/V7LGu6M72KTxKQcKG5y3lw1d1IFGtHHCnWNs8oLFaHUpJojiTLHdokFDc
         r3+JnFlD1AnrDGtwNjkb9ZWtxd/LpvvQwh/OK44G0u1p3adHp1wlkWonuor4md1KLFWl
         POBefW5FRJZp/+NcHVlXgGGKx/+e3Wz6lpCCUZ6+IfGQFMFl22Q/Mq+Y7julEF1k7usN
         eMzyuDkUTSOMpD0f8POo18WIpdJ1UjWDMKz/becbgytRfBsBB6+aaX9PAD+lx1ejKtL0
         JPHam/xTPSucC0leJO+7R7Shq5kWnXnhSFzqOebJhP1X8PopvUa//+bRZsO4Bj+2NQ8U
         NGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUotHGYiH9mPI99Sn3UR89Y2xxWV+ITN97rUqKvsIh5H3KSOYz0wbL9P6AFaOzTR6KifDm6fyLiBhYO@vger.kernel.org, AJvYcCX3/aY45QUlMxNZfUcRmm7b8qVVbWP5AntIuAFpNhpCHeU6SbuCRK26GdB6kZb9zoVOzkXUCB/bIKnYu1NCdNKHdS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7g1stYlyI6X4q/8Y9llyZuYKFf5vCq+YOAFb52F4hYzWThq+E
	5JQclywNoNUyu9hjCxAkHaaDGYlpuz8VG8CPsvrl+9vpn90frUqne/DKy1ZQqpjI
X-Gm-Gg: ASbGnctbD06jFB2xOloILJjWIVh/bwnG8qbVYYRieU9C3zVQwI/P++DPB8P2xcoZVEJ
	SbP1RUQ0wkYaWhrmntdTH5+dTa2tZL2yuQs3xAiaVyo20QghmEnSFSXRAZV8P7lk1b4WJrsZgUe
	6Kjz8Cxc9BfOPtyM4WvA9BW2rtHtTZYdzhDwtoFt55kT+SaXBhvStWCeui46g5gA+RRGz9NCL34
	nb/mGMqHhwW2ayrN4JOPkti5sBDW0YP+L0oInqTCCMkK05SnFDrGhBX1BCpPApQPa7jPLkJHS7m
	JGO6O5Z74LkaMnU8AXHyQsuGP1sz6DGvlWz8pswam5eii9sA+7NaG5/IeNDZDFHeHxgaW4/fOus
	7j5XurCRxYWmZTAl2+7GXzKBoVGk4Mry3gjh+9vG2/nbqvd61PF84ANCYgRUKqkQlLQqoPGg=
X-Google-Smtp-Source: AGHT+IGHU5WDi/o6o/XoONO6mLQ+0jcKjOJ+O1pBP2ZCZmqjk5WTF9eIZL450iylGnPgx/VPo3ugEg==
X-Received: by 2002:a05:6122:90f:b0:537:3e5b:9f66 with SMTP id 71dfb90a1353d-53b353ad83fmr2770227e0c.12.1755499728413;
        Sun, 17 Aug 2025 23:48:48 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd99bfcsm1687376e0c.9.2025.08.17.23.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:48:48 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89018fd51a1so2439073241.1;
        Sun, 17 Aug 2025 23:48:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSlm1BeCup+rWGrwouJCJMP9ho24nO2YGdAMjnke8nS8UeWSWHbYKmQCNvgDkxziHtd+8rcj8lcTZW@vger.kernel.org, AJvYcCVyOe8LmDNGMQVsrjKjzTB1AZwsakZikQh6cRTbEMZRDYC/EVKgI1jfd1enTj+cg9pU6bEa9qiusRjaKMvkyiNilSc=@vger.kernel.org
X-Received: by 2002:a05:6102:50a1:b0:4c3:64bd:93ba with SMTP id
 ada2fe7eead31-514c8e87202mr2768722137.11.1755499727845; Sun, 17 Aug 2025
 23:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 08:48:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
X-Gm-Features: Ac12FXxyeNIsyfCz0-lWV2jv0Yu1az_ElYdYVkMq34gKzKZ02Okpj8UUWdWAGZk
Message-ID: <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Update thermal trip
 points on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Aug 2025 at 01:35, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
> to generate more heat. To prevent potential damage to the board, adjust
> the temperature trip points.
>
> Add four "passive" trip points which increasingly throttle the CPU to
> prevent overheating. The first trip point at 68=C2=B0C disables the 1.8 G=
Hz
> and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
> trip point at 72=C2=B0C disables the 1.5 GHz mode and limits the CPU to 1=
.0
> GHz frequency. The third trip point at 76=C2=B0C uses thermal-idle to sta=
rt
> inserting idle cycles into the CPU instruction stream to cool the CPU
> cores down. The fourth and last trip point at 80=C2=B0C disables the 1.0 =
GHz
> mode and limits the CPU to 500 MHz frequency.
>
> In case the SoC heats up further, in case either of the thermal sensors
> readings passes the 100=C2=B0C, a thermal shutdown is triggered to preven=
t
> any damage to the hardware.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add RB from Niklas
> V3: - Sort DT nodes
>     - Update comment on idle states, note the 0..80%
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v6.18.

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

