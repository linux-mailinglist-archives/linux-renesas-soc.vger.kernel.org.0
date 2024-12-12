Return-Path: <linux-renesas-soc+bounces-11269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 689DC9EEC9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29CEF284E3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12AA217F26;
	Thu, 12 Dec 2024 15:36:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C56F217707;
	Thu, 12 Dec 2024 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017789; cv=none; b=VShHKabo3Ia4InR9oAsF+GxnA85G9U6ZMjmL2uIKgFesaMVwCevorqVN7qdcD4qNpweafdhnt+BgYAfb1yiQH8jxw/VRaUOwerVPcJHNdQza6h4xN9yexCWw5A1+KkU1/juzaBbfJ7mA04OWMDGvqZXElulYs5NxesT1t3e0TCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017789; c=relaxed/simple;
	bh=WoNkahrmA/gneRUwTqaU64mOaQjZaugsWnN+V82SheE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H9NecrnoKqcNbFVKweQP+cLMiLhpDPZ56pDuSs8ZvlCEOq8pUpuF3MHDSKgRqvxZEBGP6reYTcBtd+8Dke0oRgC0AtuEMlWRW5lF1wvqZXRHs3zrOU+QC6ZxrEmcsVm3RuO9wYgLto7G8wb6rhLqce52i05mVMoL/HbUpGulOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4678cce3d60so7016561cf.2;
        Thu, 12 Dec 2024 07:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017784; x=1734622584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nW5IHt/2gNKEDJ5Rpt/vNuzIaCRzr/R1GBJczKb/xio=;
        b=T8MTkWfXZuNEfUQmE2dETSvOjY1/nuIaUlgbQIp30wpWGviHBdANY8/fI5knFc0AmK
         9O+QPs6e4RwfXORQ2h0JNWrNrXcWuonVR/RbNPP280gLD0uh59drgMurniDodUICyTaB
         Mh5q3pmEAwCP/6MEaEX6Qs/DqVV0DSvAUhbMhTYoLfDbSjOINxMrh6vMrF7eoxzFwd+4
         Q3k5Lds+60kFdVcDhSu8RYYqsDoGA08aJi0iKW5sW9OOUzJP9YF4l1RMby0UzXQOTEdX
         895SrDldakuy4ZSQoHhDLyIrPsh7A8AeinNqIvzsbdey6XvczqudgGo+xFVmJmP/9TA0
         MokQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT3F4y86Zp1e1NxsxkmmhqXAXmuB+eUQXu5XwXGb2A5dcM9EIqoak4fos0vAQYDQtuC9HqdjFvULoYW2DQca/TSUo=@vger.kernel.org, AJvYcCWbRKorWG5tE0wM33mz+fq8kBVoUu9NlZOM2y94yCCK8edmRa/qkmV1p6FDClpTPMBrkGTCLr5Ufm1a@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyss2AtAGo6NbdEvPyEdHX/ZvFGagsp1r9RKY4M0wUmWvBDAmg
	5W7d1AllbVgvRO2Q7SPlWkH/UTEPQyiEUb+XWZFF2SilBK0OCABUNdES96DwVAc=
X-Gm-Gg: ASbGnctWja+7EIsFzNi42doEUh+42kNVEZkGs1ZvRRyn86Z995UQtTIvdgdGDwwerLo
	pstnh7o5TjrlPlnezSaZxLS/KgTs7leSog2lzYYXc9uq7LO41mhcOb703g+/BWsy87mUei55evr
	1OywokEQQBu1yO4XxlXPQeQtV5Y62pJ6v38AKf+EVPyDBlzTDrDRXdcgrXDocyixNWyS9Yn3IWD
	27L52KsHBmAVyunhSsxUT/FNo5TuZg83Nksu9jZuoENeL7DmoWxwJa5zamuoT1wE+s4RJ9snJ8T
	x6Xipfrcpbju0C8EP/H73AU=
X-Google-Smtp-Source: AGHT+IGbnM+U76AndMMALf3yHyu1JYA6p3AW2OqeOOiQ7HJ9lbbC5j7rDDQto3+dawHBhHjfYwqI7Q==
X-Received: by 2002:a05:622a:1986:b0:467:62ab:6ec5 with SMTP id d75a77b69052e-467a14fd424mr12433901cf.19.1734017784551;
        Thu, 12 Dec 2024 07:36:24 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46789105216sm20841691cf.11.2024.12.12.07.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:36:24 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6e4d38185so57590785a.0;
        Thu, 12 Dec 2024 07:36:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6AORNFTeNbAVlJ8BDLBhk15tTeJKqgzzZ+IRwhQLeEFayoKEP2QgzfTVrXil5z2/N90GVzyiHE5eE@vger.kernel.org, AJvYcCVau3y/OmSm89sHAxI5+SzQY6GwrgOaPZEuWcTEreo5jkTGPYhuY0RCy4ZMs8TsLVOLrLENfetuJkDUSFVgMSYEcV4=@vger.kernel.org
X-Received: by 2002:a05:620a:2a0f:b0:7b6:d63a:ae8f with SMTP id
 af79cd13be357-7b6f8953d1dmr148529385a.21.1734017784091; Thu, 12 Dec 2024
 07:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:36:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWG6-7dvEYYZzmsprCGDAsgCqP62Us6OdoPLQVnhk3CgA@mail.gmail.com>
Message-ID: <CAMuHMdWG6-7dvEYYZzmsprCGDAsgCqP62Us6OdoPLQVnhk3CgA@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] arm64: dts: renesas: Add initial support for
 RZ/G3E SMARC SoM
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add initial support for the RZ/G3E SMARC SoM with 4GB memory,
> audio_extal, qextal and rtxin clks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
>
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3e-smarc-som.dtsi
> new file mode 100644
> index 000000000000..c8cf61545a5f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R9A09G047E57 SMARC SoM board.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +/ {
> +       compatible =3D "renesas,rzg3e-smarc", "renesas,r9a09g047e57", "re=
nesas,r9a09g047";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14, with s/smarc/smarcm/,
as pointed out by Paul.

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

