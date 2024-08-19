Return-Path: <linux-renesas-soc+bounces-7926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489495746B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 21:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3BBE1F23BB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BCD1DF664;
	Mon, 19 Aug 2024 19:26:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C01DC496
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724095608; cv=none; b=TuGYQhxyUHhbxSClxtJA0fuRduw55irhmhcC1Hm0x36pZC1DxI/0LTS7xhq1ESXucgl7evAqHK4rw/gQvO0sjQQu18QXzl7TDErrZTWD1kpbJ0BK024PLdMJU8SkY+GRUWM9cTCq6yif+eIXwISpJBTXd1xxR4EZDl/hrAoEqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724095608; c=relaxed/simple;
	bh=rxAVNFMBh3i2aD73+UJcIQDAgEE0KR2hsAgsJEYl1Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5rlpatcByi/EDwPEF0mHR27nBBJs8ssDqAPoq6FRpMsDf5rHJETq7DyScM6XmLZaasXAvKby+DfaeH/DyBZX5bYa3qx7Y/NonLwkf41OQdg3D2MSHXTEI70K0qLkyCyxsZPn0rZ1lG5V1kEwUBtkDZxWDf9ZLS9LUpqQhNhi5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f0277daa5so6046704e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 12:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724095602; x=1724700402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTpZ8ZHX2MuhjxsxTBFRBL/fJDqY7h01eYaZIRVd2q8=;
        b=N9RNaiPo33JV3cTjgjIWc5BbUe6gOy00sx2Q0lPzlqRoyLDGskkQoUYhEGS3xXDcwI
         Fl266Fmmc7lKw64q5425+ceJXvcK+0qb/UAVryXtjRpM3G/coOjKfxf9amCgnGiJAbDl
         6U5MIuDAV5Vh+tLeI2xWUIpyheJlFBqLwG3iAERRyzujJu/ue2ESBaS1VjJ1eOmBocgU
         rChqRWijFygLEzWMf5cwBxa5re3rI3LwsYwoii6csjfQhyXue5SVhR+9eT73lKhAfJa3
         EUaQeMwxjpsBOl2ubJ93PVvG9JGESp+B4dnYGJ4N94ZeecDZennx+dBFACLydO6r0nEj
         clAA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Y7l7VHLV1HUb3K8g5WokRd/89KFuyRx0NPAexmXSaOjCymgSQ2DjUcyiUXxQYLufaZJPgNRWRmg0t5Q0H91rAjIMuXSSE8kOSD6Zbk6qNLM=
X-Gm-Message-State: AOJu0YyyfnElU19D4veNlHh55ZWLLD6dI5P2sKsDBfXFPDVmul6JUpYp
	+WNB+5rhoVXuBSKqh1DrvOWA8LD9/TRqIbr/9/jE8f47A7E3+Td3rgNSvaQ5sCU=
X-Google-Smtp-Source: AGHT+IFI5b7e9QuBI8WYKuC8UWB/FTLZbt2hV0+GTxr1OhE0bELiQu7SdULXgZsseCSYLfX9KtKbhA==
X-Received: by 2002:a05:6512:1081:b0:52e:73a2:4415 with SMTP id 2adb3069b0e04-5331c6dc95emr8079124e87.46.1724095601523;
        Mon, 19 Aug 2024 12:26:41 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3ff322sm1568790e87.173.2024.08.19.12.26.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 12:26:41 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5314c6dbaa5so6251553e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 12:26:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCnQFof8gmdbh5aWXjc3hvGjQKY6bectqqmkxknCM7obY1WwHVfgnso0Z2SphHf+R2KYLGIvzuQ/ORPfZ23i6mzP6uEiMkXH6DZ+CmMqxT0n0=
X-Received: by 2002:a05:6512:1096:b0:530:daaa:271c with SMTP id
 2adb3069b0e04-5331c6a1a7bmr8283007e87.16.1724095600967; Mon, 19 Aug 2024
 12:26:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <651189ff-bb02-4c6f-94da-fa2eb4dc0e49@de.bosch.com>
In-Reply-To: <651189ff-bb02-4c6f-94da-fa2eb4dc0e49@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2024 21:26:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJT8-hUWrbQEWM4Dj_rJOxvCcUpksL_8EKn19MEstnmA@mail.gmail.com>
Message-ID: <CAMuHMdWJT8-hUWrbQEWM4Dj_rJOxvCcUpksL_8EKn19MEstnmA@mail.gmail.com>
Subject: Re: serial: sh-sci: rx overrun errors and hrtimer rx_timeout?
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

On Fri, Aug 9, 2024 at 9:27=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
> short: What is the sh-sci rx DMA hrtimer configured to rx_timeout good fo=
r?
>
> Long story:
>
> Using drivers/tty/serial/sh-sci.c (on 4.14.x Renesas BSP) what is quite
> similar to [1] we got reports about data loss on rx large files (test
> case rx 1GB file):

[...]

I'll answer the short question ;-)

When RX DMA is enabled, data is received in the RX FIFO.  Only when
the FIFO is full, an interrupt is raised, and the data is received by
Linux, and passed to the next layer.

So what happens if less data is received than the FIFO size?
In that case, the data would be stuck in the FIFO, as no interrupt
is raised.  Hence a hrtimer is used to make sure Linux receives data
from a partially-filled FIFO when no more data arrives soon (within
rx_timeout =C2=B5s).

I hope this helps to understand the problem you are seeing.

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

