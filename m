Return-Path: <linux-renesas-soc+bounces-16128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7CA92336
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 18:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F7C440BBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 16:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083DF254B0B;
	Thu, 17 Apr 2025 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxltWd29"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233321D5CF8;
	Thu, 17 Apr 2025 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909017; cv=none; b=VX8lgkA4AOhk+NcZvDfH1ddia10PWtJI7jZLIVevDBEIF2IRtNhUoA9xm2akFf58EgMbIbg2bS17X7AJG+K1JCs9YMJrmtNS1gXa8gwSwAUcR/e1QnGoJfxqLGLgZTKXHI11ysbl2dtnOzErG2+dlEmq9X6cYjO/rgdnE9SL5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909017; c=relaxed/simple;
	bh=ZE5QZ6o1+K5+TnNh8ttD3VHE9cUlzFBLRNzZqopbEnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6wQ3yswwgVQYH1ACexaWqSxT63j59wB3oju4w+Q5+APVHLO7W9M1AY+2LkJNyyLbDAWUBQGfacl7SgWyWLIPrkUXPRggS2JQQWfRLkAE0jStWLS4M2SAMrXyeqfrlg4e3KdtIg+7nNB8kEt9NkiKlO0em4QHAPrLF2R5OoRtD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxltWd29; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so9947885e9.3;
        Thu, 17 Apr 2025 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744909014; x=1745513814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw8DDATN1J2JsMwxeC9w6YIdhEUcW1aADlMTAQuiYDk=;
        b=YxltWd29u+v6krTUqKXgqQH4QSrJPvCGGdDELt8ZunoHQ6/ygi3HMrmF9Vv8hxdV0c
         ZRZUGOAaipL+qvQdT6uny666AZWqx5CU8Zw/zUs18f9jaDP4wC3YxCxXQ1zkXafgWZW2
         MRaUrZtTNzeI39AYD2IK0X2e2/kTAW8em+/eECpii+WGLGlXnz038QZILaNBiLilV4Pi
         9MZeyPgaGbiTQM4Hqa2zKOAPf1WrukEsWi9CJ3nwqiT630w3PoFonbmgtZCAhwykstmo
         yGGTDjk3DMFRrsOw+HpBoyinyEActW1+L+oriWL8iGxFi1w5dEKEwVe8INJhpBFYP6F1
         KJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744909014; x=1745513814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw8DDATN1J2JsMwxeC9w6YIdhEUcW1aADlMTAQuiYDk=;
        b=fnh05jVNM8pLpVNc1gaEy8bSc2PYexjLQ0AbwxbwTOEykHSaZUjb02u7cUOOMuhlO0
         SXHegecdrwVNbp8UQ04F1SpdDWyfkYaT7nYL2CEbPa673U1VQenIcPGpPx4R9CKqUxGD
         CnqT0/OH17aUNWmp4LbFV1+ErnEswewLQpmr4CdaHdaWArdP5g/KT3Wo9KXAvG66ev54
         JTyUo5tIU0l/ISISWxZUzWdc/E2miSMphgXcxcT3PY+8AMsTkUXyGhewLwQ7GXr3kje7
         5XUuKuy2vXO1YlwESnOvR3uu2EYUmjAdvWfnNtdGJUIhLxToiWdikolOQUJtMs/lN2qc
         Jo4w==
X-Forwarded-Encrypted: i=1; AJvYcCUEOx4CMNe1H7gexdqHf8G83jcZkyvv75lyC6h/qRR33LMXHUr4gH4sgcNosdZ9o06TE7enGuHMfDpKjyM=@vger.kernel.org, AJvYcCUMSYWvMHT8yXQEoaxAwg2APmztbCrGP2GjWfQOKe43TSbjcAvHyrdlMLiwh46PQIQfTU5JwTNRly3DmY2W63D6bgQ=@vger.kernel.org, AJvYcCX4l109IkPyA/BAGBDf1YitxMhuWMbo+NWqNF4Ox0OeCYVO04BJP6wEMDV8SwF3BN/4SR+8SUYdU2/n@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5LnT5XnhOY9Hspq/b8X4oXi5dMoD/WdVhteg78IbyuZ+ax5ip
	NEhZEmLnVAEvLdy/ZQ3iM598/8HRG4RGmOHV/HkPJF+2ykCbnkwVECaxTkEsW6wD96+kNCttpy8
	A1q06asGCKDTpOsmkZYbOxROCX4c=
X-Gm-Gg: ASbGncts1n2M+UkIFM/RMxLkQolgG6BN78lv6e6iPVgQsVSUNSmxrPZg12tJeFFhXv7
	i8VlK8+NLzUGFLbsCXSTo3EEBnTb4dIdjJdSlLx06VURvdSRGhOA5/oGDp6BYLVqTmOYk9/Sn+H
	YbEvHE1QGVG2bd5HqEQ6E84ptYK4B6Gi8M
