Return-Path: <linux-renesas-soc+bounces-5657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B728D3A41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335411F2195A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D10D15B11A;
	Wed, 29 May 2024 15:04:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54E157A43;
	Wed, 29 May 2024 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995045; cv=none; b=ZpoYy0SA+hA+aJnzFOfCyXpmBqCTDsKG3AIg2l4rWICsy09evscJhAqxmgKMGUbxvpNPHNboZJHHBgG/81qbzzSvgm3E4eHsS1fmDzcK3oHzgqENaf5obEQCY4AoVosE4s+Lo/K/YoG1YrB+bp21pAf9R9M5/Wlrs1ZUaj80Aiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995045; c=relaxed/simple;
	bh=N1FVNczfpmv1IfyOCfqlUVtgwfqVYZTW/vAYHWWIviE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehro8ksboHMxHR71Zqoi71ZQEA4YQ5gSvWqR/BSz3iFj7gsJonErNx9hhXPo4udLR2I169CA4mC9VfvvbnAU+651fCuxqWOWNCFhmhStHzbl/X+XNsipDYcD858gaWGIdNz4O2sfEAJ6o1P4AGMGFhjC52naiwQpTeqFh0ZBvBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-627e3368394so23539757b3.2;
        Wed, 29 May 2024 08:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995043; x=1717599843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLtGbwpZXCr7NYLHMYvKzswL6udVm2IskfIVQpdf4YQ=;
        b=V7OB48nkrJcqPVlt4XDWjw+pFgYVAhSfHDDpMJRHjCQfFeSDRbLFFnWwhJjmWzFMm7
         cJBpcUJ9bocrUgdSS5Qn3gq0M+rWoefMoq/QeNk0Pyn0CWaRJLyU6DnzKw1nhcRG0hoa
         G3SpiCgT8fH3GR3CgQQUYz/B4MZmFcIm+fqOjcNl3Ny6B1YBqMcbzw9xBZoefFI3DFEK
         3XE8pa85iMrjNpMwEEwdIfYBJ43GCl7ZEgQ6GYmgbSsBhOCGAti0hfm0/elxKegzsLFt
         PJt4Aet5cVI4XFN/K55QnuZ7vrTuGpayWH2DDCso5EN8h+UL1e5RRBfVsbaRCuLm4BCV
         XGhA==
X-Forwarded-Encrypted: i=1; AJvYcCV1uuGuCLdi8GHFK9W33ghyQUKqD8SSKEov5/wY50ml6PW3RLaJLR+UNts2PPj255TCAROYzhwE6t9gp9wAeeafrsbwt/uiLIvR
X-Gm-Message-State: AOJu0Yx3TEunjgPBrKOe0jN5GkjrSK9c8jliT8qUgVqqnWH3HkJdgpn1
	rbNG2dGDh3CORzzT/m8v1NK/TsH0+uYxb7Lp5AFXhFiawg2IPrss7fbWhShl
X-Google-Smtp-Source: AGHT+IHZv/WCJCnKI1lWjEKf1BOxvBgWeijV3bGUBEbcVR9bIbEzV+KN7I4zhLVlZXyoucLQR2XJ3w==
X-Received: by 2002:a05:6902:1367:b0:dc6:e4f8:7e22 with SMTP id 3f1490d57ef6-df772389101mr14545587276.62.1716995042702;
        Wed, 29 May 2024 08:04:02 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df7746889easm1549278276.17.2024.05.29.08.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:04:02 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa49a90146so795452276.1;
        Wed, 29 May 2024 08:04:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXziRpsA0CBoSN2NoCAq9eKCFdU148urgUdzU15BWxkbgUm2zCksafLZT2F2NZEcX0vtVpyk6VjCZXXCBO2yBFdPdpqCygKTLoJ
X-Received: by 2002:a25:6603:0:b0:dc7:5cb3:256a with SMTP id
 3f1490d57ef6-df7722676f8mr14926888276.42.1716995042222; Wed, 29 May 2024
 08:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se> <20240527131541.1676525-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527131541.1676525-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 17:03:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDdJV5Tyx+DUY5+tZNwpG81Ev+5_NGqbzqFARt1EeqQA@mail.gmail.com>
Message-ID: <CAMuHMdUDdJV5Tyx+DUY5+tZNwpG81Ev+5_NGqbzqFARt1EeqQA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r8a779h0: Add ISPCS clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:16=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the ISPCS0 and ISPCS1 module clocks, which are used by the ISPCS
> modules on the Renesas R-Car V4M (R8A779H0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.11.

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

