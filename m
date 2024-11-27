Return-Path: <linux-renesas-soc+bounces-10722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A77EC9DA7B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E38E1B278F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 12:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742631494D4;
	Wed, 27 Nov 2024 12:22:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8439E1FBE9C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710143; cv=none; b=hEr8igcn5eYVkE0zItwDjKkQxRhMBB1/Vb40X1gzWbCnoS4LlPhwWVgZa4PBA0lnr6dP9X4jQjTfxZTmXSb3x2Ipwhp7K+6wcSXiE4xLji2R0foMe8EHmcylzdix4OzF8eJuFD+33DpuzEfLJbjkVUIPuKn8SPD/lcc296MObts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710143; c=relaxed/simple;
	bh=pynOe72ZKe8gJ0OcNEpu+jcm3QiW6HYwe9eJui80oc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzyGhcSd4lH95kIpTHbE9gQvNZ3P6odylg7bSPH6r6wqNjn952xyQwndyz2iOO3wP7PPtMqRCHtTln78XtZp4O+Q5pT2LveozlNYS/reOl0kRz4LTxFygHX4uwykxJE2oz+qmhvweLAnHAPHuqrpFQkENAOcNxTT0KqVqWgIick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4af1ace57c7so405514137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 04:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710139; x=1733314939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxX5KR2By0hI4/YsHuiGJ8X4gKRMMcMe2jBmAuEo/lU=;
        b=Nb4Wt7lohXPvXXQdHiesGYict4PZP4bqfoHH4LiP1VY0De1o4xSSRYgdhyRThA81+h
         hvpZktp3tGPooNj3AJqBOUT8HvPl95I7GrPIJ3KOLy+m5cBnQl/ZQn57U07LNep4m63b
         OqtlqTmuFqGstxkOMnE87aPOyrUJxunJlCZb/oxuKOCOBfeBMcbxxxqXjok7F20xdNEc
         ggvj3AdPaoDnvNgBGGO2TvYx5D5xP3mpiImGzIyBN0u431osm/aicdN17X4n4499QCmx
         JzBDY8WTr8FbD6Cp3VS5aADYTe7Dns1Sxa7ymZo/k70eZIh4ICPkIuQg84mPnqCPIMnK
         gkyg==
X-Gm-Message-State: AOJu0Yz3FpU1/jyalJbjN3V+l4CZywAQLCyOZ007qQxjt//uOZRe7WP0
	EauWb8I50arNBnb6I7aRIePoSxQh+NzZbBpWsj7RKmy5QbT9DP4/XCDbP0/86Ak=
X-Gm-Gg: ASbGncv902a2rRKB6SCRp14hN5upwCpmzg3HcfG44Eq3m+uBWuRnTvS0fse0L10dPYj
	2jn83Vk/kfaVulXd9MfJubpfeJbFssTcOpIf4lY3t9u1dKhWsa46ej1Dli8QkQZkLSwOscaKc2A
	ReNUa+IcOQHvSD4We40DCKysvF8zBe8CBWoqDmVTIYuE45aShY2IlsLLY3vch1kIzFPVKq8v4lC
	1hyf1YB8ox8zwBQQFVugmesleVPJw4ts1ry2bvxgz3k3Soe15Tb6/vH/vd6ZqzMKBpK5ULHjx22
	yn+OXYfzv7Am
X-Google-Smtp-Source: AGHT+IGPNwCiJvLa6TxAo46I04bN4efkPvCiw10xT6Ywpkihyd20eN6g42oQGrmsHTK+ndbQ6rSCUg==
X-Received: by 2002:a05:6102:31ba:b0:4af:78b:819d with SMTP id ada2fe7eead31-4af361d16cbmr4555563137.13.1732710139084;
        Wed, 27 Nov 2024 04:22:19 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8215desm680260241.6.2024.11.27.04.22.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 04:22:18 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85706e5ecabso403377241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 04:22:18 -0800 (PST)
X-Received: by 2002:a05:6122:620b:10b0:515:1fde:1cb1 with SMTP id
 71dfb90a1353d-51544bd5061mr5657563e0c.3.1732710138486; Wed, 27 Nov 2024
 04:22:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87wmh6pqje.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVRnpZ=H=kNKzEN_Xq_ZCEcJsYOKcdE3tjd26BLnEynLA@mail.gmail.com>
In-Reply-To: <CAMuHMdVRnpZ=H=kNKzEN_Xq_ZCEcJsYOKcdE3tjd26BLnEynLA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 13:22:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAuf0sDEDZW=RD9jJFZV_5K4U3QqUv-01JBaK9Kn4M1w@mail.gmail.com>
Message-ID: <CAMuHMdUAuf0sDEDZW=RD9jJFZV_5K4U3QqUv-01JBaK9Kn4M1w@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: ulcb: add Sample Audio Codec settings
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 1:21=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Thu, Nov 14, 2024 at 2:12=E2=80=AFAM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > ulcb{-kf} needs amixer settings to use Audio. This patch adds Sample
> > settings for it, for not to forget.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Thanks, will queue in renesas-devel for v6.13.

v6.14, of course.

/me updates his canned responses.

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

