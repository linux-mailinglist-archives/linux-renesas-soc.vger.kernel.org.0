Return-Path: <linux-renesas-soc+bounces-9115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F6F988413
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 14:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11AD61F2297A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 12:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F418BC0A;
	Fri, 27 Sep 2024 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtvCBuZJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387F818BBB6;
	Fri, 27 Sep 2024 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727439609; cv=none; b=g2y4bVOareh1xT4tv0CTXDb96wICDtsq1tVVTQNvoE3ajcODAP7WVMga9cDqKW1BsEYUkV/GnfrR6gtVFby9fGgAtokzDsSyb/6GskGTeocfO5HgZMArOMr6UZFNorBMRisIirwIpzGU5xnMO5RIbeZInF7MDBou9M2PjKaGk6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727439609; c=relaxed/simple;
	bh=WPNYO+xd1s1KN3jUa+JBRRpxKWaYwWSOMkkB8tCf+NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX2Psro8YHlBIPHwrAU6CCap6WkSGSejSG/vsznCYPuHNydFm1wIxG0s+jaskrmo14sLHUNkV1CSvI5nmUZEdBu2HI/BI5SNkd8mhvEEolPe3mKWKC6D+Y3W/fTtcvPhZbhbfiY+G/G1OIuDr5ipBo+RL3q+GNvwMqyXTfu3+8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtvCBuZJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20570b42f24so23842125ad.1;
        Fri, 27 Sep 2024 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727439607; x=1728044407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmpHJeLs6NJdfwlzRVUknQADxAgUSEiuTv5BJcRJnFc=;
        b=FtvCBuZJqQ1lZf6mSKiHpm2+DJgLbow9NCkWHV4IDQ3ktEL6VIv3M9fAx7r5tE0Svs
         APTuIAx1/cTOVwhqXb2oGzeYneUJlzMbt4aFa6R+qTVYd/5KyVCr5FUzECEQS+unF+2d
         VEs5P56IHZs8/W1tzSXTmsfUPvPyo8QVpT3Pynktn0/tEs4U0w4pnLHOgyeys+RBiV67
         pTSnomoATzEHzge6MkcJ3T/7Yp/UawokYlnZTanboD2I6pqBpr/zaNQzTOkf0OPEtpxY
         +zOOGXr/rFYwYc6GUaIXevn+dhoWown0Mpesi5DplM13G7lLXuq5bbT6uVNW55u+HRHL
         6d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727439607; x=1728044407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmpHJeLs6NJdfwlzRVUknQADxAgUSEiuTv5BJcRJnFc=;
        b=wPIxAnASGJigz1jyaAMJEpZ8YOjpmKxLJEriVYjXCd++gQJ6anW0S0F5U12N8+WV8b
         qzXNmG/lM/mJF83Q8mfxLBldRJfRtriJhUlorc6bTr9CcbXlNHSsYIC/EWDI3D1gagqf
         nuksO3GJoFhbN9qNnbiUcSwnLFmw3+CPr56b61yvIrTUEJVNtTQ5zFY8PeGaWNsLVyTC
         cnYDEue2s2hUdEGJFImpiMOsg7zH5B33bq5DQar50hBTEpShJkgP2COIf3pMTwrD2GJ+
         gSp+sOhz4MWUyEgpG1BQ9z8rWjYXmB443hFqxVOIkriNTSvHdNoIxSUqVW4zv7GLEupM
         qHYA==
X-Forwarded-Encrypted: i=1; AJvYcCW2EmWJAe1RGAGbBic3BApC8gWcO70uT/cgf/DaTbbbDdblOTL9TvaA0C9lFredh476aFWq2lZKGMc4@vger.kernel.org, AJvYcCWzWQ3IBtWZFAYh8pht8PFYwKLkiifE56YjsXrS34FGyRMkMlVE9SUzYPwr4KPf2x1VmDNaDzSMVlgV8licFm8Xduo=@vger.kernel.org, AJvYcCXkY4r5h7EAWMq7BWlsr6WHfIDtZRHZ8WKTmeL6G3e6SaiBapHhpF/6aYEZQf6Dq59/Iun1yOt3m4IzwK2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Nu1ne+RxcObONcW2ZQ01a0eolv5FrxGo7lQF+FhxHDXffuJ0
	h+OTlucf12I1w73sTg9ebFIM1nsCKIpvjAaGYOoO7Qp09a9tl3w73ZftSz7JeC1rp/vgKEf2mxx
	Tg3DyBdcbEhW2S2wyAjUVIOyNnNs=
X-Google-Smtp-Source: AGHT+IG8xzE2YhDlqy6m9OCQv2i651ZoyrhJRmx3DU1y1XLHaGexnr0U8wiN8jW67VoZb0Kdz0KoguDZte066MqyFCk=
X-Received: by 2002:a17:903:98b:b0:206:8d6e:cff9 with SMTP id
 d9443c01a7336-20b36be53e9mr53189825ad.4.1727439607242; Fri, 27 Sep 2024
 05:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev> <cb716925-f6c0-4a00-8cfd-b30aed132fd1@linux.dev>
In-Reply-To: <cb716925-f6c0-4a00-8cfd-b30aed132fd1@linux.dev>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 07:19:55 -0500
Message-ID: <CAHCN7x+tcvih1-kmUs8tVLCAk0Gnj11t0yEZLPWk3UBNyad7Jg@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, 
	Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 1:24=E2=80=AFPM Sean Anderson <sean.anderson@linux.=
dev> wrote:
>
> On 9/26/24 14:09, Sean Anderson wrote:
> > Linux can configure almost every part of this clock generator without
> > relying on the OTP settings. However, the correct configuration for the
> > SD/OE pin cannot be determined automatically. Therefore, add the
> > appropriate properties to configure this pin.
> >
> > I have CC'd some people who appear to have access to the following
> > boards which use the versaclock5:
> >
> > - Salvator-X
> > - HiHope RZ/G2[MN] Main Board
> > - Beacon Embedded Works RZ/G2N Development Kit
> >
> > as I could not find schematics for these boards. You can help me out by
> > (pick one):
> >
> > - Run the following command and send me the output:
> >
> >     $ grep 10: /sys/kernel/debug/regmap/*-006a/registers

Without any of the patches from this series, for the Beacon RZ/G2 Boards:

grep 10: /sys/kernel/debug/regmap/*-006a/registers
/sys/kernel/debug/regmap/2-006a/registers:10: a0
/sys/kernel/debug/regmap/4-006a/registers:10: a0

> >
> > - Measure the voltage on the SD/OE pin on a functioning board.
> > - Inspect (or send me) the schematic to determine the state of the SD/O=
E
> >   pin during normal operation.

The SD/OE pins on the Beacon boards are not tied high by default.
They have an optional pull-up resistor, but it is not populated by
default.

adam
> >
> > My suspicion is that all of these boards use the same configuration
> > (SD/OE pin tied high) owing to their common design heritage. Thanks in
> > advance.
>
> +CC the people I meant to CC in the first place

