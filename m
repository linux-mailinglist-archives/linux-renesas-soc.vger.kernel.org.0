Return-Path: <linux-renesas-soc+bounces-25287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF7C8F4B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6463A7C41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 15:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197303375D1;
	Thu, 27 Nov 2025 15:32:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387533711E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257539; cv=none; b=XGCE1+KdrzPcHKz/yR1Nsf7FFWfnDaqBfxKllWeWgq5IwcYIw8sQsjDEJOPtCHSJmrwQfwnbNEhtYovRbos9iwAxBiH/PIojER9LFxl9y9XEO07mfCwsOVgFda9BB8TRIr8gnYKSOsM1ScViVbVNAX2iUk3FmF0PPpqTiE8OBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257539; c=relaxed/simple;
	bh=sHl5pwlmEItohvFZHZI1KjlDkMBVN2T/fYskflBGJd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaDIkzdBdeFNKEHZdfdKXbg1Pa0GL7lwmfe2CXnrm4MMsFt1NNdlP9DeNlZ7TR0Xr2Cs0gn6pxavkG5jZg641OOBI2jrz5o10Xd5jb0CCCU4rVNbaeEUqEWkgPlg1iV/MHPfGni79cg8qri3gbaN9uZuQ8dp7p7aRU/qWakkeiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so362596137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257537; x=1764862337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrz1X36yjHl1z7T/FMljFcnnUdnxdHtX5H28vUmRBT8=;
        b=czcW+RMxgVS0mHbQ/DMrlFUUlrPQYNA3ii7RDu7m3iUspHttS/UX5ULjFrez6t14ec
         M2ES+jvW3KXwil6kyajstXS8sQRjuPt0eiNzWDziFIr0qF4h4GcC+oYqLdTHy4n34APD
         Y3ERWflfoG//FzJrwWwiWPklK1R4C6xEEgWfx1n/R93Wka4/jaL6WpOwHB9tu6lCQ6CA
         eXiELqlxkbZnaPDbl43XYZiDg3Ec9aiPFkOkCSDAqHF5xF8Mep2pkVfSpYbXi0bDyf7O
         wMxx6pZ2cfkRH4io7tYuZyhaJXkw1fiJFqQriL35I9GOyjlM6x2Ggq4NLtFMGk3+0vWV
         T9yA==
X-Forwarded-Encrypted: i=1; AJvYcCUCvIlhxX8bL0U5usrnYbRUMtZOH5I2k4wvvKT/0i685f1rRmQGIFBfPpRJ2HxmcLbbTebCAPQvFj1nql4XfN7ifA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPZ46JCgU02kbUDP4oQ2/wVgXKBqqmrRYqgSZRPvgersDhChz
	l8+WoCjdGSGhI6a6E0M7+CzEO3D+Z6mJ8VhnaOXnjbnAY7KJ2AZjWMWWWPBbKGwb
X-Gm-Gg: ASbGncv9/QGFg+EtkgSpCN179Xz0FZkyKKZCWbO4PGdOx736U12/SXIKM7Zi2xE+jmm
	XisYc1izNduMfP54VYpxtlML1sCbmAmRZ7lcEMirq2I10bt0tvccGiFK5ld7boC1yzVdfy2F5bk
	bZsSUbsaBf3DYRbZ+WeAIdonSIJau5bKgbI/V8iMJPa6rV50PsqBj/yGvAd/iMJcYQBOldc8tJd
	VkvKA6LXTdsSy7kpnZGNF7rHPYIIeP/nwBw+xFIehTwoyoFHg+0tbC2i3pOWPxAatNI+RhAfXSd
	IRBXhAjyzjNNBCG/wTsC/RWyqXbS8TSP2h4vuxNQNjFURM4fdWuaD2ozExBBZ85uYhtHkvXgWsK
	fyO+JPYGyFYSuhtz+isTO45rk+XgjvQ6pSsoZZCy0NFuP/BSMZqtJZIp/fCemqKHtwMa1CJM0gk
	IMj5/GeWykqFAv2QwLIj9H8nN5X+oCmuKdIneS9k30o2OHzhaT
X-Google-Smtp-Source: AGHT+IEMqZPTy/7DqhGQEGSnyEmqz7UHU0Y2D2m4ust9hXHxAr8iE32gJuKKzFCkAMbkC00/KNCU0Q==
X-Received: by 2002:a05:6102:8004:b0:5db:faa2:f3e1 with SMTP id ada2fe7eead31-5e1de13b857mr7461542137.15.1764257537137;
        Thu, 27 Nov 2025 07:32:17 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d94f2d2sm597468137.8.2025.11.27.07.32.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 07:32:16 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so362558137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:32:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI0JLi+LXi1kSQ7XfXbynIuGaIAqDDfSWRIb0HDvannhyb8GTkJLoyYyCUld4cYBpn7xG4r017E/jeBgh4eA7U+g==@vger.kernel.org
X-Received: by 2002:a05:6102:5107:b0:5db:ef30:b74f with SMTP id
 ada2fe7eead31-5e1de0c07b0mr6881793137.8.1764257536406; Thu, 27 Nov 2025
 07:32:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
 <20251119143523.977085-7-claudiu.beznea.uj@bp.renesas.com> <c24nuqtczt2jxekl67boramlgullnxftwjfjlwcjjnyv47ykwc@tlpojiyzdk6r>
In-Reply-To: <c24nuqtczt2jxekl67boramlgullnxftwjfjlwcjjnyv47ykwc@tlpojiyzdk6r>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 16:32:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBG9VFJsm6mMAUDev2d_+2xta74PwN791_NV-=rZhyHQ@mail.gmail.com>
X-Gm-Features: AWmQ_blQk_Z_QzvT5Ty6xKUF9xdppK3UfiIhR9w996WFFGRzUjAlrY7O8yUugfs
Message-ID: <CAMuHMdWBG9VFJsm6mMAUDev2d_+2xta74PwN791_NV-=rZhyHQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] arm64: defconfig: Enable PCIe for the Renesas
 RZ/G3S SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 06:55, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Wed, Nov 19, 2025 at 04:35:23PM +0200, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Enable PCIe for the Renesas RZ/G3S SoC.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Thx, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

