Return-Path: <linux-renesas-soc+bounces-5685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BBD8D4593
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 08:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56241F22655
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 06:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B1D1586C8;
	Thu, 30 May 2024 06:46:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFB3207;
	Thu, 30 May 2024 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051590; cv=none; b=a368lq7HVI2eKFWmqbJ1+Ps8a/t8rB5Pjy4N9p9vGcfismlTd+GEb58Ov4LPL20YdCNNYUp6f0dc/cZvMazKmo6jtiAPVN0IhD0mPaL6cEtC32cpzKY/BmfBSgCLxwKgn6cZh9SrJV2CYayeF/GOl10wBj8WKOeyQw2+m/mGMNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051590; c=relaxed/simple;
	bh=akZLQVA6UdnpnCZMef9LejJZkaRHTEc88xOUZ+UFV7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKmP08iUvKra3e/673hCMvS0JQi++mG8HAMp3rY39eeXO0WYBDhS5r8mKPGbXvwLPA7gxWDNW6PjWjcU2G7uu6cXOyXANByHX0YvzUYlXK8/hHtEO2DTxPGI0FSTCMpyu+YJEuLrAR6/5xaLTAljPZL0X4U8c7GffwXnCB3JGPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a2424ecdaso5014527b3.1;
        Wed, 29 May 2024 23:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051586; x=1717656386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zn1OTt+XuEgtvOgdmab/UKCFiabii+gzE+Wp06XUO0g=;
        b=aGBjArw+J7hY3ef9EJB59UXV4PesenqwB3Bgm/xcdd3mFOw6OMNMDejAczANwrZaYx
         xN9ucL1p7rrB5FcpNwsC+n7DEP3ks7b66B98esscBX+IDxEJDRqDI379jX6uxAl3zDIT
         SNPlkWsOckjw5b2ncrkxxUfy0BHW3MsTQB8bnH4rUn45g7SQa2M1CPaHpslh/r646EuI
         6y5zNILJCVDQeT2lJcqkAnkjeS8HTJ5SP7A2GhvkALFMnBXgsm2XyqyA09T2J2PP2yxS
         EVRJUPNjyUQT9XvptFlb3r2Q7z7ZWmAi7UlGgiJbgrU7uTBiirOFtWhVtjnyHpv1+f3v
         Z42A==
X-Forwarded-Encrypted: i=1; AJvYcCXNJDcA995ZCns4GIm/Sie0Fbg8g40TSMGESXaQ7smRWuGC2ATifjqeGOtRwIGovWSonqv9+QZZ35pkn1NKYGa8GeAqw+EviZSS3PByD5i6dbMmeS8B4a/9XlUmsKZsHJwE8yOwhmt3Muv41wI=
X-Gm-Message-State: AOJu0Yw+Jdoj6cn1Z1hEji8dmO5+aQRMxAe4gXS4iZ4fM1EzgJgo1TQS
	mHsfeZoNqgh9r0LsjCeMA5rReZVhhkr716nak9ImNQtVpGGp+pSornDT+Bqr
X-Google-Smtp-Source: AGHT+IGuw9viPOXNEwk3gAXxviQXQHpLJp9DkBhhoQzbL81CO06pm6rTT4jK2yJmgAk/3VGNh4mCQQ==
X-Received: by 2002:a81:d403:0:b0:627:788e:94c7 with SMTP id 00721157ae682-62c6bbce86emr12988937b3.6.1717051585895;
        Wed, 29 May 2024 23:46:25 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a535bb8sm27033617b3.119.2024.05.29.23.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 23:46:25 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfa4ad7f6dfso462463276.1;
        Wed, 29 May 2024 23:46:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXH0LHDUhDM7OpzfkhlZL3NJS+8bbupcU1+uW9srbPfJTgh/eKTY4Xr9VBbfS1VJ9cB1ugnAYidCy4gETcyU+/HYPDOdwWUqfj3rK8/rsZzZG/NmtauNxAGLLYACyr7b4CXwhU020ud7etkvY=
X-Received: by 2002:a05:6902:2006:b0:de5:852f:6afe with SMTP id
 3f1490d57ef6-dfa5a6144a3mr1574524276.30.1717051585210; Wed, 29 May 2024
 23:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716975021.git.geert+renesas@glider.be> <9073a6bfb7791e492156331fa8a0ea87a7c7cef6.1716975021.git.geert+renesas@glider.be>
 <20f4f283b9f842f3868363a3f078b2a4.sboyd@kernel.org>
In-Reply-To: <20f4f283b9f842f3868363a3f078b2a4.sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 08:46:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_FywMD5yDtq_J=n2028=X26qhwE_9A72EuzCtwj931A@mail.gmail.com>
Message-ID: <CAMuHMdV_FywMD5yDtq_J=n2028=X26qhwE_9A72EuzCtwj931A@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: cpg-lib: Use DEFINE_SPINLOCK() for
 global spinlock
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Ye Bin <yebin10@huawei.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, May 29, 2024 at 9:56=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wro=
te:
> Quoting Geert Uytterhoeven (2024-05-29 02:35:09)
> > A global spinlock can be initialized automatically with
> > DEFINE_SPINLOCK() rather than explicitly calling spin_lock_init().
> >
> > Suggested-by: Ye Bin <yebin10@huawei.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Shouldn't this be first so that the previous patch can use the
> initialized spinlock?

Order of the patches doesn't matter.

r8a77970_cpg_mssr_init() in the R-Car V3M sub-driver calls into
rcar_gen3_cpg_init() in the Gen3 family sub-driver, which initialized
the spinlock.

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

