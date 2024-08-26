Return-Path: <linux-renesas-soc+bounces-8220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6195ED1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 241261C2186A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCADB146584;
	Mon, 26 Aug 2024 09:28:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A213AD3F;
	Mon, 26 Aug 2024 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664483; cv=none; b=FeQVxYszf4QpITN5mri+fK6H1aJDpu7PVlADiF19e6SywYvjqlyH+WEBipzXDvHtFxDP621nZkW7gAInAtx1fKrYjwisvvfDfhyg0Be0XdK+a6udsDe9MbacQxbFK3y4aYzCGaoBeLkuFO+k7FVky1x2KJahcWEgvO9XlmfAZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664483; c=relaxed/simple;
	bh=sSaUhn+I2Wf3h5Ge42v4qqXN69VHOAmehNEkyYHnBnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtB8KOKtwbHhZh3Ne+2S2Nfq/De1BNdz7z0fNpnOOMmvLHLINW/XWKABr6IDZPzVVUYsxsfOPedHsD1LN/TYs/TXIRqDBw9clhU+1MesNzDrHaxaLELER1/aDUp4avhHkRsXXKPwH7Eout8W9rGuYWhsmedVyUAvbSTr1TZC7B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e162df8bab4so3719423276.0;
        Mon, 26 Aug 2024 02:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724664481; x=1725269281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNMbfrbxS48+aNmq0d91jfV6HNdOeE787OSvLTVzG2U=;
        b=iEMJS0xPDUODGsARR77i5gFcIpFKK+JSKWjZSe0JQkpfULLhp3RMEP9AhdDSDhtA2W
         OBQ+dMGCQ2Sg3eq3EWj4U0fuArrFWncUkHi0GXVMxnyuKzlh3Ffwi8JL9Xq6pqHJBX5P
         q6iHao3JehQYj+xR7uIg/yuQV9mgJ5Zumb/jNxjLqqnGNdkWA6XcNm10cv3q7+mV0DdE
         g440cO7jQ8tvDwUmZmP35RV3qPRw39hqdRSIzGmgD6XKuuGc9FOhIRFASz6S8ckq7gZ2
         W1VqFmnf1RUXXVVPKprr9/Doar5KXYWBm6uPT/grXSR5sKd6dxfSCPQM4njpWkVdGx4I
         e0UA==
X-Forwarded-Encrypted: i=1; AJvYcCU+o0tMtjwwSLD2pDzuMIX22ev38IgVQTtHDQtLj6eRSYARrHmTzexNW59UVC7R8Xy8NknfMWWCYl1g@vger.kernel.org, AJvYcCVpmCZgaeQ72eD+Tf3DxBuQdzZgEgtarQ4VrFkGvJJNsN+ZEkWBGfs/aiC2SkL08ahg/6t7klS7MNrF8+eg4y/mnGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjeCEjUBtwD8J35YwQDnKazvHhaIrxftc5S5CjK3pVRB19DN+F
	tbn6ifuLHxWHeP/LfgvCSgU9yQx+zoZgy+HDIL0t4EfXUuSFrCUmC4aSiNON
X-Google-Smtp-Source: AGHT+IHe2SCagiqw1zbl8lxRhd8+LDzJuHlQjPk16GWhHoTiyLU7mFlGptUuNzx5nGLGfwBBZlKWbA==
X-Received: by 2002:a05:6902:1109:b0:e16:3d01:3fc6 with SMTP id 3f1490d57ef6-e17a83d8c4dmr12223047276.21.1724664480684;
        Mon, 26 Aug 2024 02:28:00 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e43fa60sm1898978276.5.2024.08.26.02.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:28:00 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-69df49d92b8so35555067b3.3;
        Mon, 26 Aug 2024 02:28:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4nDmzyoG1SbRuG4Y6pjiMiAvCi3kuJEXLeSp3u/papu7BJvDQEmuGs6tyUt5UMgnQXsK3Oc849gsL@vger.kernel.org, AJvYcCUsIyp1sqs2dMZ8rSNpmGPgUqOJHs86612MEo7jiw7kBq95XJi1qJSiem+4VzX3BsdXE/X7MGzcWN1nc6bJzo6uOBM=@vger.kernel.org
X-Received: by 2002:a05:690c:f01:b0:6b1:1c30:7ea1 with SMTP id
 00721157ae682-6c62538d722mr114870897b3.8.1724664480212; Mon, 26 Aug 2024
 02:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826090803.56176-1-biju.das.jz@bp.renesas.com> <20240826090803.56176-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240826090803.56176-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 11:27:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfn_bAVswzSQZJKOy2yojwt9LH-cLT_KH9_C-3ojGz1A@mail.gmail.com>
Message-ID: <CAMuHMdUfn_bAVswzSQZJKOy2yojwt9LH-cLT_KH9_C-3ojGz1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 11:08=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Enable HDMI audio on RZ/G2LC SMARC EVK. Set SW 1.5 to OFF
> position on the SoM module to turn on HDMI audio.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped deleting ssi0 port when SW_I2S0_I2S1=3D=3D0 as it enables only
>    when SW_I2S0_I2S1=3D=3D1.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

