Return-Path: <linux-renesas-soc+bounces-16119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33BA91E42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 15:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0CB8A0A39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 13:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC48E24BD14;
	Thu, 17 Apr 2025 13:40:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFD224BC1E;
	Thu, 17 Apr 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897215; cv=none; b=F1xVvjJ4xzf7aNIXggCFGw+XikcsZi7XHK0EfYIkXwt8rGua+l20k2jyteP47BbGtFYaEOVKsNNrzLcQEqS8ZYIpjYeJMx/+pS7eTbFVslpfOMrCGjGKKTfzZNTELylfqULWGDPNkSqH8nZBu60dX4DVh6L+GR+TN8ejvjzAa4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897215; c=relaxed/simple;
	bh=Qa2xPUVJ4rnG0Nj/oTMS9FPjnVbXerZiEajP+mnxldQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHHK89FzYbjph5Pm2BLlk/7J+AfByZArxf8KQPjaIZikl1A7B+eIXy/dqP4aC7EKkmArCKCbosnWHLV+YZBHoveRJ07/wgDszkyUSm6S61nFng5wWOz/EygYKVqV0vGpSIOW6u7ojICpn0dzOvlZqzJFKLxGWI9XET/mSJHUV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523ffbe0dbcso777945e0c.0;
        Thu, 17 Apr 2025 06:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897211; x=1745502011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=norxNIEvOFi3m/3M3MLdPXTyALOtUvuTXRTkY2ukr/U=;
        b=o/VCO8eh4FFcNq8JkGL9MHIAiGdu6J0QMO1gqYoc84OOD9L4cHjSSfWHvQ7d0gCZR7
         n5sLvFBs03u+PXPDBP9xZl5WI2dxJlRKVvZ1cYL7oJmIO+KyCGUsfTULCV8bxzUyB6Di
         cpU+rv7k9Ijiql2iLwIncrJ2prPGT9W04MZlsSqP4ePPkvf7e82M85j2fwQHfoi0pMwn
         IQxi9qsl6npWtsZaoj9Z6NlWD8YQa2ZzaLKC26IjQrDgl2In5vbzvPKplzZ9EkRVvS7e
         OhYksZnOC3n2invS9Avz1T26Ss0nZzWNq60y5o/oVAse9GwqUcvHv7hAGVg0Mk3XgodS
         yOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFeUAmfkgrzHXmhJe+98OyU8Eyf5tC4RnKj/itgZn9qpPSy/QZdj94suu8IrRj5oPGgyNNBzv48L/IJjMotTOJJr8=@vger.kernel.org, AJvYcCUl55VtQ+zObx4MXUPdxNS3T44wxmeJF83J1f8S60bzXkd9Z2GElwgknrIibuouqAei1dc//jHQs9fpv0Hm@vger.kernel.org, AJvYcCWbm+m9uJVEJ10IDKAPu2h1YWBDt7dZRFp9GjLSJ2/Q7uOKu7lY0Za0PLZRLcYN1ugIE8/lRTaPa4V4@vger.kernel.org
X-Gm-Message-State: AOJu0YzeFF3tFCN3o0H0QZo9G2bJFNPq7HWDnvM7in5YUXsfKH2TUp3K
	XmH6RAhLRSMfrGP/D4zq6sEcD4TyfacDvouoBs8vfVcZZTRamm3jWFC8teEd
X-Gm-Gg: ASbGncsihSNfsGDOby2KxrWitJAiRu7kE+zCwLP5two5KP6ZtrwRuYRtMwAoGer7xet
	3jcaSwhiqxX9vpOyu7pN3jeuJne02mnI3YcGsbkrzwJlt6S7/s83BBfWPCBMZ0gJ7hW0qUwocA0
	pndMn29yE5/ifBc/6P6JVXR7oPrtneJHgEviWWdfgsNp0TWHivsvmF/Pn7vFTSl6Z/yTjq3IFJM
	Ia4duvnWWHzJ3xap1MVIBqTlK9MZtJP6g3OS3wRcjBfqv660LLz8wj4mpHHrNA9M+7Lr6LP4gfA
	sM//lvu2tbFKl5t6vs+zc8ZcyTzcjuJRVPuGTlp+tf3oCtzvupPtiq4eqlsiizEGZDIJm2fzp+r
	n6ystnP9SAZekig==
X-Google-Smtp-Source: AGHT+IF1mGw6E9+BbkaqeDOvy/ejPUn7C7mnwt/bHqqvwJWFSOF+D4D1BLQmlDo7dAit/WM5cstpfQ==
X-Received: by 2002:a05:6122:20a3:b0:528:bd71:8932 with SMTP id 71dfb90a1353d-5290e1f77e6mr5364497e0c.11.1744897211210;
        Thu, 17 Apr 2025 06:40:11 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8755716ccccsm3687479241.16.2025.04.17.06.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 06:40:10 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso919083241.1;
        Thu, 17 Apr 2025 06:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxp3716MO2NfPyxLzhH07DmZwkfMWv+c6qidNYgSGtOK3TQzqSG6tFghsFI7Ygsds2djolyMCDJ99Iq9/J@vger.kernel.org, AJvYcCWopDXw2cR5jmM4lth+yvCLRfn50+NiKeGn4MZNnBwuKAH7+fvo11K5jzHhJAlw7SgbVDHzQQyx0OgtTWuxO9w+J9M=@vger.kernel.org, AJvYcCXAKGwkpL17Ri/bxkhi98NFVv5LxlFDvNs7hEkUt5EbKgPjX3/0lFOv90TZ2Qn3oESPQ33qpVXQEcY7@vger.kernel.org
X-Received: by 2002:a05:6122:20a3:b0:528:bd71:8932 with SMTP id
 71dfb90a1353d-5290e1f77e6mr5364382e0c.11.1744897210248; Thu, 17 Apr 2025
 06:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com> <20250403212919.1137670-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250403212919.1137670-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 15:39:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJpu9ygO=D2ev+TZ94K0mV6bzs8O+jfMz6byneW46K+Q@mail.gmail.com>
X-Gm-Features: ATxdqUFqXJqGZscyc7nxStjv43x0ewZvEKmLXbJUIn5I_xBemOj4VtoXu9chgpY
Message-ID: <CAMuHMdVJpu9ygO=D2ev+TZ94K0mV6bzs8O+jfMz6byneW46K+Q@mail.gmail.com>
Subject: Re: [PATCH v7 01/13] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 23:29, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
> documentation.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

