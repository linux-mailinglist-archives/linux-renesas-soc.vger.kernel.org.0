Return-Path: <linux-renesas-soc+bounces-16627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C0AA708C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 13:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8D801BA5351
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 11:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE2022A1CD;
	Fri,  2 May 2025 11:19:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116A1E5B62;
	Fri,  2 May 2025 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184799; cv=none; b=ejGFi6CkxsyRyoCfHxNU3AufNu0zMF9vD+GOVA2+N3UKkT5/wl8AaZsoxm/cVwJ46Zyaoa7D2+uApqx/KoQVIAqk3EI2VCouIHIBO6tQjqUM7MoTDV2+bKihQKfIPp21Q4BJj/1utm90mDBVY7R5+Miapi36p6cNkH8Gd+VJ5bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184799; c=relaxed/simple;
	bh=lpZTnwBYo+XcjeWqAJh2b7NjtWLdxgZdB98h4NadBCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/PIqn3gOu+StQZbktu70MjqzaETzJeXPG490EkY2vjl+7Qq4q6NiX35X32ap19ic2OvAUXhtcYeedJDBxxqVSjGrF3aim+KaTfm5vMBYZwzmNx/nv/ZGs+yjV1hFpk1sa2ZBSfGgtED6izK43BGVIIB0V+cDRB1CdcJ+gen32c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d42f08135so445041241.0;
        Fri, 02 May 2025 04:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184795; x=1746789595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0JAI6sZd0uHFTWQQ5aY6+EjRWeUMf3jsosJ74kHZHU=;
        b=UcE2S86gywkqd9zryhVpJDH2wiXMjQxMiB/p8Ik6htXVIPN2u8U89fXvutC1gCt5V5
         t8UN1hWX9VJbFkBaPcjh+dvQa7qvg7XKRF4hItweh4mdpGTj+jvW7ZUtaB4GnFP825ko
         qQmAZwVf2ybRf+aNuy4Wys00QQen3MM0kqEn7U/sja3HHFIBUbpWqNVoOz9dJ+fG0sxe
         2e6nXWQNwFLHseL0SDSGTD2eYi7hGDqge56xcXVyNcX7ass+KvZpRh66PiTGIiWVLnt0
         JYUa1IQ8MEQ1VHWhPX0Zg+zeo4ANbVV03TrhCFjA0UfuRAIAkZ2srd4tQIiU1xyc4vTC
         pT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVePXDJh7/oY1J6bS78HDhvznfJv87urF/3NFpVnNekxyX17v02WaaU6X6SP3sqrtej6VgtKJAV06o=@vger.kernel.org, AJvYcCX1ur5CQJhDkW01TGHpu9RFn3pfPkYVe0TOpR9SNVBP7zRDD2wGbUWt1nWAUExii3FeKUXwiOQkgij3ROrBjVxhPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrjxzWl9ZGeJmp8XIphOfum4b6lTnU31QSwZeOPaXjOikr7Tm
	DjsNK3Z7EWntk4qQXNvCOVcBF+T0KTo9OEho/JU1hcnqVlfzVaQA8giXnjmV
X-Gm-Gg: ASbGncvyXNNKwqdUN7IeTRJykEkcOIYt2/qSwXawA/l3CYDtK7C0GbIbL/RQTL2/Wlr
	3JGSwCLyYpUMbD0IYLXOlvxSoT8jo5pfyVF4Cdf9VuEJPsCoh/16IPtfS4ZET1mxzs4Z5K/SrcV
	yctpgEEDtdPLVyGXcKufT8Eijg5fr6/Hei3MRS6m2WpGgBVELf5vvrbXubF7FrMXnkgLJxKgwLz
	/7T01Ig0b/S5dcHuIPwttkcKhQ1i08t4q7nev1f8ccgClk8hiQY2ZcAI52NTWoKzQZwcX489RWT
	AmAO3PgdWQgROEbJH8ZH66G3eDfz184n0+WSZqb+bD9ef70VpKNtT7qBnAnHI8ve8NWdhNRlCrw
	RCSM=
X-Google-Smtp-Source: AGHT+IHcwORHTEMsRFv3rLpD0Le/3kwQ3FWEW/mx71d/pLamM6gTSH1JHfqG9K6UjHbxaOvcFo9qhg==
X-Received: by 2002:a05:6102:5249:b0:4da:ed5d:e2e8 with SMTP id ada2fe7eead31-4dafb677d98mr1275396137.18.1746184794487;
        Fri, 02 May 2025 04:19:54 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780b293dd7sm243469241.34.2025.05.02.04.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:19:54 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d42f08135so445033241.0;
        Fri, 02 May 2025 04:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPYFzho3v1vzARdiLJnuE+nkgktrn3iF6jZBAwWalnBiaBlvZJD3pHDLbnR+5Huc5ukGcsABPIrxojB1x/KQpAYw==@vger.kernel.org, AJvYcCVQBnDmrOITBpHEc3xTK2l+WPkbGXY/Y6wQ1Z/KaKk2Qx0q8iMHkVWK/BQuI2iuiRKnrJC/S8kMrGg=@vger.kernel.org
X-Received: by 2002:a05:6102:4194:b0:4da:fc9d:f0a with SMTP id
 ada2fe7eead31-4dafc9d1269mr781602137.15.1746184794117; Fri, 02 May 2025
 04:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be>
 <c766ba851cde51b70c8516b921c5d1e2dc30c198.camel@physik.fu-berlin.de>
In-Reply-To: <c766ba851cde51b70c8516b921c5d1e2dc30c198.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 13:19:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRU4LVKF-PMjWgnx+dyAUoyYkD3SFXjLSc=niZnkhUsQ@mail.gmail.com>
X-Gm-Features: ATxdqUEUJKATG_ugSpOOpmE7syxVO1ZJaxflX1C7pK0RqUZSi1eS1VrfPbcmCAs
Message-ID: <CAMuHMdVRU4LVKF-PMjWgnx+dyAUoyYkD3SFXjLSc=niZnkhUsQ@mail.gmail.com>
Subject: Re: [PATCH] sh: ecovec24: Make SPI mode explicit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Fri, 2 May 2025 at 13:18, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2025-05-02 at 13:13 +0200, Geert Uytterhoeven wrote:
> > Commit cf9e4784f3bde3e4 ("spi: sh-msiof: Add slave mode support") added
> > a new mode member to the sh_msiof_spi_info structure, but did not update
> > any board files.  Hence all users in board files rely on the default
> > being host mode.
> >
> > Make this unambiguous by configuring host mode explicitly.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/sh/boards/mach-ecovec24/setup.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
> > index 6f13557eecd6bb21..a641e26f8fdf7369 100644
> > --- a/arch/sh/boards/mach-ecovec24/setup.c
> > +++ b/arch/sh/boards/mach-ecovec24/setup.c
> > @@ -825,6 +825,7 @@ static struct spi_board_info spi_bus[] = {
> >  /* MSIOF0 */
> >  static struct sh_msiof_spi_info msiof0_data = {
> >       .num_chipselect = 1,
> > +     .mode = MSIOF_SPI_HOST,
> >  };
> >
> >  static struct resource msiof0_resources[] = {
>
> Is MSIOF_SPI_HOST actually the correct identifier?
>
> I'm asking because the commit above lists only MISOF_SPI_MASTER and _SLAVE:
>
> enum {
>         MSIOF_SPI_MASTER,
>         MSIOF_SPI_SLAVE,
> };
>
> Unless the identifiers were renamed a few years later to avoid political issues.

They were indeed renamed in commit 1cb3ebc417fe6cc5 ("spi:
sh-msiof: switch to use modern name") in v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

