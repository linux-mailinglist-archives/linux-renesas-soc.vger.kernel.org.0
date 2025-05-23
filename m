Return-Path: <linux-renesas-soc+bounces-17463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB454AC2697
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 17:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D63554036F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374AD293730;
	Fri, 23 May 2025 15:39:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29821B9D1;
	Fri, 23 May 2025 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014758; cv=none; b=Z8Hc7WRiOsUa04G7z7W/jCJcsaU3RftxvDRPVXUxwE/IoLG+XaS55z26qgPyf+8JKCcEr0c6xE0VpLdhW2nFgl489xraD9cnYGIQ7ReKEUtu1A3v6srpZJGKq1s4Bgx0Fde5zAXzVmhpnOlT9VeO2tMh/o2qfq/5bjq4eWc0/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014758; c=relaxed/simple;
	bh=y6QDEdVpdn8ngwnjqX/heqft7b9nTsCDw/SESWMAK88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQFkMY0dlGIX9tL+C7mzXkd09aqwspxQx4a8AtJ+hFKHMc2iSaUxaceio9IhSdwi2yqmKYDif2XlDrsGM/IJ2A5s4WW+04hBPywlD5wTLPYSVYcT5qAwyWD0lyrAmviE48+27Ki7BkBwkZ+gJF/huOSig8/IpX6SWtlEjxNrujA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c922169051so553810985a.0;
        Fri, 23 May 2025 08:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748014755; x=1748619555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryBrvbiRRYJJ2VCcfpsXi9l8rNBPjFl5o3IstLI0tZw=;
        b=nohfKRR9l46Bn4wXY2EWeDIe6P+QsvRR+53A7h5hSdhPLmCRvdj3Rn/4baE29PKxft
         S078OBwsS4DMWayPaiN6NaFn4j0xHQttH5fJHNjwwGQs3nDoERFZDeELA3HgJita9Kf5
         gxVMg3pp0E7rq3rojtGcuPG7YyW83C/pZKckFuIKXu4dnJPimJthZlvnPwDS+Bbm8hnZ
         2GAyRCwQVMNtLRROEwp1B3b1+LYT9k60gdFDtGNzKUZ3K0bbrlySNw6LNyTzncR86JBG
         CEgxvremznjxm6tivZU26FlRAQUK6EdxD4y77+eW7X1c/4Xev1xJ0Pc4Zq9ANY4oDhuy
         GlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHILaOT9yZ24w/vT2StILkXTGMJK26Nmc9mrsbplpzLuU0vAm+leR+KWZoJ41TgR0M6A6XrQVkSt0Y@vger.kernel.org, AJvYcCVwxRlzay2hptuxUU+mj0DjiTe925yWUCRRqQsd/qgOrrCpUBfj487ZHS747U5PxWH+xltSyPmYOayUY5I1@vger.kernel.org, AJvYcCXu4G3EfOvlRzvvTspgRDRpKDONIGZxMdHXu2GLu4O3clxd3UjJhDNpwMyo+WBaw3YPChlcJ/9rxggMxBxG6e+xVXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgqqbr0sYUg/fkf4w02BaoQ3ll8LDOM9cjG9QCSV/lHVqdnBKw
	SGakymk5eanBc48zOsweBTOfJhTP02N1d/ylI4nSWL2W3UswpZg0nV/cy/5ARwzJ/kI=
X-Gm-Gg: ASbGncuccBTD86RO0HBXMREUyxB+B8IFqvL25z7FaeGhQSMNQc9n9lIemPiQgla7XTb
	QzisczzayxOlRhh1OVTmTtIkBV9WeEoj/zBDZTXJVgtqRnavUE9jKefRLAk8pIhMSKXFoIcWMuJ
	Lc9sj43T2jKM2wli3kWPnsByM0E6ISKIMVdYnOvj2rKLm2rwg2d8MZ8wMj6RLHhVz3RoheV7CF9
	12kYuHw+70m2vP82UulMt5kfUcwFo8hxDs9ys0WCFFxNIE3kvwT3DkQWyc73iZXqaOI9xUiaxHJ
	P7sNSDAOKmf/P81oxScCIuhqkyXwHS9TqEHLfS7C5y26BvZaiPBhnLPmqmSUccLGrRhTBJXCo+e
	Uu+XH/MGKaw0r8sjGbQ==
