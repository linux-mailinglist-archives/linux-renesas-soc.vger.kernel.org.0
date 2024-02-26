Return-Path: <linux-renesas-soc+bounces-3217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3448A868175
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 20:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6EC11F251CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 19:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A84130ACC;
	Mon, 26 Feb 2024 19:51:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA6129A91;
	Mon, 26 Feb 2024 19:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708977074; cv=none; b=N1xtA4VDIRs72K3mMeOmgrhdqbuTOcN6NLB4I4C2N6kBsxn9AwPhcW4IOhZx7dYDc+ui6YPpayntjW4itNa32XDQKR12p0bqvdVt2/PNM77pz3JSQE+NGZ9neOILLHKrmvZ4HeiRAirJaoomJc+BSsuI10n2wPnd5WfxB7eeC5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708977074; c=relaxed/simple;
	bh=SImoMYy+vbpJP+9LvAT8t025ogqUoRGR56ZQ3Q1R/+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMpdCHauPK5xOufQ4XZ/ENtsr2+fDYrqGH1LXw6v+QXrdZyFe3kCVLYoTUfTenT0JLcuOSqmI0cJcGek75mr5JA+s3IAqKTKhqV1sFKQqidkzKNoRKbU2jnUeCIkkz/XzMev4/0mzLTu0/kyXfxcdGgjAO8LQuQHlZcfdad2sto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3871800276.2;
        Mon, 26 Feb 2024 11:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708977070; x=1709581870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEg3XQKBbY8aMs/xFapOciK2fQQojJh026UMPG5tC14=;
        b=HHcHH66GqXWc4svvifqnbpE7lnwuiMVfHfvxAB0uDkUPAFZk7TJDgLxt7l5HDR+L+Z
         OpVpsZjcH76iXB2Duy/vF/6Vf31AXW2qnxnz0iIZym7nIcf9gd1fAB3wHEioXV+Q+1ew
         8fWoea1ZhURojwoA21+G3DdI4a0+jfgzCJmEB1Rr2k2oM7YmsfBr7UV1RdAiDfGKhUd4
         sEvm0gWLUc1vC4zqqXkyQyXYkprKfbZ92qnw4ZzkfFPSiPC++lXV3EERmzRNdONQuiAJ
         VQBXq2IGHEE+LIXXT7yr7iD5F5vz07eeTWlfNeC6Lt5Q6SjpZeKbpixAt+jQli9ZHqqi
         YQMA==
X-Forwarded-Encrypted: i=1; AJvYcCUYr/zs7eH4VrX/gW9BWFwVQFTaFayJnrXzjC/35sN6vHyZzjhy1fJwTTu275HKnFTicpgO1necRM3vm4KwDf1cFN/3rQdcwpxTf7teXdheVcUVbcFO/dPdE+b9ZoDdKIKZBkDdJJF11CxwHJEN
X-Gm-Message-State: AOJu0Yy29CO26HB5XyY+5KO+M85UZEXMj9A7kkapPi9FCuT6znkYpM1t
	GX8rXUN27ZBeGM5skIFYarjlCt381UpB5+Z30kfkzXCdJZ06AdyeIC96qC1iiqU=
X-Google-Smtp-Source: AGHT+IHQWJRhCrj9XjZy21CZFc0+dlCHnPViotNuTv4pnNHfrPlNlV6zr+af+JpQ5RZvHpO1sRLgqQ==
X-Received: by 2002:a5b:40f:0:b0:dcc:9aed:6282 with SMTP id m15-20020a5b040f000000b00dcc9aed6282mr159788ybp.65.1708977069747;
        Mon, 26 Feb 2024 11:51:09 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id v124-20020a25c582000000b00dcdbe11c243sm1100356ybe.1.2024.02.26.11.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 11:51:09 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3871738276.2;
        Mon, 26 Feb 2024 11:51:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIsa/D3SMR9fbpT8euH5wzmxiiKWAwRJyztXodbFQfBnN/NVCAij/t8eDD3Lxg6EqhKBvKRdwf1Exv4en5r8aUK8hD+FbvSnfJ84M7Qr9mkSwCkdC6zxmc6vPEnblkuVOTJa4susB9JLCtTwv8
X-Received: by 2002:a25:2088:0:b0:dcb:b572:4aaa with SMTP id
 g130-20020a252088000000b00dcbb5724aaamr170659ybg.38.1708977068002; Mon, 26
 Feb 2024 11:51:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 20:50:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9VXjRKD9+akp67sqBj_CHLSnSt0cw_DvcGuwm4t1=Kg@mail.gmail.com>
Message-ID: <CAMuHMdW9VXjRKD9+akp67sqBj_CHLSnSt0cw_DvcGuwm4t1=Kg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Enable DA9062 PMIC and built-in RTC, GPIO and ONKEY
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Feb 26, 2024 at 8:47=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> This patch series aims to enable DA9062 PMIC and built-in RTC, GPIO and
> ONKEY modules on the RZ/{G2UL,Five} SMARC EVK development boards.

Thanks for your series!


> Biju Das (2):
>   arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and built-in RTC, GPIO
>     and ONKEY
>   arm64: dts: renesas: rzg2ul-smarc: [DO NOT APPLY] Add PMIC IRQ
>     property

Why "[DO NOT APPLY]"?

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

