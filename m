Return-Path: <linux-renesas-soc+bounces-969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB28810D54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 10:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0841F210B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 09:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF591EB5A;
	Wed, 13 Dec 2023 09:25:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC706BD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 01:25:41 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5d3758fdd2eso65636827b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 01:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702459541; x=1703064341;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFVw8qgm5CagfmJlkXYQVovLsj1yh9yuXvXyS72QRO8=;
        b=NiKYYmQL6sd6Tw+E7hffqYFwqkU7nUipgVr7eb4CImH20YyOpGkDxpsykQtkFAq1Sv
         90QWTDMLLyMcPFgHJV+q9/AX15M6gqJ6LjEsqvZ7qrImfmXN/C74Xmxyw8bWC924G/rv
         jOrSgpoMkO4F4zzLiHZrv8TUV4gsFk5QWOB994y3p5eyLxkjHNAOGs3UH6BSiphc5t5o
         GM1XM0aHkcALTaRlseO5/YXLApg+k7PlgBwOeOLbzUwZ4/XTth1/bWTd+XoOL4goqDHU
         NzPnFlpWXdHcFzpiKvo1pyQL7MFouPuvoARu4ENZ85fHTFb56AXXYb9gRq1HcFwcyB6y
         CVDQ==
X-Gm-Message-State: AOJu0Yz701ksM2EEeGjeIzL2LYdA9q91SjonGgTdTm3sYLbLB2NKpn5x
	n/96laJfUXUegaqM5wcaioYpmW7xEIt6Xw==
X-Google-Smtp-Source: AGHT+IHrJy/NXT+O/ivsPMxyGaisnjaVmO8Z5sxhaxmMUNTYF8dyq+rr3DHZQAH2zDA7hy7SxaGGOw==
X-Received: by 2002:a81:4a45:0:b0:5d7:1941:3562 with SMTP id x66-20020a814a45000000b005d719413562mr7000225ywa.73.1702459540834;
        Wed, 13 Dec 2023 01:25:40 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id v80-20020a814853000000b005e287242e23sm620257ywa.48.2023.12.13.01.25.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 01:25:40 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-db4422fff15so5519671276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 01:25:40 -0800 (PST)
X-Received: by 2002:a05:6902:1a49:b0:d9c:a3dd:664e with SMTP id
 cy9-20020a0569021a4900b00d9ca3dd664emr5314825ybb.56.1702459539981; Wed, 13
 Dec 2023 01:25:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1702309604.git.geert+renesas@glider.be> <e9a9f541870450652952bca2b50603f9f8be940a.1702309604.git.geert+renesas@glider.be>
In-Reply-To: <e9a9f541870450652952bca2b50603f9f8be940a.1702309604.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 10:25:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVumBDyhVchcvL=dKUX-jppNT=TmgGW0Hmheipt_eB_3w@mail.gmail.com>
Message-ID: <CAMuHMdVumBDyhVchcvL=dKUX-jppNT=TmgGW0Hmheipt_eB_3w@mail.gmail.com>
Subject: Re: [PATCH/RFC 5/7] arm64: dts: renesas: r8a779g0: white-hawk-cpu:
 Factor out common parts
To: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 5:01=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Factor out the parts on the White Hawk CPU board that are also present
> on the White Hawk Single board, so they can be reused when introducing
> support for the latter.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -187,6 +183,9 @@ &extalr_clk {
>  };
>
>  &hscif0 {
> +       pinctrl-0 =3D <&hscif0_pins>;
> +       pinctrl-names =3D "default";
> +

Oops, this was intended to be spun off as a separate fix.

>         status =3D "okay";
>  };
>

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

