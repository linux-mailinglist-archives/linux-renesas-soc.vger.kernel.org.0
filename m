Return-Path: <linux-renesas-soc+bounces-11264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC679EEC4D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEEFD18856C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3687721764F;
	Thu, 12 Dec 2024 15:31:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856692153DF;
	Thu, 12 Dec 2024 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017496; cv=none; b=QF6bI/hk8nSx4RwkYBRjv8aFUx7qagkQWnZ8t5Fad3jm3To5ptcu1R6CLb9qWXoXkvZhVZjU5+Gpj4DHdkmyoX+gyC/Cq9SPGJ/YR76ei4x+jI2BDQ9hnSemPWVuXVjETTBy0bQ/xBR0WbRAs52MZelOYcYZMACBD9HWIrfWvhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017496; c=relaxed/simple;
	bh=X1YaEawYnn9WWHhUejWhsMuylqwatiO6I686Y5NNsuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCAEl0dgtcDY7LPB5vQuck76Oars16aQpwhgIcuaeoFta4u4bLPv9spsGCZqoqa5J9Y22MiuDBzPb90SadnYXLF1IDsEqyoBX19AaG8yDCXSImkrKPYsXfjtnh0gSCqQvu4py73sOS5K3r5KekAVb5tQffD3k6wNd65QnL4zCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679eacf2c5so4290741cf.0;
        Thu, 12 Dec 2024 07:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017493; x=1734622293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4I2Xhiqj4gNrEIiazzuChFSwpmRlVP92K0fs/TnSpg=;
        b=DS8qTSt51Q5EJn72BlrAjubOMZazqV/vVzBSN2mFD/8k/dqH0HJlwzYvn36TcbZ7zK
         RKJx1VMc8zXJ+sd6+JH9b7ksW/yuTPKbOLzn3hvr+l39j6iD7tGBRX6y/ZAGeeqtcUll
         uGYcNZQOc4c98pwClkAJZU312P4BLe/Uii/pUktV0cgpYzVJ+v3dV/UZkFrpEAIk/8JO
         nhpOM1HDx9DUZ0mEVxy9eL7ksriYskI095H8NrEfvwuZamN4wvgV9yJdDn/WHHcTOnX1
         W8L0sWBTjpWPsiG+YEGeOCKRc8iuqDI3OQxEo2n7vv6SDa/gpV5sshfhgSTk8Sc59czb
         IKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHGtjm3w18EDAeFWSk7g6lXO/pnsf/DBmK7WZ0Z52cWyBemsH2aL52KHzcltfDrBTZx6PtZujwBaI=@vger.kernel.org, AJvYcCVBS7TW3GOa5aSVp+p9oiTEUPJPEktl3oKIn5Ls1mhH+bsh+ZvzdaPTVD1LeHYC8VPEJXoBqOPTYiZ63qAHxOZ6mCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyljveW/W0VkcDUJTYtj1lTC5n4pLxJ1n6K92cfutI3eo7jQvR2
	i7WkuW9JN9mWAPJzpX5o69UHDrCJ5JqVttBwxZBpEkQIF6wkAcFqeiO5SB9V53I=
X-Gm-Gg: ASbGnctpdv5hC/1bcKPhn91zyeFOtrprrPN0m7t1oqWVK6ZwAHE3aqqOTTMbJfDopf1
	j13qprB+tPRWZ8jl7BBF2zzLEj+mf6S1Jq+2n35kcUn+wW3mtEd+519lz8P9ZgYd5KqMpK/nPFS
	J6AP7tz2kfTFcV6O91+zXNSeAIDTVMujWdC33PH81RscXzseLh1bfKBry2FT8ntL+AWqcHWTB4L
	ELb83d5i8GYE8SyG1Yv5M+CYQ967T9kg/F0v9G9x1y1wW67aYHZ68rWdXOYcpoGpnu0dqhTXB0k
	H25hrI+MnkWFMQk46+6ihJg=
X-Google-Smtp-Source: AGHT+IHR0iZI8tiAxyrPl7J+qeu7mCuiAZvvFPiXmPpF0fkutylGgw5t2CMgeBps5LyI3nPqcKe5GA==
X-Received: by 2002:ac8:57c9:0:b0:466:b189:2071 with SMTP id d75a77b69052e-467a16ec06dmr12134361cf.49.1734017492730;
        Thu, 12 Dec 2024 07:31:32 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467296fcb20sm85693441cf.47.2024.12.12.07.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:31:32 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6f53c12adso41960385a.1;
        Thu, 12 Dec 2024 07:31:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaxkzafR7RCsQD22vvJwCQvKLztQKzpDpam8Hmi/RSKAIfVOVd+8AGkwFalfhQ++3+6uG3uJ+JZ0Y=@vger.kernel.org, AJvYcCUbjnCnhEuGXzYmhQJ5OkuM1gmvyY39Ldo4mDBiKR9FMh89Z2DF/AR/LbBR9Y9lSzWzbY4BSH6gjzHbOWjZFDS+BuM=@vger.kernel.org
X-Received: by 2002:a05:620a:6003:b0:7b6:67a6:5adb with SMTP id
 af79cd13be357-7b6f8953f24mr148285385a.21.1734017492295; Thu, 12 Dec 2024
 07:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:31:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVveCN8umkmXhOxoN6oxAARgdPiX=MJnDkYuS1nLUeLxQ@mail.gmail.com>
Message-ID: <CAMuHMdVveCN8umkmXhOxoN6oxAARgdPiX=MJnDkYuS1nLUeLxQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] clk: renesas: Add support for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The clock structure for RZ/G3E is almost identical to RZ/V2H SoC with
> more IP blocks compared to RZ/V2H. For eg: VSPI, LVDS, DPI and LCDC1
> are present only on the RZ/G3E SoC.
>
> Add minimal clock and reset entries required to boot the Renesas RZ/G3E
> SMARC EVK and binds it with the RZ/V2H CPG core driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

