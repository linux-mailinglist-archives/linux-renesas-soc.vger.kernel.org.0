Return-Path: <linux-renesas-soc+bounces-18461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE3ADD195
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 17:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEDB41897203
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371E92ECD31;
	Tue, 17 Jun 2025 15:32:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB4293443;
	Tue, 17 Jun 2025 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174353; cv=none; b=V02Dch9qePG47RN0uoUNTYjgV2oypKYi9wv3tBscDDfgx8u8wGO7oswr1j2CbKpMe5zVO0wUyBD2KJ+rsHhv9XOpv6AMMuwIu3MlCu12h5Jnm1Ea2fJnZ5Y/9WG04Th+ESwYb2ZdxxdrV9L/eWgXfKpoXCMcdgYp1M3jmz5pnk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174353; c=relaxed/simple;
	bh=dCxlk196YZYPE8TlRLNIkJ9CdJg40ti/ptp9oiQH4Bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGa/XS4fB6ri/fZ07C7EPsoyDDmZcQL+sQ8Bj3PTJ6eQW5pHv1LA6omHkSrgFGD10uTk5u/6SZ7tq0ZhzYpevmGFVFd8OXHyuZ1KFirQjDj51HQPUAq5yMPLqQ9nntH7i59kONskmMxxRNV/Wq4Q4eOpb/xI9H4wYyTpmj0n1r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fb3bba0730so58330446d6.0;
        Tue, 17 Jun 2025 08:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750174346; x=1750779146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hKN7NniJW8hug/LTZijcgQthH3orsVUhf13e+m8K8s=;
        b=mTSdVRmDZg4mTxrrw829iudhonirSNHidlcUOXOqXNeDR5m++5ki4LG2u9zDjdGF1P
         5TExwVo38aeIiB+Gek7OHeB1P+wuGyTJQAJio3FTlhFM63WSyHsdmCVGqWiLCt5XhGY5
         ah0lVsxBhWMbAvFnF9iBPvNVci25SnvyEpln+7uQNeLZ4IEH14HcdmyXifmkxsepguYD
         554p4p9ELe9EhA01mgRR+NwhVi1EkBH6QsbAvbd5YczMQvJuuicr4whMUz9bDWJqw2m5
         aA5b970PguUXIOQUf8I19mI55OscgffYrGESbmhMZ+44uSQKxWJhsT94HyUQWq4l6L0w
         T44g==
X-Forwarded-Encrypted: i=1; AJvYcCU/pLyXpXGJs5AOGufu+P084+/ztqjgLoPubyzU/fEKbFCklCm5Kka1yseOIp0Y9L7oKy0NPQs6LIgCbmzC@vger.kernel.org, AJvYcCW+6AwoD/pFX821FrrbjHQv7vO6GQaOMrOE/2ArKACb7uwFmTWKcHWVVgSy80u6NLKaK0jwKJrhoXbo@vger.kernel.org, AJvYcCWGV0UW68n9HUeNLx5T4spDiTk/m+yy1u7sqopVAuXStTlj/NZ0IDucpezn2TZBaPE9m9IwCOS2zV+DAdLqVgYuxPA=@vger.kernel.org, AJvYcCXAfNGjWaCVTbjQSMdtGlkwcsr8+wfTyKRH8+274XckW73wbxXsjkcGmnppROWjyOlI/bEYpCmc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+qEzQj0BrxnL5mVY4XiO+QlchtIUAEDEWhXosDFAHyBnK4Jmm
	cnzQSi/diX2G7x6DhkLZN63eamuEGCp542c405E/0aFaYookReTkOQvNWYnKxC2P
X-Gm-Gg: ASbGnct+9sMyegD8D6/SSwDmiLkugtvB69UVMIHjqYZPOFovqgmG0VYRjoTGBTUFcTq
	UmDgz9xxfoypoP4OSpME1qTf948wUIXhjZi3/Qnz9rHmWkZ1rObvvKEMU7s56qxxrGRdkzgOjgF
	+iZ03WOiSiGqR+gmZhd3i/lya/XcBDSyDBiaUw5ZPYdmDrWsTc+Hl0dQJGYzlAY7FVg5PVcvBgX
	clHBr5EqcCMzD+dEZz6vuptGkQj8oFGiidVOgor29mqwYNbVy5ttVUIZ79zomj4Ub66mg1XJKTH
	Bx4kCVbfznxjv6Ig9w16mh6XpqkREgWG66Xb92D2jZ64Y0771dKuGElZQLpt6AWHKEQAbCYJbL/
	wwTBKYmiYtyLRhJw66m75ahvlgQ0M
X-Google-Smtp-Source: AGHT+IF68CJaSmxz9OruhZX2NRP7NVMyTQUVzUN9pYxgiveh68piNHYoZ6WakNbCUJxGTI+4b4QEjg==
X-Received: by 2002:a05:6214:5b09:b0:6fa:cd5e:f4 with SMTP id 6a1803df08f44-6fb5e9f2c72mr48011196d6.6.1750174345624;
        Tue, 17 Jun 2025 08:32:25 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb48217708sm38752946d6.78.2025.06.17.08.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:32:25 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a745fc9bafso31737741cf.1;
        Tue, 17 Jun 2025 08:32:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUE1x+NVg/HhqowAMh+DOoKSems8URHAt0L/+D2HOcBa7Ox4H9l3UVMRSlERi9Gz/akCkUgON98ZZvS2Otoo7SesgE=@vger.kernel.org, AJvYcCV5bvAZvghUXHUHEpO66YqlsADRuBC7rmsiihrV07Q8FSBiTaltvKTGEz/YE8P3EszFqTlgDDgrLzqV@vger.kernel.org, AJvYcCV6iqcNwgXn2rCFBUM5f7Sa/KL40DddWR7I5T7Cv9GtoyBKYKaXm/fXtQrI8A+wtD0puG5X9JmA@vger.kernel.org, AJvYcCX2F2IvEfroYWMmG8h1YR3D6DhU7ttJLU99C5c+t8VeHpTqqxDc2btk2egKXn9WJ8rjhQptDrjeK1K0nDmB@vger.kernel.org
X-Received: by 2002:a05:622a:1a99:b0:4a5:9993:ede8 with SMTP id
 d75a77b69052e-4a75b9645e8mr44837301cf.15.1750174344423; Tue, 17 Jun 2025
 08:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com> <20250611061609.15527-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250611061609.15527-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 17:32:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEL17KruAigL2Le+9ATLWo7hQqGZjaEsFKpDt7pQr_8g@mail.gmail.com>
X-Gm-Features: Ac12FXwRWLGR2Tg4UsulLDZ0f33e_FE46TCkUsEs2fenHbM9JFlYLdpXdo-psJo
Message-ID: <CAMuHMdXEL17KruAigL2Le+9ATLWo7hQqGZjaEsFKpDt7pQr_8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047: Add GBETH nodes
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: andrew+netdev@lunn.ch, conor+dt@kernel.org, davem@davemloft.net, 
	edumazet@google.com, krzk+dt@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, 
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 11 Jun 2025 at 11:01, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add GBETH nodes to RZ/G3E (R9A09G047) SoC DTSI.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -759,6 +759,213 @@ csi2cru: endpoint@0 {
>                                 };
>                         };
>                 };
> +
> +               eth0: ethernet@15c30000 {

[...]

> +                       mdio {

You probably want to add a label (mdio0) here...

> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };

> +               eth1: ethernet@15c40000 {

[...]

> +                       mdio {

... and here (mdio1), for easier configuration of the PHY in the
board-specific DTS.

> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

