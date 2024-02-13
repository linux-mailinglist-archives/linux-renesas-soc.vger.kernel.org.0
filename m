Return-Path: <linux-renesas-soc+bounces-2684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F7853094
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 13:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBFE9B243C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 12:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D221B4B5AE;
	Tue, 13 Feb 2024 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQBnyYOY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF5446C6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707827633; cv=none; b=QnTa3YJmC+vO1wnKJPCtxM6HxAZd6HcufzPmEBwJIoR0SAxNqF7JrP9HDX4yxeiKBvzAvsS+Xxj3+Rh/FlEBTsKXXqFAt5cr8XfdfuaCuPk5mjih4mqDaxd0Z13hb4pOgyVkx/9NqH4OXdK5AM6WCuaMe308jp7s0FQrxWxKtJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707827633; c=relaxed/simple;
	bh=GwGj3mbaxyxX+GCZuXwjYyfxv+yWwqjHGw+1fC+8EL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+C7QxoBjmAw1HaFV/kShrKmnAcVTptibl3io40rfZN1QSMYPhuwD4DOg2GKzTht7a+oDJjYQxg55yP6Jluqc7kJKaC6tpXHLGqH7gYvy/4lekuLzAJV6sPMd3y/TngzNaio/o2c3j0xzvWggVB8IixMlNJpllwLoaYOq2BgTn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQBnyYOY; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so622140276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 04:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707827631; x=1708432431; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ww8CUkzhNxlH2/JABJGWf2qJPAzOGVrVZBAqevbwVMY=;
        b=xQBnyYOY13OjZjWG05dOWbOmEU0NYf3RiKBYzSiFETrw5F0cpyCc0xhhpkEUQRlFTJ
         zCdTDPGW65YcTWiDa5wyAFmR0Hx4hmhfK0Vt3px5cwR2KrZJ3xbZzwinD+1odL3XU+av
         A6KGYXdIPQGb6hNZC0IUEw+SF//KaR999+PFqit0bCRimtKEqpLzHWnps+H15ZEJBXpf
         gbuhf9oNFFfJLIXsjAlOhEQb0vA9ccvoX+KgnyELB9yFITmR61MuYsLjs/d0LfhTacuk
         HvivKbBAERLyjQYED4dF6bSwULYMBX8EkV6cBcVu0o6r1dWYRlBYGCgESx8WOHAhWh7X
         aH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707827631; x=1708432431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ww8CUkzhNxlH2/JABJGWf2qJPAzOGVrVZBAqevbwVMY=;
        b=tzhcYc8ZZpm+aAsy7cqbDlg+y0g+fmkD1xk0NVAuhl2Vlb+e2AVnekqJQrMQAfQOxp
         t+oD0FcdqW7Pv/ohp1ZvPg94h9HfqoZTXNnu/JccUNBzT9RIA4nbyAI0pUc7DE2E9gfr
         neqBrAGvJt/oUIttQFPbctjEMW12oOkwWzyhlCAGSchNfbd1woWIIzGkx3tgy46fXRhS
         qtJ43E9lUU5xfzKxAswabzojKzXUSiyNMLvkraMmSs5jGH0BhI3DaERxZpEmo38CZ8Km
         bnF/FCgtvdLpkfzrYT+XLlS/rTapiEpWHN4c8DJdymzuVF2gEWI6OnY8J7z1f54zLZnT
         nxfA==
X-Gm-Message-State: AOJu0YyD8YLNVkjeRzz/U7FFKBXHAyn+8FiV5kiPeFUWBpLWEnByGQnS
	SBavx5kvzn9i0cApngN4SESWxbz2LBeHvbXE7CnVFJAJVL/Abexdpf6PfX1B+G9fPtwjW024wAq
	7ZMHOluRIWo9/Urwr5Ht/785HVWE8kwgKK6noNw==
X-Google-Smtp-Source: AGHT+IF9w+B8KAIajg/d76zw1NDEHpTCzI8mhGX8cc3DsoJdJrZq8fwBkGtmBkG59dgo+MR3Z52ad+x+t/vovg8m4jQ=
X-Received: by 2002:a05:6902:e12:b0:dc6:ff32:aaea with SMTP id
 df18-20020a0569020e1200b00dc6ff32aaeamr9200487ybb.24.1707827630991; Tue, 13
 Feb 2024 04:33:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8734tx8b18.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8734tx8b18.wl-kuninori.morimoto.gx@renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Feb 2024 13:33:15 +0100
Message-ID: <CAPDyKFohZo6KALX2dUxruoDKLy2C+XOmnTrG1g6=s_mQB_W9ZA@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: renesas: Adjust the waiting time to cover
 the worst case
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 01:26, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Dien Pham <dien.pham.ry@renesas.com>
>
> Description in HWM rev0.51E, 9.4 Usage notes, page 455 tells
>
>         "It takes several hundreds of microseconds to shutting off and
>          resuming power domain. Because actual time required for
>          shutting off and resuming depends on the status of on-board
>          power line, shutoff/resume time is not guaranteed by
>          electrical specification"
>
> Let's assume the safe value of waiting is about 1000us.
>
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2 -> v3
>         - remove Signed-off-by Geert
>         - add    Reviewed-by   Geert
>
>  drivers/pmdomain/renesas/rcar-sysc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
> index eed47696e825..35d9aa0dfab8 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -45,10 +45,10 @@
>  #define PWRER_OFFS             0x14    /* Power Shutoff/Resume Error */
>
>
> -#define SYSCSR_TIMEOUT         100
> +#define SYSCSR_TIMEOUT         1000
>  #define SYSCSR_DELAY_US                1
>
> -#define PWRER_RETRIES          100
> +#define PWRER_RETRIES          1000
>  #define PWRER_DELAY_US         1
>
>  #define SYSCISR_TIMEOUT                1000
> --
> 2.25.1
>

