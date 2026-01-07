Return-Path: <linux-renesas-soc+bounces-26350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B74CFE380
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 15:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF773068DE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 14:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE1C32D0FD;
	Wed,  7 Jan 2026 14:09:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFB62DE6FA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794943; cv=none; b=tm+7Yq0oic1oNvR1Ln+34nCs+hTpkeP4iahsGMfgueK5RyfR+EqU6gsZt/0l0fGRKFC4yXX1EWk8yqHDfEstZeMmLjXUeIQv3qgZD7ZPla6xDRKgtO4fy9DuB6EMBmnNPsbkFcHWsWVTXPp6L7NTge6GHnm5UuTELQj02jRkpQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794943; c=relaxed/simple;
	bh=TSVifhnKCRQucGHNHKutXyQ826re/F8Nmgcx00jenV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWzpl56FH2/txlMJR2X7GbI8QVRLtUfbi25WnlwXd2MhPerjHF9GsSockdioUo1FVC9wKFAgXz7PcQEkABdSqaXD4Wa/i1PQtXNYJ/s3p0l1nF/Gl4oQ97LB9dtdFHqocNs2hA7PJLh3k4CLQu1ccSmWRyufVR/rn+9ChMcmoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55999cc2a87so565170e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 06:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794940; x=1768399740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPXHBYXXpkOfpOjUxAWvhytlRsam27J/BeRqWtdFd5c=;
        b=tO3QK2qNJm8l0FuRozcZpZ3iWOoiJmfOUbYnMBDvepoB54xy9oAemfK7djxJudf30k
         aKwIGESmxVPy84OUKDeULUR5/XEIIyQnhusNeGoTuxhxLwmZfwEYq+eNUpHeMhLIPwJE
         EYJE/LmDpWZOOfboG1XBOWFvTyNYtqIIAwpc7zf7CpmPnr4NO6IWwThNRsgIexitLdrD
         iBoT3nrSDavQBicS8F8OuUt0xKRzKJSmz+d3NOyVZCmVqLbEdk47+LMuFGqKd3gud/df
         SKa1wAm8xr5c9NZlJUn5diukfIU2GnKkqMkdT8ctRKSIZPHxkn0rW25cFLwQt6ivtRUF
         7g1A==
X-Forwarded-Encrypted: i=1; AJvYcCWJzZrnBxTj1F/nfDG8g45gcvFXAEyI+hoEir+xSQjSM/J3kH84eJeTljeAUg1CK3SNl/lDnfWrAahxlYH+lUHTsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdmvs0whsiKx9Wnb0rjuxW2JXPO9eFxvAft8weR3xER7UCCC5
	SbtTirimqWLbP7LSm6Jvmn+Cn7ViKxnoO+RH9VpNTw64RzII9603JMopcw7MbQtz
X-Gm-Gg: AY/fxX5tdtWvIHQmen5ftS86d+w74KwfD6llpvP71x+9ZIL4eAwSCAswPtZfO6eU8sd
	UieThrrfnt7cEnPfd1johdRYGEL1U8R6L2mgAJR3hKybNT0He2QP1vyQfxVlrZU2zXA6OVtfypN
	zSXcHubSTxeIe3ehZamw4aTbsIB1zrNSP77b9n7Bgr5C+HcJHdSbTG13YBU9/aHJ+u9oSU3rvPt
	070Qz4Pgk7LlsDbl/n56JtiOIZZZLrEI2wlWaPY6J1/ax39Aa62o9V5aBTI3PdiMLe9+6P8rkDc
	0td/pR8Y+1kbbyzANjDDsByKl4swnRCZEz1D8Xm/d/JdP0zf0XIrBvt78bA4jsxt7HBpv8lPqac
	vQ+RfIvOcNoBXpTxs1S46RraUcJfgCM7uPe2IzfH+ig3BSwWmjL2XZ2mSXNvAj/Dd4uTJhFWck7
	YZwpLMr88ItMfL2r+HuPeqZmnfIgxOw8uGS8MpwaepEA5JPERdwIcr
X-Google-Smtp-Source: AGHT+IFeEYiMDc7faF/ubvvwLknDUHl9POBooqUsyltA7k96OJHReW5w2kh5Nw649/dSWZyurbUHrw==
X-Received: by 2002:a05:6122:4f9c:b0:559:6e78:a43a with SMTP id 71dfb90a1353d-56347d600bbmr999358e0c.9.1767794940327;
        Wed, 07 Jan 2026 06:09:00 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122d6132sm3030031241.5.2026.01.07.06.09.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:09:00 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b26461e78so638737e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 06:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfpxKL8d6UCHQewS0/RJ/cUOBhUtYOmwwtre0hhsDX/ugxQf+2WsXaZBxcaEU/1V+sjnReLwjkbIxvmIFldyuiww==@vger.kernel.org
X-Received: by 2002:a05:6122:4f9c:b0:559:6e78:a43a with SMTP id
 71dfb90a1353d-56347d600bbmr999355e0c.9.1767794939883; Wed, 07 Jan 2026
 06:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251127145654.3253992-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251127145654.3253992-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:08:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh_B-tsAgU_pe4=QQVghxtuvQ0=yYce-1QMA+sL3GJGA@mail.gmail.com>
X-Gm-Features: AQt7F2rEh-n0UC7mrUlXv9V_Mi1tNA0_C3FMrdM40X2hHGBHysCIPhEzFsHF9uA
Message-ID: <CAMuHMdVh_B-tsAgU_pe4=QQVghxtuvQ0=yYce-1QMA+sL3GJGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: cpg-mssr: simplify pointer math in cpg_rzt2h_mstp_read()
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 27 Nov 2025 at 15:59, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Private state is available in all places where cpg_rzt2h_mstp_read() is
> called, remove the extra pointer math used to find it from clk_hw.
>
> While at it, put these statements on a single line as they do not exceed
> the 80 columns limit.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c

> @@ -286,17 +282,14 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>                 barrier_data(priv->pub.base0 + priv->control_regs[reg]);
>
>         } else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
> -               value = cpg_rzt2h_mstp_read(hw,
> -                                           priv->control_regs[reg]);
> +               value = cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);

All callers of cpg_rzt2h_mstp_{read,write}() pass priv->control_regs[reg],
so a future consolidation could change that parameter to reg.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

