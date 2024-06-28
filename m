Return-Path: <linux-renesas-soc+bounces-6856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77591B86C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 09:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC3828830F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466587E785;
	Fri, 28 Jun 2024 07:32:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7FA54BD4;
	Fri, 28 Jun 2024 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719559943; cv=none; b=KIR/WF0JdaRwSgd3xPCZKtqkgxGTi6L4wTzEloAZ1WWSp8KzNRGdHicVNLeazEf264lqwAQDFfL35DrhXElXj3nkIpFTq6F7WsC8INuMN5h2+nvPq9BWsHhnsq1X3yOf1E11DOY3ynE+VL+iHYGOJTUk/1684fcc91jgI4Nx9co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719559943; c=relaxed/simple;
	bh=9N1/mMfhqW8BsLENyLyD7c7i6dJuKlyiYhTst7s+czw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4tWyhknmaRn5p1BFbI74UeLhjQGF57J0/texR6bl6pVeGgqSbr6PJ5H7ybhbE61FfB/lLqhy7EHLX3rQs2Gniynw8HaR7YIhGOz5kegeTVTgVnZA/fJGS6hCOygNXYe93TVGjeiWyg4ZtljH4kVxlPMql7Qd+t7bfHNa0ocWkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64b0d45a7aaso2168257b3.0;
        Fri, 28 Jun 2024 00:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719559940; x=1720164740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VL+b3JwtyGCROTdqN/X9hyaMABG/pi++AqRbfpAIVA=;
        b=MJ4DlzyXLvkBh+WFvkM0ONe6xZLJIXpRRIIb1q4gvUWbddUFzZmqpyh8TvnOstvjiZ
         i3LdKh19P4kii1pBBPXpJop6lcjtankEqu1WERO8DuTOHeDLtSsnJFGIpx6rJLRHqSHN
         ZZa02SqN7SfZHLwMN75nbT9Q+mvWoEAQVk5wXmUr5J2NSfzc6i5ZEIgcl9itR7PQLXSY
         mUo9gCMXSPQwDb4RX+w4ERcQGc8N23f/YCDTuSsou+M+w3pncvWNvvRr0LlADDah/X9S
         sUQ56Qwjt999VJlZAtNiC0lIo7Vd74tHe3FvQVtpYQ7EQU10GtW/OKw8ZfcUqaG6io21
         3FkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs1m3BvBGtigESARaHlRiFlVCz0YKpGxMZcdcReOOvMKhLakGH44OZ+brse+OVZPKwOkJUwvsjbMraGXWnKJXCQgRiz1G4/8Q2t3CgIQrNfKgBJUDf4uPgGYgXgyTvJL9R8nFYwPAGJdTEt2FEA4A=
X-Gm-Message-State: AOJu0YwZ6tr9Unu0jPsa+iMPFUWkYDXXlOuKf9bHa7nYulCC1NQeFu8t
	dTVBGZkjsw4tiP1pxbYRCMOCVnhcLOGJTSJqkDo6DTVWtMlKgcZr7++wHQum
X-Google-Smtp-Source: AGHT+IGJOcCsYEhYIc4LmSevQtP72dxECeLth/LhDLGWRUe4feAG+E5MU/YALBjDOOSrhANvfVkySQ==
X-Received: by 2002:a81:8408:0:b0:62c:c660:72af with SMTP id 00721157ae682-643aa69a068mr142953687b3.24.1719559939905;
        Fri, 28 Jun 2024 00:32:19 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9ba5a2e7sm2483997b3.80.2024.06.28.00.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 00:32:19 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6327e303739so2662137b3.2;
        Fri, 28 Jun 2024 00:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV0qwn1RLJX38gasgI/GADLKJ7VcYyPLXSgVcrWQcKNe+j7cxsK3G7H5+xwrlO5YoWQPt2iJw7puCKgh4dfKVzf9lcOzMrL2caW69t8bs5OGFyzZdNwhDErXfGmGW9rnjGUF+hf3WZnsUVsIaVqlI=
X-Received: by 2002:a0d:ea0d:0:b0:64a:ce78:4f7b with SMTP id
 00721157ae682-64ace785075mr12441037b3.12.1719559939460; Fri, 28 Jun 2024
 00:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628052010.31856-1-yang.lee@linux.alibaba.com> <CAMuHMdXyqSHAo4LTy6t7=KSmi8Po0Cmp-U35py32RmCA-_spJg@mail.gmail.com>
In-Reply-To: <CAMuHMdXyqSHAo4LTy6t7=KSmi8Po0Cmp-U35py32RmCA-_spJg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 09:32:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbZaq0h=ObJnC-atvMo6H3J=ZNM1zZBTTcjV-SjZJHLw@mail.gmail.com>
Message-ID: <CAMuHMdWbZaq0h=ObJnC-atvMo6H3J=ZNM1zZBTTcjV-SjZJHLw@mail.gmail.com>
Subject: Re: [PATCH -next] soc: renesas: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 9:28=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Jun 28, 2024 at 7:20=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.c=
om> wrote:
> > ./drivers/soc/renesas/rcar-fuse.c:124:2-3: Unneeded semicolon
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9441
> > Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> As I haven't sent a PR for this yet, I will fix up the offending commit.

Oops, I forgot the offending commit is part of an immutable branch,
so I will just queue the fix in renesas-devel for v6.11.

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

