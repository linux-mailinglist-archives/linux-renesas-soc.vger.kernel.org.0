Return-Path: <linux-renesas-soc+bounces-22402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 340BEBA2FD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 10:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DAFBA4E20D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 08:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02761E2312;
	Fri, 26 Sep 2025 08:42:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F026E10942
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876148; cv=none; b=UW1vjWc+LjfnKJlGUdAdlGjq0ngBRRvAtbX93WJZbJtzGndWfkTDjfBDEbGfOe5hAE6SV//tP1UoNOADu29KJGQnrM9TC8DJU0SFjw0+Ce+7p88QxNs/7ksPZLzpTCwaVijrpzYnfNi0lw5UTfJ5q7l5uBGToI1f7RoH9qZU5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876148; c=relaxed/simple;
	bh=muY60S22DsoASRG4FiJe6ip1iEMaWWa1UAMLJoMoDx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fM8s+2tv+IBTjuvtMothMovfjPk8zHMd2RJJRXXoZgO4tA9WXZz6H0A6ZVy1YnB4W+bVqupCpRwbb9AxXwXPb13bXP+n/oR7I8xembLjvdu3LTB5aTqNqTCwPaIkD5/7NU9FVVwujopBKViK4A2OZAVb1W4DTAZzdhniN2EYwas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54adce22b2cso750803e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 01:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876146; x=1759480946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh5uxEyK6OvB8UynZ99mPLkC/3fYPS/LIg1UGviPL70=;
        b=VfuR0jE8GdVCUpKtpIFXkly7RPGEFvFKAVgHhK+QKGMJeHdMmZIVc2Nb+d6RTUWztD
         XL+KGI1iVqZSMiK7LkAPaNrpNkPuuq2bjFMLxItxajbEUpzrOCNgShzOtzXGVwiQO79U
         xVFviesKjUv6gdCpFUTUGKw/HjV0AogHjJkPR6xn62P3TUJRnOob2BdwowA54qLNnzPr
         VWZXmOCuKwGuvxVrJHlk/Ph3Ccm65Q0v7r3ymIERUt5JuEy/9fA/OpqMODrh8Im1hSRS
         /jzEVrpTegOr9zzNnuulc1ArHxPRvWPdI+TAg71fhwNPwlQ1OtS+P26ZYAEMmQcgC2Jp
         hrsA==
X-Forwarded-Encrypted: i=1; AJvYcCVIF7kMOAi17+4m9Uh7Us9OUXUHBlMk4pltVKWgCCvF6FyuGwK9HEnNfwmz7pRAyjDjQFOJMjeyJW0tyj4YbKTZwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYHsNXwHPO+1VIR2+HdThW/UO1JzPnytarASmCUasZ6FDjDtU
	CU50AUx57RC7QRCAAOuOwCW+lR4JQOs4wF9AHYjfyE6pNz+eH7Hxph3f5NYpczEm
X-Gm-Gg: ASbGnct6Zx5qroLh0XKT3+lUTpOqwBdaGcxjjhjoAB2AP5riRlS1xcgjXzAqI0EUrjJ
	2iNRGkufCNqI6GWVsC2X/oRKGXkj+lMW1DYytt7KOokN/zEj7e7uYSz0CnoYa1p20Yu1TbRU8lI
	NPKNp7ZoPWhI9AH4+gd3brVQfCGLj698Vxd9xLIyKSOzf9G68vxOPxm3XkIli+JDSAkzSKZ5tRu
	8CsXcEy41iKrxG6tbcxoKhIxIp5nwz5ARNGqF6gF6sqUVyZA9DgL4NJ7qowmWkFuzBu6IAJODZ/
	eqb3EqQeeGyebZtZQGJ3tk0apPM6JaT5TIl/+/+6CLpS6c29iSw3Z3Ag0IUC71xK0MIPmUlVlb3
	e6TcnJ9Yi/2gSRkiVC60JjzfaVoIJ8isImfzOc75Mfg9QsoNk5MTyajnCzEqX0Q+G7gwPCB8M7y
	4=
X-Google-Smtp-Source: AGHT+IGUdzTqgNkqyqrLPl9mQfXw8z+oPcNdt2e+lbiJmWjXpnyqIlrjwclovJw2ViIpVR3vOkrsuw==
X-Received: by 2002:a05:6122:218e:b0:544:6d4a:f52b with SMTP id 71dfb90a1353d-54bea1b2e52mr2503435e0c.3.1758876145546;
        Fri, 26 Sep 2025 01:42:25 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bedc9ed00sm781393e0c.17.2025.09.26.01.42.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:42:24 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54adce22b2cso750792e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 01:42:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKT+ZXZvnJe/z1BOTou8FDXQ5QtgeqW2T+SiTMkWHnzRTS3mTpBjqDrTMRWvv3xrnwp+f7twRLwq0XBHlHm8yZNQ==@vger.kernel.org
X-Received: by 2002:a05:6102:41a4:b0:55d:cfa5:9d60 with SMTP id
 ada2fe7eead31-5acc6805581mr2527265137.12.1758876143956; Fri, 26 Sep 2025
 01:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 10:42:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+X47H=_7y8rXGkXU+wCXq61LgD_VyWw-quq3O0KBzQQ@mail.gmail.com>
X-Gm-Features: AS18NWDJaK7VikVNhpA9q5HvjdDy559ovF-XoDoqQf-Yk5Qz5FJG5_rrh8fqJYk
Message-ID: <CAMuHMdU+X47H=_7y8rXGkXU+wCXq61LgD_VyWw-quq3O0KBzQQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 7 Sept 2025 at 18:11, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> been tested.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: Depends on series:
>       https://lore.kernel.org/linux-hwmon/20250904202157.170600-1-marek.vasut+renesas@mailbox.org/

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19, with the one-line summary
changed to "arm64: dts: renesas: sparrow-hawk: ...".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

