Return-Path: <linux-renesas-soc+bounces-6838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5391AC4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 18:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136E21C22AA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 16:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9BF1991C3;
	Thu, 27 Jun 2024 16:11:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD22199254
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504676; cv=none; b=eDeQp5BUQlTjYzT/yhHeL/FQ0eW715WWD/kDoDcUCW9mJCKZNGjZXqDvqvSYoSzAeEwbDWUPaSenyVS3Bc4E1Eu5xFTonS3tyJ15yV2C/+OG6cIezEIEeV9IoChdPQD/7GKqSeHQWl2x/gH433HO+5/c7fheQEiHtQMWrGlmJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504676; c=relaxed/simple;
	bh=jyNBxLsO0QbUY6tfGJotyoAjBDkRl8dFetqwJathLE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9febrcrImpqpK1MTwRN77jq5yAFjrLHWGx0YNxJGax24uT9v3n6YnG9Ipoo82jSY+N5gIVK9XFT9hDIgoGDXGssNtn/A+QUgyooaezkNZXem7TihMhPXKnHUsy4GY3n7QxcyIxEaWC6i6S0MZ2O0OpiGS6be+mkigBpFW05spU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-63186c222eeso79432017b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 09:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719504673; x=1720109473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP2HkcN/pjqvh3f0w1IWBE2c9OhMNx39aFYEwk/wGpc=;
        b=pf+wv1BU6sQ3AeOf4u9xnyaCu7XnPZOqP0Dbz00RPw+CH1Z0bpLiNKZzhlz/qvlTY/
         gYBp0IAnVt7xONbDpmEwhcE08sE+woB6wCXxAQzybzr3KWJ8b08ZDZhdugc+OFvZDhue
         NaK+L1MTMkH5fxKV+T2DUIkjXeGw2sK1x3gsolqX2B5JmvooQg6WxRG1ceJfjTYtdQ5j
         7bdnyFproZeFp57/FVwOwxnrgFssgLLzXivEBwiEI3+Cc44TlOBqM3vGeeYBtJ3EVeqI
         1d+THaieXiodIgmRz+JgHKR+hxLsGYpKLBH2SK/1pAeQ15ySeOGOMmlYECFlf9Wq06+w
         O24w==
X-Forwarded-Encrypted: i=1; AJvYcCVO7pm+s6wmg4yykDjT9IFZpo1x8bvOSgFC1IpvkR2Uhsu/rSwGKAYyM2mFRlPmivTGR8ba2RCaQ08wytD0EtT8sZ6l0jS8lw5/xb8yCBGpX/k=
X-Gm-Message-State: AOJu0YxTmoYrnxMUX88zemQDgRCORBgxqYo5Amk1p/KccxlWVu8R6+3h
	wkdHjXEq7Tbw5snC9PE31EADaUA8zfBlA3d5CJzAgoIhTE16xd5MWf++AxKl
X-Google-Smtp-Source: AGHT+IExZvDRo8odkMGm4CJc5UpGOlNqiYrVUVNJ43Xda4WqxTC22KWPMghKIYqEtT+JF8HbBs3g+w==
X-Received: by 2002:a81:d409:0:b0:64a:4728:eed with SMTP id 00721157ae682-64a47375315mr9700167b3.46.1719504673436;
        Thu, 27 Jun 2024 09:11:13 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6497ac2ed8dsm2982677b3.127.2024.06.27.09.11.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 09:11:13 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-64546605546so50250747b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 09:11:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYVq8wI9w8TFmEHpPRM0EkagAjUlW340dEPTnMFb0xCaXBKpw+pxb9tyiWP5kWWCZTzwE4Far8yxS094EXOcdv4yCDJR+xcBSmPuZvLSLVgcc=
X-Received: by 2002:a81:bb54:0:b0:631:7b18:91a2 with SMTP id
 00721157ae682-643aab822bfmr138686827b3.20.1719504673059; Thu, 27 Jun 2024
 09:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4a0a12227f2145ef53b18bc08f45b19dcd745fc6.1718378739.git.geert+renesas@glider.be>
 <20240615121647.GJ382677@ragnatech.se>
In-Reply-To: <20240615121647.GJ382677@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jun 2024 18:11:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgT1rp94Fcv=pRvzGeZAp9Wf5hv+nXORRV0_RzFZQdAw@mail.gmail.com>
Message-ID: <CAMuHMdUgT1rp94Fcv=pRvzGeZAp9Wf5hv+nXORRV0_RzFZQdAw@mail.gmail.com>
Subject: Re: [PATCH/RFC] pinctrl: renesas: r8a779h0: Add AVB MII pins and groups
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 2:16=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-06-14 17:26:45 +0200, Geert Uytterhoeven wrote:
> > EtherAVB instances 0 and 1 support both RGMII and MII interfaces.
> > Add the missing pins and groups for MII.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>

Thanks, queuing in renesas-pinctrl for v6.11.

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

