Return-Path: <linux-renesas-soc+bounces-10978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C79E5F4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 21:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A55618848A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 20:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2C922B8A2;
	Thu,  5 Dec 2024 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XChPQP//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828218FDAA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733429675; cv=none; b=gUH99iqddW8b9KXcggGBiSJDLlSHTjoOMMr2jioFzeio8fdxqL4oH+NyL1ht4uqA5+hStcxOC9itVg4L7K5sY3rXC0cyeVbyxCHhdh+/r5rlEW4YEzCiUhtx4OT76e4qnrSezyivJqRq1aSFVrhSWlh7gKw37b1jpKc0r8FXvh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733429675; c=relaxed/simple;
	bh=f5eqyhKVGnpVkF/wPyOpZrDNNpMh2nXC1um5w35dY3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7PmGrmoipVnpT6Dzg3wME4nGBJDodQ3mc4pdhUWK3T53FyIeJiByoPSM8vyRpdGVmYFiDbii4eIzzeovFHWZGiCu1hMQxu7s/LSKbRXWAjkoZRncnFk9Tr5GLHCGbg81KHUKTrEm1TGKRQCoSG4/HdVsnT+CClxlRjR5KU9/gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XChPQP//; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so10231941fa.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Dec 2024 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733429672; x=1734034472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgqbKLEavaHLiZwSrnhECHdLW65ZvokO2Jg0XuF7dOY=;
        b=XChPQP//9J9IqxBgM8zboh/JpaP+YqXn/N/OxO0+RMRx12iMqCcKXMgK5beSZ5wvYt
         bdJNouXg5rqBGTJ2W6zm76+aqbWWfRq2pCfKwqMSLnrFg5MRwkdOI/5lFOYYJoD0iAqB
         5Q1UTbKiIGC9I+Dc+8DdkLBzLRamADTVlmw24exL03BxtB7TFc7nUhrnzGSMTKG3YadF
         BKiKKqk+KAt6Hrk8WYchB7W3A2mq9icLkwGeIGz1r3K5TyuE+hwYCD7avltpzpdf656q
         9PwNQnlFY8ZNIoGo/DD++OpsPRHuAAUIGipeodtTlKdAokSn341BoEF3fV55RZTMLnYd
         J8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733429672; x=1734034472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgqbKLEavaHLiZwSrnhECHdLW65ZvokO2Jg0XuF7dOY=;
        b=ule9TZoQN54I0433B3gM21rMbjjhn3n0p2wma1c2fk3aYquCWvqiA580ZCx6gn+GoQ
         6OYPLxQZsftfXlAzlNxo3447HZ0MgKINDUHdLZVkoHHT5sQQ0gZuCjZQzL7GO7YlJtOC
         HHY508GLIt9C/vzD3ghaP//Rb6X1qX7JFGeJVNBRDgp6LyEN1q3AKCsyQAQerc4sGXqJ
         aHPyuzo4ZgtExSes4qUHoaU6/7G3KNwymoy9eAOY+9ndoPaws/rAcGbbtix7FtcSF8qh
         OqZdIoOh0Ca5Fyfj5cmUjp+gccNDL6pn1aao4q4dNSdTiQkUCVC1stGgoCxcbHXM5Xdm
         94hA==
X-Forwarded-Encrypted: i=1; AJvYcCVoG0K1e3vx+0uDA897r82MkJ0Dk7sCaIfp34ddr04kau6lREBuoWH9kqoU6EhJ8S8zQ3ERnYpgLOLpBGSref3fXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzGSX3rsQUd3W9dBkfMqwleO+jqS4/OoSMhqEidgp+K6nvd7g
	biEurkfJNJgVmCVuf7AfKAGJCKxeWaj8ZDY+YV6aO55abIP0S88eWRMeGoCfXl0/hUW3f47iDMv
	+C1IdrXIAV+ZLeFp1E51lYQgQTerl31frccMl
X-Gm-Gg: ASbGncthi7cQw+R9fkCSqzwseDwJDDO7fqU1buA6QkYd9srWEm7ujF+JGGLo1/GAHOq
	H7LtOUDnjXkioLj0wcCil9yX3vuKqmg==
X-Google-Smtp-Source: AGHT+IGFgkXtuPAnkojQK18RbIhqSfv7i03Oxy4ZIFKbCRFdxEWacRzHnAnPtUNduLvJgo8CdNg4Qw6xQAq+GxKER+s=
X-Received: by 2002:a05:6512:15a3:b0:53e:1bd3:889b with SMTP id
 2adb3069b0e04-53e2c2ac217mr89160e87.3.1733429671868; Thu, 05 Dec 2024
 12:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <087ef57d899c93f45ceffb8f9c5df3ad850b1e85.1733403513.git.geert+renesas@glider.be>
In-Reply-To: <087ef57d899c93f45ceffb8f9c5df3ad850b1e85.1733403513.git.geert+renesas@glider.be>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 12:13:54 -0800
Message-ID: <CAGETcx8Wj8Ym-KHv6=J2aCSWn1YXKaXw0VVxdni+-qHJ5+14GQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-sysc: Drop fwnode_dev_initialized()
 call
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 5:00=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> As of commit bab2d712eeaf9d60 ("PM: domains: Mark fwnodes when their
> powerdomain is added/removed") in v5.12, the pmdomain core takes care of
> marking the fwnode initialized, so there is no need to repeat it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

If it works for you,

Acked-by: Saravana Kannan <saravanak@google.com>

-Saravana

> ---
>  drivers/pmdomain/renesas/rcar-sysc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/rene=
sas/rcar-sysc.c
> index b99326917330f5f1..dce1a6d37e80127d 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -434,8 +434,6 @@ static int __init rcar_sysc_pd_init(void)
>         }
>
>         error =3D of_genpd_add_provider_onecell(np, &domains->onecell_dat=
a);
> -       if (!error)
> -               fwnode_dev_initialized(of_fwnode_handle(np), true);
>
>  out_put:
>         of_node_put(np);
> --
> 2.34.1
>

