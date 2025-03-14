Return-Path: <linux-renesas-soc+bounces-14367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4EFA60F92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 12:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FAD418956FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 11:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EF11F4717;
	Fri, 14 Mar 2025 11:06:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C61A5B82;
	Fri, 14 Mar 2025 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950369; cv=none; b=NrSaO30PjngksZwZcWtLJk662g2N1os65gKg7TxSU4itj9zJ4KQU3UgX+PxXAo5OvCHwmGLITkdBb126u0QBVoY6+vUOmTpJNHP1IC7E+2myVZgO7PZ3xBKOfRKFM4wX0JOD3wWM6Ww3CpZ8rBKSvtkS51q2wyTOFJbwzxLvqqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950369; c=relaxed/simple;
	bh=lp0qxpY9qBwzwnNGNJAX05+rnm5rwC/mbVnFgljb+pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMVkscavb0Vr8vec8HkQPHUzrCRLR/Q54bWGZZU75YAOtJZ+bBQqbBAZfDQXT+jKCGP8l3gv1tbGhJFmwqNPRQz4jz4tf999jC8rL4VvA3a7iHsNkOid7BWukkEBri3/md5iMyWxIY9+V6csnmJQJw63Fe7CQ6QYhIfUNtomAkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52410fb2afeso1600688e0c.3;
        Fri, 14 Mar 2025 04:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950366; x=1742555166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCYV3M13nXALyaslQ4jI5BtJPOc5sBQ9xRnSr95zlTI=;
        b=UYIXzvuCQEAC55Djg2RgBvd1SCHk4QymUTPM1WfqRhd7prpVF44Ztmddnzk6RppYYI
         okLf1NiiCROH+muqyrxfHPNkoUTsDJtQP2uzzCBkhFIiffEX59QnTGM1IsnFxjqoMH3+
         4aH5KeAZkxMt3ddlU8afipmZeJgGkWVTUXpxXdsyzrVS6YuWHY+7FZ20vgMH1uGejjNp
         iEnuI6iVrCrS8VOtIzFEdJn89HSgkj4yL2HVPFU6RiCQZHqDP3ePIFcIpH7flvFHeKUn
         f8DQ3nBdE35YSnKa0/Ks6/Mmv+mIV9pgBwoO6ONC1ncG3IUX/XpUdBJY4Zm56eziE8ti
         exZA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Ojl35ehPmite4QUrTXWS/qTSggVNpgtoTbtUUZubosyHLtlS0xX5Q9Sn2O4aOLdGCFDREl9KLh0yVq5v@vger.kernel.org, AJvYcCVF6qvkPRe+Ri7JdPgG6/4U1zHJdn+dsE17zA51JrCzIRbENwzQlbLR1VetR+f3JAn3VWERq6RVcI0=@vger.kernel.org, AJvYcCVYAo5Dj/QmGfxnNkW2gAPpUTUXKXn7foEbW45aDBMaUK6WMrg1/vh/d1UWGd9Ii+6jJD0Opp/z94hv8Cc=@vger.kernel.org, AJvYcCXiWOsGm4q3XGUW1pxAOmavC8Za1exr38NvWma/s4rjT0eLS4ZRxWY+CIwVbn9MKraxPljrSqna0eNcqyTJiFswm8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2+2ZNzB3P7z/pnhFWlWNB47KnRAJ1Is6ZbOkJBj1QVMnsSx6
	n0fahMOed08IIfQTYJEWNgwrC+b8l8llkae37U8bEyU1T3uXAC6ts9xA+60okOQ=
X-Gm-Gg: ASbGnctJ/57gLTOJloeK4VlqYy2RLcccHsAA9C/u9Dqlf8c8go+FvSXVx6b4YyKnqsJ
	txxdeMceAhgaU7/3llfQ6zTg6vJo3Z2NOB6UinkW3t7Uw+Ftx9dIm+9t45sCeYQUriXiID9+AcL
	LnGiXJyTftH96Lb7jgMsLTcz0x8R8rraozYt5G3egWRr3wKTS2pF5ygndBUlTeXThh0Ac1d6mcs
	rqz/FoVE3NtxG5FHJxJdBk8H4qAx2f8yw8kICr1cq024u+UEGx2qTSktHxL+pKKwL6BBUx4JqgJ
	9vHfAf7UIrFdMGmzN3FTwKb/kyZ89gBDBT8l04ykjN1w3vdPrdBMLuFE2G3w6EOzZzCARqgonnM
	buz/mSd4=
