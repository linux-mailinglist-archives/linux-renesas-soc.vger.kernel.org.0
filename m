Return-Path: <linux-renesas-soc+bounces-11143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A69EAD89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 11:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30390283777
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 10:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A2C23DEA5;
	Tue, 10 Dec 2024 10:04:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718223DE96;
	Tue, 10 Dec 2024 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825080; cv=none; b=vA85h3TblZ77FpKJYFJtk7HNrAo7O0fOW6nS7Tnqpq/iIXQu1Uy5M5tt6man4a9Mn7sSAc0i4b/QP87Wk5GG45/1kWDKdINGJurw3FE7o48OrjcqcVGm/OBWuCskgxNU8s+aHmwUPUfj9OFeQhrH+x/VCDIoo1UNR9bh9lb6X8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825080; c=relaxed/simple;
	bh=Kx6ZCL9OLHThg/AlX72V+Zi7+OJ92yG7aHU90uk1kwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEmxvj7qUA+L4vDPopQbq0X7w1Rsb/Wi7S45v5liSNw1Ac+doVS3Y9Ej8ZYluYTxbNCZKKxH5WdWDQJCmYqFcKwYsMI51412KBQOdSkDxEu1nyne8UOFMyyjoi/7OkCKTx5oHEPHp19ukgbSISSU8hkyNeacecsgbjMZmSVQd+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afd68271b6so1105450137.0;
        Tue, 10 Dec 2024 02:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733825077; x=1734429877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CfpFkLkZqxgcX4QF5aNknnKi2/XJy2DSDzk2hxLc1o=;
        b=CYelmKF9GlfYDZPUZ2DWFn7gFU7oQBOBpEQmI/086W19DitdwEKXhbqkgUX+tavddP
         tmkEcll97tb0ufRU5i93kaNTnj1tQaFRO6W5Wq+kurdnaqDJf532NrV90CrojkGiH3C6
         jtaEpTUaIAyLlT3EUHlWHV+xaTGKGwDr9aAg0TpMSem2x+vtdQzOM0ld2rrZUaXkqEC4
         10I1W/UcEmLNxV/w/TY0CT2MqAgJrmofVcV7MExVxMKpzZ5aZ0j78RqBfutB/ZU4wSuW
         a2cVJvqB84a1rTHeDOe85mYi0uBlJ8+SHKCFXDpmnEjdJseNP8yhefiP86UVntyj1RmW
         1nzg==
X-Forwarded-Encrypted: i=1; AJvYcCWZamr61CR46Cw9wqwfXRz4NQPrUVY+UCuqvUpLo6PIU4Sqj2QV6sNnBVArOae/IEN67y19H5ofns5wPohXNfEztWw=@vger.kernel.org, AJvYcCXGPGJk7vD1LwdNFKLag1FzE3U5VwuTYOIk8c8K0eY5OxXZbun2oBcMMWtWXxfWvr7XB8w+O78kWv/5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+yQRrWtWKOk6G7vGDYsijEky9dxskrQGTYi6XSefxhDYOtSU
	k4JUPbi/tG1iSuICucGmkGsowpc0IsxuaShm9kTT2lrUhpc/RhpKSqHa/Q4j
X-Gm-Gg: ASbGncuFjn3CYA0y+3xKQc/KfG8U8hYEG9KpIZgXiDvL4bpwaadSj0eivmn7C1mPPB3
	/1bKLQ3xFoYKGGdhgtQdqrhlhPeu9CoNBSydVPTyyL88eRMtNrnSYKLZMh/PII7eCurvSzKYEP6
	1uMGFh4Zir1ez8hmYbc/fbzsBQ82rFy1f8kyuhdMsf/CoCP2CL3S9XVVs4QAHjV4xjPBnggW1hP
	bF4UAMY7NaFCmAf92mGi8/WgsGnBdiSVr4PyiAuQSaDHI8ccKQeew1gyKooLKfPFAzE/lL2j2Yv
	VugWDX5Mp6R/tTnN
X-Google-Smtp-Source: AGHT+IHjdcvvlBxqx/gtzf6jqm/Rs3SiLVskNU7e09YTHUdnAlLVn9VuHXRv8SxuAZ1cpw2ciwHMJA==
X-Received: by 2002:a05:6102:32ce:b0:4af:a990:d212 with SMTP id ada2fe7eead31-4b11607c10cmr4324121137.9.1733825077274;
        Tue, 10 Dec 2024 02:04:37 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd5ee97ecsm1018882137.12.2024.12.10.02.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 02:04:37 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afdfd3124dso885535137.2;
        Tue, 10 Dec 2024 02:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCMBPeK1yKy4YTGZkv7NFtxO4km9eeWdKppFPqPFvsk7cbouIVMSoEMb6PO7SdgFoSBp0jA7ktvfHr@vger.kernel.org, AJvYcCX5Tz3ZZ3g86mnSagbzZ0iGsLXS6Kevohj1O50PWu0NJPDbibxJLEENmF2eSsZtL6a7nEwbJfAjKzAxMDDeq+e43MA=@vger.kernel.org
X-Received: by 2002:a05:6102:162c:b0:4af:f2e2:7b56 with SMTP id
 ada2fe7eead31-4b11623a2c7mr3989869137.25.1733825076815; Tue, 10 Dec 2024
 02:04:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733156661.git.geert+renesas@glider.be> <87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
 <87y10tvhw1.wl-kuninori.morimoto.gx@renesas.com> <87y10pmjd6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y10pmjd6.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 11:04:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEdLvSRRUOwZR_jzpvjAM_zr++Bbxph21QzXLLsjY7mw@mail.gmail.com>
Message-ID: <CAMuHMdVEdLvSRRUOwZR_jzpvjAM_zr++Bbxph21QzXLLsjY7mw@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Mon, Dec 9, 2024 at 8:00=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > -              - renesas,r8a779g2
> > > -              - renesas,r8a779g3
> > > +              - renesas,r8a779g2 # ES2.x
> > > +              - renesas,r8a779g3 # ES3.0
> > >
> > > but decided against doing so, as "ES3.0" would become stale as soon
> > > as Renesas releases "ES3.1". Alternatively, I could use "ES3.x"
> > > immediately.
>
> It seems using "ES3.x" is a good idea.

Thanks for checking, I'll add these comments while applying.

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

