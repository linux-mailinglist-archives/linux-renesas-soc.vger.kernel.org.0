Return-Path: <linux-renesas-soc+bounces-26195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A8CE9EDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 15:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77BA0301DBA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 14:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D8326561D;
	Tue, 30 Dec 2025 14:27:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CF323C4F4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104877; cv=none; b=ecPmlaWYQ4qC+e3xv1szDvcDvBkDyrpPDEYuSzSWA2iVyX0yUDXQIysmRPGdqx5d5B7cqsT/yGKVjluw1kbr0Xng/N92JbhyVyY5KanIQbnSZC054oHl4PXWlnervggAbahZ9vY/Fw9Y/qeQhSZaVo8LyZmZnL3Iceo95VvRKa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104877; c=relaxed/simple;
	bh=+dutgkFFrzdsvj7H90KKT4iDf65szYNT2Tr+Vghu3To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoaZlVky+1/x4e4y17fMg79jRYo9nKPbspsU7WYGq2SCDZRerDpb5+NHcezSZ8JmRurdjqcobPaE/mg2NH82tJvnfE5Ni8/8HXeRsWvgEUcnkVMhRyQ8Rbv/90rU0CQpNrEXoz1Ux7yT84dr/rkU9ujByq5jCQMLWD++21Q9mBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55ae07cf627so2403114e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 06:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104875; x=1767709675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVxAPYgKCcBeYHyKGPlSmqfJ6oQZ7MwjBy+J2gXmu+Q=;
        b=qm3v0zY8d14o+YkgQJfMlQQMRKzxVYwkZgJE1ZWthZdUosiaYkJXW017lQkGX8Rnat
         xT5k7aSrH6i9BuqIdD0f2+2ndRDfDX2wHxytP8KeP+Hst6sxBgZw4Vb56o1YjN1otC3/
         odCsRjDB6o8Tz/yj6tqbIMhRCFb/7tbwgALm47px33bwIslFkczfZ49ACjI6nhtf1/cV
         K1AO4Oydpz+/vSg6FUqbdwOPZ0Pg7/pm123nLEaOSlFZGJGsyloblJtgmYjWqbs6VIB9
         c6FGGTzjKrx0T12W6zh04tXXdxDoeHhN3MX16AbgCEbXAKTHX6QmmbKynrsw5tnNvvHH
         yJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4Rn20vt/n16febCDTGHNnMnIs1P1k/xMpsSs1d1uHoko1r26PLtNdqt8NW2HKn2IZWxp3E2+wVDqgwBnXsSONjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4GjoQARWzeGDvFTF/PSQAqmiMjtNqkP0gibJKZT4MJC95woyx
	yZq7TgvnGe01x1ZSwcePftBxWEtXJouxWLXsaNzeMSymgKeK54rxrvud+EzO2eWp
X-Gm-Gg: AY/fxX4p3fYGAcCFJcIOWCbcg7jRFTTlqKcvGMUE4Uiwop96xlh6ODqfRxjVPog6SDn
	uy7nRb/VVmqvuFRx/yy7WDwWIruExnltV1PnEGfDVHmkTpLujl/aA/JyZP5GPcLntme1YbiwaFi
	Ii50H1HSAVmL/drWzgVlWqe5ie+zzI+fGoUdZVU3cUBFpJbXC9kf8jS8EE/YF0UXK2CgKPHEpLf
	Cx8eMuRnFPtgu4lUrIpVcKEUkabngyX4Kl2Af3ovmUjvqyTvESqqx8a8BupfcrSL7hgezm0XS8G
	b/XT8UbnrGuKjjhiaheE127m9dAli+34hLD2D+7omDZjEd1zm+xcFH1TngZGteGmaAiI4yYhUlt
	nILfNxUAI8tTKkcoVti8aipldAn+SC3VWHIEIsgkAUHGbcw/FSGSUCgA7J2AZXwsBCF9FoWaiiC
	rVhzgIVy48l1EYtwf+HveHRj8cCxikBOxzTogFFRnBStV0d+QZ
X-Google-Smtp-Source: AGHT+IEOKk7MlSAyk3ZPl9Dgi46yD8ShqwWS6RyO0OQin9kjwITJVSPLETsEcLUfldXEgBWXDe8+Qg==
X-Received: by 2002:a05:6122:16a6:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-5615be84c55mr10201301e0c.16.1767104874740;
        Tue, 30 Dec 2025 06:27:54 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d132efesm10365807e0c.11.2025.12.30.06.27.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:27:54 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so3728685137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 06:27:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsQ5+NYls3UCpykIhcYIGIo/HeZd11s5Hwk7mhmSIGYD37pzLSSV62spv+4+FdOlxKLC4sTPxfZEkw1Cy9dGH3Pg==@vger.kernel.org
X-Received: by 2002:a05:6102:148d:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5eb1a8044f7mr10349292137.32.1767104873794; Tue, 30 Dec 2025
 06:27:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230141050.93856-1-Julia.Lawall@inria.fr>
In-Reply-To: <20251230141050.93856-1-Julia.Lawall@inria.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 15:27:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVskYbe3sk3Bq7qLNLd9ahy6K3QOLHphQLBqpKvDjXQxg@mail.gmail.com>
X-Gm-Features: AQt7F2qG_yFtePzO29zvWHTP6nVtCgovG5NMsBrOll6Kioon3iC0k6mcBC7p-ms
Message-ID: <CAMuHMdVskYbe3sk3Bq7qLNLd9ahy6K3QOLHphQLBqpKvDjXQxg@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: fix typo in function name reference
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Vinod Koul <vkoul@kernel.org>, yunbolyu@smu.edu.sg, kexinsun@smail.nju.edu.cn, 
	ratnadiraw@smu.edu.sg, xutong.ma@inria.fr, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Dec 2025 at 15:10, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> Replace cmpxcgh by cmpxchg.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

