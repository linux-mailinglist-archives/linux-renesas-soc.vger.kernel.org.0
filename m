Return-Path: <linux-renesas-soc+bounces-9383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59A5990133
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 12:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23EFFB270C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 10:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45418156887;
	Fri,  4 Oct 2024 10:27:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EB7156872;
	Fri,  4 Oct 2024 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037648; cv=none; b=aeuhyrjZ7K4iRBuZku4IXtNRBhcPgxtt2wdUC8hq18QHlucbjOG2MvcnakGMRdCBV/pLVp9A6FfSZ+4kq7k0w6jsTGnAiN7iJlFkp8L2gY0Zrbc9/MO/iTTUyrlde5F5vQtByHlM3PozLfnuh8JFnf6ygp2Zv8Y84owy3N+s0F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037648; c=relaxed/simple;
	bh=Lv+wsMCH7zkm0PoCWTm9DMQRoFbEvLyOAcKUyiKSkps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6XXY6MdD3K4l14NeciQKpHr06eTUQn0FyylJB8U/vzebfDU2IHbXlVv2qW1H18Tu/9F3nuButRFeIPDltc9LqjfZ5a+EnPxN8T8Jn+JRRtDHSeafppRh5JAiX4zTVgKDqUjEHoy3fit46R0fKMi2qbghHRneOrFfIAOgZ9m42I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e25f3748e0so21143937b3.0;
        Fri, 04 Oct 2024 03:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728037645; x=1728642445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XHWpQuSYQCpzlbUHAcyWGGG8GcQgnQ08qsgKpmz1nA=;
        b=LrTc2JsCFvT8yD9WJ7wNZow/zmCMrC+qOS2N3ZzMr+m9RHWooxbdOmMxRD0XP4iNyh
         WbwzZdq7npIYR4vBx4P4RQBsvp/oEJE7BNJMuJOtrof692VaPEGztTJ9aivPHL7cA89f
         WhRy6DeGxelRAgfgEnbTuF9vkyJHZj7Y+UvPEMqFKvSgh1E0Ym/50o3ovObhBseiWCH1
         pb2/u5jGH5dPWXTV+qHiP2/qSs+/8chTpSQyBko26QVjAKwLwLGp9WkhDp/i/uUNXDRI
         /H5r4KAu3kwAuMi0j/tPVaqaLo9DCvo/rBFM44PSb8VPDBHZ/ItIuWukEYsZ5ZY3VV5Y
         uSSA==
X-Forwarded-Encrypted: i=1; AJvYcCUs9S/bEU6vIqTUgRXtW+vkl6TJHfrsMuoW0JtB06zRrlv9JXCrqq2W3XlGDQQVEDDrdC4/ESi6njsnYiFlGA8VeHo=@vger.kernel.org, AJvYcCWTE7/UB1wfAEN1wkuZt0BrQ1mefVXwUijrgB4hOALFFy6Vte4DRgDf4KlTZQ4aucYQ5fsnbf02CwRdW/56@vger.kernel.org, AJvYcCWwKSLNxtBMFtSwJrHqdlLT+OS9logUD2tVohhDwG9d/HHDwTyaWghLV7loXNW9Z8o4slq9r4ENYpYU@vger.kernel.org
X-Gm-Message-State: AOJu0YxbFQsysMNGtTX99rgdf9h/1zihU5KrfOJa8Ni5jrCA6o9+vYju
	1cVH87qOzcWBfGgb8mtZDrykIU0BmAK0pk7SYG2yOeo3tYeFa0A94L76RpIh
X-Google-Smtp-Source: AGHT+IEQzYGvLBp/Ks3vYL/KYV/pCbFJRpZCCr8Z58dqmK78gWcjZup60LdqhTrMzj6t2UVMfIrzgQ==
X-Received: by 2002:a05:690c:4603:b0:6dd:c851:2940 with SMTP id 00721157ae682-6e2c6ff7d9emr14727127b3.11.1728037645276;
        Fri, 04 Oct 2024 03:27:25 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbbb7c80sm6038467b3.4.2024.10.04.03.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 03:27:22 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6c3f1939d12so15415107b3.2;
        Fri, 04 Oct 2024 03:27:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/ybbB0/Ab0uOOiu33wsKSlZoYVM0j3Eq1Q6yfYHcFgjv6AHMSVXHgIFqRH+DiADOHK3FNAoqZAYDG@vger.kernel.org, AJvYcCUwyNvNYTG1mGhw4RrR76WJPMJzum0k+R4we8KKekNUxr7cUN9NYoLQefmx6i5qUR94vyNRc3U1Z7YndKyN@vger.kernel.org, AJvYcCWGc2QKuuTThPnzc4uQw4WyUIR9a5ekGv9tsQ0yNfqHdL32KdNyIKrJsDYVM3CwPJybvbKV89p7JJGQYSUe3s0eoWA=@vger.kernel.org
X-Received: by 2002:a05:690c:fc7:b0:6e2:636:d9ba with SMTP id
 00721157ae682-6e2c6fc66bamr19650967b3.3.1728037641722; Fri, 04 Oct 2024
 03:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com> <20240930145244.356565-6-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20240930145244.356565-6-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 12:27:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD=1ReyLg15Kg7ajp0xZXb8p1GFzhYU=HoPTaKBg29FQ@mail.gmail.com>
Message-ID: <CAMuHMdVD=1ReyLg15Kg7ajp0xZXb8p1GFzhYU=HoPTaKBg29FQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: r9a09g057: Add ICU node
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:53=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add node for the Interrupt Control Unit IP found on the Renesas
> RZ/V2H(P) SoC, and modify the pinctrl node as its interrupt parent
> is the ICU node.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

