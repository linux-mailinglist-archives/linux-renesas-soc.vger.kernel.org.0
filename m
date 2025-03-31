Return-Path: <linux-renesas-soc+bounces-15138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B5A764A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCE5167612
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71B81E1DF6;
	Mon, 31 Mar 2025 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aghuHnW8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF201E0B91;
	Mon, 31 Mar 2025 10:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418651; cv=none; b=kedU9NJJ9MomolxFarixd1LBS7NLH9XRt0FdVMdGm/Jqxfod3T8MHhUYFjbBFqQdk0Dfimixl6UKMgHDTrCU8otvuMML7dhgM9c6SBPtllwM3KkR1zyBvhyWfZaE/IoPqf/cP6B6XTdEy50vJi7TWssM6UmtwUvODNNDRZaLJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418651; c=relaxed/simple;
	bh=3iyJtbgGzB1OJBH5C9tTZhh5p8Zc2H+RQBAXZssCc3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUjB53w990Ij9+FeyHH7rSvvfP5lSlKUdD6x7f2ct54fdFGKgOlBmmfWo51mzvBKmFffednYuXC/Q51sPq5ZZHFoe+q7C3OTymooDKRwqQgUCeDFoLUG4WVi0vBemVc+JCrb6fqWmlpQ8Xgm8bPAnCKwvs7l38xA612GcKTpy6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aghuHnW8; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5240317b3e0so1407503e0c.0;
        Mon, 31 Mar 2025 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743418649; x=1744023449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNNRG1/aA151htuH/eNkLqh0nhijCBN91yU1AUjfzl8=;
        b=aghuHnW8QAM4LFHI/vLwr/YwoSHoQ90pZ+obkZTbuMF+a+1kT4UPr9UVzueWc4l0Vw
         kZiLZsF/xOipxQG7Xs7QjkKRk93TNe+coH3333yx6DO3BMjIE1eVJB0c0H8G44Z6VSsw
         lLNeQrPrE/uNu+1T5Jntuf+aLRx6i6ReOi3jgEQWXaaZg8FM4Lr8Kc70dsZhYXxzH5t7
         1I6aqXEvldknxbmPBpCMF6vdOmFoyi6esQv9vqRLzTnNyNlXNSJnjZG9Ly6J765l5iKb
         zNXGxOjBvXavfT/U3vaE+sdB9Sred65So6u+e3KEaFoePDN74vEaGyVunFzjmVRIcLVq
         OFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743418649; x=1744023449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNNRG1/aA151htuH/eNkLqh0nhijCBN91yU1AUjfzl8=;
        b=kkQia31gwKn4i7JMXWWVMToGqmzsh3uC+3AYu2eDz0chSarS0KluwdgSsR//fjA/sH
         Q1lQWYKQrR8pVqf7JAVxuUKUfjjCNvIaE386A3shWzbbrDhvJ9aGZwGDI87910+xPpse
         begCt3uW3PkEm7H/Miby9IXPQkGB3SqUpLGHdjXAamPRbgoJAonmZSohtYxqN6pDQflX
         O2HxVhzv4AcdEFurOiT4K0wIXcqwlVtLLkKHw7a2inOP665MSTMnrdhFKT67zHt/GMGh
         kXc4r0+WdL6u7NGrRCq6LcMvPEBD+TdB/sjkeLSkylFPn+TwHSpeK5sXbppR7IcuKIIF
         iRLA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3h6nnWbIIshbGycIKt3yAYEwGC/dWq5cQ1DHSAManlduz8suq1hxVHssAsJR7tmzM7H5cfIMwTMYM8g=@vger.kernel.org, AJvYcCWQszTeEgih4NDjbli5BHCtnbtBd5zcmUawCBesNi/OmZh8cLKEa7O0gWD3S7BL37fwMapWHSJpN5TgjCIBh2jJuSA=@vger.kernel.org, AJvYcCXlsvSyOFepEh4wzEUJWzku8W9HAZfC4RKgDxZQXON2ngDPqUAc6fpoO++vSvaDmjHtZ2G5n/6aUHPu@vger.kernel.org
