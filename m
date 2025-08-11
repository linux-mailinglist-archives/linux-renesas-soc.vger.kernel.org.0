Return-Path: <linux-renesas-soc+bounces-20361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD57B210A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 18:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84B4D687F38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B542D6E76;
	Mon, 11 Aug 2025 15:34:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0B2D6E48;
	Mon, 11 Aug 2025 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926481; cv=none; b=fgoC60WH3/UDOyinJsb9ZHNGnEt06MSqQxy/3P/dHRRhg9soqejCfBOMO0hfr4LWWZdH/M75LwotBEkU4dPr+Lw1H5wrS0iMqSSOHTh6gxlhX3gsArUmrMnYcNvhrLVHClVThuj58uzxHmDgnDFFp3WIINMApVOPJeYKm1abRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926481; c=relaxed/simple;
	bh=IcKFhZLJ7J9gTEoz2bTidjbXHmaW/a/qfFUiNMuXl+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXjA11iqEh9ObRUF/ai3tiPIic/QxE+/oKAyxj8NFA+CpcPpZ5TEjgwUbaUcBn+AmDZJGuaRtZJ2HmfuPETeZlKJEt/MrMs+ljGvQTEjOmP1p0vAOIVRNMUnnP6gdqCa50INXJtR3w/0q4kGAzDk2evxNwVCvnj2pxXgbLbDVqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53987d78f0bso1093038e0c.2;
        Mon, 11 Aug 2025 08:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926478; x=1755531278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ve33mL4aw76YMtS3FHKAxm5cY7E3oL2MCtS18+vOCM=;
        b=bkU3d4FPJb2SrSvHvO+iumBc5qC7Xqpd12H5DtbYAbHei7oqYV/VsN/ixCK4kDrD0N
         OlZlkxS3/H9R673lhjJGddD1MqOPR3B7E4cZ/6Ji8vSxrlIe+a0gowyT7/e3Gc9795FY
         4RlwTNI6SzE140TUeXjQvwarl1lnOpeZWM85f7rNJ41cu6+ZJVEogvW2At7Z0V99+6vB
         cY+pCy5HFaXXYzuKCEllhx1SHD7owYFnFl/0rTIp+DP5sd9eVxZLfWPjHkBCYlg2Hozt
         BHhubBBD4bUYA2TBk3O4Z6MYPcRBYeN32dYeYURuhJbJTfhE0XRr/kfQvy9m+Wr8rDXk
         EdIg==
X-Forwarded-Encrypted: i=1; AJvYcCU2CeDNbaJun4+LV9Oj1Q6WYUeHzB1NHPaB3I7cVRtXo4Pk6jglloEZk50PbNmthPhjOPZl4Ak/WdAZlQ5b@vger.kernel.org, AJvYcCUIvbyau3av6voXwPcAJFU4mZH9k9Dby7ZaIipt2pTr3KJAqn2tZ7rtJVAdIEnYBCp65KV8vTXQ2syX@vger.kernel.org, AJvYcCWLLw7amOWCOEiK81OaTzWfMhRpCswvbhHYHGBjYe8L8fRXuQrZ+IhYAFRrFOT2+Lc4c7QCbdpsz68LTcbSDk4ysEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrlGbX/0Vx8RHCLeOLaE05PMJS7a22tHg7+RKgw/y3+/b2SiB9
	sWlUvGmFYb/3lhCZEpIOZjMHSHeyczWEBETWX1+dAKa7Kn9GyyOBkAeYAy7Es0os
X-Gm-Gg: ASbGncuoN5EIIOjPVvv2rkzGlFuk3giQicE/iPNSpfIFu6djJ3KOgW9SIuZ6B9EoBJ9
	SgpXiS7o2UdzigL0O7fkLTG0nhgSP9ZDcx8uaf3B2VaHsVtOEVijIR36agrpmK01fWM5WZ0yG/b
	/WhmmtKFksF7JMfChTpUFihxAEnt7n9biGTYbBptGIojf7uIMuQZcOUxgF7Gg4DYRAP4bxLsuMy
	Ng0WkojEkxJfph8/V2FikJSJQU6u3QErEY4bSi0UPEzgoAWd5F0E0XpTWhFG0fBJqUeUMMYuFkE
	X9PzMhbb4SdY3vRBZFWEiUKvpP7TfXMhbdbJaX7dNSd8NZa/1fod20B7ibX/gALm5i+WPmEji3z
	998pmYicwDCi0rko0HGeEZ82fsbcTEJGGjepeZLnEN9/7j3Nr7QMWgKvnMo/Y/KjdCbq3YgKGVy
	8=
X-Google-Smtp-Source: AGHT+IG0UVuk0PCqp/PycAmZdbuD1hxAExPBg2mbor52Zrz9V/c/dPnNvlJ6+DlvGsmjH+yaO1A7qQ==
X-Received: by 2002:a05:6122:2a0c:b0:535:aea0:7a2f with SMTP id 71dfb90a1353d-53a52d794f6mr4232458e0c.4.1754926478204;
        Mon, 11 Aug 2025 08:34:38 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0286c1fsm2706407e0c.17.2025.08.11.08.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 08:34:37 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-539613258e8so1217246e0c.1;
        Mon, 11 Aug 2025 08:34:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJ6VsbMUareAY0yU7qaDHfhfjEZKrtaww2bKVGlMeh+KOmbBEko3rwOZ/xyStxQ3mqoNQwnQvK7GTY@vger.kernel.org, AJvYcCX+ITBTM3QrnWXX6rZbis/ckqWFxMY3q25pUImcOd99Q1aW/8Y5OmOnRGgajrZZJ7mvLDAOBRZzJHSFbBlyysD/HXE=@vger.kernel.org, AJvYcCX7FKhFr6t0B7LD5ngfzosyL7r92fvPF7M8zeUWJdFdUq4rvfekgUHzim51o0n9F7DG5NDs/itEOC8AtsQA@vger.kernel.org
X-Received: by 2002:a05:6102:5091:b0:4fc:d0e5:23fe with SMTP id
 ada2fe7eead31-50cbeb6e16dmr158520137.15.1754926477067; Mon, 11 Aug 2025
 08:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250707153533.287832-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250707153533.287832-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 17:34:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTZzsy3L5Y8qv+wG74OUidmGbujvfgJ3Ev4s-zPRCVEw@mail.gmail.com>
X-Gm-Features: Ac12FXwtKZz43hF-2FhZpC-uLkCi78LlLTlzKago9TsFqKxV4k7_p5YqZGo0Z44
Message-ID: <CAMuHMdWTZzsy3L5Y8qv+wG74OUidmGbujvfgJ3Ev4s-zPRCVEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r9a09g087: Add SDHI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jul 2025 at 17:35, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI0-SDHI1 nodes to RZ/N2H ("R9A09G087") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Added "Reviewed-by" tag for patch 2/4 and 3/4.

Thanks, will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

