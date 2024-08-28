Return-Path: <linux-renesas-soc+bounces-8421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7521896223C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE742836AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 08:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCAD15A842;
	Wed, 28 Aug 2024 08:23:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2110158851
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 08:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724833395; cv=none; b=NpDjZmlKTU+Y0TNjedBLzjgSKYHkyhgyLsrT0lRk7Vt0bxTuGwwmYIm7cD6GmyjquwQms6CGmvIR0cNmv6oq1KV+96s8ZFM7yejt92WtgbmOqvT+u1hCWHUkat45mwcUM9bIXjxFLWWP1Ako+Hc+1Ss8e4bbm9a4k3v8Q+u1N+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724833395; c=relaxed/simple;
	bh=l5o1bgrYKJkJ+MFDPP3JfORlW1we8Lt5q/djJ0xrcwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXO2mWx+M0lHbGtRqEuML0Z4si55JwxhUoQuyuya1AQ0paNipXl4jJrI4mkvdOE357KGpGBwcPoAAM4LIgWoms6IwMUw2fCwJ9WHtXVPFsJzzggtXQtl/4JN7A5xoSrBY/26g2/Hku2oN3auiuNgbsplbdajfyHyKkRJGvXaos0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6d0e7dfab60so10329807b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 01:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724833392; x=1725438192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocfTF99wchQ39N4Hwpb5ku5kE3gVniVhDBmhO2vWfB8=;
        b=E22oFXeUWtlJxxnVwOjvaDx6pX2It6++K9VCxDM1P/Eyms18yGw0sQb2788Cg8R8p4
         PeobI7ahfxO9+lQz2DrYDjzHEvbikoXAQFvv2c846UALF9xmpyMt8B99rku695/f7JDp
         Ok3qjjLCVZ0GeKclyGXg7mY92oUaebTYTS8IS6OFFSyobtqCYgTEelaACTxyU9lJfnwH
         DR1/0AfWhqo9XjpfhCfwZrFn1dA0gZ2/zJMsyokSDFaxlt9fjw6WfeFQv5pKSnyZE4GA
         36V94/yq8N0k7rnzyNDr72kHKPP2b76lt7G7x1l8yBMUIQtNb8QmNpAasZ/K7O7klT+X
         THbw==
X-Forwarded-Encrypted: i=1; AJvYcCUXymaXLwPE2znZzedZIV3FwMzYf2ddbx/Dg3kfVdI1dy73jAmzFWFWdhkLN9/vdkLiVGpaB2lu5/7tKX+Kia95/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJqBtz5+us41q1kRD437a68vB2+2JqLhEZhkBsDlPrre7rIUEL
	mvZxqlnX/Zm1PVyHMyr2gpVasq3mapElbBcaM9/D4mG5We2I/O3Y+y3GK4Bh
X-Google-Smtp-Source: AGHT+IEYZ8zTva4osL3lX7KD656ew7q/gZUk4OQVIOBfTfQUfHoWOwSj04RMgqnXBx8HGF2giiP6FQ==
X-Received: by 2002:a05:690c:dc4:b0:65f:93c1:fee9 with SMTP id 00721157ae682-6c624418d6amr198006267b3.9.1724833392087;
        Wed, 28 Aug 2024 01:23:12 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39d3a9db0sm22519087b3.88.2024.08.28.01.23.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 01:23:11 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6b47ff8a59aso53146087b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 01:23:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJUWWBi7mIEMYqnzyeAkNscrpk8EoB6jwuOuyxlqiYLxOzwN1JY8KIH87MzHz+NDVcx9QVEIXx7jvuXkCuElDINw==@vger.kernel.org
X-Received: by 2002:a05:690c:95:b0:64b:69f0:f8f2 with SMTP id
 00721157ae682-6c62441920amr156231277b3.3.1724833391491; Wed, 28 Aug 2024
 01:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdXs=T7Spiu8N_xgx=ai3b1Bcx3qcncwUMwSoN2T2oRFpA@mail.gmail.com>
 <1f29901e-1076-4742-a1cb-c69903afe902@tuxon.dev>
In-Reply-To: <1f29901e-1076-4742-a1cb-c69903afe902@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 10:22:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUE=UJ_dMLVjze2dkzKBLODcVVZmmEffkV6nQsmha_Gw@mail.gmail.com>
Message-ID: <CAMuHMdXUE=UJ_dMLVjze2dkzKBLODcVVZmmEffkV6nQsmha_Gw@mail.gmail.com>
Subject: Re: ravb interrupt storm
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Aug 28, 2024 at 10:11=E2=80=AFAM claudiu beznea
<claudiu.beznea@tuxon.dev> wrote:
> On 28.08.2024 10:53, Geert Uytterhoeven wrote:
> > Yesterday, I saw an interrupt storm on Gray Hawk Single after s2idle
> > with Wake-on-LAN.
>
> Do you know if this used to work after suspend to ram and runtime PM
> support added for RZ/G3S? Not sure if something wrong was added with thes=
e
> 2 commits:
>
> e95273fe4d02 net: ravb: Simplify ravb_resume()
> b07bc55cbb1c net: ravb: Simplify ravb_suspend()

These two commits are included.
But I forgot to mention I saw this only once. I.e. usually it works fine.

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

