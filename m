Return-Path: <linux-renesas-soc+bounces-26451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B50D0542B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 18:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0EBD343A1C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 17:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDAA26560D;
	Thu,  8 Jan 2026 17:01:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9137271464
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891710; cv=none; b=Ww4gS8hSwcL8VYKy05MuNcpRJl6/Sgdc5AxtGCkLMSKIGtcqFERvz1plCeVmd5C156aNJnwTLPhuFi54OKYCJtCoUAKqJqAQEfhAmmTEKaE7X6BzPUCw18zb0AZ4fq6Ksjvxkr7G78bLpcgtdFC2BPx0O6ncJ8SEkOof3GTF+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891710; c=relaxed/simple;
	bh=l/hatv9g6YZh7Jedhcdf7GctsSHL9xJ16ZgcVa0bhbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDD1qoX+LzefnJrGM7LKV6ImBWQ6xwQb74fat2Y9b846fGIqs0b69oQLYsu/bdkNbHDoDLmo9cIR88bkXe8HtWhDNEMzxgzHUVjASJKOXxwvS2r2p4vw4vVgNjU1GU36KPn7a9QUG2TFot9cvx8C8ZA5wQiZ/ZZDm6q8OlaSQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-55b09f54e98so1087255e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891708; x=1768496508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3co9hJKBOyWFmQg9PlWXAOMJY35oVbLhgGmADuHFV00=;
        b=ZAyvXec4T8imRBCG5Q/5doNo+5cGSd/9v1JN+YTUTjzhMzxvu9b3SS9npYfFiGpCM9
         BqD7Idm0npt1W1oC9mkls/J/L62z6teirJ45ESgraDRXU3mUwg3SB7zixGUcwMDENc+E
         JXFBDnxRGisIkYxMvf6jgyNjtk973vQfXpa1pmPtWoGcXCDuRGwwNI6s8KSCG8i8JKN3
         yUMHGNy5w1mMG4s9RhX1AFdNEmqXR7modmqU9A5kWvmhkDXe7ZyuzFOmr1e+Qcgv6/YE
         9crrNRVX+q7H4ZtCjRVU4mjCTCeFBpe5NbiqLKG9uBzpC2ZCnEQBsZvI+uY5kx6z6s01
         KGWA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Tofi0Z2zPhn0uHtX6C8HOukg5k1R1yk9jlFmw75XX/stSVzvtiKgSKhTNaA74w4mhPeyHRnqxleDtLQmhzAoBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX5LaAw55vtnBLpkmWm/PL80hBadXkJ0N3aUaNz5vHb9LXUNXx
	3OqVV9cTadYMCmtSry+ocwQgO1HRkm2EP3WL5Walb2vWNTcM1biyJVRpSMlFGJNNOrg=
X-Gm-Gg: AY/fxX6FsFHeBlXpPgiVGiIQNjfwngTIm3hcqPGZ6rO1E2/mVB4ubOAbZd0slXYLs2D
	yd6uXsRua/3jbcegO5biUPqVa4000WBBvM8cdRHCji5CB7IzG8Ll2frVCG8jShoKPzgbeXBbhxx
	uhDR/fBedLJfcz3LX1KPPKo1gZUvWu7lZ31RGuGmf3P6w22NbWEh4jybGRq5KVlWMWl7Cf1on/n
	TkHLxTPbrxbT3q/fDzyrRfbuTOvUDeDpWap6Fb+DeORGmqMqsTE7Y2Oz5hBT51UMOt5ROqwFizl
	F5tvmNcbyiy83pSz1nxP/5z4h9nnOe+2bXtbvRR/sTX7Ab5UDAxiHd1oh06WfdvFEaN5ZuXuZ/l
	8kepmfIW1COwB3w3I7fKmSdMuq11ZlKNfee5LS7YULVmLquGtY7A31m5gfhiNPzYqVeEU6XdWYu
	6p2Gvnr17UW6DeCJcbfb5xzBVrkeoxPSgYSmjD0IKyKWRFWv/EPRi1
X-Google-Smtp-Source: AGHT+IExDyrhXARO0YPdhsNQn3641i/4v01Zfg6YnYcPPGiXQbQSoWxGc9KMCPHS/OYKOo/NPasPPA==
X-Received: by 2002:a05:6122:8710:b0:563:618f:b7da with SMTP id 71dfb90a1353d-563618fbd24mr544943e0c.19.1767891706066;
        Thu, 08 Jan 2026 09:01:46 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944123fca44sm6349215241.7.2026.01.08.09.01.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:01:45 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5634d866615so1050717e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQb+Wa0Z5yWvJ/svJVGtJcEfQ51VtFjhjo9lD8FUyLRdLDi5h64rVhb4lvoTA+EIpqfcF8Rz8/mWWnWhBNoGI4Lw==@vger.kernel.org
X-Received: by 2002:a05:6122:d26:b0:559:ef6b:1efb with SMTP id
 71dfb90a1353d-56347fd756dmr2483847e0c.11.1767891705232; Thu, 08 Jan 2026
 09:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:01:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWg7Txe1fm0XOaT9FB0pDq0SehoXHWrx2g=j26g80vnHQ@mail.gmail.com>
X-Gm-Features: AQt7F2rYWZ2Ei2cs0E8SVTZUjMSM-px_qYqN_ex3GD4Ez2BxiCY01zZUOkvmZgc
Message-ID: <CAMuHMdWg7Txe1fm0XOaT9FB0pDq0SehoXHWrx2g=j26g80vnHQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl:
 Document GPIO IRQ
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Document the required properties to handle GPIO IRQ.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> V2:
>  * drop interrupt-controller and #interrupt-cells from required to keep
>    compatibility

We can make these required once all pieces are upstream.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