X-Gm-Message-State: AOJu0YwbjNtGtFTCuVI1J4GfEfD9crnjQPJ7xNj4o4+mg3ikb7kq8Wyc
	WT08m1aIniBm8Y0TKjLQZiCzj8OSMthMT+09bBaYZnqZQoxjYjQ/QfMHAa+z53K8rSTHRZ5kRrf
	JaMhBwse/aa0Z0L5Kfd5yTRyA4dE=
X-Gm-Gg: ASbGncv0lV36ug+J5sMM9T8Pw506DJbo0vSMN0+lsIi2A8EhvPoTvCD/ePuuarzsO05
	bLTpM58mE2e145JhhIZnNJdQxW0gzh1UQYMGdzmkHAl0jF7CRQZGeeWHiBTX/Ds0JNuxzW08GBl
	dgxvcQiJ/hezvoB6MT1oUr5Z65LIhsLqTb2NaQ5FXCK8BwTOmEcYgEZk88gf4=
X-Google-Smtp-Source: AGHT+IEqYRcxUiARUhkAS+U3oiuXILK20HiYaw+X095+lOU7LXb76ms2yffoHkVVCV2OqJX0/p9GqGjoiVD1nyweXf0=
X-Received: by 2002:a05:6122:d87:b0:520:6773:e5bf with SMTP id
 71dfb90a1353d-5261d353d3fmr3113600e0c.1.1743418648966; Mon, 31 Mar 2025
 03:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327120737.230041-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87zfh6yoly.wl-kuninori.morimoto.gx@renesas.com> <CA+V-a8uwJasrQZ+3Y1vgTKz+b_SBULXpXdGYxULUOpPkZgXjFg@mail.gmail.com>
 <875xjq12vr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xjq12vr.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 11:57:03 +0100
X-Gm-Features: AQ5f1JocOtJDqSG1p3iXddX3aNepbZDqcge-fFv546733q8ijn8MptjNPw0nAh4
Message-ID: <CA+V-a8vqnNN119RbRJ5FvEUkWOd+FEHr9g+B3YnZasn=y7MWaQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: renesas_usbhs: Reorder clock handling and power
 management in probe
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto san,

On Mon, Mar 31, 2025 at 1:05=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Lad, Prabhakar
>
> > > >     usbhs_probe()
> > > >         usbhs_sys_clock_ctrl()
> > > >             usbhs_bset()
> > > >                 usbhs_write()
> > > >                     iowrite16()  <-- Register access before enablin=
g clocks
> > >
> > > This patch itself is not so bad idea, but basically, we should not as=
sume
> > > the power/clock was enabled since kernel boot.
> > > In this driver, register access happen only during power enable <->  =
power
> > > disable (except your issue case), and this is good idea. So, the stra=
nge
> > > is usbhs_sys_clock_ctrl() call in usbhs_probe() (without power enable=
) I
> > > guess.
> > >
> > > According to the comment, it is just caring boot loader, and
> > > usbhs_sys_clock_ctrl() itself will be called when usbhsc_power_ctrl()=
 was
> > > called anyway. And more, if my understanding was correct, Renesas clo=
ck
> > > driver will stop all unused devices clock/power after boot.
> > > So maybe we can just remove strange usbhs_sys_clock_ctrl() from usbhs=
_probe() ?
> > >
> >
> > After dropping usbhs_sys_clock_ctrl and removing the clock enabling
> > done in this patch and with  `CONFIG_USB_G_SERIAL=3Dy` I hit the same
> > issue.
>
> Ah...
> OK, not only usbhs_sys_clock_ctrl(), but other initializer also
> missing power in probe(). Thank you for reporting, your original patch
> is reasonable.
>
Thanks! I'll send a V2 incorporating your review comments next week
after v6.15-rc1 is released.

Cheers,
Prabhakar

