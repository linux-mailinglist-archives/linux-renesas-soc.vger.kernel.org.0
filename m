Return-Path: <linux-renesas-soc+bounces-12732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F29A229AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 357BD3A2374
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA571B0422;
	Thu, 30 Jan 2025 08:38:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1414B1AF0B7;
	Thu, 30 Jan 2025 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738226312; cv=none; b=qUWrYmoj3G1K+Jk/z5zBcXaNNi1m1NyAYkWwvSrP3Y3JUDWboEpLyEXek53xeHCddKulmShcGR1kxbilgoSh3FcCwqfEI/weHeHHE7HUEgJe/AExbB3f/N+r4hmqCSAnvZbZva7OpkZk+dqF1Oa0GkU/5vIePqPwy6y7KzMDOog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738226312; c=relaxed/simple;
	bh=xaEB5hJOJkNBO0IjFnL3xW00KWwZTCk3fz8gBNFUef8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqY1D2vDVDBdgVbQQph/D6OaBpJDczNtYNeO23SeTAt5cHsoNhv+Urw1anfqn0ah1oz+9Wgam/gD5jHpPyfzexCO/IJ1OpfsWl8EMn18K8/BeBerma1/9uGvKOFtc3GdgHGBsjVH0CI5KMR3KtXkUFZLgW3bu2JzRAjyGpqDU0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso104698241.0;
        Thu, 30 Jan 2025 00:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738226309; x=1738831109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk2TKsSY74j0HUDaUVAH8OWqO0r0d6lB1EeAqPzbUxA=;
        b=Zy/yVRQ6OPVd8EModrqn7G0KgXmO7swlYoX4uWIEiIetYlWzVV1X7W1uVipfAlduIV
         +/W7xjebLNFiLWRPK/dsGGLDwjPOgKXdNj95Tigum6g9wWbUZ/AAeIJ6ROJ3VqkvkNbw
         /KDSUFDcc0/dKIYH7fEnR6rvDEZXFUHIXGA/k/wA9wtHjV5pbQ+EpL/10CRZt04hwkf1
         GK53IgJ6T7SpgvUFccs1nDscLarY6fAuqSyW5akkFaHJYwUK9UllcXteKdkHPYQ1gC3P
         c5DoKTUpgPdyecIhXibegT0Lx1rMRI67TpuFqHfCKwlyyIIAAOCe9J0P9TaEUbUsRcVB
         tnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa8A+j0DlqXg58jpP1rVLV6Xr/PyhP7cLqDDGDlucu90PYsQp7Gn2v5H3VoJ9KeJ30Cwr85x9HRf4fMhiI@vger.kernel.org, AJvYcCVtp9HKUBNiKKrfxvWY8FhYljYvX1Wv8ZDTskGVtvMrK9mBwBGdnrxaY54OoncD3Ioddo6GTQpK6HXwMj/iNp60NOk=@vger.kernel.org, AJvYcCWw/pJYe/d6FFXM8j9PmIZN87jF2szpi9y6tpgn40a0LBxY9viDH3JW87cVmZTu9IE2y/p23boIrC7Px2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWQLOuRBWlG5VUZ/qXKbDBwMSu8YMI81zT0mMl1fu5HZTHHf/
	xLokybGHqbwRMC3c1Ny5oQSP3vt3/IMT7vope8leWoEOec29Ldwg15bmgYeR
X-Gm-Gg: ASbGncuVWPy6Dwmk5gdr27dbizjjRVK7rSo0AE81JP1uBumL114TbzVZetHEZfjMXjx
	qWW8/u/ovfKBjwtsPnX8uITu4ug35aY0l/Luu19k2AcJG8hqdDJSbhaFzBMj+PcMDsEub7AFXUd
	AuTzkJG64E8bl03XK9sezvPXZgGwXecvx26Vvka7MVPQ/PmYlr6F78aaGi8t8NRI2iHZ9zrxQpe
	XD4KAb/VPSAR1/JauPftpGSBWuG8WNvp3VBIRvMFIGh7qll0etJr352F6tihV86jvI/jZdxkRIR
	DmmYMldgm4qZgN/cgjW7i/z+cLlGwvbpJNE6wnUdMP680/MyXFYTsA==
X-Google-Smtp-Source: AGHT+IGHPLFd5+eSiM9QBCAmCGiiiHKmyAzT1nhEZP5evR9K1ZWkIkJBgxBgEOp5+S1ZE5xblAlbpw==
X-Received: by 2002:a05:6102:160c:b0:4b2:af77:b53a with SMTP id ada2fe7eead31-4b9a4f5722cmr6132984137.11.1738226309643;
        Thu, 30 Jan 2025 00:38:29 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941f13d3sm165142241.34.2025.01.30.00.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:38:29 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so137324241.3;
        Thu, 30 Jan 2025 00:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUBY+SUyRVws4/AXkFBwBoqXLir9Pw9JZMj/kVFqTISQIBNINeNIlfLEckQfdUjZtRmpTBPUAYxXSqMZ4=@vger.kernel.org, AJvYcCXjK71OvvmCefDiERhQNvA/PX9qpwlAdrYyfLXnDhmYjoH0hLr0cMjVewvEjhlsaRSBdOMnVugqUMDmmPkd@vger.kernel.org, AJvYcCXvy8ODvhsR9T31RZCujysRzvlQiBwRuCZEkpiWg3/UW+DVkQ48HDfJbLZXZoEbmDZ49UIO7DIYLpvxiO6VjL9mDbk=@vger.kernel.org
X-Received: by 2002:a05:6102:3f56:b0:4b2:5d63:a0f3 with SMTP id
 ada2fe7eead31-4b9a4f9543cmr6134834137.15.1738226308606; Thu, 30 Jan 2025
 00:38:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-9-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-9-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:38:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4wm0gS-6LnxFVS9yTAKwTbOm2OUyvPqAoZE6ZOg50+Q@mail.gmail.com>
X-Gm-Features: AWEUYZnBP-VOwl0jIUzcJEZYDu8Rf70RLhWF8wesPAPWDT7bF7N5k_FA79xqlk0
Message-ID: <CAMuHMdW4wm0gS-6LnxFVS9yTAKwTbOm2OUyvPqAoZE6ZOg50+Q@mail.gmail.com>
Subject: Re: [PATCH 08/14] serial: sh-sci: Fix a comment about SCIFA
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC linux-renesas-soc

On Wed, 29 Jan 2025 at 17:54, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
>
> RZ/T1 has SCIFA, 'T' is not relevant.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 924b803af440..5ba25a6a5432 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -291,7 +291,7 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
>         },
>
>         /*
> -        * The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T.
> +        * The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T1
>          * It looks like a normal SCIF with FIFO data, but with a
>          * compressed address space. Also, the break out of interrupts
>          * are different: ERI/BRI, RXI, TXI, TEI, DRI.
> --
> 2.43.0

