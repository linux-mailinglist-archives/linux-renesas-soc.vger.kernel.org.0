Return-Path: <linux-renesas-soc+bounces-15726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86939A83D20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 10:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961EE19E7A2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 08:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C2A20AF63;
	Thu, 10 Apr 2025 08:37:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B543AB7;
	Thu, 10 Apr 2025 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274230; cv=none; b=jCPL8bN5hytSyQuD98wY49atV0aF6F1rCW/KfMLPNqNsN9uXq+amB7jPveVt0Pe/3iJTk/zmDZ1ReuhLhxuAPKlp3rDS8QcVLXP05TbzAf+ymuBjgXqsGFvmJU9L5qSJcWSIvonHclkmtdxY1m0a3SpVbbZs3z3vi4DbU0naI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274230; c=relaxed/simple;
	bh=VeuJFe5h10MNcuyLD9WOsB2prlSPzG/6nRGyFsZ8Leg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEtaZf8MC/rlXoyfRcBBAw2Ei6Cq9e2yMJoPjmEHdTiYI+VRlgR+EqKyrFzimj054Ax7l8PS6s28wvgGoJR4g7//qOSF/RqLA2z5vYL//tR0FQsoXLXpAjXK3EhaYn2m3sSk/JaZdyguXINwVsDPfdChwP5LaXkayImqIfElQo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523fa0df55dso1589389e0c.1;
        Thu, 10 Apr 2025 01:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744274226; x=1744879026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5R9bBkLIJ9LaZOCrWV8p+hglpHXrmD0rfKnJVoBklY=;
        b=JYSwDmhdSaquUmPla5GAqUxUPo//fdPKmfrM6Z4iy+iehvCeBTTTfwccrFgEo4frPE
         lQc+kip1eisqN9+ebQO2Fj+vdLLgKFT9asHJv6R2ELiatrs+2uoYoOwAoT32XEeNAq3M
         OY+FJuoOmxYZXW0R4myI36yto1aUK5JdKmhRw8BfaQ3qEL1vcUNIJ1Ab5nBBT5Ovr+xe
         1tZ8Gj0aQvEWswrAVSMV6iPnziyW+nRnkLO4ZOyyhy5dazrrWFyEzCYYHzBEe3oiftpG
         kFqHsGc8kPdsP86i+pFRPNgA82YSEnr+ESy9ABRfa3U5uAhfwPiWafysjYPKaUKJqbtf
         T4nA==
X-Forwarded-Encrypted: i=1; AJvYcCV0vjOdS40kLXpCScTOO5fiHe9zlSbk8py6jCil3RCrQ9fcpNuR+k5PnuK4Yv3EZJS1Yf0h9C6JCG8w@vger.kernel.org, AJvYcCVbnzBU3vdqjEHmnGBDLa7xt3AaP+Y0x7mPaccIdRcKWbFkD1mP6uqRepwAT9nEehOZpqXkmXZ9mb1GtcQW@vger.kernel.org, AJvYcCXvXEdCZNY3oXAJlskN9tFbHqhl1ijZFbSckIaOOMEufxZCC1sDvCCj6JcBtCvM1A4vqqpN8dZbxTTg3VeSyQd+fis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIJLWBMlzQViF27Ve4UQPYp2N2hfDlivkpSpF9219Vy+BPF87
	I0CjAh+XA75tG6uaKZVNCkmD9RTSQuQzfGYfouDBJSYSEJMelOXEaVEQDdmY
X-Gm-Gg: ASbGncun5H+hVP9X9OIW4cD8Yrj+w6DLCTYHjI5X+rAhWBpqU4T9OA17xe0yAxpPZvU
	B1soIlwHkj01ETwW96uNxrnRiNKo7UUAjeO/OU4Kl7VUrapdBznYi3yAuZHh1RtRIgIg8bO1VNH
	OH5bBZYe3Snjl+FK9UPhi6qe0jo7nJLVKJLgMB6kpcDMjAICrx8z/BXCIhlg0HrQgBp3xTNetg2
	+MARG6jf8exU1+kZAJDK38QBg0MUx1TPeeR3DCsDShBcahZNKgtajK0EBpqRl0XVp6+8k+EDxQ1
	Tx+SWi5wPUXFxHJhV3d8PeRWyUOuOAYU/S1LzKPCi6Lb3CkLCzXvGytZOdnpsa7PaWdOhOWIYYL
	IeM0g1/A=
X-Google-Smtp-Source: AGHT+IHGdV1vU1XpS7mfuYdxubH5cS3CX5v2RkS5E96eA4K4rvmnv+PCVuLBQ8H9KQH+TLlmp48skw==
X-Received: by 2002:a05:6122:3c83:b0:51f:a02b:45d4 with SMTP id 71dfb90a1353d-527b60a6516mr993505e0c.1.1744274226509;
        Thu, 10 Apr 2025 01:37:06 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd77f82sm567817e0c.17.2025.04.10.01.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 01:37:06 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523f721bc63so1486353e0c.0;
        Thu, 10 Apr 2025 01:37:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9VJmpnnoxGA5ePwbp0lH+m3o5DptIHX56NMPXF5tYFt/kJ9xMaMHJDiS+MQqz7N7+iQ8GqudqYt72@vger.kernel.org, AJvYcCVTJe+s9fIB099ZKJdJQ9AJ7kNVLBtCxMDbFGOn7b/JwdPc4P1xvVI1j6jJAdlSr/yDXg73jMqgQ3LTc8bs@vger.kernel.org, AJvYcCX15gCp7+JfblVDUSyppamp2EUQqRXhdRytw8eDTtLw9SN2Ien/jP4zQKIjuT6/BpW8eR93lk5p+GoS01UBwLXFrlY=@vger.kernel.org
X-Received: by 2002:a67:f5c7:0:b0:4c3:b75:16e6 with SMTP id
 ada2fe7eead31-4c9d3fc4c38mr897522137.10.1744274225992; Thu, 10 Apr 2025
 01:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
 <Z_eCV8aTmr4t1_xZ@shikoro>
In-Reply-To: <Z_eCV8aTmr4t1_xZ@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 10:36:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5w_9VpVrJPHy_EtmXoWV9fdBBO_YwhPt2TcX_D4TUxg@mail.gmail.com>
X-Gm-Features: ATxdqUHkSKSCEKCEJSAuGV6i1Hdt0mFYqL-YJPsp5D-L3YCAbLDZz0Oa_K2nfJk
Message-ID: <CAMuHMdV5w_9VpVrJPHy_EtmXoWV9fdBBO_YwhPt2TcX_D4TUxg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 10 Apr 2025 at 10:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > -            - enum:
> > -                - renesas,r9a06g032-uart
> > -                - renesas,r9a06g033-uart
> > +            - {}
>
> What about simply dropping r9a06g033 which cannot run Linux (no RAM
> controller, only 6MB internal RAM) and there hasn't been any upstreaming

You can run Linux on 6 MiB of RAM, if you try hard ;-)

> effort for other OS in the last 7 years? And making the remaining

... which does not mean there are no users.

> r9a06g032 just const? Why should we allow everything there? Do we want
> to support that?

We don't allow "everything". Valid compatible values are checked by
the normal rules below.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

