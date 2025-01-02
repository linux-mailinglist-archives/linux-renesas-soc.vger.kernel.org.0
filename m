Return-Path: <linux-renesas-soc+bounces-11784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C8E9FFFE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 21:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29A841883CED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 20:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743081B87D9;
	Thu,  2 Jan 2025 20:15:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067F19E968;
	Thu,  2 Jan 2025 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735848916; cv=none; b=Sok2gJVnnjrk64UHDkQGd0ZgAkSuVdfYNeotXSIi+Ig3bkxwDrQ/fSNZ6++39KTw6HITqD0+7g0EoIuZqR3DcEICQV39BT9iPrfxmfr9dbHf+X2ga1zn3SlHkLST2Ibi2jgp3UlcGWWOBm+IrOqXplL5Kt4THaKXkP4G4JRLb6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735848916; c=relaxed/simple;
	bh=L2aDDAnlAfvgkhCbd8d0CVPQcY0MfAyD7K4gow8FyD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXLLYQf+GRkPFW+tRfSiQ3q4dapXX5HkmQuno3Dm6IpxQ8MhJLppJg7GsOE0pY74BPeT6+porCBCZmUxhGaOkV94tpKv4Ub2UTA3rZNx7dKi/GVBefd4gHfUU7Wfq66sdei8XLZrzZBh8NeooBDEN9cvG15GWM7IPJbv2s7UvEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51bb020339fso2156038e0c.0;
        Thu, 02 Jan 2025 12:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735848911; x=1736453711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FibJ37TPEM13bEVPYLkHLMORANI9Oug072BfmMn4Uj8=;
        b=szLny9pYdnj7/V9OofR98xl1uX4twMFo6UawM8dRnibqPSPRCiohYxHfIjUwvWzP3R
         mRzgB5oTqBZKbsXDXg0DlJ4r6kz1GpYwSRb2jcAWGJqrlE0OhkYJFlD1ADbzDbd9OjxG
         7l2NskC3cixjch2B/N8Kb383CqwZwSTDq28B0lJ4pquAi2Rp1xQdWK/nJC+4FeQ/0rVc
         wbuKBeCvIg295+SlmGMQVY7ORuOD/5u2Z/LleIfrWp5r+HCi1glWiaqduGxvHr3YjDgx
         Z8c9jLILIXWWnM2+b447UBtYkv/lH7TlQoNIYLxp0ofOPUDqa7lUGoC7RFAIhkfzxDZs
         zWnw==
X-Forwarded-Encrypted: i=1; AJvYcCUAeewdN2LLRiMOA3QJZSRW/SIOjdqnC2LyzjVnNfSikjTSIMFv8hwntWj5qLrQ8XlHBBrc7vGFl/ZNfEfAgDc6uis=@vger.kernel.org, AJvYcCUMwZ0fe6YcrPnsWuTtyIRh799NAcdFuQADzyAEK2D20qbyXdOj6YV/ixNlcVm3d/GcsEd5GxDMRClK@vger.kernel.org, AJvYcCUTCXgFC9QLJO7QJLCmEq2XQtJVtPtiDT8yDLHbxjOEJ9vl2khp7uKeMWELBHMkofGkOvwK5TT0MnI+hL6S@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJvpI7YrssEwqf1JGY62CaBXlz2hjAIu/orj3cw0THVtabYlH
	Bxd3Yyn3isYoXq835JbZScPoMS/RWPYO/saz9lmY+bhRY1cJCaSHSBTOhift
X-Gm-Gg: ASbGncvspdSWMfmokii2TDVycFg7pnxj8HqK+W/pG1R1VfoCUitkY/aBsVVFwfAnTk+
	O5KnMHfnJgirYmwav3DvLYrC2ZdscekRxCJs6FydoutTq1wxeDJRjmug8iHyS5EJg7a1oF6ZCu8
	Vj4ORUbwaznoaRO/JbG/cR8wThuVxZmr82PQx6spfULxigt1Kmg9xazpAtRnEn5hZBB6apgBei6
	iyh+oSa8GUBg4e58Gk0vRiPAWOoGlQ5Wk5Kb5f4jGL2QEnqfxTHGwqJeZZYAdNvAmrfrDoQQqFG
	I1jwA3A1om1wkRWhPxQ=
X-Google-Smtp-Source: AGHT+IEUFjkCo56OFNscDGQ4qtvdEhf7I7S6XLsVtyz2J8RDp7XriOzT5Kgvbb9Yp92HRcJ5QVLr+A==
X-Received: by 2002:a05:6122:4302:b0:518:a0ee:e8e7 with SMTP id 71dfb90a1353d-51b75abac1bmr32951058e0c.0.1735848911066;
        Thu, 02 Jan 2025 12:15:11 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51bd8792c91sm1472702e0c.5.2025.01.02.12.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 12:15:10 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso3277106137.3;
        Thu, 02 Jan 2025 12:15:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcXMbymprgRXTQ+LiIld+2M1hYK0qRqeJrfvwPG9qsAjW+36ucpyNQF38bN7oZRhLS9G5sjDATqtpr@vger.kernel.org, AJvYcCVGsHg0YnyLu4vOmr4DAS8dXQXaUXhVrVXigs3nv7h23RDdemorc/sDErQB+/R7F10UjCq3K1HeeDqxUn0WGWMssmY=@vger.kernel.org, AJvYcCWRE5n/GpSerXUoaprDnKN/uaodYp7ZTuHBhAY00AAvIkZX/20yPpX/ISb+GVuWc32dQK5d+3u5DkkoA4hj@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:4b2:75a3:2267 with SMTP id
 ada2fe7eead31-4b2cc35c112mr40496086137.10.1735848910207; Thu, 02 Jan 2025
 12:15:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20250101163344.128139-1-john.madieu.xa@bp.renesas.com> <20250101163344.128139-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250101163344.128139-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 21:14:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxxRXHCj35tbVTHVMn9NUVFmmHPzvP2Asd6GVuXmYJXQ@mail.gmail.com>
Message-ID: <CAMuHMdVxxRXHCj35tbVTHVMn9NUVFmmHPzvP2Asd6GVuXmYJXQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] soc: renesas: rz-sysc: Fix SoC ID string extraction
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, geert+renesas@glider.be, 
	john.madieu@gmail.com, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Wed, Jan 1, 2025 at 5:34=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Fix string length calculation when extracting the SoC ID from the compati=
ble
> string. Add +1 to the size calculation to ensure proper string terminatio=
n when
> copying with strncpy().
>
> This prevents potential string trunctation when processing the device tre=
e
> compatible string to identify the SoC.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> New patch introduced in v2, targetting specific fix.

Thanks for your patch!

> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -231,7 +231,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, con=
st struct of_device_id *mat
>
>         soc_id_start =3D strchr(match->compatible, ',') + 1;
>         soc_id_end =3D strchr(match->compatible, '-');
> -       size =3D soc_id_end - soc_id_start;
> +       size =3D soc_id_end - soc_id_start + 1;
>         if (size > 32)
>                 size =3D 32;
>         strscpy(soc_id, soc_id_start, size);

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the code fixed was introduced by a patch[1] that has not been
accepted yet, this fix should be incorporated into the original patch
(together with other fixes according to review comments).

[1] "[PATCH v2 04/15] soc: renesas: rz-sysc: Add SoC detection support"
https://lore.kernel.org/linux-renesas-soc/20241126092050.1825607-5-claudiu.=
beznea.uj@bp.renesas.com

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

