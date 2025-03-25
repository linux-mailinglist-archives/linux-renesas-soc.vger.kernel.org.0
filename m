Return-Path: <linux-renesas-soc+bounces-14819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5EAA706CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 17:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 655583A95DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB5925D205;
	Tue, 25 Mar 2025 16:24:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24478F24;
	Tue, 25 Mar 2025 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919897; cv=none; b=HD9LOydpT7kzgMGkPG5YNbtFk5Y6i93RFFcK1nBaFWYzsl7XLbdq9LxJTXmQ5KEbI2iwvhP9LSyExpsibFXNVjsb/hQaT6SMlzJ3Z7Znd6FDAWhOPFdbe+tOMmbyPqO0KoNFyahnu6jxepg6/l8O0IrYOI5YgGzOYSFV+na96ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919897; c=relaxed/simple;
	bh=C7fBDqjXv2CVmINJYOBkk5XGIiofXHQLfQocU+kGCtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzfHbnoK2lldlaSAuVj/Peb2af5Kxn9DlRCFlkZn7r5SjeDI285xKFHQwe4ktMZ4IJz1fYWEY8idEN5j0pMdPX4sDpZ2PxWtn41n7uo86qn7Y5XJASr07OB6AoPyCRaYEjDjGIBaxiENtd/rDCwgSgWAkY7mwIWT51RfvKeTzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d69774081so2511530241.0;
        Tue, 25 Mar 2025 09:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742919895; x=1743524695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3iUGf60hSD8kCkzesJGsUCW6fH2x3e5r2ngVLOx6QY=;
        b=hqPAHYvPFqCQk+PVzAwDQW+sJrq9BHbjs9HmyAjDXTO0dP10bcgTj2Sc+dSpbSre+z
         aOTdBVBE1/kbJKkb/EuvO4BXIbUX6LmHssbIpnymCo6ihZqIu8FVVz/T8ZsEDRfIVKqJ
         7fmUlZdi/i7jEw0KVwujGY0CbcIL3rA9TpB5V7YdR6uRaO1eAOzN8H19AHFnKqjNLWPY
         LF57MP4xJQaVGLuin5+EMHF0QvrGeQBOWQoBNRCbJVoc5P8vhmVq/t28JJUgntdKEUsD
         Aw92tgNqp3SSX6qAmpLYyl+3ait1iVyvw0Bh4OdihcPDFsQPIODz18egeTSOP3yqyubx
         rX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTVR1Ag5J7D1+GUdWPtr4ZS/S4C2aYzonObmHDMNfMMZAcA1pXgPgycIs2e5Zortn5ecTp8v9lo0UHqXc=@vger.kernel.org, AJvYcCVgHshMf36r38RU3LeS6eKiGYx44iF2uvPf0D+lBpq2Q5JnI82ZWY6WnRortpBbJb7HUjlrrylU1YbLuX83JiG4JC4=@vger.kernel.org, AJvYcCVw5tQCWEkqqWr2HZngDvRtvHXc8P+NJozqcFB6QB8GzHIcoRi5shdm0PUu6fm5cyR6J5T1+d4eypMF9O8S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0cBafIfM9Ee0/MrUfWEq2VoJsFN4WTolz8KDeVEUHmQy6YglM
	782FXGhecHZObiFsj9X6L6vco9UQFC6P6H3Wd0U5/hguElxiFXOXJxooQVUKdDk=
X-Gm-Gg: ASbGncsqmxfyr4/5FEItrRYN1zFX2cH0192C5BeGX71j1eUmfzSEbkxOHJOa2TJLrt4
	Mr+erQEj6vfoelj1++p4TiGGGyerjnRWyy/yVu8XGl+kQJ9ajKmr/EN2+P5BLhqPpHm9qe8xuwO
	pmW+aI5RwACod6Y7z6Im+LJcyBxLlwebrbE+BETM/CDeOyXjVaccdgSHBK5BDIcpQ6cnI7KPHTt
	KINDaNEDOPKSbhWaH8XQAChsQXnAjXMMgacPe6kI5LvJTMzaW/QmChbhtG7f2VkLp65BGmGl9oh
	VygerUxe8l7EPpuIP/8OPaF702NKNFKZY6lmCMHXLryF7XF2xPRAdCykrtsZuZs43Z5KHAJUby+
	2KvxvV2Y=
