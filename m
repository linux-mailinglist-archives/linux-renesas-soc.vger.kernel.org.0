Return-Path: <linux-renesas-soc+bounces-27100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9FD3C577
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 11:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 478965A45B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 10:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771E93ECBD5;
	Tue, 20 Jan 2026 10:20:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF03E9F88
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904447; cv=none; b=O/fcr9iOFB7o1/zxq4jaotr8UNI7OzRsG91LviT11uxnRNz7wYjrIfTjQ1n6xEeFD4aEsOMYoqcT58RHOsj+eY4RqCWi8no0LDnIh4qdjNDSe0ULbuc1EH742R1VQLeJE61XUtafpqD3caya56kdjcXt+wiaybTcpWLrUsd5gvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904447; c=relaxed/simple;
	bh=aAg7Ezp3FuZ606SiZuKQuwvHZ2cnjOgD6370edqmDyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paknGqNi2DGdDk3nH3DIb0gMaVqmfAf/tD2hYP5pWpYgxIyYpquYNeS+mM4EiyvAdDM+jdoyloecUJ4MmaW96Cu3Aodv7YOEaR030E3UqcWRYMXPnTO/DdKlXBSYJ7zUGJ2G8VL0WB8ES9rG9htMsrSTppD+DujXm8kmQw+EHMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eea9fbe4a4so1819332137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 02:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904445; x=1769509245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nyv07j23r/do4ZgfLqH89KjdmB98dkcyShTfl8D+6CI=;
        b=gfd5+E4V4SWPxgKj1NDuwhcEO2il7izlowXy/VREYBLTJaURoiCNHJz7AvLLv90LmZ
         /0yS08FvKCNFK6mdK6lawDfDSJtA5eSwohBpYva+rwIyGdP3LkfxTxMXiRCsUaSR7fMF
         zbu3gY2pqeKkN434deBrimgiL0FAgqlhP8SoeavnUau7GNM/G+jhJp/e6PfMJVueW4dF
         E+0OR4cmubrmaqo9HRyXJLbNG3PVONlQRN4SKcYu0H6er2As7+TfQxn9jbB4omaiLeXh
         6Ix732/EFppBuOrNusIyrY5duyJriFcUpYlqQH2YB7W20DwVlT6hrAxYFlzSitQJjWbQ
         8h6A==
X-Forwarded-Encrypted: i=1; AJvYcCXtjrENeupk3eqIvj00yhxSDkyAMqm456TGdXvOy6lMiF7dyf/OCBg/MfrkPqyRpRjTpZzGt6f2WYjtohmckovmZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvTiSWqWITMjkTarg83JZoCvS/BVMpvAagbu6e+aczHEDhXSGT
	CO3rQQ+Hsuf9Ou+G4Le0nNY0oWfx5bZhx+pcsmf8vPUmTRup82LVe7zFOmqVIXJC
X-Gm-Gg: AZuq6aLOYF/+PssVgT0R7sD6cY1tthVMRd2O9030p/WtuiG3Dj/2URSG2wUqBaNodnA
	GoYLV1CisG7jKTL+VLTk8yHxrWyNJXG3iuFJfVaYFsb97zJUF7OrWlH8swBOR0zb8pVf96gdsVG
	QDV8iyi2HkfNioMekfONZfViXg0SJ8ttpsLF9+qciAo54AQOQdJEhjAMEaNiirBDfaUeO7Q3KD9
	RM9iXP7/QlyhSFPkhlc3Wf8M936Hgg+uLdRxHuY8b9FtdzWc7CxT8ni0M7zDd9fprer/+l6+Ywn
	8W9HSfW7eyjp+z+zaofQl54bjBDqVmlQ0TSakyA8XLe5ffdUToahQJBTZrbZ9K009N1dxP9BUaG
	zxLIp39Ttjp2W+CQQQwVmIOIwgEXLdJAA1OENoCHfQTjhFDgfOxX+VnGstzDoUVc9alb0wiwP+G
	jOY9idGQpuRWJu7PdHNdr+igqJJLB1z8HTCoViWqDuAV5vxYvs
X-Received: by 2002:a05:6102:3909:b0:5db:fe41:747b with SMTP id ada2fe7eead31-5f1a53b7a74mr4017206137.18.1768904444648;
        Tue, 20 Jan 2026 02:20:44 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm4557152137.10.2026.01.20.02.20.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:20:44 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94240659ceaso1443896241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 02:20:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUERBq7y6tKJYvYYZdY7mOeoa9CB3daAUWTVaTdujdEF5o/B3XaMI8315lvx+4vRuQfxUnbBYMSfgOuTPTM5wbIAQ==@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:5e5:5ed7:60b6 with SMTP id
 ada2fe7eead31-5f1a55b92famr3532144137.39.1768904443274; Tue, 20 Jan 2026
 02:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org> <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 11:20:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWrnn0vkgKra8mPzTLk5sWzE=CeQv-FXJ7-Jb+-mqU0A@mail.gmail.com>
X-Gm-Features: AZwV_QjATqdrAwQiQ-9Ivrk8GAW5lhpXxjdgsjHmeMx-cj4-rn9YTbwg6Jsj-98
Message-ID: <CAMuHMdVWrnn0vkgKra8mPzTLk5sWzE=CeQv-FXJ7-Jb+-mqU0A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] Input: ili210x - convert to dev_err_probe()
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jan 2026 at 01:12, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Simplify error return handling, use dev_err_probe() where possible.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

