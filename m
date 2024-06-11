Return-Path: <linux-renesas-soc+bounces-6067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E054903C21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 14:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 917BB28483E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 12:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCD6178CCF;
	Tue, 11 Jun 2024 12:45:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50A238DC0;
	Tue, 11 Jun 2024 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109935; cv=none; b=ZWkMLT2Y1TG8OFn3PAIyP2JxvFaYWakGp4XHccRBvfKxdpkr9b5aibqQtSdH8tRx8vWx1gvhT4ckjqwwND5obg3L+4VGVkhPJdfIAua3L8QAyJPI0Fs8mkI5o+oXTpbBWbSmQ/QRLLfxEMMrbLbI3mWA4VW7Sr+XQX6W2RqegFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109935; c=relaxed/simple;
	bh=nY8+G6+Wc+iKEOD8LIKa0F5xqH0+KD8ciWBL2bCrMIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpuMAQeI9gZUvZZkC9ovyCpYrWO8EZN2KjL3z7hxJ5PoFWnwaCabC1tGXd4hNQD/UC4njdguYpoVI1xah1mmj9yD2+/HjG2L2FUILUTXuIAbfeIec37h9K6FJGjYqSIGg/WO2nEQiDg4NPNzH136WrV9qmZ+IhT2KQlRwuY6xNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfb3ff45c06so1154303276.3;
        Tue, 11 Jun 2024 05:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718109930; x=1718714730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA50fIPVA2O1q5A6lERTjC6jOEdlOMiNnypF6hx5p6s=;
        b=YTOWC8DsqEjvA4YgO02pMEUt+TNjeDZPbhGRq2F5DJN6qz1x1t+wNd69uYd00YwbRE
         0F100BW+6RW/mCbvlgqcJ0W/2XEw1V1ZZIb3vyv+6IsE5N3czc7xVsOxl/CMTkA0yNqH
         dK+0yNrxONddK8C8tvOEYElpHTDkiX0B3Rch/F3ZlxYySLSJGndEJwd52EowZifRKUI7
         orMvPA91GCAL6tWL/XS2hmeRnGGjcpgQZ+Emd9GcSo5qjYFIjjCe1AMoCmrjPqJGPsfq
         W320Pd5gKYx2QWBXqodpxnPApRNWbT3uWe0G02S3pRFtEZXuV9TMhZf0K5zhluacuxcx
         H3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbdw4AHKzPp0OWazSWHKNuV4VSShYfOLsjm2NG6AQ/g6isqB2FQgNXHixETqaPl6hAHP4Po3l1uHR/uJuB5F360EaCecW91g5F2afAb6LKB30N0aeE4UUyciTnP0ss3W6BQyxH7gzw3gaFdeOosqg=
X-Gm-Message-State: AOJu0YzzFyYBycmF3dFyxOcKigDtV3qwRoymKLPS1OxCWiWz2LZkVc4U
	gNmkS6pXkrjkUfmy3jpf0Thm+V0vFiKHkLqhW4ZKNLuQlAOTTv1TfddVLCQ/
X-Google-Smtp-Source: AGHT+IEaZi1qP8PiLgXfz3IwsNbouC/zw/oGMEkqXMbGzcSbS+tOupwYkTAfSrC9cre8t+5N/59xOw==
X-Received: by 2002:a25:bfc8:0:b0:df4:d29a:6897 with SMTP id 3f1490d57ef6-dfaf65c55aemr11105864276.35.1718109929625;
        Tue, 11 Jun 2024 05:45:29 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfb0138fd2bsm1512911276.51.2024.06.11.05.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 05:45:28 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfb3ff45c06so1154178276.3;
        Tue, 11 Jun 2024 05:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPH8wW/2DKVkKayODXxO6QHartBiuUNLNIUxIBXW0u2rZuFHEcDZNggNTbSKxXkyp8lKkndgDfoVcnpOwlpt5iom6eNCQEVhE0FJZLuSGgnVgxKwRYVMlDFoIIbjf9JSMgX/0WO+leYQil8Gwj4sE=
X-Received: by 2002:a25:744d:0:b0:dfa:528d:e8f4 with SMTP id
 3f1490d57ef6-dfaf65c01c4mr11427597276.33.1718109927736; Tue, 11 Jun 2024
 05:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240316023932.700685-1-liuyuntao12@huawei.com>
In-Reply-To: <20240316023932.700685-1-liuyuntao12@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jun 2024 14:45:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMAg59p+hzeLG9Uc3X55Vt9ccNy5BRoPX0RJbxrMOFLA@mail.gmail.com>
Message-ID: <CAMuHMdWMAg59p+hzeLG9Uc3X55Vt9ccNy5BRoPX0RJbxrMOFLA@mail.gmail.com>
Subject: Re: [PATCH-next v4] arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arnd@arndb.de, ardb@kernel.org, linux@armlinux.org.uk, afd@ti.com, 
	akpm@linux-foundation.org, kirill.shutemov@linux.intel.com, corbet@lwn.net, 
	rppt@kernel.org, robh@kernel.org, tglx@linutronix.de, 
	linus.walleij@linaro.org, maskray@google.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuntao,

On Sat, Mar 16, 2024 at 3:44=E2=80=AFAM Yuntao Liu <liuyuntao12@huawei.com>=
 wrote:
> The current arm32 architecture does not yet support the
> HAVE_LD_DEAD_CODE_DATA_ELIMINATION feature. arm32 is widely used in
> embedded scenarios, and enabling this feature would be beneficial for
> reducing the size of the kernel image.
>
> In order to make this work, we keep the necessary tables by annotating
> them with KEEP, also it requires further changes to linker script to KEEP
> some tables and wildcard compiler generated sections into the right place=
.
> When using ld.lld for linking, KEEP is not recognized within the OVERLAY
> command, and Ard proposed a concise method to solve this problem.
>
> It boots normally with defconfig, vexpress_defconfig and tinyconfig.
>
> The size comparison of zImage is as follows:
> defconfig       vexpress_defconfig      tinyconfig
> 5137712         5138024                 424192          no dce
> 5032560         4997824                 298384          dce
> 2.0%            2.7%                    29.7%           shrink
>
> When using smaller config file, there is a significant reduction in the
> size of the zImage.
>
> We also tested this patch on a commercially available single-board
> computer, and the comparison is as follows:
> a15eb_config
> 2161384         no dce
> 2092240         dce
> 3.2%            shrink
>
> The zImage size has been reduced by approximately 3.2%, which is 70KB on
> 2.1M.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> Tested-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit ed0f941022515ff4 ("ARM:
9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION") in
arm/for-next (next-20240611).

I gave this a try on my custom configs for RSK+RZA1 (RZ/A1H)
and RZA2MEVB (RZ/A2M).  According to bloat-o-meter, enabling
HAVE_LD_DEAD_CODE_DATA_ELIMINATION reduced kernel size by almost
500 KiB (-8.3%).  The figures reported in "Memory: ... available"
were even more impressive: 1032 KiB more free memory than before.

As these boards have only 32 resp. 64 MiB of RAM, and some products
even use RZ/A1H with just the 10 MiB of on-chip SRAM, this is a good
improvement to have!
Thanks!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

