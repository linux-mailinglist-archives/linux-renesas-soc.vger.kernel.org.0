Return-Path: <linux-renesas-soc+bounces-22140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34340B912F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 14:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A69189F8EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 12:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F473090D7;
	Mon, 22 Sep 2025 12:46:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9253081AB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758545181; cv=none; b=H1DHxOCQbEJJr5Q42F9kRQlnz1EIhXVcRhBbwVVTVsjuoujlqPTMF/gfMjWaN+jJmoQpQJWfCrovo//5BwUGJtLou+ZZfpWM1cmzre6Yi1eA48m1eWQFy78SJGd1GqBhR8Rxe66YxLzdbwXPUthl7PxJyTU2pax+6co4DfKEe74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758545181; c=relaxed/simple;
	bh=LalxEdf2CLHD+3/DoosjP7R0lybr3lNihZe4lb2nS2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i89WTvwvcDtOfb7XnWtqjrw0e3pixd9sUpmEmyWwKop8KamtdZVS3V19k0FrGXOZdakCtCGeWEcozNoaRfthEbJ0x5+NJDlAsymV4QYBEWOoOpYA3piclpTp3Jyym5h2pFCeelNL0xpC334AzXmdx56XnJE2gb7HL2EVfjPNlCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-557a2ba1e65so3690376137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 05:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758545178; x=1759149978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5J4VRvr1gr76F3lInaspOR1L44Cm4laCA28EiGvaXI=;
        b=Ywv4i7DvZoaMQUL1D5MYuXddKdCdasBuXheU9C9R1lrx+Qeo7N11gFH5I0Z6JGSTrs
         lm0/NYY9OveVinoPX/J0gCTG30+uOKarrcTs7rvk+iZGgHW4A6cKoUGIvOvOxKH5C18z
         0i29H8aAN68rNMz3w3yIwt3kDHzzdP9S6PFRGptjf+LXTGJRqsjm8/0zxAJ8r2cEsGwy
         YFItgLGR9pUTcDLZpZhrVQ5R+5BXhu2I4oEZFbx4oX8doH3dPxUTQttbB90GOsLJMklm
         04NZqTG1a2zDHNksjZ0bT72moM3LYorUdiSQzVfZdOqEU0utGQrK6rs1ib76Y9Qc8aOx
         GqhA==
X-Gm-Message-State: AOJu0YwkPW2NhxKUHqiIykd/OMvD78AYDwia38z0CpzLRMYe0kKNIQD2
	PxqDWU1Wol18O2WW6W+TC8hHBdmiQ8MLe/QE+LfOssHg8r4o9GViJoxO2yPJD351
X-Gm-Gg: ASbGncuhAFew6V8oZLaeUTAgNjK5wgQdHo3GfbDzaxsCTYDsCgC8Xc1fwBOPgWYQJwF
	fdqmMB5YBKFYkT75DB3inipJAzRqfDuW+FbA6mCFdPXOgYD/A7MptA+3cGEYWc5CNzwtLJ97YJG
	XMaFYowgGVA+XpNzF2+uNNImAqTnF6nRPFrJcFS7UFbyTP0CgBxBPlN071kbMJhj66hrYa48Hqt
	9cGnEigRPmw1z0KnqAdSdLaKoTrhDBk0Cex6xR9pB4rnv4ste3U6WU3mIN155FnCZGoehfqGlXJ
	deLvWdrwyc+R1hE6ZnOuLu8Rup1Pl493HWygAtd1lcCRAAG5fhO/Q4zH3zWY8pM2f1Kvm2frmie
	T86ZUxg2nRDZhGhGZWgj7RC7xH6AoLrwifvjMLvSgQZuP5JdchqHVEDaXO4eq
X-Google-Smtp-Source: AGHT+IHHP6WZItUcYOlu9OQwAzDBT0k1GiDkJt6PDNHJI4xtZMi1YK/kJxsnbb2OGNPRCNDB1PDAsw==
X-Received: by 2002:a05:6102:40d3:20b0:59d:2396:18fb with SMTP id ada2fe7eead31-59d2396210fmr1551118137.25.1758545178268;
        Mon, 22 Sep 2025 05:46:18 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5a1ad18556dsm684552137.9.2025.09.22.05.46.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 05:46:17 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-55ae619545fso2609815137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 05:46:17 -0700 (PDT)
X-Received: by 2002:a05:6102:3911:b0:5a1:ad18:4a52 with SMTP id
 ada2fe7eead31-5a1ad1854a9mr1056291137.12.1758545177149; Mon, 22 Sep 2025
 05:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 14:46:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVONJVkvBj_AYZxkCZ1Fhr95HGSMNbQa-nn6+NmZc-R-g@mail.gmail.com>
X-Gm-Features: AS18NWC3NFwLCTMrNfKZ2H-zizbHeBjjhWejGJ6R4dTa1H9iB4dRfBDjP3fzvZE
Message-ID: <CAMuHMdVONJVkvBj_AYZxkCZ1Fhr95HGSMNbQa-nn6+NmZc-R-g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] arm64: dts: renesas: add SWDT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 20 Sept 2025 at 08:44, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I forgot over the years why we did not enable the SWDT on R-Car Gen3+.
> The reason is that it is used by the firmware on Renesas boards.
> However, this was not documented. So, based on a previous discussion
> with Geert, here is an RFC how this documentation could look like:
>
> * add the complete node to the SoC DTSI (here only R-Car H3, M3*)
> * mark the node as "reserved" for the relevant boards
>   (firmware should have done that(tm))
>
> If this approach is acceptable, I'd handle the other SoCs, too, of
> course. Looking forward to comments! Passes dtbs_check here BTW.
>
> Wolfram Sang (6):
>   arm64: dts: renesas: r8a77951: add SWDT node
>   arm64: dts: renesas: r8a77960: add SWDT node
>   arm64: dts: renesas: r8a77961: add SWDT node
>   arm64: dts: renesas: r8a77965: add SWDT node
>   arm64: dts: renesas: salvator-common: mark SWDT as reserved
>   arm64: dts: renesas: ulcb: mark SWDT as reserved

Thanks for your series!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

