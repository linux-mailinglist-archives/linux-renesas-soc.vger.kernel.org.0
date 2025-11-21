Return-Path: <linux-renesas-soc+bounces-24953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD775C7A65C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E67C4F2681
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657022C1593;
	Fri, 21 Nov 2025 14:58:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11512C0F62
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737084; cv=none; b=nuw9P8m8VQJXTpOUGw25BPweoV+J9df2/XlkHvwWD514gajaiNmw2kJeo/JS07SN4Ib+NuuRcv6weh5gHuPCQURWUuDoHfiQ3O6HeLNNbRSgV35M7giGGlBEYF1YkfbZUnyNtDe0ayoKDkC22d93T4gZVWBH5VW8wKqy3mLOa0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737084; c=relaxed/simple;
	bh=z9Bsa1f1sbWqN7C4msF/pWLE5blDrixbOnRk9RzJyf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7ur993YSDtrtq/Z0PgnjN42+0P8qfu/o++yC3PQQIs9haw7BK72pv+WKCoe7t29GSZPeuqr0cgNnLg+eqCNhB95f+bSIt+6fHGdWHowNg+AqabcsAG92RIqbP022q+VlfkrWJjeKS8vgCh30QfYbgEGJMYw+ydLB0BMfa3j9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-559712e8914so1344088e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737081; x=1764341881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfkyv/tryLawD4Q8sssLn/BjejOMHRpCzq6qtJXB0XM=;
        b=sVsGehZaVrX7JZPCycmGrJs7eXhD/8nEfb4FMWBZvQs+ueX5qCcnQoCWemlj/B749M
         TjNWc6L01y4atzea3puA1E3Mp3onuVduhu1vWTIosQwjGmqEiLpqPXEFARt7n5Q3zsn1
         dsromsBqfGtmrUskZ8YVNlZkRzMEyegcn7F8eSGak3PGBjwEdcZ4tzmNDW2h0aC8cQjd
         ByeKx6MQy8QQYKT+Kky08I6Ts0zlTuxGX1uC2sC96DRROJbpunZyl4kh5ayvL9z3/N6j
         ush59DedN82ZZToRQSa4QfyG44QNZJ8M+HyTKORn2FZlvxXsM2u02+nCDIO46WNpCvRK
         5hEw==
X-Forwarded-Encrypted: i=1; AJvYcCXylKa71ZmRUCgkr+jtqvYCXygAkXcsLiIZp5Tud+D+VrQHOD9VNW05/HkykIfM3j/Tie2D7SuNoJJtIwxvhBE7Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJO2mdfdnZj2L44xg5tlaCmM4hFCwJUkd8HyoYFPWduUFSdwyw
	SBnMY2vhTXoWVxOqpkY2THaCuXsL0xxSbMFNiY2UXFsVrqYilUPou/MayaigQTrh
X-Gm-Gg: ASbGncsAtWFganie3bsW5XfM1drDwkC79CtO8tEMOJbqJGcY7X9AUJe82VYdiquIoad
	e2pNhXjsHr9ZYTqKTRGtUGyUcUYsvw6HclywojxH/AgFSfeaJRSW3+JzjT9SNLSjydhA4urbRZQ
	+TOtv8hROzO+Bi+KONCTJ2Fxsx3JGnnSxLsCdKEKxBFTsNUewbe7tYcgMHVa5XfEm89rv2tF6Nh
	Gxnz7wlQwC8SQ+LI1VE6BNh4WMPObXibiWWHukIV+HdZ311FetiSXWgn0Rad8pnbTjfE5uAucU7
	H9qoAL1CoL7F01bohIdO4Zv5p0psSD2XD7rQVZRznAoRDS1F8E4HZXyzhdEQkUfn3w8TLL0QKYX
	zzRWRrEzUt38PneU4/c9suDu/SczwW4ls7GD/yfPC2ViRQdmQdHoVvwYWrySodeAleX+wbXxqUv
	etiW07amevuAenQbPsolUDC+EjvEp7aXcnQBSHxFwgCSCxW7PQOP8R
X-Google-Smtp-Source: AGHT+IE61/XgPHuHmN9Q+/sTEJEQPI7Lfn5R8EsUxg5UMgj9bh3C18D0cVF0oVi89Ab9dqDjgogtZA==
X-Received: by 2002:a05:6122:906:b0:55b:6b20:a17a with SMTP id 71dfb90a1353d-55b8d6f48e3mr731422e0c.9.1763737081465;
        Fri, 21 Nov 2025 06:58:01 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f64e4f0sm2501889e0c.8.2025.11.21.06.58.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:58:00 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dfa9c01c54so1331680137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:58:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuLAdYMbCp8AoACQyyLxsrSJ1Nck4qnzpug/zRbMAWzek3QhTKFC4v6SBrar/qhXVhcQhyf409v1WE3H1ajkx11Q==@vger.kernel.org
X-Received: by 2002:a05:6102:4411:b0:5db:d2b7:9511 with SMTP id
 ada2fe7eead31-5e1de48395dmr710558137.40.1763737080699; Fri, 21 Nov 2025
 06:58:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 15:57:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUd6_rWDaxGTjJVJjyfup3rt3vzUTMz4=iBXv+w=7zwQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnubWkdNicuBkriRW_L44RQUxMnm_IjfWKVeClWPt4dx3flq_ZzdcjFRkk
Message-ID: <CAMuHMdUUd6_rWDaxGTjJVJjyfup3rt3vzUTMz4=iBXv+w=7zwQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] serial: rsci: Drop unused macro DCR
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Drop unused macro DCR and its bit definition.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But I am not a big fan of dropping register documentation.
It must be reverted when adding RS-485 support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

