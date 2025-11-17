Return-Path: <linux-renesas-soc+bounces-24690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6FC63763
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4052C3B0973
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1293E32937E;
	Mon, 17 Nov 2025 10:12:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8FF32720F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374379; cv=none; b=aQJmmgWNyeNCzEazMcZflO5X8Co8TqxzIcoRyW4O0ydMruQ/AlRT0SCuzjbOhrRHnlneakfZGZ9RGNQDt0SYm4ZU2IhaQfKsRIqEn7IY/9+tgcJKU2lQTMVfscNn+dYAKktRrUqQUlpQu0EsiPornKBksjNRxOR/x7sUYhxNYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374379; c=relaxed/simple;
	bh=GDOM+0gYiKkhyCkDjVnvHjHMXUKJ91og6WK5WoSGmVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guANbjItfeYe/z5/twkYRk/jhdPKedSPWOJ76u2VGWMmuK0ICgd1w3JvtRHhKRiRpKyrfkLvP3uyl8O7hcs5H7Xso3fBpt6mnLNM3sQhuqDQgdxtX1X0fMjZchKfd/cZOYB8BV5Hl8Ez6a/fIHkFg52G1jMEAhWvqRD4YCoE1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5597330a34fso2613868e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 02:12:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374375; x=1763979175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwmIm0bgwineetBBRefqzkv/ZlLUD6Hn/jhQ8fYgpUo=;
        b=tBdcNmfyVT+MAGv3IPP8B5VGt2cCkpAZkzbCk6B6v8o1LxB39NDGCnhsWTFau7WRNA
         TpJ5Qo3pqdfCCfIYUQ7KWp5/ZP4oSKCof2zSTOTBKQG6t8qsGC3VdlEZCkyWry8w9hTK
         KoUVbSoYJgp8kUHIGpVcKnYzcRZOluGet+Wrw+wuiktRDq7GIFHoxgfu5E/qfsw9HZqx
         v8kIfvewRXoeMVJXEZqmSub78TK25D++el3En6B16OKgS8onz9LVWv9hQUIpixEKYOjf
         z+k12igYqEQ0FNOjA8pNfVpZt03nd6wu1krGhgj77U0Rq7oKJ0iFMHd7Os2Rbp39qX2O
         DhZA==
X-Forwarded-Encrypted: i=1; AJvYcCWesyNKcEiufB8OCH3/z4keb9MeeGmU/X55DTLe5JryUAM+CYqY+WUVSjd/97cfUjsPWkEy5n0RrPParKn04oP++Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkKKrxsYUKb68S6tH1PJjZs6bnRMJkp4cIQr7BcPSjSLFjJXYr
	tn5tne/u2seXDe3mLpXjIFVS0ZbEa/BIGSk0+MUOuCOlg/chFqGH3E4SbqvEYLKh
X-Gm-Gg: ASbGncvPY1XlIwWr3BfEIhAdhboAVvqvPVRKzCO742OMeszyk5YdbibD+bGbEiR0wWg
	4AlaeAa9rKe8MLd7hDCXsQUvcsYYmEl076p7io+zKndL6LXq/nd6I/a/TVvp+4KlWEQA0NWMy2p
	8tPNt7zFKcP+k3MQJzojj99BqdQggRB3ExwvJwELyoMllUD8F6A2j2yYj797vtHaNVmU+kwN3T7
	Vqi3qgDjsjylq5Z4ujexdlZCzHUMLt2EVxW6M9urJabpxbKeMdUcOMfAAT+vsAb5QLezJaNpep1
	4olzeW7VePCcxw6q5qAPjPuGHjCJLULdV8xWFER0Be+1qnPM+XWxhLI67G+lUJu1AXo+akGoBrV
	Ovi1JGW3q56fQTnlmPqC5czOrdMhKTQW9/xCaC8n7vC/2jFX0XEiBZbIC43RwMz9yYPqfKxxM3E
	U2rxpfcCY1eVrsx0xCuCIvmlo/FR4fi0whG5HoRqo4WorPGZ+cPQG1
X-Google-Smtp-Source: AGHT+IGXKhMOSaaasYStrr73pBCbudFOsPgI/YQ25F6VXQcr7aSbdyz/AyNr9mMWT6jY87FaMgx+7Q==
X-Received: by 2002:a05:6102:419e:b0:5dd:b2a1:e9a5 with SMTP id ada2fe7eead31-5dfc55508e3mr3829399137.5.1763374375448;
        Mon, 17 Nov 2025 02:12:55 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb6ca9d47sm4649651137.0.2025.11.17.02.12.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 02:12:54 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9374ecdccb4so2424847241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 02:12:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViCTmx+2ekeAC3aDO49yAj9FQVLt8I/d/qqCWypOLwG4RVNmuMt/vtURnor490TT+vun75xQIpC+UVmgTY1YTTAA==@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:5db:32dc:f05b with SMTP id
 ada2fe7eead31-5dfc5bf1b06mr4258951137.42.1763374374287; Mon, 17 Nov 2025
 02:12:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030120508.420377-1-biju.das.jz@bp.renesas.com>
 <20251112-warping-ninja-jaybird-22edde-mkl@pengutronix.de>
 <TY3PR01MB11346974232A057A7D5B6EBAD86CBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134632B48784F5D72721611D86C8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134632B48784F5D72721611D86C8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Nov 2025 11:12:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXSaaoOaECmBQmPyWQA7Z30BVBLfVoF-Uz01GfbFZNGw@mail.gmail.com>
