Return-Path: <linux-renesas-soc+bounces-23620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E331DC0CE79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 11:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF6764025F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 10:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32842C0F69;
	Mon, 27 Oct 2025 10:10:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0662E6116
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559809; cv=none; b=NNVqpHsqcIwx8VO/tNMPzenA/ykwhCFCe7N+z1G+6oOq32LTS8MUIU64Hod6WnMyFPRp5PxoZO2aPXfh/aKjFxLAGx7+uSmIc0IKdV/+KhaHrBrbR4Orj/pM7jWVSjATtWye0yoHRxfdiaH5G/h9RK/omp4/zUYJJDo3soMe8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559809; c=relaxed/simple;
	bh=wabfbo3L0St98xqkI3dsSU5HnY98N7SPncJI9BJ0fCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcJzdcpXX0BEgvHjXxQXuSObFhvUqtJNKFL7/5TPMYnZI/mJWmiPm/LT48NtfayAgL9/nDbo1e1K1rJBOus6Rgsn2UseHl1snbU19GNS/OYMu+OdcizTA+f21I1QWgbktg/+ie1OYT1TLjanURvubQ0hAJsU/DI13hYSW3E6kf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db469a92f7so1017588137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 03:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559806; x=1762164606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfKPIqPs1uhFSxfv2Q4P8MRWwGNst7LmX4Uw4wnrJps=;
        b=VZquVK4XzOHqeFPxFiAs+xThP8pgm29pyyNqRQWlt+Y36E+xIJ+VcejoaBvtXt97GT
         baSpLKpSxnNaA9ZYqsvL6tkOz5Bq/4BUcV9V89kUOrsSZ3NgOppKncgA917w1MvsRGbC
         qwuXfXsg0h7hM64nohBGS9WNnL9DbX29Zg7dgmY3VMacOtThCBpXQwN6jFJtc2QXm6do
         oMcJ3Sn47oOZX4igh71M5aZeJ6b7MiMmF4lzFUfvZkg7W2DCclhh0HDDyWnpLLrc7U6D
         hNQKjVjeoiJvz4zA2CwPR4n5jpoDG+0f0TVrDx4YlhpIJB78TdZk68iJkU8gXAV9PKnF
         G0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz40HavVQKZfm21nL3til+1qfWMzewjkSs3gLU8AeZmVavjddaqKuAKVRbD9shXjA13Z2J5wuseLEqdnq68zaI8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzejmrj2ZODb2IEac7RR2HVtHOwsL6C1YjzTuFzmjan0RdHUahn
	IOo8uutG59hNdlCrrzzKZgf5m6/ncek0SjsuTuLIeZTS8+8OK2L0wWN8gggkSa/q
X-Gm-Gg: ASbGncvW+y8E5beeh9DtkB5FOcpUvjDyqQVxCf22fEsc9DhEr4Yo0FQhraqNTRW0j3G
	0iYPRwE2YNNN7lL9NsDgSNN7+FDHQR9QtQuaqHjWEqWb4VMqUevMMlvIgTWwkm6j3DTN1yLPW6m
	sKSshvQqX9lvKBtiBuyNsafT6a1NPvZaACtS+ZMRDFDE0+zbKDuf7hGvWeVFZzfUYEYXSex88mZ
	N5+7h/2zVXlLurxkU3dRKKOoD6fvpsZCySpJt2lFaGUrzCDkTa+u+ZtR5LPrpn6GGtf8nxNmrBb
	d8718dNtJRJan15COHe0ys5rsD23I+6Jkrl7C8SDkKGyaXlez5LbrC7LZZSUh3+LenF5clHiFil
	qz16ynFIco6gH8/USNpAcnLe5MZFDBsop13WVMVDi87BpqrtKhSOHN38MYSNotFFvFzbe9Qd699
	EtwgTCeegigFCKGLAoleiJn31mb6e1TRwCyvQJ5vVQMbcS10x3