X-Google-Smtp-Source: AGHT+IEm8Fs2/w5EiE5qEp219X24iQv+AEx5KbLwO2KUs0kY4cfqtLILzCN4VyOKCCXGlke46bG9BA==
X-Received: by 2002:a05:6122:f1b:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-524498886b6mr1342050e0c.2.1741950366570;
        Fri, 14 Mar 2025 04:06:06 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a7184c5sm514319e0c.41.2025.03.14.04.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:06:06 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so1898633241.1;
        Fri, 14 Mar 2025 04:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHOaoA3pN2y+PZYd/aD121mka8AVFxyLD+JsVuM5s2ACqOYI/w/74buJDMfJLTjjeB235AmY+pY5Y=@vger.kernel.org, AJvYcCWLTI4JHVuNCbbcmnJfkyccHR6pIWHrCDkNima6NIqKL5OFSVW94kDgPr951YnwLk0P+l6f/FFGk6W8YCs=@vger.kernel.org, AJvYcCWqHmdpuPFJg2pxUaNXSHkxUKXJSE3FBe4FQSUyUalQAv0rGw0VkhEhlkbIY71FcD6NJ6yKbbG1gsAXV5IE@vger.kernel.org, AJvYcCXXeHbsQSM9UCE0pQmhp6vSZ1e7926H15lFxzJxHmHFaVBMdl9hkKd87kjxcDhYOY3Di/E1Cq38MIHhgdKVcnemCYQ=@vger.kernel.org
X-Received: by 2002:a05:6102:2ad4:b0:4c1:71b6:6c with SMTP id
 ada2fe7eead31-4c383139951mr938603137.7.1741950366058; Fri, 14 Mar 2025
 04:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com> <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 12:05:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVM_ozW4LAA4DstQuDfEcOnOcXZ2QHGv8nYMKDPWJe43Q@mail.gmail.com>
X-Gm-Features: AQ5f1JoZp_Fh2KNiMYwN_3b-UmSTFcVLiLca4lkc9x0qGfUAtorqFKSqrdTwz50
Message-ID: <CAMuHMdVM_ozW4LAA4DstQuDfEcOnOcXZ2QHGv8nYMKDPWJe43Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Ulrich Hecht <uli@fpond.eu>, Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Thu, 6 Mar 2025 at 16:26, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> The aim here is to prepare support for new sci controllers like
> the T2H/RSCI whose registers are too much different for being
> handled in common code.
>
> This named serial controller also has 32 bits register,
> so some return types had to be changed.
>
> The needed generic functions are no longer static, with prototypes
> defined in sh-sci-common.h so that they can be used from specific
> implementation in a separate file, to keep this driver as little
> changed as possible.
>
> For doing so, a set of 'ops' is added to struct sci_port.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v3->v4:
>    - Add missing #include <bitfield.h>
>    - Remove sci_poll_get_char sci_poll_put_char from sh-sci-common.h (both
>      function are not used by rzsci yet).
>    - Add missing #ifdef around .poll_put_char pointer initialization.
>    - More registers to save & restore due to rebase on tty-next

Thanks for the update!

While most rough edges have been polished by now (thanks!), and the
driver seems to still work on a variety of platforms, I am still
worried about the impact of this change:
  - Maintainability and future bug fixing?
  - Performance of the additional indirections on slow platforms (SH)?

What do other people think?
Thanks!

Full series:
https://lore.kernel.org/all/20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com
My initial comments and RFC:
https://lore.kernel.org/all/CAMuHMdVD1dLP53V_zOhxpqazDdPDVafJ6iohY8u6WPQrmYH5Sw@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

