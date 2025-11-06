Return-Path: <linux-renesas-soc+bounces-24255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25BC3BC25
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138731B222A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5B51E1A17;
	Thu,  6 Nov 2025 14:29:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6928B1DA60D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439355; cv=none; b=EVccb/4mhRB9jmJU0r4O/aVR0zXLBXsuoR0eczsP655U/2ziw+WmYgn1UGppm9jiZ31c4FMikzUPi+BtEnEhVPOhX2YDZ32UdsouWKKiYnUKumSn0r24mxMLrvzwyVSYQnuLfAf9D3zx1cB6VwQLWPSVSN90wFMVgio1o5JBhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439355; c=relaxed/simple;
	bh=NdOeY7lnDOPuK6VEus4jY0bG+2eiDkIJXg9ctj3EdoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzLRDtyhMv1GqJDwVZZBdLK1eU9dm1i/EyeBFZItbjSCd6IbltCagfU/B43zs1IKQjyEXGeOtktf3qVJYA17Nv6oK/khsRaARU6HcJ60gIWDwhZasCtrX5XV6l25pJoFmZa3BUNfJqDx57FlIp/YeUXNwwo9W9mXAWD8BVtQpak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so1678699a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439350; x=1763044150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3Qbwr2Y/2kUNO17tUXtWv3yos6fo6dQ6sGg+S6eon0=;
        b=cpoYoWvkFFHHEGYkvW1vJ485UIY/mbuwEjwdIzUCR4rSAQCLTovGjYo+g4mL9ump6s
         /Liv5Zce/fs3uM0psRFZTreHQL4974RzlKwq+JfeNxmvkMrVHO9dbSEh110EFXwQB4JC
         flFRefIqs5VH4nGQ63DGUoGnODlIZclBNQFq+B/VTvV3pcvD/IQb7Va9yLqeF7PLgaXk
         4/24ydXFhY6W20xT07V9uyWPkfkrvijrX890IjIRzeYWj7cWO9iv4mcKWn3CR5kxXWfk
         +tA9N5eJx+B6oWZUIVE1EAvOltzcPoYy3Tnawna+zFshhKg+hTB/ZjEFxQ43HmVgCh5e
         6Law==
X-Forwarded-Encrypted: i=1; AJvYcCUEd+ofYAMASt+0+8qIt6CjtFIbN+vSJMy5SXdtdzHWCIrwIQCYNRZf9dYmBEgQ/GAswAUv4Ne0ta4mmtsbV365Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuI91O+n2Ste4wQ7H4BRTEuiRroH90u/GkJ4YCudGn9+BG/i6V
	jXvPz4BIRUZv5jcLiSKBoAMHC/iZIo+hTcPiKLcP07oX+RpDAKsBtnCsRiqd4ftpnkg=
X-Gm-Gg: ASbGncv0kcqE+JFhXYV3+wn1L1Qa76e6PjT8kQilkNZZU+XbQsrMhwz1g2SXoaVhYhq
	v5OF+KDnd6fP6G8ANtkhFk3+EYcaZqmAuZeluueOY+ArouE+BWrGVI5Gz9iWtCwN0EwGXtfGAmG
	yqCqowKob6PAlO31+DAkWwwnPvvrzSgnbzyySzmxQXF6FQ8QPyA9kwt72lt+oCQnhR0Yd/2r55m
	wa+/5IVeyv/jimw+kmofoBJZcp6aER75cdL3KLSzTibAfKfrCzgNW+NqlDx2X4ShX7DjnQClSoy
	VJ+6/VUSGB7ajXEa712V00jR4qALJZba+Kzvr69T77XWe342IkmjEB4EeCb2vsGicuCrXePne+3
	PZzWjw+EbjIcwbCIASMihApYZ3LoW9OUkFisJ64J6lG9+tL6Xs4m2Zpg/OHxURVfSPpX+EjFyhb
	bg0zNs60wvlxqBkaIfXvRznm3R6+zArPKxzFFmKBmoi45UcNg0
X-Google-Smtp-Source: AGHT+IGaVfGunumFR2/yMmsnsgwueYgfAWj7etK0+lUMw+yhsx8JJlKL7biAgRPSNQ1ufxPzfiAz3A==
X-Received: by 2002:a17:906:4a88:b0:b72:9d0b:def4 with SMTP id a640c23a62f3a-b729d0be197mr203662466b.18.1762439350343;
        Thu, 06 Nov 2025 06:29:10 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728937d88csm223549366b.25.2025.11.06.06.29.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:29:07 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so1550847a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA8DPajBu1Z+dhcCCz4lMi3r+Tlztddj3w+t1ayAEQn+WPDiR1yR+G1Wh2vRR/lMQ/qAuD+S3eRFjXKssBB1ZEsw==@vger.kernel.org
X-Received: by 2002:a05:6402:304d:20b0:63b:ee76:3f7a with SMTP id
 4fb4d7f45d1cf-64105b6b3ecmr5978777a12.26.1762439345346; Thu, 06 Nov 2025
 06:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se> <20251105231815.1927239-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105231815.1927239-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:28:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0ydbmuQSi03Z+S-PDCfCniMEv8mJmyjTk+fow=psHoQ@mail.gmail.com>
X-Gm-Features: AWmQ_blCLPFn8r02Z5U7Y2OzAl3U_Qf6uQ1OKqEvZIhri73Mjip1xcYunGdvcMY
Message-ID: <CAMuHMdV0ydbmuQSi03Z+S-PDCfCniMEv8mJmyjTk+fow=psHoQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r8a779a0: Add 3dge module clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 00:18, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the 3DGE module clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

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