X-Google-Smtp-Source: AGHT+IFJ17PdUSrR9PAyz9A373Qt5+hTCJx8bTr+SWPz7moNObgf+GjDwQtYfqxX3cYq6vu5r5dXlw==
X-Received: by 2002:a05:620a:1128:b0:7cd:92:9f48 with SMTP id af79cd13be357-7cee3280f39mr419630285a.52.1748014754985;
        Fri, 23 May 2025 08:39:14 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cc4dcsm1191241385a.96.2025.05.23.08.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:39:14 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7cd0a7b672bso630273085a.2;
        Fri, 23 May 2025 08:39:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEOR3ON8CXP3UOnyogxW+amUCV3cAuYsOyR/a8sJWMrwsv/C3JsDdRJ7ActbNlURB0whxUCFm6aRGjTFUa@vger.kernel.org, AJvYcCWG3V8NiKGc5Tr9mst7H0l0hl45kVP108H3ONe+gOl574bxZ+6QB7bDVSYigUIrSdCSgo8l7Bkf0wSb@vger.kernel.org, AJvYcCXc+dUSdM0ZFqg7fJUUili6vIvdaFP7zv0NB7ZaZXDcU+1nckVcRfGpKA8eEHJpEwI00yNdpRItlSU/oyzzSTCSexU=@vger.kernel.org
X-Received: by 2002:a05:620a:2891:b0:7c5:b909:fde1 with SMTP id
 af79cd13be357-7cee31f7527mr536169785a.25.1748014754323; Fri, 23 May 2025
 08:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518220812.1480696-1-john.madieu.xa@bp.renesas.com>
 <CAMuHMdX3tmRsWH=T76UESxPO59uG=8di72FuSsV__hHNsmw_CQ@mail.gmail.com> <OSCPR01MB14647796989C230D7E1866C86FF9CA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
In-Reply-To: <OSCPR01MB14647796989C230D7E1866C86FF9CA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 17:39:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4poOJ46NEVZUpuDDNjU-F7o6Wn62triNd=jqHq466Wg@mail.gmail.com>
X-Gm-Features: AX0GCFvPbfJQetkxe_Tm6HStAEgmMR_7lrJ5cp2m_CaawoErBbvWG065tJ8rY3M
Message-ID: <CAMuHMdU4poOJ46NEVZUpuDDNjU-F7o6Wn62triNd=jqHq466Wg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Reduce I2C2
 clock frequency
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 19 May 2025 at 10:56, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 19 May 2025 at 00:08, John Madieu <john.madieu.xa@bp.renesas.com>
> > wrote:
> > > Lower the I2C2 bus clock frequency on the RZ/G3E SMARC SoM from 1MHz
> > > to 400KHz to improve compatibility with a wider range of I2C
> > > peripherals. The previous 1MHz setting was too aggressive for some
> > > devices on the bus, which experienced timing issues at such a frequency.
> > >
> > > --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> > > @@ -85,7 +85,7 @@ &gpu {
> > >  &i2c2 {
> > >         pinctrl-0 = <&i2c2_pins>;
> > >         pinctrl-names = "default";
> > > -       clock-frequency = <1000000>;
> > > +       clock-frequency = <400000>;
> > >         status = "okay";
> > >
> > >         raa215300: pmic@12 {
> >
> > Can you please clarify which devices on this bus do not support 1 MHz?
> > Or perhaps this is a board layout issue?
>
> This is mainly the case for the GreenPAK device, that is programmed to
> Operate at 400KHz.

Thanks for the clarification!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel as a fix for v6.16, with the clarification
added.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

