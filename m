Return-Path: <linux-renesas-soc+bounces-22834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A364BC9AB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 17:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F3A94E1984
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 15:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A3D19B5A7;
	Thu,  9 Oct 2025 15:01:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340B4A06
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022071; cv=none; b=psEZmThYGHBDZk5jzurr+KTup0QSMrPlrWraRcwJ1VtwZXhlqBU5AnxIwUp+E5OHn+o0MAs+2qQB7wIQbkJ5yXwT0/S9Ryt1gqBbNqJ+UtY3Kb5Cj4hjIh5uGM0jgZk/IlelY5FR4SOMbKALeMtTxzueB8fH+oDjjN1A06PzQ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022071; c=relaxed/simple;
	bh=VYtR/BrxVhhUPl8/JYFTyZslVyMQ1aInFJ49LJUI/wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fcel4wjyLKTEHuEmUecrRfHt/cB9OTc52bsTft2cLh9hOcGvXyNHd/9lK52bnh+gbfaajpV3ih7QOgaHqRRjGMrKPge9y/XDMV2UQdXiM6Fc9jgYajzBLjiyi0Ls2+aHumPvF8UOIGDItTad2nMU6gVEwGyD3WOfwaV0JVauLfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54bc04b9d07so349127e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760022068; x=1760626868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dv6e5BZNXjBjbbuYmCeOcI+oi8ukG40KOevAMak4u2g=;
        b=uVDcZBBFVbp6qtII8Tyr0tXtmJwQFX09N29WgYnewZQrdbj+63BhDCmtbcta1OLFni
         jKyuPAlsGfR30d5kX7JtrF26QFMiorjQZWwxO3Iff0CSw/zs3mwBIuBToXqBBnpojlTQ
         OqM584SQfrPgq5Wdy0VniEUlZVDviV9KQwLtGaC3vFwXbrim241iw6C6WufTE6sE1d2k
         mBBnkXgoBfPRUr6ORxfHKKJKVxhQN3dBFmKIenSVGV+aTnqBRSaxvVnXKyru2WsnVWE9
         zrtort0BY3FqSDQBoQSGHR70WjMmZOZ4zRwjTYUeM5J3/qYmXUzdLyrSrjN5uiuL1VhY
         leQw==
X-Gm-Message-State: AOJu0Yy4fh4QSgdUMQH2TnAjbGf1r/06tIjN8nYrHR/J3zTaXIVIJKaT
	98VF+GrRHdJR4s5a1tTEt4aWlVFJ0qsopx/2R79Cg8PXemamLyAkcxi2OkZRSzZY
X-Gm-Gg: ASbGncvShrUkKkpp/DYkQzIWU72C+dtpythdb0bTYBY7PjYAcpQ0trKQ5c8Lre02gbJ
	8GZeZy+3VV3QVs+RZZRYWb5mgIhrCyCe/25QZj0D1o5h81ilPsCFv9uahl/DdaMGuCRyEcbgFjO
	tZ+Z0wDuxCd6NIgXIV45uu9Zh3Ra5bcTFA4kr/GQuPy5h78T1ww+DKJEZdFcuIyctrVL99tjDjN
	HSud6S39yC24LDdGdajv2zN1yuK1q1GRpWSLIVqHQ4IjIsG8E2DfYbWg837sYthkHRucNGuhW2U
	Tz+sEG1WiTMfRbChcnFCa+5Qpr6vG7t/KtjqkUmKviORt/EwR+np/1IGOWkF1kLgSbwZbILU5gC
	Pr8N7+3ak8LLmT9xdEUFRCqNzwSuVztdbTS1S2LqxRaezoEzTZVmHg9qw5FB+yppgQpBBfFYJuh
	q8ikvdbMluIZ/Tp+Fx8V8=
X-Google-Smtp-Source: AGHT+IGQ0wPo7CxMAnCColnOIebtyyJQ4QrTDvdcmFwO+Nx1szMtlyN3YLzW1PanipsCMbjanHA5cQ==
X-Received: by 2002:a05:6122:894:b0:54b:bea6:a20c with SMTP id 71dfb90a1353d-554b8bb90bcmr3266312e0c.10.1760022066958;
        Thu, 09 Oct 2025 08:01:06 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce202c6sm5405035e0c.5.2025.10.09.08.01.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 08:01:06 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso282592241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:01:06 -0700 (PDT)
X-Received: by 2002:a05:6102:c09:b0:5d3:ff03:8f6a with SMTP id
 ada2fe7eead31-5d5e23d364fmr2960739137.30.1760022066202; Thu, 09 Oct 2025
 08:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 17:00:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6NiAikc_ii1P=KA2UebzvGWbZCvNJiWUa4CDd2VbbjQ@mail.gmail.com>
X-Gm-Features: AS18NWCSARQIf1P_YYzSrmoJBjfh7tsr02jdLbJ3JKDqn0Xq022QT_qM5YLDx7Y
Message-ID: <CAMuHMdU6NiAikc_ii1P=KA2UebzvGWbZCvNJiWUa4CDd2VbbjQ@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 2 Oct 2025 at 11:30, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Internal RFC for now.
>
> Basic binding description for the above PMIC already referenced in
> upstream DTs for the Renesas Lager and Koelsch boards.
>
> Do you think we could / should upstream it? Passes dt_binding_check and
> dtbs_check.
>
> Fixes:
> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
>
> Notes:
>
> Would have loved to add this to 'trivial-devices' but 'spi-cpol' and
> 'spi-cpha' are not allowed there.
>
> There is no driver and there will likely never be one.
>
> I don't have and couldn't find any datasheet.
>
> Maybe Geert wants to be listed as maintainer? He is the only one who
> ever playes with this device. All is fine with me...
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml

> +
> +unevaluatedProperties: false

Perhaps this should be dropped? Or that can be done when/if actual
additional properties and subnodes are added.

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

