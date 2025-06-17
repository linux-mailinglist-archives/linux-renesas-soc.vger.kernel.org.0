Return-Path: <linux-renesas-soc+bounces-18412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A51CADC2EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 09:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A959A3A133D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 07:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4595728C5AD;
	Tue, 17 Jun 2025 07:12:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD228C2C7;
	Tue, 17 Jun 2025 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144363; cv=none; b=bFdoQZ1XYATX6pnxncrXgJG14Tf7hD/C7dHW5+uFkHUtD4lpFiyif3Go52C1invsnVopFWjXReOwcqOp408SsaFJTVuUFo1BVLX2qZb4Vd2lFl5RiYbJQl7uw18YFf3lG3Wuo0dd+SMSs+na+2bXeKWSJ1z6wRuqcxYJHljYnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144363; c=relaxed/simple;
	bh=0ZvkLgWdTVoVsHyt/50pZjOCSEl6fxkinMVnmzzuyLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZk6NcCvLQFnWmZJPBEbRMUYeLSoFEVGhIXoMwVLCoHEgB6xHFRY98LucoIC+T1eHvAuagit59VuwLtQ4gz6dvTNE6AR0LCHS+dT/6Qts6j3Ab5RHOTqBru8eZ5fLlttEs7OpluP02q8E9wnnAHFe7kwkLRDjvmjyvdE7MO/X/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5315acf37b6so620345e0c.2;
        Tue, 17 Jun 2025 00:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144359; x=1750749159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Nmvul6W8ekOE7+MmxAVOB45wapNmCLHpMau5XL4H0=;
        b=atykW+qVRpHI5PmgLqiftvmxRNqY/2iWnm56gWD9zjgMeYqgaWBylutmFs0Yxv7Xzd
         /Fk1elljbuFMDmc8hr8gCsnQzjb9coAfeqIRqMlCuySM0tSf5zJK8QQYWdGpTUbhG7kA
         vU3lkFUqCTYnloj7Eaks80I9LsWl+cGTohx6kGthl0bkBD10EnJvowBtUUiWaf79NOkE
         6zC9slzJLglisGXn2Oor3veiMgxOGu/W2kHVq9YdRjebyVIQMpNkFUjAV80BKnCWHAMz
         VYPAM5NUZUKov357HpuWmdkj95/cm/7jc0TWrizjBEKr+NfBx+WzrzjwRt97DPrY409W
         JkCw==
X-Forwarded-Encrypted: i=1; AJvYcCWDsA81LDsuW7WCmo4AgQoZB5dCpHx6i30BsoBQuwhbWi9v6dgVAnnoky1HEVe7TjOA6jGGw6eWDldNeYB30fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbKBX5Udp3hma0iIt01fUr7ZbZm2w1Z4Rrj3nlQLX6n7zFAl4
	D6LP3eMuJB1hQ8eZZJpSVTbxX9LBlrR1bYV6nyYBiTOQq05OmZFCZ/BIG+YxD5qK
X-Gm-Gg: ASbGncusHeJH8WKj0Hs1pmNxN4Pl8HLhJ4YNimH7TRwQPmWO4cliC96pFZEJJxqRH6a
	j1oDqTvILWwtn2e9lDpy4ZxSakW3z8LcaDJS/aLGAH1W/FPD0qqKEelnfE/82MfWxoPScbIuL/Z
	LwbQkRuPOTH9bBMq6SxTW1i0VrrAbpBgnrtTWN26qCZn9Xq8Rc0Rq7IseKY614soUTJQrCMVp52
	UxEKQSA+obsU5Y0mBqL/KUHbeixuTdQ6KD9shuiEx9h3PhfJlA4EAcO9IXH7x5LdMXfmMHYYIYO
	/6hD/CAIAeSXvI7hNUS1+vQL8U5/QrZYNU6SLzTEI2QqdYAZ/8HUJCYqYMfas6IuRmQ+IwM8289
	hYCOJJG9eI479It1Qo7kd7ixj2B6Ar+SwhHE=
X-Google-Smtp-Source: AGHT+IGTSh50xfm440MU+tVE2YbvTaJaIzc+Y8oyl8fs2ugWx3ed26fRB1lx6nR9YyzkSRTnWkQKkg==
X-Received: by 2002:a05:6122:3c51:b0:530:81ac:51be with SMTP id 71dfb90a1353d-5314968c4f9mr6983365e0c.8.1750144358700;
        Tue, 17 Jun 2025 00:12:38 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dddc610sm1560628e0c.15.2025.06.17.00.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:12:37 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7eefcbf08so871671137.2;
        Tue, 17 Jun 2025 00:12:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfY+ppWO9bbb1o9sqxuKW6O8PoQ9buR83roppvFdYaliLyLKPRKUjelCiuT7UfnW8LjezoTkb//7s8B2LccVk=@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:4e5:59ce:4717 with SMTP id
 ada2fe7eead31-4e7f614b8femr7832472137.9.1750144357283; Tue, 17 Jun 2025
 00:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com> <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro> <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro> <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
 <aEwjU-uq4XsNzrOO@shikoro>
In-Reply-To: <aEwjU-uq4XsNzrOO@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 09:12:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
X-Gm-Features: AX0GCFvUnS4t6z_q3W1IAT-fQyHXax5-N9-bx5_cemKOClJecGyaB9RpDeXkPO0
Message-ID: <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 13 Jun 2025 at 17:15, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Perhaps your overly-long Mail-Followup-To:-header?
> > When replying to your emails, I always have to prune the To-recipients...
>
> Let's try if this comes through. I told mutt to not add it anymore...

Thanks, much better!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

