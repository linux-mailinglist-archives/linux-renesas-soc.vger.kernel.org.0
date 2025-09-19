Return-Path: <linux-renesas-soc+bounces-22058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 524C7B88644
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 10:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8F931C83924
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 08:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571D82ECE95;
	Fri, 19 Sep 2025 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+ODnzik"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEB62ECD20
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758270162; cv=none; b=g+OfNnYPrdXFFxvbBU0+oXlP7EysawRDLpGx9JuQZAGY6Y53CBEyTJ+RnRMbeFw3UyuiXRiH/JtiXWZ8G7I8Wu6l6tQst13PuYPXWBX6upo7VTiJy84porH5s1Q2RSKXVAVsGsL0QYH7IDCCrwTiDIkzFDlqw1SLcTNgmHQRjt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758270162; c=relaxed/simple;
	bh=ZVchn/a+zBTJqIDbK8453T6fgudKd+vTt03y4yOYzrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXPiqnIKCHq3U+UKbcb699XSibvUMbjEglwXbqOuBkzAxVfsTmSJ0kgJWWFjoAoKXis+2nh7A0Djtfroiwjf69Q+0rfFMrJTwhrKgwk0lWBcWmC3Y/7cDYOnujLowpK1fTsjmcpsc3x70wHJFpnZjld50g1LC6rZcsUCsWk8hzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+ODnzik; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45ed646b656so17753315e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758270159; x=1758874959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiNCv05Kx1Q3DUWlrfQiOdHDqIleciz4/poY6HoSnr8=;
        b=a+ODnzik7b5bOID+JKEofV/yLeaUowAcgDKiQK0OvCcCbTHiqyf6sR60GhWP878BZ1
         AX+L9uWgoTSn9s0Mwdw0xIpblQi11pVs9IS9ewRumxnndIJQHimDoCT+tuK31vcQ5lh5
         hARkYvuUIS52Y2nYY2TmAIJINbYY4jw6W9IsjAxjj0mKNbOi7zu6vT9aNWpQ6MOf8dpP
         6XaVUisEfLNs5Dm3LkqD1zxHLsoKbiNBhWyzKS/nSXhq1LmTbFIzSaxL1MbHDJr6QWNE
         +FPZEA1tgP7NknxogRjUTWAzViF5J4TLCSD+2VniTNumBxeXucJfmtCE1sHrZppC8ShZ
         bhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270159; x=1758874959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiNCv05Kx1Q3DUWlrfQiOdHDqIleciz4/poY6HoSnr8=;
        b=Cc6LcHg4LAPUTtam50hx1mTVVOhXS4aOqKUmHuUFdv0rDtQ3eS3HrZxQ/DTgjPdBlk
         ag7bgqZZEwAU2i8VJgqAOv2GiI/QbRCmJ1HTmNnJj5TBZpQ/pXWKXwhrxf+VWWap+fOg
         SL7rCJjl2P/8XfhRGZUBGbei+a1uOhZwJ9pxcuzyRW30Dq/dcTeMfh1QgrKmhtUKBJXt
         aQKFLtSAOv3yheJ13CNA6JESlIcgZFj5BL5yNRA4zl4hnAw2j1chhqYxphtipla783Y+
         bFkSFdOCfJYnWbEbtZHkFNTTVZNCMyl3RoUB9Hgk+Dqz+U3yerlCqMd5++LlT6RHeiU2
         RDjA==
X-Forwarded-Encrypted: i=1; AJvYcCV9RzZWhYg6l5bZXLFOIn+kbkUUJ0y41LHcZxk7slAb/tphYys43RJ2/yTN09Tfg0N8K8njdT6skuujwVz+LLUbAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5bkRs9/BWdfQiTXdw3NAAklyJ/Khv+HKhfCyz7b+zHnCGRv3r
	RxUixLfV1A4+awN3Sko+YvJK8YYLcO06RFAN6TvAehfjhyBWNvVSuXyPB46BqGOQQc/V7K2xaFu
	tqHLyrESRCvInyRiGKZRqofpY513qMAo=
X-Gm-Gg: ASbGncsww8r3tHFeiOUzt/OHriG+VlPWdDIXqqmHsbuQKG765yxrizeLa2t0kAdQIyz
	EdGqKlPz5tACZY28Qem03aVVaij+Fbv/5swz4w7J6mMzNVT7JFkZIXbagS7NPCAqJ+5Qza9vMWV
	096/Erk05kKDihVUiSL5sihnYN/YvA9oDevkV0vkHdjtY7jPKeLKwSQj0KAfKy6q2k06earli92
	GFIAwBR
X-Google-Smtp-Source: AGHT+IEReVmIHXH/3IJAB4/dFP1ejPigMaopulYFWvbOFpLc49ERKrurp4xFZnA+JggjJwehm0MvZQacm8OmIkCV9s0=
X-Received: by 2002:a05:6000:2204:b0:3d4:eac4:9db2 with SMTP id
 ffacd0b85a97d-3ee7c554315mr1862707f8f.5.1758270158565; Fri, 19 Sep 2025
 01:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
In-Reply-To: <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 19 Sep 2025 09:22:12 +0100
X-Gm-Features: AS18NWCgFhip0K80VnghbVWJheLc0rYlIwp4z0DfnYSak7_z7TLKovSG3M1ZR04
Message-ID: <CA+V-a8v9-C-oqzMrZ3OwokHD9eNF_y-ONzPW1O=qdcOek1OxSQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Sep 19, 2025 at 8:21=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 18 Sept 2025 at 17:05, Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Sep 18, 2025 at 2:42=E2=80=AFPM Marek Vasut <marek.vasut@mailbo=
x.org> wrote:
> > > On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
> > > >> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/=
renesas/renesas-cpg-mssr.c
> > > >> index 65dfaceea71f..7b52e8235984 100644
> > > >> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > >> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > >> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_control=
ler_dev *rcdev,
> > > >>
> > > >>          /* Reset module */
> > > >>          writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > > >> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> > > > Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we nee=
d
> > > > to read the reset register `7` times and confirm [0] (as mentioned =
in
> > > > the HW manual). So after reading do we want to confirm the bit is
> > > > set/clear?
> > > This is interesting, I wonder if the readback is something more commo=
n
> > > to this reset controller.
> > >
> > > Why 7 times ? Is this documented in one of the HW manuals ? Are those
> > > public and can you share a link to them , with the specific chapter o=
r
> > > page I should read about this 7 times read requirement ?
> > >
> > Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> > Module Reset Control Register Operation:
> >
> > 1. To secure processing after release from a module reset, dummy read
> > the same register at least seven times except RTC
> > and LCDC after writing to initiate release from the module reset, and
> > only then proceed with the subsequent processing.
> > For RTC, dummy read the same register at least 300 times and for LCDC,
> > at least 100 times.
>
> Ugh, the number of times depends on the module to reset :-(
> Do we need #reset-cells =3D <2> to encode the number?
>
There are no bits to reset RTC and LCDC in MRCTLA-MRCTLM registers,
Ive confirmed this with the HW team. (The manual will be updated in
the next version).

Cheers,
Prabhakar