X-Gm-Features: AWmQ_blx-TSIXOAD1fL3P2E09fREtqUZGsBV4Ry1Ow-eJhOSBFBGV1F1fuwPF-E
Message-ID: <CAMuHMdVXSaaoOaECmBQmPyWQA7Z30BVBLfVoF-Uz01GfbFZNGw@mail.gmail.com>
Subject: Re: [PATCH] can: rcar_canfd: Fix controller mode setting for RZ/G2L SoCs
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, Tranh Ha <tranh.ha.xb@renesas.com>, 
	Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 16 Nov 2025 at 11:31, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das
> > > Sent: 12 November 2025 08:47
> > > On 30.10.2025 12:05:04, Biju wrote:
> > > > The commit 5cff263606a1 ("can: rcar_canfd: Fix controller mode
> > > > setting") applies to all SoCs except the RZ/G2L family of SoCs. As
> > > > per RZ/G2L hardware manual "Figure 28.16 CAN Setting Procedure after
> > > > the MCU is Reset" CAN mode needs to be set before channel reset. Add
> > > > the mode_before_ch_rst variable to struct rcar_canfd_hw_info to
> > > > handle this difference.
> > > >
> > > > The above commit also breaks CANFD functionality on RZ/G3E. Adapt
> > > > this change to RZ/G3E, as well as it works ok by following the
> > > > initialisation sequence of RZ/G2L.
> > > >
> > > > Fixes: 5cff263606a1 ("can: rcar_canfd: Fix controller mode setting")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Applied to linux-can.
> >
> > There are 3 modes for CANFD on RZ/G3E
> >
> > 1) CAN-FD mode
> > 2) FD only mode
> > 3) Classical CAN only mode
> >
> > In the "FD only mode", the FDOE bit enables the reception and transmission of CAN-FD-only frames.
> > If enabled, communication in the Classical CAN frame format is disabled.
> >
> > On RZ/G2L, currently, CAN-FD mode is enabled by default and On RZ/G3E and R-Car Gen4, currently FD-
> > only mode is the default.
> >
> > Prior to commit 5cff263606a1010 ("can: rcar_canfd: Fix controller mode setting) RZ/G3E and R-Car Gen4
> > are using incorrect code for setting CAN-FD mode. But fortunately, it sets the mode as CAN-FD node, as
> > the channel reset was executed after setting the mode, that resets the registers to CAN-FD
> > mode.(Global reset, set mode, channel reset)
> >
> > The commit 5cff263606a1010 makes (Global reset, channel reset, set mode), now align with the flow
> > mentioned in the hardware manual for all SoCs except RZ/G2L.
> > But because of the earlier wrong code, it sets to FD-only mode instead of CAN-FD mode.
> >
> > Is it okay to drop this patch so I can send another patch to make CAN-FD mode as the default for
> > RZ/G3E and R-Car Gen4?
> >
> > As an enhancement, we need to define a device tree property to support FD-only mode for RZ/G2L, RZ/G3E
> > and R-Car Gen4. Please share your thoughts on this.

Hmm, Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml:

  renesas,no-can-fd:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      The controller can operate in either CAN FD only mode (default) or
      Classical CAN only mode.  The mode is global to all channels.
      Specify this property to put the controller in Classical CAN only mode.

> The patch I posted "can: rcar_canfd: Fix controller mode setting for RZ/G2L SoCs" and
> commit 5cff263606a1010 ("can: rcar_canfd: Fix controller mode setting) is wrong for
> R-Car Gen3.
>
> R-Car Gen3 has only 2 modes: CAN-FD and Classical CAN (there is no FD-only mode).
> All other SoCs has 3 modes, CAN-FD, Classical CAN and FD-only mode
>
> R-Can Gen3, RZ/G2L (CAN-FD and Classical modes): Modify the RSCFDnCFDGRMCFG register only in global reset mode.
> (Here the flow is global reset, set mode, channel reset)
>
> Selection of FD-only mode for RZ/G2L: Modify the FDOE bit in RSCFDnCFDCmFDCFG only in channel reset
>
> RZ/G3E and R-Car Gen4: Modify the FDOE/CLOE bit in CFDCnFDCFG only in channel reset
>                       (Here flow is global reset, set mode, channel reset)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

