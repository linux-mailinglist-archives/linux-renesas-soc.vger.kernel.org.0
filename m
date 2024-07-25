Return-Path: <linux-renesas-soc+bounces-7532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4A93C6D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 17:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69ADF28451D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050919D89E;
	Thu, 25 Jul 2024 15:55:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055A19CCE6;
	Thu, 25 Jul 2024 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721922915; cv=none; b=q1RTmf+iifiN2CtYKhEMzx2+yLp6M7ieBSW2V9Brcg3B6nbdC/CJo8gpyjmH+8U25u9lYYDql0E8vssWpFJ4GDSgrFOLYo9UuuE8gcBhR6gMAePOIAkDsJYTuHako9Bt5aLra0WgSeW5vtcMyo4ckOpDfGJKwS0wzanrr1pXo5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721922915; c=relaxed/simple;
	bh=vYxc5IMKY3JQcIoQfBKz/JVvlUHBsbuO4zyhmT6q8Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlEGyMtMLHjXzKDR6+zTpYv0SWmHOZfAu767d60D4KAzsMfyQvUHhqoPL4aG5Rs5OW0YnuoFopzgtcsE905px4z0i6Pyt74Q5d5Kn3p0IO6ZZdH937cB7I2Hg297ZG2wYhhOnZoq9QnXiwoDgaQvt58Z3GvD+VoBkQ8Xy0IejgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efef496ccso304080e87.1;
        Thu, 25 Jul 2024 08:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721922907; x=1722527707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2rmxXIjfvlqGvnNOjLh3FPE3gfoFA/YfS1QboIJxEA=;
        b=SK3Fx7lBBFd/SQhrR3VmT719lUYaT8inoXWyweG/IVnZUcv5jK2Tm4qKNperW7nBvX
         dH6iExf9jddlnd5toQrGq071Ts3MzsJBrtqL2nYfUD7p4pN0hGOLFv3a8MfdFh8od1vA
         /zQag46uHENSN0aIwhNruHQt8rTNPMQH1t8xpcapBy8+TKKnJYkmCbc3h1/+Tv32A90L
         a22RnFxn03ceVKg7FTPg2OAud/kiQ8hL5NRMTlAszARumD9Hf0eMiOr629dzydMwQTEz
         yi6foOqRC5CPlG6BXKO6pFfrnUezpWic4YGI0vpRwENFub7EjceDY8RKMsyGaJnDRizw
         gb0w==
X-Forwarded-Encrypted: i=1; AJvYcCU4+AchOEgZsmH5og2g3pn5+O839Ym+ReLmY0HBINR1cKCSw5eh07Vtx5Jg390V3j9pQSceSlhuk6FGdvv56Gxo2U9tjm9nDDVI3j7B/c3s4PdHtIrut2TuvSg5t98N+BTlqk6AWU5MwrYY/Vk6
X-Gm-Message-State: AOJu0YwVAR16qaEhti3xJXE00UOkFHbrxowvNZDAQWFh+l4za8MCn5oj
	xVJhi8GYjZXtFfhz0rsu85dmfc3sCYtKgANw9pYAk3/FpWjGctvghaDTNLe+7Ro=
X-Google-Smtp-Source: AGHT+IE0DLrENhBRAgundpSX7BNN5aXjUDyNyxgWxggviKd/2wokXaEfyWte+3upoyZNLB/tEt9lOw==
X-Received: by 2002:a05:6512:3b29:b0:52f:18b:ea18 with SMTP id 2adb3069b0e04-52fd41f4068mr990051e87.1.1721922907349;
        Thu, 25 Jul 2024 08:55:07 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c08d1asm265492e87.143.2024.07.25.08.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 08:55:07 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f01613acbso305070e87.1;
        Thu, 25 Jul 2024 08:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5t0pwR5qtx6ktP4wyxE0X8A/fSqMoCROIDZ/Du3k3sato2EWy9ciZdrDZcOqv4VgYnLofCC6e90KL2Y7rTQu/mDXIzChS+9Vk7kTh5dEZaAVMkna+4OAVSH+tgB+QD4QajQVCUHaxLLIoW2/+
X-Received: by 2002:a2e:a787:0:b0:2ef:216a:3ceb with SMTP id
 38308e7fff4ca-2f03aa7413emr12103301fa.10.1721922906774; Thu, 25 Jul 2024
 08:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
 <0e711bd9-8ff7-4346-ab18-a3b5e4d8d730@kernel.org> <OS7PR01MB11537E8348F88FDCE4479B02CCFAB2@OS7PR01MB11537.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB11537E8348F88FDCE4479B02CCFAB2@OS7PR01MB11537.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Jul 2024 17:54:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2r34S3vkH3nLdA74UktQnxJ_u085hBSvP_qbGrboUQA@mail.gmail.com>
Message-ID: <CAMuHMdU2r34S3vkH3nLdA74UktQnxJ_u085hBSvP_qbGrboUQA@mail.gmail.com>
Subject: Re: [PATCH V2 0/6] Document r8a774a3 SoC bindings
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Thu, Jul 25, 2024 at 5:22=E2=80=AFPM Oliver Rhodes
<oliver.rhodes.aj@renesas.com> wrote:
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Thursday, July 25, 2024 4:01 PM
> > Subject: Re: [PATCH V2 0/6] Document r8a774a3 SoC bindings
> >
> > On 25/07/2024 12:05, Oliver Rhodes wrote:
> > > This patch series updates the renesas DT bindings documentation for
> > > core components (SoC, SYSC, reset, clk, pinctrl, scif) on the RZ/G2M =
v3.0
> > (R8A774A3) SoC.
> > > This SoC is similar to R-CAR M3-W+ (R8A77961) SoC.
> > >
> > > v2->v2 resend:
> > > * Updated the patch description for patch #3
> >
> > So it is a v3? Otherwise which v2 tools will pick up?
> The reason for this patch series is that there was a typo in the
> change history for patch #3.
> This is supposed to be "v2 resend" but by mistake I sent this as "v2".
> Shall I send this patch series as "v3"?

Apparently b4 can distinguish fine between the original and the resend,
so for now there is no hard reason to send a v3.

> I apologise for the noise and the inconvenience I have caused.
> I will take greater care next time.

Thanks!

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