X-Google-Smtp-Source: AGHT+IFto9b5UOUPtnV1wp1D8cIG5F0mOE1Sx7UffouZOawKSn+ZDssypAWeSNwzC+SmvX5A56nDTg==
X-Received: by 2002:a05:6102:dd2:b0:4bb:b809:36c6 with SMTP id ada2fe7eead31-4c50d4fb6admr14454091137.11.1742919894530;
        Tue, 25 Mar 2025 09:24:54 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c50bbb3affsm2061070137.4.2025.03.25.09.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 09:24:54 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d69774081so2511508241.0;
        Tue, 25 Mar 2025 09:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURJ19LYYbNOK7lgKgTs3QHoG1MJyIPQqd9k88FMl9STr3iG1nbI0TnPiGrvbEtUF74Q3vNyG1C4+QZdXGtuu6kNnY=@vger.kernel.org, AJvYcCUcbxHQvM6qFaNYC4NsRTIfKyxQyODePwGGAOC4PgAwHPF/9EjuBQcdPchJShNQeGeYOEpnob0bkltJcQQ=@vger.kernel.org, AJvYcCVTqJ55g22rByenzIFf/x+j2RVMTAjqqkV31Hr7HO5DcmP9yinGv59m9upGklMlxtYuaaYm5t0Fqe3jsFoK@vger.kernel.org
X-Received: by 2002:a05:6102:3589:b0:4c2:2beb:b726 with SMTP id
 ada2fe7eead31-4c50d4f1cd2mr11387064137.10.1742919893845; Tue, 25 Mar 2025
 09:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>
 <Z-EpPL3tn54E8KG5@shikoro> <TYCPR01MB114922CBDC2911E2F644BDADC8AA42@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <Z-HVD6w6ivYR6pt5@shikoro> <TY3PR01MB1134602E988AD8428422E820086A72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-Jgdi5_SizHzcO0@shikoro> <TYCPR01MB11492F2D6D73B2EC18E46D6B98AA72@TYCPR01MB11492.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11492F2D6D73B2EC18E46D6B98AA72@TYCPR01MB11492.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Mar 2025 17:24:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8VSD1Z4ing_NLXyo4x4ErzqkqzeM_n4nXX3h_GYCLnA@mail.gmail.com>
X-Gm-Features: AQ5f1JrPdMUtwfzLYkd4tA2p5ykjTStKxFm2BOrBAk4-uGOWcV4_ArQkaw_jT80
Message-ID: <CAMuHMdU8VSD1Z4ing_NLXyo4x4ErzqkqzeM_n4nXX3h_GYCLnA@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Tue, 25 Mar 2025 at 11:49, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > > > +config SERIAL_RZ_SCI
> > > > > >
> > > > > > I think this name is too generic. Most RZ-variants so far do not
> > > > > > have this SoC. Would 'RZT2H' work or is it too narrow then?
> > > > >
> > > > > This is too narrow, because for instance the RZ/N2H , which is
> > > > > very similar, has the same SCI
> > > >
> > > > You know the differences better, what could be a suitable name?
> > >
> > > Please consider RZ/G3E and RZ/V2H SCI as well as it is almost similar
> > IP.
> >
> > So, I am thinking to not use a name based on SoC but based on feature like
> > SERIAL_SCI_32BIT or something. But I don't know the HW details enough to
> > make the best possible name or maybe this is a bogus idea.
>
> This seems a little bit confusing, and like said in former discussions,
> the 32 bits registers are not the main difference.
>
> Here are the known SoCs that have this IP, up to now:
>
> RZ/T2H
> RZ/N2H
> RZ/G3E
> RZ/V2H

+ RZ/V2N

> So that seems reasonable to keep RZ in the name, even there are other RZ SoCs that
> do not have it.
>
> The HW documentation does not mention a better name, or revision,

While the RZ/T2H and RZ/N2H documentation just call it "SCI" ("SCIE"
for a reduced-functionality variant), the RZ/G3E, RZV2H, and RZ/V2N
documentation calls it "RSCI". More below...

> so, the suggestion is to arbitrarily consider it as a new 'T2' type.
>
> Would SERIAL_RZ_SCI_T2 (and rz-sci-t2 for the driver) be specific enough ?

Please don't put the "SCI" in the middle of the part name
=> SERIAL_RZT2_SCI.

"RSCI" does not seem to be present on any Linux-capable Renesas SH,
ARM or RISC-V SoC I have documentation for.  However it seems to
originate from the RX series of microcontrollers:
  - RX Family Application Note: Comparison of the Differences Between
    the RSCI Module and the SCI Module[1],
  - The RX26T documentation[2] shows RSCI on RX26T is very similar
    to RSCI on the five RZ SoCs listed above, but not identical.
    The RZ variant seems to be a reduced version with 16 instead of 32
    FIFO entries, and less "special" (non-UART) modes.

So I'm in favor of calling it "RSCI" (CONFIG_SERIAL_RSCI).

[1] https://www.renesas.com/en/document/apn/comparison-differences-between-rsci-module-and-sci-module-rev100
[2] https://www.renesas.com/en/products/microcontrollers-microprocessors/rx-32-bit-performance-efficiency-mcus/rx26t-32-bit-microcontroller-optimized-dual-motor-and-pfc-control

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

