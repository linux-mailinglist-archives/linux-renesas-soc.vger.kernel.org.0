Return-Path: <linux-renesas-soc+bounces-23231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D251DBE8423
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EAFB406D9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E648322523;
	Fri, 17 Oct 2025 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cIzL5Ck/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA473321B0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760699400; cv=none; b=CAnMRUj6q3MY7nK9zrT7ayc6aqmtbx+HlNQwnlPcwS1RGe3ajt3fMpTpqpHtQmJQeO2Z0Oc27Nh5OBj2YFuuhwzPYka6rRRJp+nQLGZWTGEImI7KcHs2h96JOlOrp7ZOe16nOk6NDDNz7ykjMj0Y4wn75iUYJO+a1eITo8WMSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760699400; c=relaxed/simple;
	bh=jJ3sJSfGGDZPPWMFLprjMHiW/EllfBTeLQIZoh/ZyxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZuUWxLfzY9PzW/wxY/TPWD7ki0S8KekG41uZFgWb09KTBecZuHXt0oT++KZdmtxONHPQwDPD0gH91bsJ0C/8/LnQZBUdHK1fEu8n/MxOPLLw3Kv31BJ1SsI42aTdMK8a7TecJbc2yowtZ8vMUXhJqEjD1aqXwfg/fRSr9VhiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cIzL5Ck/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59093250aabso2352642e87.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760699396; x=1761304196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ3sJSfGGDZPPWMFLprjMHiW/EllfBTeLQIZoh/ZyxI=;
        b=cIzL5Ck/8wNnAqKxninMiulfKB+lAxTj8XIrxSS+iiRAcsawulROWtwlmJks4eMX9H
         atmf234J/YT3RmK7vU6F8DHOb661sc5v1x6O27o/8H5Ud4eJ+uKzOUoLd3SiHzsDSoiD
         Kw7nffjX5GxU3YxFgGapg00/9VfD5zTt3HlBXmYSa2FVUHznEGuu6Dapc53yohmiHPZu
         cMYJ0nbkoanZnpgE+Dl2sbronm9lea2LLe2sp5JI6TyEdED8TZYU+cnNbW+geOKTtnlS
         PXfPn0ctDbcz87Yg8BZWOxVmmbHqtg5vALxJcsXpl75RYQCV6NhyXHVMcII87hMVt6zs
         T2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760699396; x=1761304196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJ3sJSfGGDZPPWMFLprjMHiW/EllfBTeLQIZoh/ZyxI=;
        b=VjP8v0cdZRSlb7VvNVSKkp7YD8YWyoMfRmupj5x6OpYv1K4o0wjzKJ4EyFHdMUOX06
         qOy43elAtR/gwhVeuk5jJMWV5GacXNtbnO8/z3jPUxdN02viTCjgBG2PrXTU0AKo4YYf
         MjotmZMSJy/gUiSFVJxEnVQdnqrNjJbMYUzHGO91aBey7VU50Td4auNXRn/p/Zs4KBOd
         UmEI+zRjzSdkp7NK3r30TOvEeYB20krqvd5cz30uBq0Xngq3o+mOl1K4EiYgV8sv/T6J
         pJyd4z6sdKCnJI0MnoLuQJ1IabSccE7VyTqqbw/q6U7CIzamWxgAXumF84ZwfmzF0KEL
         DxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnjBT26/wsusmYjwvs6IV/qkNYQfFmnT4zOgAngOGUUzDYC4cRR7TUm1vSryWm7ozEGTKhTpstGomJi9SsOj9rYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkYPCi0T9Yg9LCOCNcMRWtxd19atDhFXOLOxvxIkFezg4S7lY
	FqhUIrBqVKocPlAwr440ZN+8DO28QewJGUvdJ/vhUVzQYF4QFGfe7pp2rruzbdxniDPKb6xKSjx
	mXFEsNchKfD59tx2sBVcav7cUrgd0CKUbf3zHfkQNCQ==
X-Gm-Gg: ASbGncs9kQnQYOYr1+Vus6bSUrcG/XqWSl8tOuiOAkiQz0kkKQ4g6A9kQmM3BZSf/2e
	rApEHmdLJKCw4UTh67x5LZaciIF5Cb2wvmOQBj+jH7H+cTy/z5yA3Uj56VZEerqGMTv3GjicU/C
	CNlGRb9CSCdkUgbkEO4pJaTU8Ri7Qm+tHHxH2Wv9mJTArOWYPtOiSJ7tUo99WTgALx/iJ3e2eZW
	UfVxbPXEkST6SvDPjT1upEPw7bfDmGYFeuDODSWKzsyyihuiiYjjFaXG3UIOhTBFd7syHstJ+kp
	JUJwlrMzePUtv7BK
X-Google-Smtp-Source: AGHT+IHAQb+PujZ3FlhVbP/5obfB82tUK18MuZgZkVjEsCxRPkQtT5FNrzDdnND37AsMEzZd7iYSCgmCJUb3JOw9GHc=
X-Received: by 2002:a05:6512:1324:b0:563:3ac3:1ec1 with SMTP id
 2adb3069b0e04-591d857942amr1167284e87.54.1760699396306; Fri, 17 Oct 2025
 04:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com> <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro> <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro>
In-Reply-To: <aPIfF-3SgzW5V_gs@shikoro>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 13:09:44 +0200
X-Gm-Features: AS18NWA8jH3FhagHn3D8_Lt6AEhdFJCJ9BjuVsTGnGPGq3eRCDcchI99tLK0230
Message-ID: <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if possible
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 12:48=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > Interesting topic. In fact, I think we should make RESET_GPIO bool. I
> > > think the fallback mechanism of the core should work without any modu=
le
> > > loading infrastructure. It should be there whenever possible.
> > >
> >
> > You have not said *why*. How is this different from any other device
> > whose driver is only loaded when actually needed?
>
> ? I just did that, but let me repeat:
>
> I think the fallback mechanism of the core should work without any
> module loading infrastructure. It should be there whenever possible.
>

It's not really a fallback, is it? This is the path we'll always take
if the driver requests a reset control on a firmware node which has a
reset-gpios property. If the driver goes with the gpiod API, it will
get a regular descriptor. It's deterministic enough to not warrant the
term "fallback".

> I might add that module loading infrastructure might be broken in
> userspace. Been there. Also, some drivers might need their reset early?
>

Then I believe the platform's config should make sure the driver is
built-in. I don't think it makes sense to just cram it into the kernel
image for the few users it currently has.

> Looking more into it, I can't find any 'request_module'. Am I
> overlooking something? The fallback feature is only present if the user
> loads the driver manually? If that is true, it would make it rather
> useless IMHO because consumer drivers cannot rely on it. I must be
> missing something...
>

The reset-gpio driver has a MODULE_DEVICE_TABLE().

Bart

