Return-Path: <linux-renesas-soc+bounces-16771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F296AAE789
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 19:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C97927B268F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6428C1DE8A0;
	Wed,  7 May 2025 17:15:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48CF2C9D;
	Wed,  7 May 2025 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638147; cv=none; b=TrqRmcxPjOyW6ByKPv7PGnIueSKpWlOkC2LCnTaG8iq5SpVvrfTSUWRAK4l4IbT+mLgxUI/n/W9Gqlsie/AQfuBrTxS702xpCmzezfAq3vsSj4jNGAAB62Sn4sh1xrU3pBjEQf5oqXE+FL+MCmOaMWNXQdXL21lwY8Ri9pLX06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638147; c=relaxed/simple;
	bh=EodWvoVBr9X0H3RmTywHuGYU76j0rL2oQlt9Tkhfqc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxsJKf4OsYlDSqJWJ634rAGNjxV7pki4tt7s9LJOfBMEQrYMNtJkLB+RwipS+NhAhypr2ayqsIaefbH7ZbmS5eSTp7uy19Vt/H2zpXyeE90BHyiEmcGTFPbC2hGh7q3d/q2lHcRf4SMG3pyQ5P61jRi+E9yK3Bx/XAvZEPjVJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5242f137a1eso23058e0c.1;
        Wed, 07 May 2025 10:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638144; x=1747242944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjssFlw1FzpH4B0sQSNz2YHpp3SvNlCS+DZZcEssn9M=;
        b=MIrGMvnItV69H0BBspd71AvQ2gDXSDgTjieOzJU1OLfD2QdMKjO3v/6DD83YNf5Yej
         yM17R89TqlPYgBzCLGgKiyQVeZUnbtpLHAFWdMKQcxhCAgmPl8PkLPH0w5xqJrYkFnIj
         twOXdVxYUYF1V9uKfrkpmPtMvpZzuDRTQ4UJ39VL+eq6A9D91BeXOjBrQG1JsnoSWQMb
         kvvv3B7laSN8Fao8o8bZSB43pqf+nevJqrMwA32Hg59xr6j+1PoowVgwRbnpacQ92EM1
         LbZiykYbpOojdPjLfG1X0DdyGAcDBQUbxkFJmoX1zpUUQ5T5raByOrKcSBWYpgxb+tJu
         xYGg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2iDBZ1zME/1OB+3aRModeXjkR4kWzIS8NwYOIxCHCiByTsFGbgZs6faBrCagO9NoeOo2ZGEoFxN8@vger.kernel.org, AJvYcCVPmwvF8UrhHmG2fbR1S8+vyz73KX0GGsRDhsJLiWh+4a3Oipv9DRMyXUkwgyDUeBw6TOfX4LR6/+2gCEs+Xk/s7H4=@vger.kernel.org, AJvYcCVQ158jo6Dw3SD8b/kmSDskCizEYZrxM9XfrXrzphwTj4qpoPq+SzjSfhfzgkUyNaK9mAiboewg3SCEi9ib@vger.kernel.org, AJvYcCXBoeYlW5zU+r6tq9VWoKzNDgAhSwRnN1SV/qwwnkv02FTYuJj0OziA+xaAxFHDIZxOcpkGckkVnK8N@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0n+H4OekdhhQQritL+/aiyd6DbaBtUvhgYfmwxYtCkyUUZIac
	dunUd4/rn4GRbLK3/zlfJIQ9EIFYfEvK5OyxQZF+bcZtQPw4/YYvCg3jfke1
X-Gm-Gg: ASbGnctcomxj+rkHES7aU/rfGYMmCqXvW4NEK029nPdh+sGyQpWn+l1AAsqhwDmmEG8
	Mymxau7fa1FNjoncu2ibSEyxglDcPDfT56vZk6HdMqaZTCVtFBJYFeUN1o5SbOp+Pfl8BGY0l8Q
	a/7Jqs72UaVThrbgD3RxswF57U1xyp6i4qjJs3PawhxMJiCDR5GwY0vKFLHO1ToUVse48GqRhcf
	OalRfFwx3mKVHzMxJCs+3+OBDoam4zqECG7tvVAAkUEc8uYQlxx3g/xG7qazat6cri/OInEPtU6
	qp3jb3eVVflWJTbOSsQU1qhgpcOtgDFuL7NJno8YM1FuPkG4KiuQ5vi20Bb+rboww6rfRZW6//E
	VgkM=
X-Google-Smtp-Source: AGHT+IH3aVDhaWRFn4FB9MgDrcU6nndPWSx0YZkPnyqHM0aXOplfWvBDjOvj6bwuy5TjEiSf1oOVvQ==
X-Received: by 2002:a05:6122:4692:b0:529:995:5aec with SMTP id 71dfb90a1353d-52c379ccb4cmr3336141e0c.4.1746638144092;
        Wed, 07 May 2025 10:15:44 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae41eb5d7sm2455492e0c.39.2025.05.07.10.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:15:43 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4c326617e6cso21764137.1;
        Wed, 07 May 2025 10:15:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB1+9wyrdrUm5hK3gvdbG7dnTe2vQ3GxXm1Ydmm7nMfCrqYo/bVPOY5ZRqpujolMNZcVIUjNREw9XhFYyh9zNKA3A=@vger.kernel.org, AJvYcCVCokQ6l2Daa0ZvE35e2yu6ImXytKsqTmtZHXObIZJ9cXvqBS2X5+eR8gvrP5tZ3IcOV4o2H/hjQQWd@vger.kernel.org, AJvYcCW5GGzOWJ5NWXCwfjkSkiBjikT9XydSgGOkNTMvmrAZlNQEHMnjzeMnHxTPrNFljuI19jOi7ojgyDzF71CE@vger.kernel.org, AJvYcCXoYhraIgs/iU+sgENE9bvx2bp6KhmvH1Pm2/+Lha//PZdJeQes58j5U7W18O/SyMN+6nUR+eGDjBQ3@vger.kernel.org
X-Received: by 2002:a05:6102:5e82:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4dc73896351mr3305611137.19.1746638143350; Wed, 07 May 2025
 10:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 May 2025 19:15:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcUCsa-c0oHz20huEG0cvv6zVq4OwONfrcMVSQC84XbQ@mail.gmail.com>
X-Gm-Features: ATxdqUFFIBTCxfle3eXYQu4EEydjHa0Zh6WAfCUTIuL1cqOuLd_-RqXuGIJbNNw
Message-ID: <CAMuHMdXcUCsa-c0oHz20huEG0cvv6zVq4OwONfrcMVSQC84XbQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] clk: renesas: rzg2l-cpg: Drop MSTOP based power
 domain support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain core code.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

