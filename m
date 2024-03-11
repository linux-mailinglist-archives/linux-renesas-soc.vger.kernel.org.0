Return-Path: <linux-renesas-soc+bounces-3668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B3877D17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F701F23BA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3057F179B7;
	Mon, 11 Mar 2024 09:39:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7693322318;
	Mon, 11 Mar 2024 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149972; cv=none; b=C92mWsrAqUvjSmzDgnatbX3bU0+VkEbDeYr3MRd9VfGf08d/xGGItmx/sQUrwxc2zZR3HoKBLqwL1bedIVdmdyucad2WwYCQI9+pYJ9PuJiRFKuncLKIs1LXfNgfF5+6TWCbqmI2YkWm6sgGfVQ0Borxe9vbr4eEIRtjpuZyEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149972; c=relaxed/simple;
	bh=8RD6mC8xSja2sUNhifabyAxiPFVD+N9OqMGAKLucmho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7n4iAJ8mGtx8kodHn9p0enP1YibYVM2Ac0Dn4MS31odvYDNe8Q+gxpu0TLFg3RGw5Ioxv/z4XL1rRiSjGzqn0k5wlzOyK073EDWtubLwF03X9In48Aadvvt3ErqPYv53TbAljRaPCQugyf/ufDMt9sv8/iAATSebF6mkFIb+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a434ea806so3884697b3.3;
        Mon, 11 Mar 2024 02:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149968; x=1710754768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op2yPO52E5v0vCyGVS9xjBGQxS0Hr3LHOnGrg5TkKto=;
        b=WAFCwXqfi8Je+huHvs82qSFFBnaZlUri+664omHyzTri2vh67v0VL6FZyp1yf4MDC1
         WFIpWujCfqLbHnCUfLxZcgMbnLiGYjRvmmkCrkLiNBNkYMNjO+b09CZ83qtoBMXjmo/P
         HIqwLeIpI2pXkA+96C1vOdoUtiLIcK7R7NFAJWCcuTXSmX9vC7uGXfT1is/X9dng4uOG
         ltOiTdbK1fyoVo1AIDenfd6Ej5LDh6/J7dnD9qaoH+DoyrDzAqF8Y2Ez87TdEP3PWHkv
         7Gcy3HbxDCtZETkq3E2tpaB7+dwrWbt+mH6+meVaBhscjLk6+fB6XUEDT5jZZd/14FmT
         Ao2A==
X-Forwarded-Encrypted: i=1; AJvYcCXCL2vS4WYEIS764w5qqEmBc6WXWnHEn0P3P7aS3B11hdwV0eQZ/5RrXSOWEW22EymcW6Xa/9d/ZTbrEGlAT0NLn6Zbjn2nb8kYhFxT8jiVqM4LlaSLNiB20G1R6gc6eTTiPJdIyx+iSEw=
X-Gm-Message-State: AOJu0YxQ13t3R+qtJnHJf2H2BKLSBebc2HOx5T4UMoGd1XlGXYXW5zU1
	yzJOkDIZ+41xL+Hw81GxWUjZxnsFgBuK80nVTNssdN32fPudkJQK1zOB1aYjvso=
X-Google-Smtp-Source: AGHT+IHedWwSxTlGXbykQ9Me12qddonRx6ayP52yW9my0ajg2vcMAndM2DBuznHgPGjmTtL844kFQA==
X-Received: by 2002:a81:a214:0:b0:609:ecb9:77c with SMTP id w20-20020a81a214000000b00609ecb9077cmr5527159ywg.18.1710149968408;
        Mon, 11 Mar 2024 02:39:28 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id i17-20020a81aa11000000b006093c621a9asm1211402ywh.86.2024.03.11.02.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:39:28 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60a434ea806so3884517b3.3;
        Mon, 11 Mar 2024 02:39:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjFoMKtH4YXSc+7thwr+CAIhtgBaYrqSoMLbipCkl5XJ/ukDLCbxqW9iMvUp2GX/sRl9ecBld91BB9ScLeF15oLAq6ZbSGWevDcLycYPgbFX9/bfaWZtPyc3W3a+86SUIdHRqFrCU3KV8=
X-Received: by 2002:a81:de52:0:b0:609:f7ce:50b with SMTP id
 o18-20020a81de52000000b00609f7ce050bmr5008033ywl.21.1710149968098; Mon, 11
 Mar 2024 02:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308224237.496924-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240308224237.496924-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 10:39:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpFKbDTHMzLx7VagKLbU2nk_oQOaodYhgA4xhUK8JQmg@mail.gmail.com>
Message-ID: <CAMuHMdWpFKbDTHMzLx7VagKLbU2nk_oQOaodYhgA4xhUK8JQmg@mail.gmail.com>
Subject: Re: [net-next] ravb: Correct buffer size to map for R-Car Rx
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 11:43=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When creating a helper to allocate and align an skb one location where
> the skb data size was updated was missed. This can lead to a warning
> being printed when the memory is being unmapped as it now always unmap
> the maximum frame size, instead of the size after it have been
> aligned.
>
> This was correctly done for RZ/G2L but missed for R-Car.
>
> Fixes: cfbad64706c1 ("ravb: Create helper to allocate skb and align it")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

