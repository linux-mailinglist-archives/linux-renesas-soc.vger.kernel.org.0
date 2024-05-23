Return-Path: <linux-renesas-soc+bounces-5452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7FF8CD152
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 13:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B6CB1C211BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 11:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A1713CF9C;
	Thu, 23 May 2024 11:36:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF84BA2F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716464165; cv=none; b=qX7A2Sf2lwwKwOtDQQ0FVOMbCjuTaKyGsKPWXDvMX0MZ3hatOj0I5+sju3pyyXnmJALk9ur8i9rh/bQ6VKPC5FQqjYCRusE6hWUdi2NmgB8ib3jlE598X2G4lwF4fkhYVFBtnKkpKHkhXYh5moEyr3Ip4QKY2NRyH7QbEy2f5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716464165; c=relaxed/simple;
	bh=ANEtUuMInPu22m6EV1Ni9kn/hW9APiX6S36EC/RfeTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=WP6XASPaAwomgKXrNSyFubKGfoyzzEfAby4+xaP6TCweT/M/1j2jMMmt9eBHvY2oviBK3OeXXyrVFVgRcf7xPq4gzfnYyC0pzksKc4xuwm38wPkuGHQLNqap3D6XGRdAVfeq+a5KP1gpFDLM23++ICPxTnHgviOeowrZmGycoBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61b2218ab6fso48183997b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 04:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716464161; x=1717068961;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnnWsYhTPpZtFzqzvxn1Jku3HxrEl6bQT9QKNvJfDeY=;
        b=M/aGTQBRvE2i83UsYoRkAGC7bfzScpB4Q7ONATCZ5QW+Cp3FbmBFcRKz+ZwHdG9WBr
         R0a74FgU7JWtlXL42X0I51BUtNg5zsr8TTxv+1C74OCX91Lqs3oEy2D/cC8gkeqoYaMh
         FKoWyS6PeAsQD9XCDYJFV4ihGecxnK3XSQdM7E2SjY37EzTt2/ajGNl2B5yYFD4zf0Mh
         cecfCgAwR645RitR2vJ0NYpUtHTkOrKahDOGF76rDJMK0hf/4lwfeEDmXeOKzH/rZ0s+
         MTOPrtZ5hTfwlgzjj+xAES0Vngweh/0YANHFZg7VmlNkqMN5++a9+nozZAwKGZe/HCZi
         koHg==
X-Gm-Message-State: AOJu0YxD86zH4ckrN3APqmDrBvk4WspuA6jcqU5sLKmLlF3KLEQRV8kU
	RqdDdjzEsh8Ln8iqz+zsklVs87luOxwaLipRlN4fVRd9iHD82K9ixlmd5WEu
X-Google-Smtp-Source: AGHT+IFO+ktaUktu990mbuDsltnHiQV1+day9JXRqRJN1Flv8b5Cdjk3aSzpaBnblY/0CQ3Cm0TSZA==
X-Received: by 2002:a05:690c:c05:b0:61a:ae0a:1f4d with SMTP id 00721157ae682-627e46edb10mr53671857b3.17.1716464161462;
        Thu, 23 May 2024 04:36:01 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-627e1f36c82sm7570587b3.19.2024.05.23.04.36.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 04:36:01 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61b2218ab6fso48183827b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 04:36:01 -0700 (PDT)
X-Received: by 2002:a81:5203:0:b0:620:4018:7c67 with SMTP id
 00721157ae682-627e472aed5mr47843157b3.27.1716464160982; Thu, 23 May 2024
 04:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com> <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
In-Reply-To: <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 May 2024 13:35:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
Message-ID: <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 10:21=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>   - renesas-drivers-2024-05-14-v6.9 (TBD),
>   - renesas-drivers-2024-05-21-v6.9 (TBD).

So that became renesas-drivers-2024-05-14-v6.9

Next planned releases, if all goes well:
  - renesas-drivers-2024-05-28-v6.10-rc1,
  - renesas-drivers-2024-06-11-v6.10-rc3,
  - renesas-drivers-2024-06-25-v6.10-rc5,
  - renesas-drivers-2024-07-09-v6.10-rc7,
  - renesas-drivers-2024-07-16-v6.10 (TBD),
  - renesas-drivers-2024-07-23-v6.10 (TBD).

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

