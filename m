Return-Path: <linux-renesas-soc+bounces-7295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977292FB3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AA4BB219C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C3B1607B2;
	Fri, 12 Jul 2024 13:23:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7946A13CFB0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790610; cv=none; b=WVFScNr6GWNoMQpV+FVX9A6lFZSbVEouoU5jfDVYpn8uz7oqA2Lrmm3oDICuiD/SFnkq82QObC3v/xAOVPG5OSnzg6xXpJTeA1HHok1an18Ii4gcp2OcmC+KSuSnp8QkQTR5xhEoOlno3t8iqLws0/IlVzqXPfjqVGs14fJjIJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790610; c=relaxed/simple;
	bh=Ylm3uqDbWQirp+jzpfOrwpMX791v4tfhrpZfk1jkuMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqIYhvvlzLCfEolo0s5ZizGh3V40rNJIggdAPYoos4RDp+dbLOHMJ7VvuHAc9he9L+63iozvhwR6B7PzP184BId8QNndvisCIgooIPa5NU9qhqN4Nl+/xDE7CbVPgZcFaw+WHhtqMucaqB4alWECmH0uQBsxZ+BW9PVobbPc4zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6512866fa87so21572937b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 06:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720790607; x=1721395407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpZtr02pTmP0vv1QOd0+eTLzGt2NS1mAIK5sul877Tg=;
        b=oGtiN7DrNh3zmGZYkeje/2mHcaMwna5/Wbjbr1lGVwlZfL+l41ajQQH3p47fJ2IT/0
         Jb0EaHIMRMBF5raw+IUkK0qT/WF3zkY8TBB4FyFD3mHeyzwkp65O3RpkOvDFg134Lgw2
         qOkoXYDgzwqqx9I++TDRcGZMh/NEp5FX9P94rWzVzKBBQ5842DVfKwQh8m9zNlZHqtmy
         jS4ofycmYRdigxsokJ7cgIf/iBoA1Rnx2Nxi0FXhdDmHtMl6e81Xwx2DT+yeE3wNNfje
         OnunWH4fZOQHHjmUDF92FQJN1I5Wd4j9myrbxkxi5FHXVr4s3apzOuBMK/e/SWwv9Qku
         TQng==
X-Forwarded-Encrypted: i=1; AJvYcCUEsHAXZP+tzAHpmwOm6MklEWb0sVx97fCXbAxbqrE/v6dijXkqqpXpAuJw8ixdaMYonjeLO5MVBcJ/B+gEl0SQUINv8qtcRu4XVT0p+j7coBw=
X-Gm-Message-State: AOJu0YzAdNEcn5Nxw5CEgj9mUhbktKHN+/foXlGT270wox0Biwk/Ig43
	oZ7++mSKYldyJPhzHtiSrG5pzi31AQO2gbTRQ8LOYPJ41RRuW10Uvu2mFVpM
X-Google-Smtp-Source: AGHT+IEnH2MoWczyz9cPgkVFL67L6PaKdKtBooJutkz0p0zrwwa1XePLpsWYJbNlbX+wPhnfZzUahQ==
X-Received: by 2002:a81:8d13:0:b0:647:e079:da73 with SMTP id 00721157ae682-658ee69ab8dmr133524047b3.10.1720790606752;
        Fri, 12 Jul 2024 06:23:26 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e74988fbsm14670097b3.144.2024.07.12.06.23.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:23:26 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6512866fa87so21572617b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 06:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqk/BT/PlmeBXFYsTsoToub7fDy240fLbpmNwIr5L3WZ7YpI15WUGyu1rRw2QlYjiccxwVch6COuwDjplSjF+NCZpDpAjk1KEKhTDbilVHl1U=
X-Received: by 2002:a0d:e6d1:0:b0:62d:1eb6:87bf with SMTP id
 00721157ae682-658ee7910f1mr116693037b3.5.1720790606021; Fri, 12 Jul 2024
 06:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704061720.1444755-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240704061720.1444755-1-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 15:23:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSkFsAk_8FujEGDkqr1Sg+67j-OdTWvKPmg1cW8ifBpQ@mail.gmail.com>
Message-ID: <CAMuHMdXSkFsAk_8FujEGDkqr1Sg+67j-OdTWvKPmg1cW8ifBpQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add PCIe clocks
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 8:17=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add the PCIe module clock, which is used by the PCIe modules on the
> Renesas R-Car V4M (R8A779H0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

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

