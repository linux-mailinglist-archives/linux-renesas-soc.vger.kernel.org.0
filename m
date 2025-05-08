Return-Path: <linux-renesas-soc+bounces-16808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD1AAFB89
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 15:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6240D4E53E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 13:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7F822C325;
	Thu,  8 May 2025 13:37:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10294B1E6D;
	Thu,  8 May 2025 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711444; cv=none; b=CkCNzv37RCWP5vsTyTTIHdibPWVtDkpYqCbWDRUMQLxrp2fgaN2znk1d9FNSxkjKI+F80bo9xy42fSmq8djHRWfBAD9ok7nFyK9yysl4yzuzzvlhcLTyCc9LF0YPe2X74IW28ZCneFfsA9kz647bSjKF3JLC5hhNEQayeMrk/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711444; c=relaxed/simple;
	bh=s7z5o/8eCMGs3s+A7RnKcNXCea6Sot4vDPIePl11Lqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+DdVsAHn/iQkFg2bc74m/iRYlQf3aGEZUkLXlsQFpSwdeLT0KsK1zJPe19nTxGFBIFe0aWxenRn5GWlNHBg77iOcEPNRyELwNjxfaQOgzP+ukobyCHWU18IoAaOlPX3UfKFxcEjRtNDCb+lMBUXB+B9aImZcA29jYE3KwKKUfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-527b70bd90dso369835e0c.3;
        Thu, 08 May 2025 06:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711441; x=1747316241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1i0NJfkB7hfbRwgqC8YE4+7ML9IkokDWfYMaehwDVU=;
        b=QQ2FuJjGv+Kpn7YD7dRKcMxGaFtNegIAJeFHQJbveHV+DJGAqL5vwS6VpWhG7aDJ8Y
         N+Gg8ZH80vvgiNljRdd+LgTjmzCnIJ/YA0E0ebfNspx5rchVuFS8ETbKBw9LAySI2dGS
         qFwiE5PdMCNB4mfpuzIvFGU1bJguzV1Sf4qOK6MYiGI8CHZhRdnN81NIwH4Xy7W1IVQ+
         3B+uKB4B5bMGIW1xjE2LYwPZqWLhDgTZwiHxaO+iR/KKK4EJ65KipGFf753zG6zc9N2W
         gnsPuyhGNwrad+bvjk1YPqgg995H2+k7dC5e8FL4f/2eh7YYdhnKnNmAXuSAYBPyApkL
         Em2A==
X-Forwarded-Encrypted: i=1; AJvYcCUwJFff0gonjphoFrBFp6POvwt0lUjKXgXYI8xM9HfgOI0qjEAXr1uYxMBVjhIcJFjjJCZw5KfFIeU53CGYOm3gdP0=@vger.kernel.org, AJvYcCWXeS+dvYfGm+vQpS7YiHctsbOv6evcz7V/W7ktaeHDbkQz1GEBuCZYsYb0Qznt1d8VYlNcWENP8ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQg1txgpklPwGLcuw5VXb/1SXEzqNbn3EheVKc7S7xzwo2kk/v
	I80pLcnZlQaDMys2phkQIyHaHX3OzIfc1DyPN9VgrztpFji6DbVC7+n661fs
X-Gm-Gg: ASbGncvF9FBRCeDbMwsaOpwUp0X0sNyFhbJzjLxK5l+uU8DYtFSYEMNb8c1OtDbAFxT
	YWCVBS43ZsLX8RM+vuEIXrhqNgwb0+KSnYnH0xshQtBWMzGyqt/UECEjFLZmoB4SbvnO7XV6UVA
	hQqG0k0la4xL3A3F2vOXqGY6FwWgM8kCDoTofAbMjL3beDnlZEVL65z5FhWWSq0ePP1Bdl1HDM4
	MG+dzCeNAjune2eSfOE6pjBKKHWEyy1u+wpkTRIZvVthRF6MfI4Zlhhn+xeqI0AWsP8GFWkQMsj
	NLCWNciPyF3d6TauGkcPZweOMPYAuIwEjSiNwqm9UZ6yN9hU/YEkoIwOWAQWDZ6bMO7hZDJonqS
	TGec=
X-Google-Smtp-Source: AGHT+IGHYjhO6/AnzFx8ftKVzGKao1URNHW4TwUJZ3ksDuOp+hBFSMRmYOpBlvwCgiE/OTuY9jXlnA==
X-Received: by 2002:a05:6122:1da8:b0:529:2644:76bf with SMTP id 71dfb90a1353d-52c441e8019mr2346672e0c.9.1746711441196;
        Thu, 08 May 2025 06:37:21 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae3ff5cf4sm3019782e0c.5.2025.05.08.06.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:37:21 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-878440ee153so281131241.1;
        Thu, 08 May 2025 06:37:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9Ppxoz0zV9z1V9G3H5iggKx2ve7FBrH8ALJYiulJciUyUoZ2tMf2DLrPsiPQCIZU9Vu8n/1bxDQMITSg0K0Qqjhk=@vger.kernel.org, AJvYcCVB8a9H/XTR5glHHUisvb/dORubnhhfLd7LIjSKqv/NwrZ8EjbVdzcTOtjTJ6GV/pjvJEv0Mf3ILas=@vger.kernel.org
X-Received: by 2002:a05:6102:5709:b0:4cb:5d6e:e6c8 with SMTP id
 ada2fe7eead31-4ddacf8b482mr2820618137.9.1746711440868; Thu, 08 May 2025
 06:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424081400.135028-1-biju.das.jz@bp.renesas.com> <20250424081400.135028-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424081400.135028-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 15:37:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsEa174O915GwnynRiTDovDK+fnVj=FpES9OvKS_14wQ@mail.gmail.com>
X-Gm-Features: AX0GCFsOBEvBTexLwoS06SXdsf-j2jd7t-kImaAkNfb1YdwItXrnCxVupF6UA7Y
Message-ID: <CAMuHMdVsEa174O915GwnynRiTDovDK+fnVj=FpES9OvKS_14wQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: renesas: r9a09g047: Add XSPI clock/reset
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 10:14, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add XSPI clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

