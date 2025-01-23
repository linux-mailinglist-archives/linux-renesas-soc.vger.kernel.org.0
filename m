Return-Path: <linux-renesas-soc+bounces-12392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 449FAA1A4A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 14:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DCA5163D3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780CE2010E1;
	Thu, 23 Jan 2025 13:06:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7FE2F3B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737637573; cv=none; b=JZTZo5urgpbhgwSZoLX1+a4gloGrWfFmACxKmlevevpATkWmaKCu1QFaiK4dy2RilAetiK1D6M99IcVeDDSN3bOxJxOIg2mAH4C1efYaKTTESlqcGzpjfmIOvUQ8M3KsXVOquYmjIGEXTZxCAw/E22hQ14YrOclIURxafnwkbLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737637573; c=relaxed/simple;
	bh=oXOzpzMrmmf0TwbxXHtms5l0+sEz6mWo86dIYop0ByQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sa/e6d2o1nHXaHQh8UvG8cQmizt6hTS+K7jGaBChxo+W8nxA2VRFmVUe+glbi3sbPuPTFX9T+fyP6aGix13B/w4z/8OrXmFerBu8DYGzYPkJixc/R+yrHZXDua4o3UDKnK2wry4HEz0v57YxKLwG0drTesEwJeoTY0zSDdLk3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6e9db19c8so76913085a.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 05:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737637570; x=1738242370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiygrgYsO739skaoPESqIEGzSo4IJJ9SbsxwNuEpwL0=;
        b=cfJ2548bjtZMXBuItIpx0+3hCTIGnJdu+/E+YhLpAlr3P6x81bZN3m1xpgk6CwZ6OS
         LWJd8bYFIiIKgh5b8BqTK+0uQw6Dg46YvnLZt8jgy1bGKXGoEiGGtEY7tUQ/LQY5VfJn
         URl37OqXJanmQ9Ob+s232hYOEBWWoj95t7SuY0UqP1sqbEEyu1V/4o8g4UTfwLBuQXLD
         JutjyRyFfxK1fu0ue7jOdQ/JFM4e+GDqyzRExVS15Eg7COonepD9kMDzmYRfrD9/4W0H
         rfmzs6cJp1v3ps15mO8pntvuZUC+ODB9uDE/PBZH0U1pp1svPHhRv6tkW9bTbQdfhgYw
         YWUw==
X-Forwarded-Encrypted: i=1; AJvYcCUNTb7GTW8X4uJ1qcAZafB2NmXMeLVMOj/H4x1P+rAFMeSVB5X2RCqHe4yMmqpnKU6Ww/qZItnaLNUlCmhny3uceA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5qc6aae2gkjJCus93wFSkHyJZ9zjSC7B8B8wBv8fqlBRR3+jO
	zgrds9go66NEv/Gf6pqcRvlGxKFLTZEnp9KR1ZJ/F7yihE3KUw1mrOAX0htC
X-Gm-Gg: ASbGnctyU1xCnUsDn6MGgaDtEaNtecqiboYfYI6AzqD/ceYUMkVdHy2rdFhvY/CwoxA
	7e25rR8zNQfgfNYqTVJ/CZ4gm36HOX6XSikKXzHrwO/9l3wyCUrWsjNAPLGaI6SZoxm9rSdi1cU
	v/SZnBeHn8CGCTjQTejRrofpN2KqsHCoCtnBRA5ZFoW4rthoY0sIA5U/17UrK80sqawwM/3zIg+
	rUgn7WFxvLd5X2ONsM1GjVyy7cMxtoI552GlCcpSq9kYFq6y9rNehbE6IWOu8OShxgGKuK1PE7c
	pl807iTlKx+WOQesNTIflC/AsfQBMNp5Sd0j1JkXOcymRGU=
X-Google-Smtp-Source: AGHT+IFumPsnnaC0yRQByV6hbeAZb8FLNpE8BQPGkwRGLnsHw6DRKRCRM6rl8jKKFnpEULL7FTHPQw==
X-Received: by 2002:a05:620a:2894:b0:7b6:d611:5d35 with SMTP id af79cd13be357-7be63249f09mr3580072185a.32.1737637569640;
        Thu, 23 Jan 2025 05:06:09 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be61473d24sm763089885a.22.2025.01.23.05.06.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 05:06:09 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a63f5d1cso7898361cf.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 05:06:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRhYUwAZRC5oQkW0KuGprtJkVRPdcZxUQx9z6MWJNRedPp4GNxxnxu0m8+V9D17B5ERcW4rSuzRLR5Hm3oEmROjg==@vger.kernel.org
X-Received: by 2002:a05:622a:211:b0:466:b1fb:3028 with SMTP id
 d75a77b69052e-46e12ad56c6mr414633151cf.4.1737637569250; Thu, 23 Jan 2025
 05:06:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116153204.615736-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250116153204.615736-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 14:05:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVZghXmA3MrmM+L=fta9Rf5tjGhrSzXFH693wKkaKBKg@mail.gmail.com>
X-Gm-Features: AWEUYZkhnBAcJOrt0LZ4LxtesBsvqH4lZK5bBapycwiiMvp-1FtOceeF8qtL8Og
Message-ID: <CAMuHMdVVZghXmA3MrmM+L=fta9Rf5tjGhrSzXFH693wKkaKBKg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Supplement DTB with ATAG information
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Thu, Jan 16, 2025 at 4:33=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Enable CONFIG_ARM_ATAG_DTB_COMPAT to allow u-boot to override kernel
> command line from DTB using the bootargs argument. This is needed at
> lest on H1 Marzen to control the command line from u-boot.

least

>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks, this indeed makes shmobile_defconfig boot on my old Marzen.
Unfortunately this change is not sufficient for my old Lager (I guess
I should upgrade U-Boot instead ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

