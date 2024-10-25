Return-Path: <linux-renesas-soc+bounces-10146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D39599B05BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 16:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68827B24BCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8741FB8AD;
	Fri, 25 Oct 2024 14:25:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494497083A;
	Fri, 25 Oct 2024 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866342; cv=none; b=AZgb8r7Db+iextBOHVcJIgy+99A7unBn1l7oJVBKtYRenBufS2CSjvkNYZzfTt8oSQPHMAxyQswhnouW99cXd3qesrahib4LURMfgazD59RmnZdjmRQ/J2QonPSh4VTOnEDx0UuoApw9Yl8jSQg3J5Dh9/NcAgTvCTiSQ4oE9Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866342; c=relaxed/simple;
	bh=IQlo4fzujYrh6juGwTH0ViLCcbe7mFaoqEvtzDjRK/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiVUZuxaqtUOhGcw+IDjYGduC6j1KEzKc09N8sJMWl02DF6xVMaYkqmT2RHszggu2HkL3yupACx58RonEvd2RZ3GsM8UXSbSgx07ej8sJl7Bh4EvASYNrAUAfq7h7ujYnstCQIUet5cCrdgvZFcHc88R/Af8IsuQULzkE4A5/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so2397812276.0;
        Fri, 25 Oct 2024 07:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866336; x=1730471136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vWIrOKPsKtZ20LJ18A22SjkWvM2IeMrsdgL7ijaJrU=;
        b=YJyLGJEPand/dbJjET/ZHv6hQuRjDpcZIwwrJlEiNCjJJARptTIVfJ7HK1nFw5lBp+
         f3hRt15kYB6gG9tre1DqhJXNFLW25vQNwG/gTruw8Yl+QOhclEjpzXHJtteaTMDq5WXd
         CGBH48k67JggRGmDs6lCUUPKt+oT4KLQmqX6NoUy/3XmTascD0SwnFtw+mukyfNz+jgL
         dXZ4NdVPQStWZjjiWB0C4xgvv2yc7Ed3mr+4p7rzvXr/j/V98kHnOWSZkRuVxeSam4PX
         XTZ9Bfc4I/pZwajb1zQNUdTYk+lk1vrpjYkPHuanU59mtJXyp9f300e/qsCkg81eQe9s
         0X2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU/vS7fTs5bQ2tKmqjqs/d/X8FYOPOk0PNQ+LAuWm2h8loj0NKmKWI6hl0lmuium7hCc+8re9yOPcdt0mx@vger.kernel.org, AJvYcCV8WfRm2lHjSNiNhHh9c+urZoIqA+s2g0tI1/6cXsYmhhvXSlguPX/BVFRekudJntdSNL7iAL5Zv3llc+x2J63w2dc=@vger.kernel.org, AJvYcCXbn28vEhwT0eLwDipGkzVr1E9cdgKOgznumAqBtXxhhDepiKgt2GSD9LUJieMJa+78hIxyZSE+6ksB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyteiu83wYxtCkWvq24IVIffujFy1ZUJ/264RB1on9e2zVxl66a
	o2507UxyLY9KjtNZ/Vt4//rEtvFsOI5hrF0Fi+HDzKjykB0TMtWjiLOL+O9t
X-Google-Smtp-Source: AGHT+IHf59uJyPCUcVGOoTHjEmfQjAzI+MxRM0u1DvlA10tyRwn654cF/QPXk9hirDn8RJsr7fmKxA==
X-Received: by 2002:a05:6902:2511:b0:e29:ac5:ef88 with SMTP id 3f1490d57ef6-e2e3a6642edmr10118729276.27.1729866336170;
        Fri, 25 Oct 2024 07:25:36 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3079d52658sm257746276.8.2024.10.25.07.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:25:36 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e41bd08bso27193167b3.2;
        Fri, 25 Oct 2024 07:25:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZhjc1PnLSp3Tg4weDZL0lx/V4sZuk0uNIdnqt9qQEl9BS8+3SFcYOYjx75eZw4XgXVEtAenXBIMos1Qyo@vger.kernel.org, AJvYcCVBfCAbgzheT3Y/wyeaW2NY7yW2cAyO22Fy2LnNNDo7e0DUvDSiVfBudSFeVrtMGct5bxqKYBbBjC67q/zLktPc1w8=@vger.kernel.org, AJvYcCXBawIerKT/pnzBulnoMn3qELcjQqYL6sqbi+qDziTY5T8Qu2aveR9npVdu0Olq2GvjiAH0Lnqu1Tnl@vger.kernel.org
X-Received: by 2002:a05:690c:4287:b0:6e3:1537:3d54 with SMTP id
 00721157ae682-6e7f0fadb37mr69785967b3.45.1729866335564; Fri, 25 Oct 2024
 07:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010135332.710648-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241010135332.710648-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2024 16:25:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVX7hYdH3iLKttqkYeTC_ZGyCNmSycUtUx+QKSDCjaP1g@mail.gmail.com>
Message-ID: <CAMuHMdVX7hYdH3iLKttqkYeTC_ZGyCNmSycUtUx+QKSDCjaP1g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope: Drop #sound-dai-cells
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC morimoto-san

On Thu, Oct 10, 2024 at 3:53=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> `#sound-dai-cells` is required if board is using "simple-card", and on
> the hihope board we are using "audio-graph" thus remove the unneeded
> `#sound-dai-cells`.
>
> Commit 9e72606cd2db ("arm64: dts: renesas: #sound-dai-cells is used when
> simple-card") updated the comment regarding usage of `#sound-dai-cells`
> in SoC DTSI but missed to remove the `#sound-dai-cells` from board DTS
> files.
>
> Fixes: 9e72606cd2db ("arm64: dts: renesas: #sound-dai-cells is used when =
simple-card")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13, unless Morimoto-san objects.

> diff --git a/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi b/arch/arm64/bo=
ot/dts/renesas/hihope-rev2.dtsi
> index 8e2db1d6ca81..25c55b32aafe 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
> @@ -69,9 +69,6 @@ &rcar_sound {
>
>         status =3D "okay";
>
> -       /* Single DAI */
> -       #sound-dai-cells =3D <0>;
> -
>         rsnd_port: port {
>                 rsnd_endpoint: endpoint {
>                         remote-endpoint =3D <&dw_hdmi0_snd_in>;
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/bo=
ot/dts/renesas/hihope-rev4.dtsi
> index 66f3affe0469..deb69c272775 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
> @@ -84,9 +84,6 @@ &rcar_sound {
>         pinctrl-names =3D "default";
>         status =3D "okay";
>
> -       /* Single DAI */
> -       #sound-dai-cells =3D <0>;
> -
>         /* audio_clkout0/1/2/3 */
>         #clock-cells =3D <1>;
>         clock-frequency =3D <12288000 11289600>;

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