X-Google-Smtp-Source: AGHT+IHQnIAYWASoVaXwT1HI2Eu1CXQYiiytNlDUNVuxf6YfVjirk87qrY5MzjVajRwPJ+ByK4Jj1g==
X-Received: by 2002:a05:6102:b0e:b0:5db:28a5:2b0c with SMTP id ada2fe7eead31-5db28a53387mr5954620137.28.1761559804894;
        Mon, 27 Oct 2025 03:10:04 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c40c0492sm2708127241.16.2025.10.27.03.10.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 03:10:04 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5db469a92f7so1017582137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 03:10:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0EUOqOfGFuYTh48raxQdLMifm6MI+3deupzjafcb6SaeX/9JgPGVylfzztR8JiSu+gFYXt6AWEY4Tc5fa7xvntQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5d5:f6ae:38bf with SMTP id
 ada2fe7eead31-5d7dd6fd644mr10702587137.40.1761559804326; Mon, 27 Oct 2025
 03:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
 <aPaSF2lokJ748cTx@shikoro> <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
 <fba13116-2495-49a3-a1b5-2eecb33bb448@mailbox.org> <CAMuHMdUP_bH5WW3=3J1H=6SocKzQXPdP7PFfYDrgaj4EhYTaYQ@mail.gmail.com>
 <0e81437f-a13f-4605-b7f7-6e6640411f30@mailbox.org>
In-Reply-To: <0e81437f-a13f-4605-b7f7-6e6640411f30@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 11:09:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXs+FoL5g4ZgFVQ4WwXRt9Y-8BcX27d7=wFFROa939CwQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmE-1yifXAR30P2TnxjB9vJART2nr5mauZfpbP5EFuHoaYAUyzx9tdTjHA
Message-ID: <CAMuHMdXs+FoL5g4ZgFVQ4WwXRt9Y-8BcX27d7=wFFROa939CwQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 21 Oct 2025 at 18:07, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/21/25 3:22 PM, Geert Uytterhoeven wrote:
> > On Tue, 21 Oct 2025 at 15:14, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 10/21/25 9:09 AM, Geert Uytterhoeven wrote:
> >>> On Mon, 20 Oct 2025 at 21:48, Wolfram Sang
> >>> <wsa+renesas@sang-engineering.com> wrote:
> >>>>> Or better: drop all these swdt = reserved commits?
> >>>>
> >>>> Maybe. Since Marek is maybe interested in fixing FW...
> >>>>
> >>>>> TBH, I always had my doubts about making them reserved in the upstream
> >>>>> DTS, and there does not seem to be much gain in doing so...
> >>>>
> >>>> No strong opinion here. With "reserved" I think I followed your
> >>>> suggestion but I personally don't mind.
> >>>
> >>> Well, the proper mechanism would be that firmware using SWDT would
> >>> override the status to reserved, preventing the user from using it if
> >>> it was enabled in the DTB passed by the user.  But (a) the current
> >>> firmware doesn't do that, and (b) we currently do not have a use-case
> >>> for enabling SWDT in the DTB.
> >>
> >> Upstream TFA does enable SWDT for R-Car Gen3, but not for Gen4.
> >
> > Oh, so this is a "generic" R-Car Gen4 issue?
> > Does that mean we can use SWDT in Linux on R-Car Gen4 with TF-A,
> > or does TF-A still block access to it?
>
> I think this can be tested on Sparrow Hawk easily , with and without
> TFA. Wolfram, how do I test the SWDT ?
>
> >> I can pass SWDT node from upstream TFA to next stage on Gen3 if you
> >> would like that ?
> >
> > I guess that would be a good thing to do.  But I am afraid it is a bit
> > late in the product life cycle.  Ideally, everything that is used by
> > firmware should be marked reserved...
>
> It seems SWDT is not used by upstream TFA, but maybe it is used by
> downstream one (or downstream loader). I can enable SWDT in either TFA
> or U-Boot if that would be preferable, or leave it available for Linux.

My Gray Hawk Single still has downstream firmware, and I can modify the
SWDT registers from U-Boot (unlike on Salvator-XS with R-Car H3 ES2),
so access is not blocked.
Hence I plan to drop the SWDT patches for all R-Car Gen4 boards.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

