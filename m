Return-Path: <linux-renesas-soc+bounces-20606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D5FB29D01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 11:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E19021881F3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5F7308F0C;
	Mon, 18 Aug 2025 08:59:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5FA308F16;
	Mon, 18 Aug 2025 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507587; cv=none; b=YcpdFtCGSkvcY73yZhJoBQAXv6jJVmQIbDAhk4Bv5S3j5II/IWylNFhkQ/HRMZrIUDGWrR3f5fgWp6dr2IrokcXzcuBLrx/bRfl6jW8t1btdeZpAtErPLg8UHCHMx11H4ONnPK2CqEwmphmNE3sU0XYl//R3S+PVdU/9VCYinvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507587; c=relaxed/simple;
	bh=/8M5gc583ps8VanNEYTOj7Uh5cuD5fcXII5KPf8sHIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfoDXQfbL4xIBzl12qd7FjdN2iLcmrT+MWQk+pR/0S/u/nmiiizECBeoPkeO69gw04KRyWum4xg2C8UHiwOhiv9ayLDqvAoOAbqLdjEC7jbfoRTpmRSI4f+xdcRZH7leDaUDy0c4cFelfLzBUBlQYcY0AL0afAY+9w+JMEvkgcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-53b174f7cf0so2789735e0c.2;
        Mon, 18 Aug 2025 01:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507584; x=1756112384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuhsFBr0hPDOjSQgDopWNJ7fxxqkAvU6UwE4E9csdXw=;
        b=r6IAC91n/I2cS6w7pOzbauego4MZAdPPI9NRomIB+arOM2cyN/o4ENJEW8H0nvcJMX
         Y1GIZcSgM0QoaVfC39ClnBzYM7t8UPckpg0hdHLzl/gS9u9+JlOrqyaJtVz/YhuBHtJE
         HHDaT17S7c3496iTASj7sDmX0l253GmFT1e2BeRgrXpZxfWXJ1XHtEkg+PB3Vc5PFOJn
         X+2s3fg01sSYEzHnhxy3V8aev8/3SI2khctG8TQNU8Mt5VKCp+FlqLBBPhvhVOWcyemw
         EouJ9Nt8Go1ybal255xJRzbINpgbuKYMtcSzINdQ5EEaGtiUl8BUnk72UtdW8+dBCHFD
         18pw==
X-Forwarded-Encrypted: i=1; AJvYcCU7W9N2+DM7nY5X0QNV0kbCcLkPRGpHvqfpFGOhwcHBFUgMOp0npLl8271UmAOSfjpnTdnyvqu3Wqj6isQsMi0zaNg=@vger.kernel.org, AJvYcCVPMotB+2pt5TonGHm55qi+dkDEDtmNR532/dE0Y9TeWgsb+rOjRfaR5ZBqKHvD3hp94ZsgVlxA9/o/@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+Ci4bTIW0+k51q93bes0yJ/HtYUE8nGd2PzOws32atJZkJBb
	Q60Lsv8KRgZHxOhPK3LxaPEnVNWESPv1XMHLAcLBZEbF/qEwzUp5iRbkQ1medFC6
X-Gm-Gg: ASbGncuuHViMYqQ7cFarkIaJ0gb/9aowuvvdEn3Z+v7VgnvtmRdMQbPLxfe9diUSzIA
	Ao8Uc7NqAjRIGptzcmoNu3EsERqbzGBpcZ6OyXDrGvx4Q8dJZlJVlTgncrbEVHBDjv4X43KoSs5
	oYWsWcEx5p2NnZWt9TClrxn0db95tDmEsg3kasODXNEoTLvKlhbyUBVl27MWkscyRNZbAWJNfg0
	iotWmYZ1o4BEjUwd/D16lgTs2Lw5vhvZBkHNsnP/jInsUK+ZYrR4xO9SQn1Lc2yKlMiYwf6a1H7
	sJ2fB1xe4TXlnGOIOXRKLMwx5hrxCpVZsZRSZ/81JDbDC4uWJ8214cL8ULspWyZQQmfaSz56ito
	GGVDWcVtuWCw7+WdKqWWhmriBWmDAFKxULH4SligYG3h4RFyPY8WwF6D+md9kwhRwGbYttOY=
