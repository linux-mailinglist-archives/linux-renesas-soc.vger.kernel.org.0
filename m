Return-Path: <linux-renesas-soc+bounces-17179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF13BABA0DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 18:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCA9A1BA3745
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 16:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E801C9EB1;
	Fri, 16 May 2025 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjsGOQj3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1B224F6;
	Fri, 16 May 2025 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413534; cv=none; b=Hbx8wA1PxzryA9mN8wBVFDYnnjVnIc4jRXVw297VIMsjUqN9+oIv4RjPS6EJA6WhyhOntG19/QfmHoXIsDE2On8VI/nN2n/C/8ql/utg0UCF907FPJZTgM+zBNGdNk6CtNXmbN45hmG3laT4HOr/aIZ+5wmJW/uej5qUZkakuYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413534; c=relaxed/simple;
	bh=9i4TZO7F0sCGxwzDZyBytVinqtnKHLmyapBFsMMaK7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIO3is8YpuES0g1hmNN5sjPwG0OUpem+rPvuEQewuAFT4ibJQJsLRrV23KyKAQ63fZqOsIB4Pmi/jvRbdeiIZBQ77K43+caOidDatsQQX7B2WkcfwEY44I1J5s5ccBbGrL8izJLLs9V1MWJOP8C4gCK0xp48pfqNN1sgE0oGxc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjsGOQj3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so1535329f8f.3;
        Fri, 16 May 2025 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747413531; x=1748018331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i4TZO7F0sCGxwzDZyBytVinqtnKHLmyapBFsMMaK7M=;
        b=VjsGOQj3YVY1fcx0i+ifn6FNqBrQr3420wqTMSmas/t+YVE73vySuKlcfP9XfHv2Wn
         yIQq6FRxRFt5brRu7zUxvxJiyfX9wIqCQrKQVspIRPodtIigvNzayXeafQzUjPdKDRHC
         4Z08hVYQn8E/c9oO2cxQpFvu112Ta7Aj0rC6vjvcILmWPAJYyB6VG5alecPTX05RnROE
         buCbNNzzihm7jV6j25tf1/TiXl0+cZKTXlYrK0fbRCCXLoneSPjv+/Jb91o1ogaTzgWk
         uOi7POSdTMzj5bciF9zblNTJKv7sBNkpRCCpjhFTzYwQPjLhW0FJ6H9db1U0vEXAgi6o
         zQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747413531; x=1748018331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i4TZO7F0sCGxwzDZyBytVinqtnKHLmyapBFsMMaK7M=;
        b=HEE/BRdkdspqL0ClOt/EVmwZUlBujYgbH8yew1MynjhODcanCjX2YzXMuREiot8WFL
         FhpExCrZi7v1tKuNozUFHv/51NoQ8u6KU1i+1hvZYMrBmIwMUQiWRShMV2QGGnhI79oG
         +ZAPgYBQfYatQd24atkmLn3QLOm/0/1hm62B2WcadbMbnaFUCSrHwJbT45EgvjLLedvS
         TTB/GmmKA+TKC0OKKOKD5PJH9+WiahI7YV0bIB2NE42ZOm/ZeyQr25yYLSL6567RqioY
         f2aOcBQ2SqI0jbKBJoFPM02hFvu38QaBrFKHicztkcFGA+NknXEWZOwtvpJUxybiuRVk
         Jl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnuKRzmw87ahUlpuDQvXncVRzjRCL4b4xfH19NGL1O/ZIIlydNR3icGwc0Dii5iue3A/L1kIrAwJ7A@vger.kernel.org, AJvYcCWDjPFMa3Ps70HFpHFj1kGxOQ4mdxoZ3jxuw3EHT3PtUxR7nR6i9H+acMke+rsvN2uLV8J9InPayJQLzZ4D@vger.kernel.org, AJvYcCXx1RrzFfuLijB0bfRkXcc7Pt653xbr5SjXL0bPwGsuSQ5yq1DKGBZb12sGcYt00QCRE6tyTgtVcHYGdsEcO42dTio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyACBWrlyAv5YeJAXD6va4A26cCXV3hiqsi9qeRYlziKY95LAg4
	3cLCVEclydfNXT7mdqzUMJinZ1uAAsU3MAWIhHGXobyQjNX/99JLBHlspLYul5EbQPOo5UqHFm6
	bWBiwgOybAIHSL2gXotKi82dKpq/3asY=
X-Gm-Gg: ASbGncv2lfJKFL6HUoPOX+HwHvmEiRRjtLGfAaQWx08TRw9ASijL633jL5LCpMurGef
	9XnzPoE16BsQhJ8MjiRv9ciNkUGI6IKn9qLsdbdJniYA9dxZ60gfZtHRdXHCEjValhg6AWLjq2L
	M5LyO6kqH5/daoVNkZFkGnfHcdff84Fni0yfQ=
X-Google-Smtp-Source: AGHT+IFu3W4K0n/Mx4JzypNg+2pWPRluhOQNdIAWcHtnFpVY55yVyhej0EVxD5ThFx9fCHELb0vQDWAFNFt4Z6KOzag=
X-Received: by 2002:a5d:64e3:0:b0:39e:f641:c43 with SMTP id
 ffacd0b85a97d-3a3600dc224mr3444012f8f.53.1747413530485; Fri, 16 May 2025
 09:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250516-unpaid-reexamine-922bbecd4cbb@spud>
In-Reply-To: <20250516-unpaid-reexamine-922bbecd4cbb@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 May 2025 17:38:24 +0100
X-Gm-Features: AX0GCFvbvHI08lkzI43pAPo_nT6eNQFUgPjKydnuIxTd1HtqoDzP-qRe6UAojcM
Message-ID: <CA+V-a8v64jcDhdtSvqE4UTuCnL9mvjXOwtKyiZJQUeEtLmMFNA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, May 16, 2025 at 3:21=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 07:22:06PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the Renesas OS Timer (OSTM) found on the Renesas
> > RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> > other RZ families, so no driver changes are required as `renesas,ostm`
> > will be used as fallback compatible.
> >
> > Also update the bindings to require the "resets" property for RZ/V2N
> > by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> > the "resets" property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3->v4:
> > - No changes in this version.
> >
> > v2->v3:
> > - Added Acked-by tag from Conor.
>
> But v3 -> v4 doesn't mention why it was dropped?
>
Sorry I missed adding it. Please can you re-ack it.

Cheers,
Prabhakar

