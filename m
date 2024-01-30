Return-Path: <linux-renesas-soc+bounces-2029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE684269C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 15:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445B21C2674D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 14:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDC06D1B1;
	Tue, 30 Jan 2024 14:05:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75606F074;
	Tue, 30 Jan 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706623516; cv=none; b=YgZU9WKZWxAQ6wk/pH+PFhKTRbAK8nBb3eZByMQ6VVjOWdfUZjjN4bbRCL5S+tv8Hy4dpko8ON+02hZk7Xm7DsVbUTqsQb4I/jIn6hN4Hw3E+Ggp7TEEiKMGq24mOiVVUMQ0QarJX7XG7ghaufPMCoXv7sk+tzTR44SVPtdyMKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706623516; c=relaxed/simple;
	bh=VpT5dlDoRmeGgD6qZE6y21AzYGbOa7AsKenFyXyqw5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cB+qbnDFnPvv9kcre3LzP/GGBJoqDzXe6qqo4ZPHZz03eCfgAz7QFq+vCigdlGmBWaa5eNA5z6xe2/uzJ2PRiLlWOJKY5eNnIyy+3nFmOZU7NPj1gZNoKMmeacTI5ctUfdW7RmFo00gBwwApFeL6pa7CcnZYPfTn8N/vzT4aVuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e114e247a2so1579234a34.0;
        Tue, 30 Jan 2024 06:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706623513; x=1707228313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/q7TDLVxNB2L3f+/Bvfj3yaUibZb3HxYVU/k3K3+UU=;
        b=W2vq2lD/vjK+t1af7qd8UQ756USJJ0suDA0NP4IibR9PQH0T/ffKrntblL+I/BWIPS
         zlOOvzg2kfwPKNWWYht2fk3tAafmuL8PsmXOWbcuKsxp8fCAPrEkH65t0/+AezPV/hrs
         hBjCoucejpmbg3VG6VryeN+SIH7te4oRcgPP83wfa9mgnJfoLLGk1f13I+Ux9VZhXyS/
         NdoNvITGMfZ9J1PsFC7KmlsZfyhcatRJ/5EHPPQW4hGtrNYigiSQejQg2m22+sJ6GCj7
         n8c6BQy0C49HeOdY8ulW+5iU3FWhMlu6aMIijO/3a/DOajVAolzj4BaZ6ygRLR0yiPCb
         nrVQ==
X-Gm-Message-State: AOJu0Yx44BNEunBnStVL6UJXWY4E58hqiyoZ1ULLc0qsCI1+BxYjFrp4
	hDh87SLQqIswTVDr+uz0/O3JMPbILdkS6JUe9ktNunZMDmH2EdVp+5/Y6Ye53yY=
X-Google-Smtp-Source: AGHT+IEAc9+LSFnKRd92LsqDz7E5H2rNgV9Y6FHRLoqnMDv5lv74R5bLb8sy/AmDYr8xegAkjz+kow==
X-Received: by 2002:a9d:664b:0:b0:6e0:ead6:5206 with SMTP id q11-20020a9d664b000000b006e0ead65206mr7727986otm.29.1706623513565;
        Tue, 30 Jan 2024 06:05:13 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id a8-20020a056830008800b006e125aea5a3sm1000313oto.41.2024.01.30.06.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 06:05:13 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e13cfc0b2fso429294a34.2;
        Tue, 30 Jan 2024 06:05:13 -0800 (PST)
X-Received: by 2002:a9d:75c5:0:b0:6e0:be61:850d with SMTP id
 c5-20020a9d75c5000000b006e0be61850dmr6850179otl.1.1706623512929; Tue, 30 Jan
 2024 06:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123114415.290918-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240123114415.290918-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 15:05:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFjewxNNbhwkBP96uzXVa9ZuuJLygbNBLV8uUZBU8vug@mail.gmail.com>
Message-ID: <CAMuHMdWFjewxNNbhwkBP96uzXVa9ZuuJLygbNBLV8uUZBU8vug@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g043: Add clock and reset entries for CRU
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 12:44=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Add CRU clock and reset entries to CPG driver.
>
> CRU_SYSCLK and CRU_VCLK clocks need to be turned ON/OFF in particular
> sequence for the CRU block hence add these clocks to
> r9a07g043_no_pm_mod_clks[] array and pass it as part of CPG data for
> RZ/G2UL SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.9.

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