X-Google-Smtp-Source: AGHT+IEV+3tIsRgcu6/CFuFD1p7ka8g/J70DwKQqLMQr/NenlYNGkxHqnkGMY8EmJI5Mc2cA8Do+ZQ==
X-Received: by 2002:a05:6122:328f:b0:539:320d:314a with SMTP id 71dfb90a1353d-53b2b8b42d4mr4132854e0c.12.1755507583886;
        Mon, 18 Aug 2025 01:59:43 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2ba75b1esm1851464e0c.0.2025.08.18.01.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:59:43 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-890190d9f89so2100860241.2;
        Mon, 18 Aug 2025 01:59:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3L+rE1vGKqXT/6IxXvhWTqyjKZ9jTdiLpuiOn7I6q8Av70qs2XIBr3FEb6tc/5nuKobTiw/SCXPRS@vger.kernel.org, AJvYcCVnHkzIpZmT9VUcBNJ7ZKJjOTft4pawE09OuJ/iI3DmapHGTtgM24yF+O3cfG+MUJP+ohWtwDN/xWDwv8/5VTisMDI=@vger.kernel.org
X-Received: by 2002:a05:6102:5e89:b0:4f1:37f4:8c32 with SMTP id
 ada2fe7eead31-5126b112645mr4150542137.11.1755507582868; Mon, 18 Aug 2025
 01:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
 <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org> <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
 <154ea688-8e06-40c6-944c-084fb9d5ce26@mailbox.org>
In-Reply-To: <154ea688-8e06-40c6-944c-084fb9d5ce26@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 10:59:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHhwWyzKN7LrVFhyiQQSOpCa_MjJMUH5tOqiDdEwM2fg@mail.gmail.com>
X-Gm-Features: Ac12FXwusi8Q50H9ko56aKmi_551zQte_LhN-_Eru5-Jf3vH6_rggjPNmkPCoHw
Message-ID: <CAMuHMdXHhwWyzKN7LrVFhyiQQSOpCa_MjJMUH5tOqiDdEwM2fg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 15 Aug 2025 at 01:36, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/14/25 5:50 PM, Geert Uytterhoeven wrote:
> > On Wed, 6 Aug 2025 at 17:23, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 8/6/25 11:35 AM, Geert Uytterhoeven wrote:
> >>>> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
> >>>> +&sensor_thermal_ca76 {
> >>>> +       critical-action = "shutdown";
> >>>> +
> >>>> +       cooling-maps {
> >>>> +               /*
> >>>> +                * The cooling-device minimum and maximum parameters inversely
> >>>> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
> >>>> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
> >>>> +                * This is because they refer to cooling levels, where maximum
> >>>> +                * cooling level happens at 500 MHz OPP, when the CPU core is
> >>>> +                * running slowly and therefore generates least heat.
> >>>
> >>> That applies to cooling-device = <&a76_[0-3] ...>...
> >>
> >> Do you want me to add this line into the comment ?
> >
> > I don't think that is really needed (see below)
> >
> >>>> +                */
> >>>> +               map0 {
> >>>> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
> >>>> +                       trip = <&sensor3_passive_low>;
> >>>> +                       cooling-device = <&a76_0 2 4>;
> >>>> +                       contribution = <128>;
> >>>> +               };
> >>>> +
> >>>> +               map1 {
> >>>> +                       /* At 72C, inhibit 1.5 GHz mode */
> >>>> +                       trip = <&sensor3_passive_mid>;
> >>>> +                       cooling-device = <&a76_0 3 4>;
> >>>> +                       contribution = <256>;
> >>>> +               };
> >>>> +
> >>>> +               map2 {
> >>>> +                       /* At 76C, start injecting idle states */
> >>>> +                       trip = <&sensor3_passive_hi>;
> >>>> +                       cooling-device = <&a76_0_thermal_idle 0 80>,
> >>>> +                                        <&a76_1_thermal_idle 0 80>,
> >>>> +                                        <&a76_2_thermal_idle 0 80>,
> >>>> +                                        <&a76_3_thermal_idle 0 80>;
> >>>
> >>> ... but what do "0 80" refer to? I couldn't find in the thermal-idle
> >>> bindings what exactly are the minimum and maximum cooling states here.
> >>
> >> The comments in drivers/thermal/cpuidle_cooling.c clarify that, it is
> >> the idle injection rate in percent, in this case the cooling can inject
> >> idle states up to 80% of time.
> >
> > OK, so I will add "(0-80%)" to the idle states comment, and sort
> > the nodes while queuing in renesas-devel for v6.18.
> I sent a V3 to make this more official. I hope that helps.

Thanks, I took v3 instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

