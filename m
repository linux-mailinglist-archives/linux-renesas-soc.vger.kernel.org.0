Return-Path: <linux-renesas-soc+bounces-15575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61143A8109A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 17:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D521BA77EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 15:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839B723956C;
	Tue,  8 Apr 2025 15:43:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ED722DFB1;
	Tue,  8 Apr 2025 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126992; cv=none; b=K+9M+XDDOG8EsUpft5AAejKc54OUtkDlj0HfnrSY2SScUMYEBxdWyffZZ04fMFo+puViFqWKToYT3kKsME4+b/8em/dMEWU+0MKU0ZCa+rj2l2R3PCfiMlXuL/XYeAToGVAIgILcO2gF0tTONlZzP/PQUGaGkh7P1GGRojFBOWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126992; c=relaxed/simple;
	bh=mhKkui2MuhCCaDSjZCOqWxA4Njty2X+zcDjBIAbuSMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeLbIRB1rXZx0WDGKqU06KLsnPDwyCspdV8zq1zzrkAEz9XfJKEjeg+T0/rGQeEmlUjKFU/UE8hYo1ijHjVSwZ2nPIS/Nbsp8EWnemcJl5pYLEXo7Lkzw7iMzPFuuuiwt8inhRnAus0qL9e8yqI/9MxvO6RVypcsotseFOHWv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d3907524cso2439123241.0;
        Tue, 08 Apr 2025 08:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126988; x=1744731788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MKeMphw2AxvVI3RVQzjeZ/yfGi4a9EjuMid/lapYRc=;
        b=Fmpc7B0x4DNcwV949/dLsgtn0Gzfjek/gJQruUl/kQsRggphrnDZTdh3U2gpzd/JuC
         RUPUJmFYEXICEPRCoSvUjp3Nme20qVxveGir3qLCSMkX/7g7pIZIqa5n9p3mPNKFzoPt
         KjiWBHg4T1jF3itiZiHB2TqyhldhVNV6OnSw+G6pxyKkXTMHhQYOMGejzTw3N1hmWbuY
         Rcfw6ycxg2VItmLOHrxDCz70+gJNqCAqk9aq/+WcVuXMfb6T3WkHJNYZdbxnusMUAWrx
         W2/O+ldX9/ArM9XrCV5oS6fHfvaT89MrvxGO2LCp8vc/VWIQEXkZ10eJNYIhhTeFEMDy
         ApXw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ75Zu3/K1ounvljVaruGePH+aZlRhQO0wlOz8ya3odOY3dkiBVETMMtDZNhoHxOu2ZzKFcFRmlI2K3TAGAal2+oM=@vger.kernel.org, AJvYcCVl8v+BYiLV8hhHZG6wlVZFxhP/DUsBctHCmn3voL8ICvHa2dU9VcjYB8A5xekeJNPadd87CmBFMnh2Uio=@vger.kernel.org, AJvYcCXOR2EDSEr7c82rIRP4cvvFrr2dxJXr+09SsmLJ0ZwJQAMescRM9WUjQgbWbJk4AcT4MlwTLj99R4IE@vger.kernel.org
X-Gm-Message-State: AOJu0YzlWZ+ED4BvngQk9MnpyUW11aqwEaacef25VHR6ANXB7EDFy6Dp
	f9bCQiuJfKYk4o8RJjJaN1kJhhRCAhm8VRrwD+PP1KcvDuDrBqm0jtynS8lA
X-Gm-Gg: ASbGncuMRqd4rlscHPwT0FYaXeSjkYAjuB8zhS9GTX0m9LT8isgfwe1ZmLU77qNdFLx
	IJfngeZpYGVUhMFOoorKFje07fMDXeCYHPnPmTf6680iF+WsIINdw9jtWWbCyYDm6cylcHFxhgw
	WxvBuWygI6D/WiDOTq6za1uWY40XI3A4pzr+Byv1SV77Yyv/YcnuD9tigkXEngW4A74VhFfX2m1
	0SJfiCA3FY9XUbs3jhK06phufCqbkAjTjwQQY993sc/xZI6lSF0lghaxux6gUrYLjgpNBI0SaWC
	398nzOLXoyUfrtV6T9vsbJsh8GUxj/fsHwErpSchq0Cu7Rv91MoVv96S/KI0CHlDIXCbNVCaYb3
	BMBU3VOM=
X-Google-Smtp-Source: AGHT+IGHdVY/wnxGdMhNhL1OPVgn4p7SEBCBWVd6ve1HnO0+EdVxRaTd0eekcDohZlNepWuhsOEXSw==
X-Received: by 2002:a05:6122:310c:b0:523:bf8b:5dc3 with SMTP id 71dfb90a1353d-52765d6768dmr11854567e0c.9.1744126988109;
        Tue, 08 Apr 2025 08:43:08 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5279b6638f7sm420957e0c.38.2025.04.08.08.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:43:07 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so2360928241.3;
        Tue, 08 Apr 2025 08:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXPNCFZ6muz4mcw1GV8FT7NwjOGm+u/9b5EXh040GuboiMvf2cg1L2CscKsa5tpnerv2PdkuEVd3jDKvY=@vger.kernel.org, AJvYcCWFU1IvxuwrD750nm3BDWvuGQg+TXGUjQWvN2LxB0N3qiWtFwJD0z8nxBzJfihgt0eGeC1VPjgiXQyN@vger.kernel.org, AJvYcCXNZegFmnzR0oSBSa29deMYxKxokLYW95f9QiEZtCi+N3TVthqVqdJxo6AZC2rlRb5y+/hda3wbom//w+h49wUpUy4=@vger.kernel.org
X-Received: by 2002:a05:6102:3f11:b0:4c3:c9:c667 with SMTP id
 ada2fe7eead31-4c856a2d156mr14464779137.24.1744126987419; Tue, 08 Apr 2025
 08:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 17:42:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
X-Gm-Features: ATxdqUFmBwGMbXbgaFjq5IIWz6pytzMIZ8IPfFxKT-P3pDL-WzZ7zQs69pL5a0Q
Message-ID: <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Shimoda-san,

On Tue, 8 Apr 2025 at 12:40, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
> >
> > Reorder the initialization sequence in `usbhs_probe()` to enable runtime
> > PM before accessing registers, preventing potential crashes due to
> > uninitialized clocks.
>
> Just for a record. I don't know why, but the issue didn't occur on the original code
> with my environment (R-Car H3). But, anyway, I understood that we need this patch for RZ/V2H.

On R-Car Gen3 and later, the firmware must trap the external abort,
as usually no crash happens, but register reads return zero when
the module clock is turned off.  I am wondering why RZ/V2H behaves
differently than R-Car Gen3?

On R-Car Gen2, you do get an external abort when accessing hardware
registers while the module's clock is turned off.  Has anyone tested
usbhs on R-Car Gen2 recently?

> ----- I added some debug printk -----
> <snip>
> [    3.193400] usbhs_probe:706
> [    3.196204] usbhs_probe:710
> [    3.199012] usbhs_probe:715
> [    3.201808] usbhs_probe:720
> [    3.204605] usbhs_read: reg = 0

Hmm, did it read back sensible data?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

