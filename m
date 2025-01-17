Return-Path: <linux-renesas-soc+bounces-12222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089BA1542B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E113A50E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7076F19D080;
	Fri, 17 Jan 2025 16:23:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD4166F29;
	Fri, 17 Jan 2025 16:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130997; cv=none; b=GytDqVYj+65ANPU03kb4eByP3SE5IjTG2HmA9DaMRHTlmCDoS+iCQFIU/HvWtvaw0S4smVas8S1F9V5zqHbG3fg8rCpnkgMewb4QcOg7O3fbooWVoD4hzB3JIABAL4r+s2Z+jZk5xtXxUiR2kQKRWSHfdL8rcPN4KMnHkenwxGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130997; c=relaxed/simple;
	bh=vrHwhAcFIPfEt16qsoHSG7wa5ok0Jf2fnYighPTyIwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfSyG9kbxcqBSDF69ZGt/OXlTWqZPEZ2XT+puNwMJCc7p/FKZoV1EvcVtCk5siY+Wli8wPs+atq7KhVVVEb3O6VuKCjQIvwM0Ur3Yuxp4PlDf99bKY/895dHQUqEsxIJwc5iCuAeq0FkURlPcWN0ePlr21cfzUsqOYDtuu4FyZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff31b77e8so784149137.1;
        Fri, 17 Jan 2025 08:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737130994; x=1737735794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gDEcsXsptTBX7rF38otqo4vK85Tp34U65Eg4HWVLLw=;
        b=Q9fnooRyfYh95yI9rTMtmAdZuerbMyNMI48r498g0NFZE58xXD9IyZofeY2ExpjYUK
         IfpmW5i5uQb+0KGd8auZyLPziF3p6zyTwVGPKzMCySsG9AlCN0ep1CnjCetSF8DSZuk6
         FW9MrAFLpsvvFRskxorlUKKcja0OvfHlFFZCFgUkr0s1kWjos5vT3SNgSmkUaxRsZSqO
         Rl+O8F7FGZ99tiukDhnyLS7p2LtvZ2dEfHUO9nLganmuwqMdm9/pdjqiUAaS6c0d0Chi
         aIPMj+oLSTPFbF1105obu1Rzvqok2mb05+c1ISTeKeE8u3y3drFvrWYM8t26yfQlWnTo
         Yh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhy/phjziWGRzpMWrW2TnDoxxaoE/ev+33hSE/dhIyDsXv3lQNbqMhlWqL+BRkQ8s5HH/SmDyqRG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6WpQgfpIfceakp9qd7soN0FvE+nkVRCrdc4q/NBuEVNqDYF1
	bzosYQEKYvl0hy524voa3WpIIeQBkYJdJp+K2f356yyP7FMAPKRmmUNntXJ3
X-Gm-Gg: ASbGnct3GLb5CNJZnORPIwCi87ejGxhPcbCeUWo8LQu2gRuJQirWGjJEhfIq9wWt8ri
	fWBQXO55P90kNkwnhB8s4JZZxAAtMKBqyEjUdiLtM2AhqS07dGy6pfOD7qHilRpnDG0E25J+JyN
	2xczXxPmgrJ2i/SNvPaac9xbvCFr9+7++fDOq5u4y0hmcMs11sA2kpWQj1MphoX3cbnOlVHrasX
	b8uUxOiM0xMcPPk/U+zCL+0CH+p+IGM5r2LiHzvAFe+COEGwV7Vh5AyFMd45JanXVM4nbA7MxS4
	BhMkASJ4vToq0R1oSNslS+o=
X-Google-Smtp-Source: AGHT+IHgDniCZ5mg6ob6ZxFkloaaZzinLChM8ne9i8RSgzgdE9gajiBll8XhoV9KHgqSU8hZsV+2Mw==
X-Received: by 2002:a05:6102:5043:b0:4b0:49ba:8278 with SMTP id ada2fe7eead31-4b690d0ff79mr2523623137.25.1737130994159;
        Fri, 17 Jan 2025 08:23:14 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642cab2ef6sm561611241.3.2025.01.17.08.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:23:13 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5188b485988so612199e0c.3;
        Fri, 17 Jan 2025 08:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLZlOyRc2wIUeC+4S83slIupt/r9NOeYXCzvLf0VQ7Q1Bb7SiklxDjUvOE0aeShh+CXtgNNbZS3p4=@vger.kernel.org
X-Received: by 2002:a05:6122:88e:b0:50a:b5a3:e00c with SMTP id
 71dfb90a1353d-51d592b338cmr2672333e0c.1.1737130993579; Fri, 17 Jan 2025
 08:23:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se> <20250114183005.2761213-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250114183005.2761213-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2025 17:23:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6gao_JBkob_-RqMVGX0ZJUR3=JNtvOAx=QCD8HbSLog@mail.gmail.com>
X-Gm-Features: AbW1kvYGwFanCGMAQ9WsiBkixJ2ZG-yQgOTQmFnBMJ-uY_oE6MHAxHrMLR_KrnQ
Message-ID: <CAMuHMdV6gao_JBkob_-RqMVGX0ZJUR3=JNtvOAx=QCD8HbSLog@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r8a779h0: Add ISP core clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 7:30=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the ISP core module clock for Renesas R-Car V4M.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

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

