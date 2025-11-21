Return-Path: <linux-renesas-soc+bounces-24998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD10C7AD9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BDE3A1214
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FE22701D1;
	Fri, 21 Nov 2025 16:30:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B615283FD9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742637; cv=none; b=ShWJZX4P4FOhNVAK+daRA6pTBw9sE7MaZN2s/0ta6RxxB2E1Psw7MVTbq0N04235UmvLnMpmNgkvpZCzs/gCYWUVLcmQrpl6id8eYH662hZPYlPNlo4Yw2BUXM72Og23d+db3Y3HH2g0aCvxjY/tTHBa3hvsRCUjY6yThVnPok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742637; c=relaxed/simple;
	bh=miUYp13Tg68gtXfjxpodBeV3EU7nr6kyS9YRTomit/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLir5HwhHRmqPro0dOThGuSTk02CSolYlbUALsJJjzkmYbxt383pOXtIZuZY22jtcgccPLQCuZlyfUwnZlDHTJBeuwsZFKHc5k5wJp7Iv1WVqqpXEjH5wzDCxYmR0HHJ9da8Ge3YjPCMWvXuqxYqkluYTmuTov2mKe75lNU6D5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55960aa131dso666289e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742634; x=1764347434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfme4CfywnSRg8zjFjN1q1faWbrMVER83csGlPhpKYs=;
        b=Z6bCeYR/bLL/bI7l+pZktlFtYr4pPc1hs38NjEvtXXfk5arz/YgJ9ni+82Bi+WPXER
         CMI3bufS/Q62fn0ArZ/aDQDi1ZUvFZpZ2V6FCZSV4/okzYPU+6IbdpesP1VnNAEWncjb
         /eMUFaQBnt6RBbxGgfjalmZ/WYMEcAV8xRNCuNv/RhnZLJu+FQw2yLqeM/8D1CDQFbNF
         LrGW5ZHatI6NNI9ARCcItqOY0hmpZUiCUSkQ892GuMqrl5NmPf/cROpfsbM+mh1xd6fu
         p3tzeQlEF6LGt3ikI7av1k0keKZsGlqQhOxz0LuJc+pU41MuzonHG8D9jYORMvVUkauK
         KSjw==
X-Forwarded-Encrypted: i=1; AJvYcCU4DPRfOCbgJAKBQ4bsexG7V1e3azGnFBTBZ5JztzdQ0d0U2/+rjRLQGrUdou//Y7IAfJXDkz6LZl7/iqW27VIlZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIU/shyoJaUZ++B2qN/GamhOeabmFIr6I8mMkCx7WgPzLgN9j+
	3mHXM2S+RXK1L6NVcErh1/dGL2eNa4ZEQZ+dlyeiqeVdGdLkBzfMYZfOUYRbko8c
X-Gm-Gg: ASbGncvTQdaRSP3eW6Nt0gD0dc5on1E4CHujShyB4eJwI0n25d9yAWGTHudrVAY3BSc
	cFmES0gtzS7OpeIvx4WOWTqVx0BMb/i5B8egmh5lclVM2HZMl/QfXNmgastMA4f2ApWzqaLKG83
	wVd5oqaFV//f0z6feQB1QX/fsPamWd0dxFnHWq6h1Mv0YJoUuC9HjKfThjZ/cOTbrMwKBABjRg+
	78pP/8kGo20PonxM5JEJeepVRzmg8ocnrmkwUzqSsoXMFM8IzEIad2jnxfPfNadPlGh9VA7vDJi
	EG+Yg9k7k01bVU4SnIhuEL73YbXe6n6rm24uFoVXjTNWMdKU77NBY0yUE4I00wUo3I6bZqDgbBA
	XpDS+nDAoMLFSxCgZvUmUmAjWsYc1AyovTLPCxsa6Hb6olIhw2W152ONY8NvV6Fe3/KXMLU+m2o
	t5UqenqKexpVsGr4kTkUyPprHO8HuwPE86Is6m03Jmy1v/oSr9
X-Google-Smtp-Source: AGHT+IFBl0B9FtkkAYsTLpyTUFaNqW/p4qzCEjRGn0b9V28tSjkLdN2PvM9KEA38pcOH/gzpT7JB6Q==
X-Received: by 2002:a05:6122:3199:b0:55b:113f:7e08 with SMTP id 71dfb90a1353d-55b8ef40d00mr780724e0c.2.1763742634345;
        Fri, 21 Nov 2025 08:30:34 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7749fesm2556050e0c.12.2025.11.21.08.30.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 08:30:30 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93720fd0723so672276241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:30:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLUflrW1TScm5jgeF1lfh5wvwm1sFWUiMYCcPw5sC4PBKQ05xJQ0/L4NGhEvwBGPT5sz2rVtaFy2vVJKJOD0Sy4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:9d9:b0:5db:3b75:a2aa with SMTP id
 ada2fe7eead31-5e1de1a0867mr893336137.18.1763742629852; Fri, 21 Nov 2025
 08:30:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 17:30:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWaJ4Ou01FuKdXMd4WXNMSu4FeF3U7ykpmy4mN8GWcpCA@mail.gmail.com>
X-Gm-Features: AWmQ_bkY8NTotInu8fmLPPbpJHXT1kn4NeHzwLSDXbeLRL28njFMQmX7rlOiRTM
Message-ID: <CAMuHMdWaJ4Ou01FuKdXMd4WXNMSu4FeF3U7ykpmy4mN8GWcpCA@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] serial: sh-sci: Make sci_scbrr_calc() public
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Make the function sci_scbrr_calc() public for code reuse to support RZ/G3E
> RSCI IP.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

