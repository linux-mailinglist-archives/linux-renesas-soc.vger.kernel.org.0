Return-Path: <linux-renesas-soc+bounces-8894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE479737B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 14:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 582291F2622E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 12:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24103191496;
	Tue, 10 Sep 2024 12:40:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC6184522
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Sep 2024 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972017; cv=none; b=h1wOsm7bmycOEOfNl6dgEL2JQ2WaGTfBAF7FRolaPevoUSHbWS8th3xd12u/tGzYSimvAVJbQ2mKWIcCnjcluv53sS2yJw7pCQ3GoAH6IwDI48xWbwx3cw1x2LfcUVW+a2tl6fITS6clZC+ShwkMATT8KdJE3DiSf7IJ+3yaoFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972017; c=relaxed/simple;
	bh=FWC0ylQVDcm1HlPn7tSNt7o11iE1FFsBqkZCzXACgcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhJnAJZmMfhw82lSDNeLqrlJHMf0ocZa/x7wwq9g2pOow82c0VPCX+EZGHh1eSaUAtl3X/hybAHhJEhTreWQ8Y06Iokx2+wThDrngkv35Tw9cme7rka4VXhAw5GRqY4szWaPJ+kuVDstRltqTvgz5tsP7XnVQHpTgqwO0nsrA68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6db9f7969fdso3297377b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Sep 2024 05:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972013; x=1726576813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxkC6elmujDdAfnsTNRTMrFadUmhU0gDj/DcldHNh9Q=;
        b=XepUpUVB1Zuo9XiKRd4dPwJCkAZXovO7NfuJ41mBYCIr5Dxi3BeKjwsSl0ksraLaqw
         m97FNH8UM4DZzTgjj71ZL+ctrCMUg8NF+Wcgz4blgBHS9/uWJ3FSy+INq3VtaMjbajry
         WIo3h8/YGLRdlNZCmy2GcrDuu4vTekX8NNu/UZ6jhUgy/wJhtub2FhQNJbeV0dWnD9UM
         YtY7v7ps6jONk5Ld2Y/L8fBHxuRYai0+b0T8qyur/V66h7ckiW9w2ev8bX3jLbyr2ui2
         QGUSQ/XeZkBqYKqADYwiomuJS62dslxIfL544u9okVglnN9ltYCbTnnnF5MyXxGWLGvb
         n4sg==
X-Forwarded-Encrypted: i=1; AJvYcCXVQSjoX8XfK64xsS2O2pVD54sETpL5gU4lRvGFrup7G6Qg7ijhjzHEUAKiC0ha/MIzlyg+kDKAe6RlDRofxeLKyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPoeBNev6I8ylmRuXLequ/uJph3jjUX6eTgdhwhxo2Rv7n4Sl
	sEOepYorAho2EZjV59HM0dj1K4SpPMFH3SiWSu/oaZOj2g5PzNfWWOFca9o/
X-Google-Smtp-Source: AGHT+IFqBGpjapJ8mkoutCx5uY/7pMxeSTf8DFarm59iUMDiWG5f1bY6gufUmdihITC3VdqaRsqXeQ==
X-Received: by 2002:a05:690c:688c:b0:62f:60db:326 with SMTP id 00721157ae682-6db95430797mr21192417b3.20.1725972013356;
        Tue, 10 Sep 2024 05:40:13 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db9646215asm2819157b3.44.2024.09.10.05.40.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 05:40:12 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6db9f7969fdso3297117b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Sep 2024 05:40:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0cTLx+0sdTKp57gOndO+d1dpz+05N1/kwZQS7kNJ2xX/JMxtcgfswXTitETkzuGYM5e8HF74gbZeLLrcADB5BDQ==@vger.kernel.org
X-Received: by 2002:a05:690c:25c4:b0:664:74cd:5548 with SMTP id
 00721157ae682-6db95311ca7mr24962807b3.1.1725972012286; Tue, 10 Sep 2024
 05:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com> <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Sep 2024 14:39:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Message-ID: <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Tue, Sep 10, 2024 at 12:06=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
> Building with clang and and W=3D1 leads to warning about unused
> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
>
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> @@ -32,7 +32,7 @@ struct rcar_cmm {
>         } lut;
>  };
>
> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u3=
2 reg)
>  {
>         return ioread32(rcmm->base + reg);
>  }

This function was never used. Why not remove it instead?

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

