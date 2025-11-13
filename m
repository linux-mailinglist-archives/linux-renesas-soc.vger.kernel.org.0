Return-Path: <linux-renesas-soc+bounces-24571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219EC58627
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16D124EE864
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBC6265CA2;
	Thu, 13 Nov 2025 15:04:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1927F163
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763046298; cv=none; b=rAQMOOBr6FwFLpKAaPQz3E61QzGg+oPQtFWOKalklHnOG8esRC7ltTJ1iFANXQ8eJuvnNdKh1zAG6VpwpP1b5fJzS8lAOSVmrmvqCS90mOh9Rrpl5K+kXtYwPBDeZBvUF4BLf1n65bZfxPoPUsrvO8nodY9O2D+n1SWt9esbX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763046298; c=relaxed/simple;
	bh=96Y6UTc1RsC1zBGnStoKZ73w488HXsI+oYFS9qcYNHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNB0gegAXHANmDvxU/oj53TxjIGYxlWPvQzKUztiHpBcJXgcnHyL84s/D05eQyFZOClJ2z5id/UrWGsUi3/h1RcYahn9C94AZpWsCZNCF6anJT56pL1oNIIW0nxx5jeo7GQGpwNaAAFBfLWzWIsKp5QnglvSctDT+MGS3UekkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dfaf0a5da3so303094137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763046296; x=1763651096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ubK9EQtGlqEmscuI2UlEc444kIJ9wNNtF0OWUtH/PI=;
        b=Pkj9nBFkx58OKuOXA3E+61pFjfZmOmJZtMCF5JMho9Z3Ze3UDyBvsy4sP64ySuMCMF
         QcewisUrq7HXjho92D81y0Lo8+C8EcWQDBwjWQZZgtRsvHIIXg+qALsDzOvtjPg1C+o6
         cCk6PVzpAUUXY6M6may2tLsfisZ9cwMT/VfuWBv9icwobMChZK8qdR7BpYbOS+uaKIee
         a2fCGHx5kLXy8hB9B9TZw4fFJvrSuXYKMtnDOrBHysZaI8bCGVmfT2jGXNCbJss7NBue
         vUk1+W2NVJc9VPfcRaC/z4dqUag2/UmiV3SRZDMs7outwnrZYsFN6TFXdYBEjbXHVbB5
         y6MA==
X-Forwarded-Encrypted: i=1; AJvYcCUkQ8JrGRUDqZwQM13YUw6apOp9pv3wTZARfwEheuRpma0CNDtoeAiMQqhmDq0kvpH6ua6TNJJek+ABEc/padMDjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycEYesBlsRUSiAkaoYGdF9G44WPytJuNac1alaHnItDP//L3V1
	rXJKqWWuTzr0YQ3lSf2aLkv6FColPDisYMPEpx08YKkivLKoaD9PSVCCDQv5dj920HM=
X-Gm-Gg: ASbGncvsj4TU0TYihXUxw7kK91nr/U9JBwFkvQ5CCI0EuJ6ojvAo0+/qYg0VYDVTui8
	1pKVqp869M3uD7rkHbUcWj7yB8qFioph0fZtf2P2vJgZ2J6xfY2C+Z3wCl+MBLM638uW2qpdrlh
	pDQBvF+1tUJn8cwpzgJOFrVco56Ug9VElbkweKHfbpirsMqKVp4wi2LO9LoWo5dugd4DTplYNDM
	Y8Cr5xCf+v7utbh4TJrGihCQT/Io40XhDtUDilEDHIiPgpzZsVzM5Y7CMng/1HR+CF7THMhtNsA
	lJE503a+L5JQYrkxHtl7Yojb7+lKbQQPflb+DRRdvzxDByr5AMkA8EnwORHys2y0PW42pWxvB92
	4okKyk8Rk8igtKLWZzDaKycoSVMTLEJU0OajISiRUzDcPrJosd0Xiufv6gTczChKekX3Pab3Jnx
	+XXblGeGaDlnmxKnYNK1fx2l7P9WTmMIpU8KWjvw==
X-Google-Smtp-Source: AGHT+IHAK7oB1An+RrqDit+dL5OUVssXfpeSWC4RTA3KJTwP5gaKPyOE5zjTSSKoLTb0Nu4SE6bYLg==
X-Received: by 2002:a05:6102:630a:b0:5df:a069:4f79 with SMTP id ada2fe7eead31-5dfa06954a0mr1594435137.20.1763046295938;
        Thu, 13 Nov 2025 07:04:55 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb70b2e2fsm675574137.6.2025.11.13.07.04.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 07:04:55 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93720fd0723so286229241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:04:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbbDwG9z0o+G+829c5KqgwYMYm8xlTv9gRP394pAis5cjAEZr3QjWmmWcwgKDYXIEBSBpthrrs4aXXRJIXfgrzqw==@vger.kernel.org
X-Received: by 2002:a05:6102:a4b:b0:5db:f573:a2c with SMTP id
 ada2fe7eead31-5de07d2f924mr2287392137.13.1763046294441; Thu, 13 Nov 2025
 07:04:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com> <20251023135810.1688415-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251023135810.1688415-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 16:04:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqoi-1GgyC3ZpmOupNtFxaUwRx8C4Q3iO9nx_hMwxX5A@mail.gmail.com>
X-Gm-Features: AWmQ_bntxYDPmpH9FJ7BCBwIP1rRXvUl6W1zgLobUSlsMYdvdi_L11aPQlSxmS8
Message-ID: <CAMuHMdUqoi-1GgyC3ZpmOupNtFxaUwRx8C4Q3iO9nx_hMwxX5A@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] arm64: dts: renesas: r9a08g045: Add USB support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 17:21, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add USB nodes for the Renesas RZ/G3S SoC. This consists of PHY reset,
> host and device support.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

