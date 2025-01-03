Return-Path: <linux-renesas-soc+bounces-11812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD7A00BC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 16:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045CC3A431E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 15:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6689E1FBC8E;
	Fri,  3 Jan 2025 15:58:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688B1FA8F8;
	Fri,  3 Jan 2025 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919904; cv=none; b=LasLG3P9kO0F+lpspKtNpuND6u2uDP8a+xuDlsttOLJLxKZOXZvOvuQp8sFMd1jXbLEzpIVERVgQTIeLa/7uShyRctr4ZcVN4Vd1R/WB0OHrH9cIqjrdYWsh4SgKQO19L88+Hi1M+vRKCN/3pf+BV9cE21CTMwbgGnpMpBe0JXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919904; c=relaxed/simple;
	bh=jdXeVsVtaUmBQYW9bAekcctmKK5igt+j6FBYowJtZAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI6mUDiC816GFLfdfOrfkgXP1An3iYZi4Yc9HYQKWhSY8pPa6B8fg2JNJZLjEwJYteQPQ5Hoj6MjyyVOCF7+f/HMcbNfX2SH/hM4+w5htxcImCdsNxBfnvazutTKMWTMMUcvg3WnPDVvjdwBSYpnNxTUTTo9dLa+qRO90FYU8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51bb020339fso2366056e0c.0;
        Fri, 03 Jan 2025 07:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735919901; x=1736524701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySq/PC6gZ6864uNR0ikTXWC0NYCsXPRgFg2wxFBjgBk=;
        b=WPlup9pW4PVkcTGpyTfGZaSuB/Iw4uI3HsNod4XnTZOdSibEstxNbrXME4CKpQTwez
         dtouEWy66vzE9MoqLkZcy/zcljUUN1O6AyxnW2KBDqXBthePbO3kHrJthaaqBdffNfLU
         yk8XdP/l+99v2jNv75Srlacn3oXBzWpMFL1oSfScc54jQFYWzZq7mtFbvMQk4od7XiWj
         OqBRkeLfXUox9Dqmw0sXd98fEMNF5xNHNXDm6Dykm0XhnctOjKuV74+aqURBXh9WOqpQ
         PtjIRmbu+Q/jgxUXdQPocGqez8eyU8RhJ0+f7mq6qO7J2TdsX5GXTktMAZc5MSHKWkRv
         eNwA==
X-Forwarded-Encrypted: i=1; AJvYcCVH5a7AAgr86+HEkcpMnmEUJDIl+IsqEkoYUNJs2aWVO8HGex60paRz0eKW4tZvKcIrn3/3b7mnHHM=@vger.kernel.org, AJvYcCVn/EPspFdNYN9oWbgEB5T+hj39l2wAmqkaUcRCevhEM/FGz8Mf8oybvnNE+dttf5M+rRiSLMEpQiuIS2QhIPzLLNE=@vger.kernel.org, AJvYcCVrNm34MSfbd7iWYWuOdwA1jbDWkNZDYEtBk0OIE64JcoCBpwmrVo2LTbJkJv9JEcY2ry2zRmzG/GlC7DqS@vger.kernel.org
X-Gm-Message-State: AOJu0YySFcvDm+zrpC+wQJ3dOMnWhKY8knnDMq2ABgllZi/NSXfEsn7r
	lDGyFRFHDXDQOtm6jUFHJZY8T7Em2za8haVkhvIyx465bpKOdFANr8liRKfUV/w=
X-Gm-Gg: ASbGnctKhHv1Qa8DWsCHoNMnJ9RvxpwqYMAT1aWoTfn6WbitrHXM5j5yZ5Bj4rFMgM/
	BybKrVn2zas9vF5uj3Flo4a4wthESJLSxmL+tfxMmBDVDZUo2U1ZD7aunWCuarcYeqsnzAi9LTr
	JMYR0mLj+vVBr0eNPGZGYwm8WhaBFVNB1/W8cEzMu3YpQGSTCcELX6llXgmaivMCR3WuMgwvFtd
	ewCJ7VI6DVC6Zceqqqyi06h+UZXMZM2cZPR6BxxBJxLCCyx1xH6kiHwIicezKoMKKlp6SAgYt2q
	bRqbFzMuQfHV6w/ZD88=
X-Google-Smtp-Source: AGHT+IEDtzL+3tqfRSAUpaA6dkjNHNL3zMwzFOmMO5RYGfBKHIQ460LKazcdMXKPcccoRcp3e1YEdg==
X-Received: by 2002:a05:6122:4302:b0:518:a0ee:e8e7 with SMTP id 71dfb90a1353d-51b75abac1bmr34571554e0c.0.1735919900850;
        Fri, 03 Jan 2025 07:58:20 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68cd94fbsm3366072e0c.41.2025.01.03.07.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 07:58:20 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4b24d969db1so3017789137.0;
        Fri, 03 Jan 2025 07:58:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkzX7yWIvimmXMt28fxoH9+XatnWDpbaMYJX6iGN7ZCvk0SKy+hFV0S5PFkJQuy2CXD9EWo6fuM7zSio+i@vger.kernel.org, AJvYcCVq36HQIA+HYvTiSrg1LKcEiiqEME2cLCdVKN31SD01hnZisOKWY2b8Dv5gJBLBQpF3sh4fgBh+0bg=@vger.kernel.org, AJvYcCW0BM4e0qnb9haGxQsQDYrLEgeDOaJ9EmvAELhEUm+OLu5OkOu8IaLDHPBkjBwvFqjGXDDKv5IL6FPrtJkwKoAsy80=@vger.kernel.org
X-Received: by 2002:a05:6102:6e88:b0:4b2:cc92:169d with SMTP id
 ada2fe7eead31-4b2cc921785mr29810148137.4.1735919900428; Fri, 03 Jan 2025
 07:58:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250102181839.352599-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250102181839.352599-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 16:58:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWo7GLKXk8H0jhnJaQ0xa7+q7mAqvmaSzdqJmhrMr-8hQ@mail.gmail.com>
Message-ID: <CAMuHMdWo7GLKXk8H0jhnJaQ0xa7+q7mAqvmaSzdqJmhrMr-8hQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] clk: renesas: r9a09g057: Add clock and reset
 entries for GIC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:18=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GIC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3
> - Included RB tag from Geert

Thanks, will queue in renesas-clk for v6.14.

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

