Return-Path: <linux-renesas-soc+bounces-6523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B790FED8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 10:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79F02B24F85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 08:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30375579F;
	Thu, 20 Jun 2024 08:30:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C0EDB;
	Thu, 20 Jun 2024 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718872242; cv=none; b=ZwdL7PgBgT2J9FE1IFzO7UeRcGySvdHRG5Jv6sNyeFTBZm/sgx0qChljZDnOgg2s232Ax5CdIrgkbKUmQNiDGTgBEpeLxGeDEicxMTx2afYzkTDd8R6KR7RXH+UauaTZQ3EZfvFbXGRIdIAEwSP/p1QzvOoVg+r8NIm3gZEgoHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718872242; c=relaxed/simple;
	bh=eB1CIq0gxlY+acvnR1ypmvNl19YmBIL4UPKL1g+r3a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9yZYHR265OY6mI10d8DfCykr3wpLP5aDhs5qfUtNc6fy/yzp+Wjk8c/Va3eP5JFz3WwMM0n3dBrZRg3jNw2E6C8euPq3uR2Y6nMigD8VYElsEqgmHC/u3u+uWcJQTDw3wrI+7eXFPkvb1FzfyLEv48jYNvY7u5XcEzMNsJotIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfdb6122992so572481276.3;
        Thu, 20 Jun 2024 01:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718872239; x=1719477039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RFve7hyiskn4h2RnWHk8TUVX1VIb0WnIJgOemezHVg=;
        b=Xl1HtMFOTQWrQFnOLy3dFYfCfiITqY/JXpM+V/1L/bWNLXKaGICt5p8hY8srTaU/e2
         Wo0wshN0Sh4N7yz+I+Upr5NuTSlrGQbP8SJifyJM4LA07qxV3sYgOe0IXH/p2vPYFbRt
         aK2m1HBQ4THIR0qxe+i4Mv7UJ5hP7IPPwk/lSIawd/CaAHBe5qtrJDM0VfDOnCxcnD5i
         REBr+G1yy1KpQ/lT+Z0CYjbRiEgZIC+24UvDEqXsWpsbefIab7PDrtPjJQVN1JHpTbqC
         Ahtd65kj4ggnzIlgrlzroTR82zK/v50ZDvov+BWGp/6zND8DBHlPWKQIDTISp4E6+/Tx
         gXqg==
X-Forwarded-Encrypted: i=1; AJvYcCWG6q5kw+KwuwFn7Wmr7TIvwhHCrDWwZ/jV5TGsghguTuTRDwM6BO5JEk9yWANR34GclNR2Kb0mjefjGBMx4qawXBdGzN66zJSKiVtaFpP6znQAT0V98t7IlwTnRbF/eeCTXFDTdtJF8FyKmoc1IueGXF7l4GeNxSyZnJaBaZoM6Nhlfer+Ie/W
X-Gm-Message-State: AOJu0YwKs5U0KIy/J6Or7zjnWJQrlOTDRiu6dLkmVuSlagtce+ZASlYr
	5fbMRcgNU/qNH/p13COxzz9kzoJtfILOezK9QaI7Km2xEpJKXEYhe7XTRlKr
X-Google-Smtp-Source: AGHT+IHSRmpTuWzxNcthhbG0rRvqjw6Qn2MbO7Wbl8weu1WpTHEfEZ/EBLfKisCQOOsp0TDi6dpYsw==
X-Received: by 2002:a25:d30b:0:b0:e02:6e1e:209b with SMTP id 3f1490d57ef6-e02be17c36cmr5099594276.38.1718872238819;
        Thu, 20 Jun 2024 01:30:38 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04a4dc23sm3508055276.48.2024.06.20.01.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 01:30:38 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63bdb089ffdso5215287b3.3;
        Thu, 20 Jun 2024 01:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN/Rvf6z9hBQqvx6L+/np7/EWBsVXJygdZPlEhoA4VSzH6Pj4hUBbD1PEt42wkhVUPz3sQ1GOo5evyBvEKXAhi3ltodcVoLUg4CbqdBFD8hjjIYCe9HfqlwgqVRoiiPPoRIytLMgY04oJtNRPOvGG5CxlmqjKOgPnF80Tg/b3H4Jw1x5+B1afq
X-Received: by 2002:a81:a605:0:b0:62d:1eb6:87bf with SMTP id
 00721157ae682-63a8d3518b0mr47889817b3.5.1718872238440; Thu, 20 Jun 2024
 01:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d4abb688d666be35e99577a25b16958cbb4c3c98.1718796005.git.geert+renesas@glider.be>
 <20240619-explain-sip-97568f8ac726@spud> <43a57696-eb4f-4ae3-970a-cee0640baa17@mailbox.org>
In-Reply-To: <43a57696-eb4f-4ae3-970a-cee0640baa17@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 10:30:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2M6zKwy=Qqv4XR1Zjz4yRGWcp_EYO2d68DUyLp2O1Cw@mail.gmail.com>
Message-ID: <CAMuHMdV2M6zKwy=Qqv4XR1Zjz4yRGWcp_EYO2d68DUyLp2O1Cw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: rcar-gen2: Remove obsolete header files
To: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	marek.vasut+renesas@mailbox.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek, Conor,

On Wed, Jun 19, 2024 at 9:17=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
> On 6/19/24 7:48 PM, Conor Dooley wrote:
> > On Wed, Jun 19, 2024 at 01:22:46PM +0200, Geert Uytterhoeven wrote:
> >> The clock definitions in <dt-bindings/clock/r8a779?-clock.h> were
> >> superseded by those in <dt-bindings/clock/r8a779?-cpg-mssr.h> a long
> >> time ago.
> >>
> >> The last DTS user of these files was removed in commit 362b334b17943d8=
4
> >> ("ARM: dts: r8a7791: Convert to new CPG/MSSR bindings") in v4.15.
> >> Driver support for the old bindings was removed in commit
> >> 58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
> >> support") in v5.5, so there is no point to keep on carrying these.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > If U-Boot is not using them,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > (and if it is, another task for Marek I guess!)

Good point!

U-Boot does have include/dt-bindings/clock/r8a779?-clock.h, despite
never having used them.  The unused headers and the corresponding
r8a779?.dtsi files were introduced together, in the various "ARM: dts:
rmobile: Import R8A779[0-4] DTS from Linux 4.15-rc8") commits in U-Boot
v2018.03, i.e. after the conversion to the CPG/MSSR DT bindings.

> U-Boot is using upstream DTs on R-Car via OF_UPSTREAM, so whatever
> happens in Linux also happens in U-Boot since 2024.07 ... with slight
> sync delay . I don't expect much breakage.

So the obsolete headers will be removed automatically from U-Boot
soon, too?
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

