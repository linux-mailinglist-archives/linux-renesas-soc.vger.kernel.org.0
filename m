Return-Path: <linux-renesas-soc+bounces-19730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8042B14B92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 11:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD47189BD53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 09:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7490921D599;
	Tue, 29 Jul 2025 09:46:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869461E7C27;
	Tue, 29 Jul 2025 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753782373; cv=none; b=jh9T5MRb4qe+u92j/eZjOEJFIpCW+mNHOpBW/WdKMAlDsTerOQ37xCmsSiyqbdSQ/KJcaKPEfttvJ+oIz5+Soq6CroU1u9GubtQSf7NibHN3HbkRGNCDY1f8Tror0Uv33mXiopAyxok8Myxjtq/J/EHVic1tpydDP9aMrB/uGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753782373; c=relaxed/simple;
	bh=QTphEvzFOn/c7NWtOZU9iHWKZcCbV3W6dWi3ZrNCRJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S++6ci0ZrCaWEGaFrmomh32xXP/3/y3G6kXZa/X++aPyqlvFVwZJGWbgIYo7PeFdgDJz/aNrWUKcATjwnaqlGbghEGOfE5RhApRhdjNIbttLnLQTlVGrI9WbydwUjpyCd8ywqfGiZB1SN3pn+dVAIu7TXBmXuBH5IGRYMzrT8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-531acaddd5eso1350197e0c.2;
        Tue, 29 Jul 2025 02:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753782369; x=1754387169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VP9TyEmohsmpq0wEVjcGoMjrsBeaXcuG++k6Esdzloc=;
        b=XlRHLWgCqlk4LKrvnO3hekfksN4KZpleeMRqApvx3bHL5m9iO2avCyjLZpGSUDqUbH
         UM2/XngtWfLv1keQW+s9fHtNgs/9pptfmpuwUYAZrVX0vCvi/iB8Jtg3GfbCqfjKOYiH
         0k3yNFmKbLB7VovaeeHiCz8mCWrI0VamUIaTo9/SZrDGwKrz+kdTrm33G/q/AH3wHFFv
         2xvP4S36Bl51+at1kdf68PQQVDzccI5JgxlGnE2k8F6JMbhDGLflh5tI+VQr1Byl6J/V
         jxhnVmZTlnvbFOerCr0nJqBb4VH3NdsPZ9BzYWyxyShTlXmBeerIO8elwreoY8OTieXm
         SgcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlK6seUL7jCUsakUmZ082Hr521p4/bysc3vpp9XYsA9kDdTeXGsPGgLlCn79Tj+uWqkRzV3wQUVVfJ@vger.kernel.org, AJvYcCUsZqDv4a8ok8K8ygmTbYH6dE/WJGgLvyebaQd6bmkGNS+kyQJfAjLKSM7k2Wrtf/xICOC4nvu62ckm5+ylXv/mU9I=@vger.kernel.org, AJvYcCV0Wk60pfet2pMQiMbW1X86O1bb3Zod7hLMeIGx4xiPehKs23N13ye/CQmeuQyBI7zQaNYneQLR8Bf0gkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpFa+BNoBcRMu2cUI3jAQjuk0czArgzdvPXarKniYqHA/dgD0
	m+2yvh7FNN/GZyzB1jZ052HmHdokzSM3paO0EjNnBvb38UqxOKxDTs9hv4tuO5XG
X-Gm-Gg: ASbGncsT6x6Pq+vmJNkBhmz1ng70W7QwEKLbtisOTL70DXOsFIcyXbqjavSWJ8l7VRi
	43y75fWbOPzjR9eqQJ5c2a1CIS1Lh7xuu4KEQu3wNF/ontZkwmKSQVHhAsJ+KUf8lkJ6BxJF2KN
	Usu2O9ussRInGDV2axDaXdoJL9wpDXAvAbxYX07x6V+ODtZDonjScvZPrY/RAVPgK1bwc0sB0NR
	zqXi1Kxd5LyDsi8PkTkHhqJ1YrvFMuNcEFOg3D5F3eNroBYMzH+W/sQ6/vj4lcp726wMhoprtuR
	jHC/Aib9tI+uxkcrBxdjPzDKsnzqyjJwSjJE8zrRaXZAd1Izgget/wGzMPMrLmhqPVXSJ7U5V+B
	Xac1PAP0doqtBUV0k/vx42lQRCgsuAsDo4I3dFDKhT7uf1xYS6tIV/0RxSzSb
