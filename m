Return-Path: <linux-renesas-soc+bounces-15136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C677A76434
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C626F3AA7FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F6D1C84AA;
	Mon, 31 Mar 2025 10:31:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE21A20B22;
	Mon, 31 Mar 2025 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417079; cv=none; b=VK2her2wEsxgTqY11ItX02z9HKw0++4sy5kBgi6Kg+sCA2Yb21oOOFo95+8aRZJhb8HnRl1V5P3neIVNjlzr0FBHOSfpBk71Bb15zvXn6IOgfyYqEwA64pL5d6TGjJMf83DRqG7G/sw4ebby2SOBnJkaPOz63nikZbJoKtZYMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417079; c=relaxed/simple;
	bh=RPP7jnZPC4qWaafrPxFguEEYVUGBTP1qI48HQi2pWSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zxg6od8hGK0U4K/QUBlU3IdspMnawcoZfYhcMk5RHoHD1UtPVp0/S6fZLCtzbjjRcZ+RpXvoryaojeUKEFDhIbyXtDIiZpPyiyBKzPcndaObNWLwphd6V0hj1M+yLbR1R50I0uWXpagXWQPbw8zSoVTKMkswUDKTNMsEf8dyYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523dc190f95so2079581e0c.1;
        Mon, 31 Mar 2025 03:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417075; x=1744021875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSbaJgzeZEhF8EupN2ov7KTkMzJD+Q4sRllQViNaFjU=;
        b=KpYXKN/Rp02uwHAcOkL/GuUiF1NukrTYcBB3uQAhYM6xiEXCr2Dmh7Gpf1zc4BrnnT
         xDFF8DhP9ouCRWZEHtRIuRFNn1INaKIPNwOKHfg24Oye1AKCEjD3NfxPULpV+BW5H+NL
         arKZNWBkN/2qkBp6nFRp7wpXWevOCR7q00kQB0+NtMq69nV0Tu1PCY4JYYHIk0v78sr0
         gFIYUWknzgTwk1sX5M/SaQ9kchlk2hvF/MJfnD1m5oUqiK8i/hwAmyUEGPA9cBeh2FEH
         aSAm0khkwvje7Nwp5uLMOCmgGYtPIB4wao8TXWUEUk+qntiQyQMgVqK9lmlFO5CDa7Y+
         dSlg==
X-Forwarded-Encrypted: i=1; AJvYcCXHytEF/GRtdwzMJz4M9WufWR9IAdFgQu67r2FgdowBmWZneWZKxLJ7rC2Clqg0CFby/U3c8bYU+94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4Ntv3BOUsmhsDMwSFQMmBsP0MnJy0XplUwd1rzRz5HSc6UTa
	2mvAbHxZuPng9gFiTFdNS46Bv2DihlAVcIqvYyU0m2OKeakVhnWTW74jgZ5X
X-Gm-Gg: ASbGncuRT9Dvqt5JNDHnbXVVSYY9PenmdJmdkHXt3BhTf1ieMDVrzTlgF1We91bc6XA
	bP/SgIX9aJhDk++Ro5Ym5GX5HgQM85Nhx4prBL1fUbMxbc5QhwlE12rqjyZbAPjEkmmauUug0nj
	sdw2AlX0Ch7hKliHGAopY0gQ33BQxqN76+Ny1yzE+JUQXNE7Nki1TRtLWZQjuV3ZiHAZRCWjwec
	k/nEraUeA8nzvH0HgQVpraOikpNZ//2f2PbHkFP2z6CV/ymnYrCmQzzRJRcIZ2yGbSj+ebTwwrU
	h8NbfA91WKZkIHiO2Ea4wgwsHxY4bS5FIyBjkneO3QN/8YMDdSUpXnSU7fWPwaVpfQ/ryPjxm3o
	MQlkAkAM=
X-Google-Smtp-Source: AGHT+IFctQTdtW391ik1KAJLvpzZQ+FkdUTgCXvZrNA9JhFEgYFLcU0a3Y3fHcVF6x/qmKIvfwnYIQ==
X-Received: by 2002:a05:6102:3e8d:b0:4c1:801e:deb2 with SMTP id ada2fe7eead31-4c6d386db48mr4740462137.7.1743417074965;
        Mon, 31 Mar 2025 03:31:14 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfcaff66sm1617529137.7.2025.03.31.03.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 03:31:14 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d36e41070so1879567241.3;
        Mon, 31 Mar 2025 03:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6rUZNki+lrgHnuFzNeJdC7jV87ybbhYNbMRhaRaV9BVjbOhA0ehkVHIjNyokjyhEJswkITP7y8Zk=@vger.kernel.org
X-Received: by 2002:a05:6102:c11:b0:4bb:dba6:99cd with SMTP id
 ada2fe7eead31-4c6d387af2amr4324263137.8.1743417074403; Mon, 31 Mar 2025
 03:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330221732.56072-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250330221732.56072-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 12:31:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbh6w=4LW1G1sNLXSsCCGOMEydfPP2vMvaDZfJWQnCXg@mail.gmail.com>
X-Gm-Features: AQ5f1JpmY-t_dY1HyhXBiy9thZFRm_xlotMYlJ0GVudyd2E0xQcJUn6Vh82Vry0
Message-ID: <CAMuHMdXbh6w=4LW1G1sNLXSsCCGOMEydfPP2vMvaDZfJWQnCXg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: disable clocks if registering
 regulator failed
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 00:18, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Because the clocks were just enabled, bail out to the proper target if
> there are problems with the regulator.
>
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

