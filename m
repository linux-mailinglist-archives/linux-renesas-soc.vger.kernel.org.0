Return-Path: <linux-renesas-soc+bounces-6329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C390A83C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 10:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0FF2863E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 08:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6169187559;
	Mon, 17 Jun 2024 08:15:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2517190043
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718612115; cv=none; b=tpMZxQ1yqrhgdkA0PciDTCj3a34VTBci1785kyO38w/mBvpmVkD+HHIodMoXKc7Yt0axdq/VpMuAd5bqxrYFS8llInWAChBEYZZFvCxtD9c1YuufrsQ6sDMmS2fjoGpcaM6h/iXQ/A+ubEvNmPJViJWA5ALqirnmViZDT3/cCBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718612115; c=relaxed/simple;
	bh=qM2chCRu0ga3xJBs08yyD/qhoisWPyxHhOpNYgj19RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGV00LSvbyA9jCZ3TXOc7QKDxRHDM1+/nKG0Z+G77Jhs8nhtf2uUUQSMJa5Y2FFPRoBLE0SG0O13vZEMmhUQxTtC8dRGbcp2yjLZL86JgnWmcul6916aUkwFI7sCxEWFlT2zxyv/tuB2GWs+8tM/8UqevLTy6gGECwdPVTeaFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6312dc52078so42699677b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 01:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718612112; x=1719216912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nczCIexv5lAKNgm7zGVJ7w0Et6rzsxrGwmDLoLhB5Ow=;
        b=U9KzeqeYsbQNeji+58NNP8h5oidDEc5Rd0/ncKvW9oyb1YqWrnN0BsVoEkHzev1etY
         MFOMzfgV7F7QSqYj/M0vExUuib8uV5Gdn3Lo1CRMZZr1jy7esVdOMUk5pp8Jpu1o2Cdy
         iyqlMJ9suuKm/cZ/fWEZsNIp12fHdYxrLjWnYQQKB36WAc72pYXw9qoBy6mwhxX51fI4
         Gr85d1tx3587dr7cLOLyHUDChIiaL0AD7jRRKaGqG12MES2gTjeOr9DRGz30PXXU1V+W
         S1CuPZXVp/Vnb+sGx708+ElYZYBEiwHPG3k8EvYKbjmu5ufikMMP8cLpyh+CrQ6pCT62
         ioNg==
X-Forwarded-Encrypted: i=1; AJvYcCVP0CXKABeNB+H8iDxFlYZ4BaZdmtFh9EUP7psI/JyRrXTUzbWRNsLcSaG/IHwCwdvNiY1rqXDju/kCcYWyfwMJab7tXXbN2bkbentlQEodmL8=
X-Gm-Message-State: AOJu0YxfdMgg9J67+1xW6jJH9i0w45kn3yGfnNjHQn0p1jG39+xog6P0
	eswIYELy2+jI0hwMVvECbiZl/FdA5M6qyUqvtTyUnjN+4+/lfOr8+ZL751g3
X-Google-Smtp-Source: AGHT+IFbKHhj1E8uyb747E5MH1+rn6u27VQGSYlrr5unZkKzfM/XtKsH82/TWDmHc2xbCAVuR7KihQ==
X-Received: by 2002:a25:6954:0:b0:dfa:6f3a:b248 with SMTP id 3f1490d57ef6-dff19242299mr7487390276.65.1718612111989;
        Mon, 17 Jun 2024 01:15:11 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048c11d3sm1771036276.36.2024.06.17.01.15.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 01:15:11 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-627ebbefd85so45325577b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 01:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwuMVkQ2RXsdpvfGuwTYHOEVy7ekTGW8vS7g1bvZE4yMiUAUuOrFa/xNh/nMep7aCLYDsSQ6kQvBEm5WyPAEWc+ckHuNFAsdH0L9J+R9Hitgs=
X-Received: by 2002:a0d:d614:0:b0:61b:14a8:7944 with SMTP id
 00721157ae682-6322402fe58mr88286157b3.39.1718612111196; Mon, 17 Jun 2024
 01:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610164845.89666-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240610164845.89666-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 10:14:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoArW2Y0WBMGZw+MTJdc18OFP8a2-_1=LuKisGnHswGQ@mail.gmail.com>
Message-ID: <CAMuHMdXoArW2Y0WBMGZw+MTJdc18OFP8a2-_1=LuKisGnHswGQ@mail.gmail.com>
Subject: Re: [PATCH v2] reset: rzg2l-usbphy-ctrl: Move reset controller registration
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 6:48=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> As soon as the reset controller is registered, it could be used by a
> reset consumer. That means hardware setup to be done first and then the
> registration of the reset controller. So move the registration of reset
> controller at the end of probe().
>
> While at it, fix the issue that the reset is not re-asserted in case
> devm_reset_controller_register() fails and also use goto statements to
> simplify the error path in probe().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit header and description
>  * Moved reset controller registration at the end of the probe()
>  * Fixed the issue that the reset is not re-asserted in case
>    devm_reset_controller_register() fails
>  * Used goto statements to simplify the error path in probe().
>  * Restored the blank line before devm_reset_controller_register().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