X-Google-Smtp-Source: AGHT+IHx6ulGU3MZJqFFzDZbJ/v/XglXufzos8t1DuZHRwCbDjFfCp+5096Azp4BY4/183m3UX4qcA==
X-Received: by 2002:a05:6102:2b88:b0:4e2:c6e4:ab1e with SMTP id ada2fe7eead31-4fa3fa713f6mr6131977137.7.1753782369134;
        Tue, 29 Jul 2025 02:46:09 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88baa12baa4sm978875241.6.2025.07.29.02.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 02:46:08 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e8135adfccso1740328137.1;
        Tue, 29 Jul 2025 02:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUl1oME93dHENxVLUBMRJDE374g4vz2dkAjR6CqALCOqbsCcEr3RxS0riwA9w+vA2b21NrwChZf5kXd@vger.kernel.org, AJvYcCUv7k0C/w8SjBura88dqofwOUUO7H+Nu9dEByDrToelorUlVXAKTKXoRX+K6BxWQ1SkmaqMILEKGCyuvfBQh2Yr1LM=@vger.kernel.org, AJvYcCX2EadI5FO531Ek2BFAr1EANZD5ABvfZbS6H8ARcZibK2x1Fu05IHa+FKc2NOy7RSqmaY5C+xDUfZy5R2U=@vger.kernel.org
X-Received: by 2002:a05:6102:40d6:20b0:4fb:142:f4d3 with SMTP id
 ada2fe7eead31-4fb0142f850mr568305137.25.1753782368602; Tue, 29 Jul 2025
 02:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724092006.21216-1-johan@kernel.org> <CAMuHMdU0E_d3XMj6sDeJy8P_UL7ua-_6CnTYqvf2-TD-WXiR3Q@mail.gmail.com>
 <aIiTCDy-_EjUt1zd@hovoldconsulting.com>
In-Reply-To: <aIiTCDy-_EjUt1zd@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 11:45:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvusnNfnfhFVrTR4mF7PeBwXBz9a02KeOw_wfz1_sdOg@mail.gmail.com>
X-Gm-Features: Ac12FXwEGZ5rpHSGvvCAIwf9-TOMpclPXbnNiCmKjH3Mnx0nrSrJE1qeaajfegk
Message-ID: <CAMuHMdWvusnNfnfhFVrTR4mF7PeBwXBz9a02KeOw_wfz1_sdOg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: drop unused module alias
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Tue, 29 Jul 2025 at 11:23, Johan Hovold <johan@kernel.org> wrote:
> On Mon, Jul 28, 2025 at 10:56:18AM +0200, Geert Uytterhoeven wrote:
> > On Thu, 24 Jul 2025 at 11:21, Johan Hovold <johan@kernel.org> wrote:
> > > Since commit f3323cd03e58 ("usb: gadget: udc: renesas_usb3: remove R-Car
> > > H3 ES1.* handling") the driver only supports OF probe so drop the unused
> > > platform module alias.
> > >
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> >
> > While I don't debate the actual change, I would like to comment on
> > the patch description.  The driver only ever supported OF probe.
> > The call to soc_device_match() was just used to override the match
> > data for quirk handling.
>
> The driver initially indeed only supported OF probe, but that changed
> with commit ca02a5af650c ("usb: gadget: udc: renesas_usb3: Use
> of_device_get_match_data() helper") after which the driver could at
> least theoretically also bind based on the platform device name.

Oh right, now I see what you meant.
Yes, in theory the driver could bind before on a legacy platform device,
but it would crash on a NULL-pointer dereference when running on
anything but R-Car H3 ES1.0x ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

