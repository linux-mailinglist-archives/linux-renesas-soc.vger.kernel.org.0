Return-Path: <linux-renesas-soc+bounces-15561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E5A806D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562343BDD62
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F86826E175;
	Tue,  8 Apr 2025 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DmAkTUsQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08126AA8F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114667; cv=none; b=pohW+38g2q4+P85oriHwCQwCl1XLT8yG7eQfTJPw7qrqUxd9NV+uAjZSH9iYJrwxF92id7W8jI5iMyJqLCZ//+E8cInJ/QvQh64lAWD/X0Bw4JLYtUbkvaEv5/pJjbWXRqe/hbXTanOCXPuV7y7HiLyccWWkBIJR5qdqTSI6vQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114667; c=relaxed/simple;
	bh=zrTv3Igv/b40jizFm6EQbXgK0TIclob8WTp61FIgQrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQhjYgz08s/6NJTaq9ziL0piaBWGRblhPtTDWyipLKCJEKiebqX1/ZHsRkYyaDc9kYbqgTOKSNvmLX7j0iP5Y2Nz8rDvWGMkYF9SgjI18JjHfvuNFVHJOP+MJxzdzPP0m8GCY43uPKUFoL9dOaIz0mahFzJNZaBQt7UzA7OqFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DmAkTUsQ; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7023843e467so52177397b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Apr 2025 05:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744114663; x=1744719463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgQfANebtdqnI5c6U+NPo92x9wLAySpUrYEpuKhqRpM=;
        b=DmAkTUsQJnJNTUy70pA1EP+YbwSCQFwvpsh5BzKyy2I5xXJOwKPp/MjuyD7Iyvr6wr
         5lUThj3lRMnhqedjtfRP8J7zDGx0uSK+/VQeMcv8WYxuNchnWCouB6Y9hd1MaJ5j+t5v
         r+ghHoPGlhagvFh9cQfVJgJHdXNAO4YVRyK61MBQ2x557tIEYYN094pzYGp77sdkROxK
         EXd1sAvNMiWdvAPUqeqnz+Bhct3FNTbp0bsbtJ7Px8MW+yHMOyEFGSVmdWphUHs58gBq
         Xhkt+pVwRR9zBHyq0aSEVbDq88LFxyGJDcXxm4MUpMPkXY+cAj1P4wuUVIO5AMpLVVAn
         4X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114663; x=1744719463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgQfANebtdqnI5c6U+NPo92x9wLAySpUrYEpuKhqRpM=;
        b=SACYPZKvGs62N1w6SFbctwg+uRtfFwUShYw6rFKo5U0/0LRZ4vI0rya4UBW7EqzJ4b
         R9v56U0zZdrMf4MvUpE4x5+bNm9BG2i7abpFlWdiFWSwIZUNfOBg79T4lMQRTD/8myCZ
         h31v9U/bSYm0vUeRHlsuuU8NbH52mnjC8SDofWdJnn/1BTc1VK34DrSXH5uHAmbhtw1P
         DCEPsjhtETD7y+KieGp77z6nRtrqUpIArfL8wJn737w/zEyyGaUjaB4sgsXIz+2qzeAZ
         UUGnzcWAK1vrPNXpqPF+ndT1a7SB8qW2iLsuP02bmpMHSMNcyNI98fgJWyFWglqh/3h1
         S7EA==
X-Forwarded-Encrypted: i=1; AJvYcCVSoA9TsDY6BsySStmE7jerdPJasAcCz360cGtuWFY7/OvHqmRCIvXrOMmzWEHHfyiLf6+onFgnFxs0TyWaPSwIvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiAOb921RQsxtI7xxkhA+vAR4ORE7dZCkAkezUEJzlsn8lvwIS
	MPr1+exu7YsqtBd1vF35XiGVUfuTxH3Bv3iNBEmmyDjZrXo6Jf+amt8OtnTzAjn3zByQrSAB7ND
	PPw7qlcFz2Km/9vg1Hr0YIvSqpKRHnL7iCszaww==
X-Gm-Gg: ASbGncvw/3dEopskFwwC6DYYgIEYOCYE+NEXW/fB1th+/sqHtkKte5jo++Jvwhyx+Z9
	IDW8OlnudGYDPzr//BcQxxgbUiJRaWhuW/UrlA2CuicKs/HB135j3XdGfmzys4CkkHpGGeupIrs
	sFHOVPu38RdSwU2mcH+qhfQz/0oVA=
X-Google-Smtp-Source: AGHT+IE9ys53OzSUdrwDVzPrCpJ3j0rVw9UiRXdXpPHOiJneCGTZtJTMxzg8Xq2rdR9GYtx0ZTNP05CFJHjGpzcayc8=
X-Received: by 2002:a05:690c:67c4:b0:6ff:28b2:50e1 with SMTP id
 00721157ae682-703e14ffd3dmr297170407b3.2.1744114663553; Tue, 08 Apr 2025
 05:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
 <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com> <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Apr 2025 14:17:07 +0200
X-Gm-Features: ATxdqUE7frfhfuxoKUlf3DinAq4W783EiniruawsYcgTKF9-ms73Ag05S_dZWTY
Message-ID: <CAPDyKFoKdj-Y4-dCwYRG7TLdS1HcSH=i9EN-b9Cpyo50kMmC5Q@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Stephan Gerhold

On Mon, 7 Apr 2025 at 18:50, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 7, 2025 at 11:23=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linar=
o.org> wrote:
> > > >
> > > > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wr=
ote:
> > > > >
> > > > > The "power-domains" and "power-domains-names" properties are miss=
ing any
> > > > > constraints. Add the constraints and drop the generic description=
s.
> > > > >
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Do=
cumentation/devicetree/bindings/arm/cpus.yaml
> > > > > index 6f74ebfd38df..5bd5822db8af 100644
> > > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > > @@ -313,19 +313,15 @@ properties:
> > > > >      maxItems: 1
> > > > >
> > > > >    power-domains:
> > > > > -    description:
> > > > > -      List of phandles and PM domain specifiers, as defined by b=
indings of the
> > > > > -      PM domain provider (see also ../power_domain.txt).
> > > > > +    maxItems: 1
> > > >
> > > > There are more than one in some cases. The most is probably three, =
I think.
> > >
> > > Unless I missed it, testing says otherwise. What would the names be i=
f
> > > more than 1 entry?
> >
> > "psci", "perf", "cpr", etc
> >
> > The "psci" is always for CPU power management, the other is for CPU
> > performance scaling (which may be more than one power-domain in some
> > cases).
> >
> > I would suggest changing this to "maxItems: 3". That should be
> > sufficient I think.
>
> Again, my testing says 1 is enough. So where is a .dts file with 3 or 2?

Right! I assume those with 3 or 2 just haven't made it upstream yet,
but sure they are cases. If you prefer to update the binding later,
that's fine by me, but I just wanted to avoid unnecessary churns for
you.

For example, msm8916 seems to be one case that already uses "psci",
but requires an additional two power-domains for performance-scaling.
At least according to earlier discussions [1] with Stephan Gerhold.

Moreover, it's perfectly fine to also describe CPU's idle-states by
using the power-domains/domain-idle-states DT bindings, according to
the bindings for PSCI [2] (no matter of PSCI OSI/PC mode). In other
words, for all those that only have a "perf" or "cpr" power-domain
today (or whatever name is used for the performance-scaling domain),
those could easily add a "psci" power-domain too, depending on how
they choose to describe things in DT.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/ZRcC2IRRv6dtKY65@gerhold.net/
[2]
Documentation/devicetree/bindings/arm/psci.yaml

