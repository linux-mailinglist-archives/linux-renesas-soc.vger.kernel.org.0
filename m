Return-Path: <linux-renesas-soc+bounces-9335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8445398EBB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 10:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DD81C2160B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 08:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7643B13AA2B;
	Thu,  3 Oct 2024 08:35:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706F181742;
	Thu,  3 Oct 2024 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727944546; cv=none; b=YltYGfL0pKxyXzK+YNzmxL/GwtOp68Dzi5rphk8RXhEkw6s9PkVrqvgkDsKkG4D8Oyi/YUdb2l1QgEjYYaBgj9fG1LFrsst5me/RHV+k/0XPX6Fvb97XW0SEHditN/4eaHXOy8oMHwY07X6/MZoZLOXM3Heq74nFx6QNVprBsWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727944546; c=relaxed/simple;
	bh=p/nfHuOds5kWEfxjbRBSBV+/WZM7eIqifKDeA0IQQ0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WstBTJu940vJHdpnbU9Ga/EpzGbKwryeeeqv01kvNB5PtBzE8I19F2kmR367BwenK0IV+L5u+mW3rPN6Dh2ES8M09nwZr/9CvN4bUfJFI2Kq85JjGz1kCGDJyHh8v2OdyUtcfp4pNui2a9fno2K4SzwhBD35EOOuCastUQXFhX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2b1b10103so5222067b3.1;
        Thu, 03 Oct 2024 01:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727944543; x=1728549343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gttN3Lnn1dt76KPqzbwuRn+yOVls4OjMw6TmAmt9+OM=;
        b=vXw85bT3l58Jd6u/daKh5OGcFKNXIsR3a4bpl74MMVBI8m9YOs0wnNVOW1sj4ruUd8
         eFKp8rL9mdpI2Sm6CrPU0ZZ2ua43/qI4jw7BaYb4l8f1o3mEQiNOd0mVJnssrMMDJW/1
         OQfohWlzD36zg0j3tgaXKyfoQNou0aeuEVL4+p0ZM61lwld/R5qtB83B9LeHUY8lnYU3
         oaGQjX/EjSb5/L+imRKLHNfVjkCWHiXgz/pBlqPDMKRJsClMTzwGVLUgLdLT67ylf9ZO
         fg9a9INBakoS15ynVjhMu0P/ekHJA2nohdlvErJxP8T8ggUURJLhc7lScL8neCFmnq45
         8OBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCJu8xlkQRd/DO2f0wNl+dxbsyftRwrs2fMBs3Lm9yUFP/HOMGSw0ydoC24ByPYk+wmV91Z7BoQdA3ugFnWHyyFA==@vger.kernel.org, AJvYcCXZMvTQcaOl7gk+XM5aKcnqR5f0BIJVrqUwjjbwJoMHW4HIFFMN1VmnbqZRk9Psm9HSoWWlj1NP3kaXVJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0l6OihiB2+/iAUWAbOBxihh9mBDUHG/FsJ/BMY+e8Quqb/NZG
	x8DqEXG5yu9AYRZx2L1f6lDufOQEDsAR33A7o6dt1meWOekTq31g0qHSoMGhldU=
X-Google-Smtp-Source: AGHT+IGdrgqDWTHUAogssH4zvjA6DQ0w1z2qr2kdmFW9M4p12kdrEx5rik+ORF4quaBVSUN9+bxHAw==
X-Received: by 2002:a05:690c:2b81:b0:64a:b33a:d954 with SMTP id 00721157ae682-6e2a2df3cc7mr39654237b3.23.1727944542852;
        Thu, 03 Oct 2024 01:35:42 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbbb79ebsm1368857b3.5.2024.10.03.01.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 01:35:40 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6d6891012d5so5546357b3.2;
        Thu, 03 Oct 2024 01:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrdLnxgX/F4F33j8gcxARe3GKCOKiB1ghCoVoSWE5xbKQOp5CHArTLEjei1uEv5X2IL87iOaB2ZWI+K4hrhWK5VA==@vger.kernel.org, AJvYcCWBrSzJoqy2xh70BJhcYyBOrLWdiO45eWbcOpXaZgOAM3hF5O1Mhp1VlgTde3GkPpgcHCHav+3AsKAX16M=@vger.kernel.org
X-Received: by 2002:a05:690c:4682:b0:6ac:ce34:9726 with SMTP id
 00721157ae682-6e2a2cb5e70mr40616197b3.18.1727944538799; Thu, 03 Oct 2024
 01:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003081140.31332-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241003081140.31332-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Oct 2024 10:35:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8dBAinXmVXw667-5TO6aQLFm6YqnCmGgfSpsK0QS0BA@mail.gmail.com>
Message-ID: <CAMuHMdU8dBAinXmVXw667-5TO6aQLFm6YqnCmGgfSpsK0QS0BA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sh: rz-ssi: Use SSIFCR_FIFO_RST macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-sound@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 10:11=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Use SSIFCR_FIFO_RST macro to make the line shorter.
>
> Suggested-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

