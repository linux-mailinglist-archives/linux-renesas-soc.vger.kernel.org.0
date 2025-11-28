Return-Path: <linux-renesas-soc+bounces-25315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 16834C9124A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 09:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B596D344C9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 08:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F602D640F;
	Fri, 28 Nov 2025 08:29:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A91D432D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318549; cv=none; b=aE8IqegwBVTU41+WgX0p7c1NqJQjZy0joJJLHTsF5g+Y/y+Kkbi1Awu74+AOPSpXMmryZ53bnZ6aeFFDOdmkIZySUoRoe3V2b5J5gjZ2UGbmEPi15z9oFIv58mzaDMU8E9PvqFyBQ6+hx8laYY+mTxV6RUul4p9AjLVmej/UzR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318549; c=relaxed/simple;
	bh=0ZgCTv/Geux3x3SUFX8YOIFnK7oyYlxxmU4d1i7olsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9Kg6QLHKwPzx94zT+GEjkrKDHypdYwt5E0Qft/YPATDTqMXhpwGzxZSfdAqi78/GtuALAGWdmY1MI2ZZG/nO6KNuIaBxuaRh5nLgsnslxGAhx8Awjm4d7e19uyZseye0AiXlV+fILU948By/b3cD+IZNOW5jiXaqjhgkGVnxcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b26332196so416731e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 00:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318547; x=1764923347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdpMn32zBbLdSwv++ygUci+KXGTrW9TQWy7WAC04eCA=;
        b=Z0EPDnXEmRUXiXc7jDdXdZTnnpfrsRuMdPLm0sNd+FDO7BOnhcX/IYCcCysEtwZQsi
         DL0dg8zMV9e8azMD5XG+3jtL16PtpdlrT2seNWv5leN6rxd0k468+kPjIOltJUYmmGEQ
         rcQ8j8v+F7SLSF7o/df5OUdL51Zii3o77o/NW8SAKW5FZ8QgHefyLceuPy44XfjoetEo
         LrymgNECIrDD5EvPahTxmtUR/TaKqEBBQkFswyVxYxukC2xzm9W5OkWK6SSL4nvI3rNS
         UZ7K/nbVsx/xquhLF70aqunsg+ow7zCL5ikx8epSSeQpyGm31nIe3/LNrPTJVKtAROfE
         dpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWws7zVrLXnpsSxVDZlu4FW3Zv7Oc2/muAvyLO1jzxRyck/YuGB5HpR/sDPMWm8Or1wuiwereHovTW2JmzFpyRdJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvG66j44uXq4Lysr7Gk+9LTx8sCZNSYLBAKueMtQV6TENqOq4h
	kwxGNjZEm8WKdIRt7WVdkinFwTWCfS2hlMJvXkoS7H2rxVmU1Y9+VAap7mAAFt95
X-Gm-Gg: ASbGncuAVZOyRuFWRkw3YA+Sou4VbkD/Jvwjf5deBKxK67Gen8UrhrnifAJkbDoS389
	CivrK0aP5yzX4z4yUcutpmRCeSsHsl81eqC5mTJmth07v+4zTcCkt1VvXjsgMNnwHDTaUyNdClH
	gARWzDph0j31MInIGoVywtOoeRPvk8fXNX0wcGMP3hxrk+4VjYaZiPNsrDmY5ryhyyYAPaFaWyn
	4TzUf8jk9DO6Wf1+lL1UoOu4/ndltDVervfz4zfQnt/0X2eHlm1ZdpjPbC6wjdiT/IGa9XkF0xr
	GEecH2/65ZDAyLkwmsTXgs0DG1KnLwZ2spR3z/LXatQdHUrzyat1YoR0PS3WnVKCFxLo5kSI/oX
	jsHLQi18+pOFNxmS1eV58C/yEVukR7OySNiJWrq7vYwobYEtr5ayrv8748I3+IU1RIqDhalGydd
	2qEbzdNVLpFrF91bmM+CYzkJKJQgAzXMuisfaC2ijPVE5DINbo
X-Google-Smtp-Source: AGHT+IFsd+JG7s3gor+3tgAvvw8gB92/kNiGjgjio+wTQnjpftQqH3Pd+ARiZ1eL5iTCkTJr1gI6Lg==
X-Received: by 2002:a05:6122:4886:b0:55b:305b:4e48 with SMTP id 71dfb90a1353d-55b8d7ca793mr9093302e0c.20.1764318546672;
        Fri, 28 Nov 2025 00:29:06 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf516c7c5sm1501389e0c.17.2025.11.28.00.29.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 00:29:06 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9372a52af7eso426958241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 00:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqpoSeJHrWz5JDn3Lx1iIHL42gNo/Sx1TELR+crDPJU9ff/pllk7p8o9wfXJoPG3yEHhW41Ap7/5NEsG/YvOSlRw==@vger.kernel.org
X-Received: by 2002:a05:6102:510d:b0:5df:a914:bbdf with SMTP id
 ada2fe7eead31-5e1de2fdf3amr8043647137.27.1764318545497; Fri, 28 Nov 2025
 00:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125224533.294235-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125224533.294235-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Nov 2025 09:28:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+zGd5vjw7i3tah_TEsC9K2QtV-SshTdfZHt0y4fhkXw@mail.gmail.com>
X-Gm-Features: AWmQ_blxOjK2K0cDtOGsZALn7AfonTpGtKH-CtNYMSf-HQs578XzjUSEy8mUZ4I
Message-ID: <CAMuHMdV+zGd5vjw7i3tah_TEsC9K2QtV-SshTdfZHt0y4fhkXw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add NMI
 wakeup button support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 23:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the NMI connected user pushbutton on the RZ/V2N EVK.
> The button is wired to the SoC NMI input and can be used to wake the
> system from low-power states.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

