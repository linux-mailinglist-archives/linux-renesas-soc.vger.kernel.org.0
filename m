Return-Path: <linux-renesas-soc+bounces-12501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E877AA1C3F1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 16:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AFA43A0650
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 15:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6BC208D0;
	Sat, 25 Jan 2025 15:10:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAA182B4
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737817852; cv=none; b=l4O2xZ9WHLun8V/kvggK0QACcsEPDw6l+SFVV7CPO2txutb54TSO75NUPPWsM2X4ruTpIJ/vzS+vYvLKMvjsPELpWMNHhuB/jTqpTWri0AhLNMkAi5xeHX4zK4LWImJYWbQHbIMKPixpS/wPhIunNNDbbqRVQCn61RWhsOnpd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737817852; c=relaxed/simple;
	bh=knBQ7Z+0YsURjYr+4Jt4Y/TdXqxO9OsvMnLSpNmii+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciiFs+sSvz4T9rLFx9x2qHXUliHp/S0LiVM7MvH4GkdfzgDiRR8dr5lNs1zejJBkCsx3HKbteLQqIgVYaIoNmiy8s28pl6J9xXngpGNGpz1RxhVmxiCcpxWelvxDhJmgAzmHOg/eSsWW2FKUKkq2RZeU1xyxHieXMJ1XmgC/+cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6f75f61f9so447239485a.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 07:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737817849; x=1738422649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl0y3ZRFBNaiiUtaKMgetw1t+oUGHgdioy/xMc9ew8w=;
        b=FGNFc3rsGn/+m1ioZzSaYuseaPMWXiy8J2AlYFZw6hj2tqkm2G3vBqD5pSLMEuYvgp
         SOQRDsZplOkkxTUJqUPL6s/C/6KwXkKrPLhSl8SXJvy7OKDMsPF17q71KBa+R/LVUbOi
         XWK3LrfL9omaYhlMfnEQY0Lf3mkTBLCJq+t5Y69ZVM61rALEySPdsyjJ4aCxOr639iRV
         6vpRxQPe8vzKUH9mmXOl5js1zcTfmwZSmR/z+aQ/QI6abZn4SGRCDIusobXI66ZYUe1q
         hxqJzvpuX3WviUv+4nhA1rzVnXZgTpsB71n0KAlAG5dzfH6qSnU7pjK58fxaaJIQ2voc
         Dwlg==
X-Gm-Message-State: AOJu0Yy9DX/VEE+fE96UZUh8Yg/IbasPVgeM+QHmsoFNIpDPA4nv0i7V
	NngNLUgvwqt+kFTi6g2ZQrR+Tn6KqCfYKRVVaLOhKF16iRoPSJXWukBY3fbA
X-Gm-Gg: ASbGncs5sOwE5Zd6yxYIYC7NtNmhQex3qyNg+/jjZabdWIdIAzX3fxfTQAHTtC3mBS9
	pQHZs7x5txJLm3DgZToSGOMxEntv5cOSJOsx13zr9HZrIFY6gsU/p5/M0PF4GPBSq4PbkUWTGAh
	HsWna+7Q38KiHirbTA6fBOMzNgJyCbMOLFF1qjCvOhXwyTNP6DiYyu4+4wF0mKm3Z4tGvb3MAy5
	+LL+hzjjnHCVHMsgXysY0UyEkVRt8xfSTCzZsfD5iihpGtoGh1LD/Vqds6HEhhTCUOrA2sLiygq
	KJNe+XBreOKsYnDHA3fahRFd+9XztcswFMKnRXjY28wPBgj1Bah3/Het+g==
X-Google-Smtp-Source: AGHT+IFVxj6mVUpWCBR9XbUAzgYjhdcQZhkHVrBLxbU6w3PTzoe+UeLjui65kxybTtRw3/dluIo00g==
X-Received: by 2002:a05:620a:248:b0:7be:73b5:b303 with SMTP id af79cd13be357-7be73b5b466mr3787860485a.31.1737817848618;
        Sat, 25 Jan 2025 07:10:48 -0800 (PST)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae7dd05sm204272085a.13.2025.01.25.07.10.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 07:10:48 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467918c35easo47562401cf.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 07:10:48 -0800 (PST)
X-Received: by 2002:ac8:7f4b:0:b0:467:7fbf:d115 with SMTP id
 d75a77b69052e-46e12a621a8mr489273651cf.12.1737817847878; Sat, 25 Jan 2025
 07:10:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 25 Jan 2025 16:10:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
X-Gm-Features: AWEUYZn0QS7RZLs9ffY0rgAQ__EcUHBIhtag5ev1XTEwN-1xPhngzf26haF0vhA
Message-ID: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

CC Linus (the funloop one ;-)

On Sat, Jan 25, 2025 at 2:03=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> During review, a concern was raised that the link explaining the
> algorithm might get stale. Meanwhile, the site has been archived in the
> WayBack machine. So, use their link which is hopefully more stable.
>
> Fixes: c320592f3f2a ("bitops: add generic parity calculation for u8")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -254,7 +254,7 @@ static inline int parity8(u8 val)
>  {
>         /*
>          * One explanation of this algorithm:
> -        * https://funloop.org/codex/problem/parity/README.html
> +        * http://web.archive.org/web/20250105093316/https://funloop.org/=
codex/problem/parity/README.html

Is the plan to replace all weblinks by webarchive links as a precaution?
Even websites backed by big companies may disappear[1]...
Putting the webarchive link here also impacts the funloop.org server
statistics, downplaying its relevance, and possibly even causing an
earlier shutdown.
The URL can always be updated when the original site disappears.

>          */
>         val ^=3D val >> 4;
>         return (0x6996 >> (val & 0xf)) & 1;

[1] The "LessWatts.org" T-shirt I got from Intel survived the
    corresponding website by many years ;-)

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

