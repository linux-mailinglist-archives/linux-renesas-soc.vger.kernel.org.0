Return-Path: <linux-renesas-soc+bounces-10747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 845039DB419
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 09:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A93E716468E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 08:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C2E14A08E;
	Thu, 28 Nov 2024 08:47:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FBD14E2CD;
	Thu, 28 Nov 2024 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783645; cv=none; b=m6tPCsxDZ09kDy9vQlBbnCaoFHmTqe6ElllPMD8J+JK/wAVDPhA0YuDaJyzJa9SsTa3RWFyxvq6AZXMxr4icd25+3iVTPEs0D9A3sTNoBxtXkkVWifEt+cEC7nY3HcY6i89TZygMWPxRnGF5/4VjrZXr7Y5DDmC1MQhCiTjVrSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783645; c=relaxed/simple;
	bh=ZhYrJnvlh+i4LVmD0hsqQfgFobW/bRCaAOp+DMwf09s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqEjCX+TN3DRqf0/qzvPrWb8qhkDVQ74RMu7+jphDdV3wOOKx7Q0duH+5ly+ZUUSa6bWmTbxRemt8b4PWQ1cJtpMqzpkDis6FoALckHLn/t4VJOBY7TPUtNZduytyM/XoMTvTOweLf3XcRvn+GKMNn8x+EHyusKaPpNCJX2XFm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so8711411fa.3;
        Thu, 28 Nov 2024 00:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783638; x=1733388438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwggmOokH8Sa4c0OeKiw69D0dnR0y4O1b2vaenANGzw=;
        b=HVOmanULMjEdyDOZUFAcHI69KREWkCYp1uZtMbzbhLLl2dwNP8uKXUoYV9k2dzeqWK
         9EWL6Il8RBqMkfLqJPAUfHCE/id7MZcf4WQKmNnxkSW+arTnD5UNJlHvvulZ8zfpWwgb
         pTodf7mQyPDWG+Zu9zj5Pkc2bywX/tgixA3sA2NjX/Hfa+u7c7joCPPv7M8bci0FJOIK
         UdokmVJ382aiVFZAVkg+dvT80kNYDileqn1HlQQqnAIyMej7LQXLL+JnblwNN9XT53xL
         KxDz+lZ0/1M+a2m7wWYNwm6GhMxTKoVPKl+qu+cXNQon5DSwRL+llPqrbzTXIFnQVy5/
         g3XA==
X-Forwarded-Encrypted: i=1; AJvYcCUOOK+BmM0OzPrs3fyaeRFIxb/TaBRe5VW2Bqq45phs7idhz1FGVDWJg95/9g2aeq286j80Yks5I6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDziJp7IQhdZNM/svS44z0dDXnrW9+mXCRc/jaUw1y2THnCb5/
	hP9ziDpsXe5IHbnXb86qzFzCbVZ5TiVQyAkBRkOxkNrub8aqeqABrJoJ8HYketc=
X-Gm-Gg: ASbGncsZ5PozXGsABxOP/0hynM6MTKN0CZ5mAxZUk9SCErOCHC2Kp6XZOEa9+mFlASN
	cPPkUymw1WjKKk5KeTJ9GC/4WP5s5ZTx/dAO4TPU3fLGkkDLspIeZ2v+LdcDSAjdSz4XEF0grIc
	dTRBDIUBC4wEVJCFms4WgDhi5QdDpiFZyv6FVRURNupg+KK2aNC+cLL+0IFWgnx0+Dews6Udf6p
	cYHncMTgDFn4cZYr0HOuWCKcXiHpJ0Xjvp6IQvvfN0XrhLGls47hlyUH2k3x9RlGgywGWjdYSeX
	S3PZyWR7w34r
X-Google-Smtp-Source: AGHT+IF6H3Xl6B/aRxN2S1vEMUewNjabg8lxACcsteT5R5/EmaFfvy4BIBiZCCHQflESKSM7yNiS5Q==
X-Received: by 2002:a2e:a544:0:b0:2fb:51a:d2a with SMTP id 38308e7fff4ca-2ffd5fff0d9mr47024071fa.12.1732783637498;
        Thu, 28 Nov 2024 00:47:17 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbe535dsm1268471fa.27.2024.11.28.00.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 00:47:16 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df67d6659so584504e87.3;
        Thu, 28 Nov 2024 00:47:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUXDxFA8dqfU2a9MTFwWwlnOXQ8PaQk93A1976ndf7IgtovTjnAdlNA2Cwi6gdpS6m8Vwej8Ujafo=@vger.kernel.org
X-Received: by 2002:a05:6512:1286:b0:53d:eecf:e25d with SMTP id
 2adb3069b0e04-53df010b161mr5411342e87.37.1732783636117; Thu, 28 Nov 2024
 00:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107193145.20175-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdW1KpmsHEFUpKYNe96cEzUEEzGUXC52o4Fand6R+o9Y=A@mail.gmail.com> <Z0gtjA3RCLzDaUX9@ninjato>
In-Reply-To: <Z0gtjA3RCLzDaUX9@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2024 09:47:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHLL+egVUum5AvPyhH9m4yOKSJbpd6Gver-9xYYWuF3A@mail.gmail.com>
Message-ID: <CAMuHMdVHLL+egVUum5AvPyhH9m4yOKSJbpd6Gver-9xYYWuF3A@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: add restart handler
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Nov 28, 2024 at 9:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> > > +       error =3D register_restart_handler(&clocks->restart_nb);
> >
> > You can simplify using devm_register_sys_off_handler(), cfr.
> > drivers/power/reset/rmobile-reset.c.
>
> Ok, will do, thanks for the pointer. One question, though...
>
> > > +       if (error)
> > > +               dev_warn(dev, "couldn't register restart handler (%d)=
\n", error);
>
> rmobile bails out on error. I still think a warning is enough. What is
> your preference?

The mobile-reset driver is only a reset driver, hence failure is fatal.
For a combined clock/reset driver, a warning is fine, IMO.

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