X-Google-Smtp-Source: AGHT+IGTD9DkTtTtyVRNj29mkmWSu7Gv4jo+9DUSSQfA24Ymdg96+KNErXCLlhUaidw03N9DXESgP0iGsUfOg0qIx6Q=
X-Received: by 2002:a05:600c:a46:b0:43c:fcb1:528a with SMTP id
 5b1f17b1804b1-4405d5fd32dmr59550555e9.6.1744909014014; Thu, 17 Apr 2025
 09:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
 <TYCPR01MB110407080D95D7EE14CFDC5A5D8B42@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <TYCPR01MB1104086085A1B051D61AE104AD8B72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CA+V-a8uUNV_8R+4O+Rie86g4kRRG6rduKZD+F51PRavq7kzsFw@mail.gmail.com>
In-Reply-To: <CA+V-a8uUNV_8R+4O+Rie86g4kRRG6rduKZD+F51PRavq7kzsFw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Apr 2025 17:56:27 +0100
X-Gm-Features: ATxdqUG0r63cjUNCWfcd4MSJctjY32ZMY13wf1ncIcIEBQ56v8LXHh7NeKpIs1M
Message-ID: <CA+V-a8tErqUK=nHBOzA5HWH=xJX1JnTuzBAqwTA3fg-Snq02JQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Thu, Apr 17, 2025 at 5:32=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Shimoda-san,
>
> Sorry for the delayed response.
>
> On Thu, Apr 10, 2025 at 3:48=E2=80=AFAM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> >
> > Hello Geert-san,
> >
> > > From: Yoshihiro Shimoda, Sent: Wednesday, April 9, 2025 10:10 AM
> > > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Prabhakar <prabhakar.csengg@gmail.com>; Greg Kroah-Hartman <gregk=
h@linuxfoundation.org>; Kuninori Morimoto
> > > <kuninori.morimoto.gx@renesas.com>; linux-usb@vger.kernel.org; linux-=
kernel@vger.kernel.org;
> > > linux-renesas-soc@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.c=
om>; Claudiu Beznea
> > > <claudiu.beznea.uj@bp.renesas.com>; Fabrizio Castro <fabrizio.castro.=
jz@renesas.com>; Prabhakar Mahadev Lad
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Subject: RE: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handlin=
g and power management in probe
> > >
> > > Hello Geert-san,
> > >
> > > > From: Geert Uytterhoeven, Sent: Wednesday, April 9, 2025 12:43 AM
> > > >
> > > > Hi Shimoda-san,
> > > >
> > > > On Tue, 8 Apr 2025 at 12:40, Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > > From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
> > > > > >
> > > > > > Reorder the initialization sequence in `usbhs_probe()` to enabl=
e runtime
> > > > > > PM before accessing registers, preventing potential crashes due=
 to
> > > > > > uninitialized clocks.
> > > > >
> > > > > Just for a record. I don't know why, but the issue didn't occur o=
n the original code
> > > > > with my environment (R-Car H3). But, anyway, I understood that we=
 need this patch for RZ/V2H.
> > > >
> > > > On R-Car Gen3 and later, the firmware must trap the external abort,
> > > > as usually no crash happens, but register reads return zero when
> > > > the module clock is turned off.  I am wondering why RZ/V2H behaves
> > > > differently than R-Car Gen3?
> > >
> > > I'm guessing that:
> > > - EHCI/OHCI drivers on R-Car Gen3 enabled both the USB clocks (EHCI/O=
HCI and USBHS).
> > > - RZ/V2H didn't enable the USBHS clock only.
> > >
> > > So, I'm also guessing that the R-Car V2H issue can be reproduced if w=
e disable EHCI/OHCI on R-Car Gen3.
> > > # However, for some reasons, I don't have time to test for it today. =
(I'll test it tomorrow or later.)
> >
> > I tested this topic, and I realized that my guess was incorrect.
> > In other words, the current code seems no problem except accessing regi=
ster offset 0.
> As Geert mentioned, we don't get synchronous aborts on R-Car Gen3--we
> only get a 0 for register reads when the clock is not enabled, as seen
> in the test you ran. On the RZ/V2H, however, if we try to access an IP
> before enabling the clocks, error interrupts are triggered, which is
> why we're seeing synchronous aborts.
>
Another simpler way to test this is using devmem2:

Case #1] On RZ/G2M (which is similar to R-Car Gen3) by disabling all
the ehci/ohci/phy/hsusb and running the devem I see the below:

$devmem2 0xe6590000/dev/mem opened.
Memory mapped at address 0xffffa854c000
Read at address 0xE6590000 (0xffffa854c000): 0x00000000

Case #2] If I do the same on RZ/V2H and run devmem I get the below:
root@rzv2h-evk:~# devmem2 0x15820000
/dev/mem opened.[   34.056718] kauditd_printk_skb: 5 callbacks suppressed

Memory mapped [   34.056734] audit: type=3D1701
audit(1744907878.287:22): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496729=
5
pid=3D313 comm=3D"devmem2" exe=3D"/usr/bin/devmem2" sig=3D7 res=3D1
at address 0xffff92854000.
Bus error (core dumped)

Cheers,
Prabhakar

