Return-Path: <linux-renesas-soc+bounces-33265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDAGC60GGGrGaQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 11:11:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D825EF488
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 11:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31EDF305BF34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 08:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAFF38E129;
	Thu, 28 May 2026 08:57:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122538AC90
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958652; cv=none; b=Uq1EYEXDlpw7r5+jgW/tFo/VfQ8eU4rvTejnYETtM8hQ8IJWwypRKcME/KPSF6zjh/5yKgdJy4e+G6oWjY4ieIgTr+Qcf1EuBwxKBiImjDawJ81+65rA8XRIRFYglov1CxM8EGoMZhL0bsdUhvIW5UfnxSRc7EAENf8baq3HtZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958652; c=relaxed/simple;
	bh=udN5yvImCBSxZLul/qJ3biL3aUpy3IPt8kYNBe9x0r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8qqfDCwMNYG4SdLG4WhfRbKciMDa+9RWjuTDz7rG/4ewUQnWosovc6AbQxlo7rUyM44/+Um+aBzbxyjbWIwofwb7W9Jv5cjM7geHvkMsFbXDKWgwJlvUNbCESqwWRFjjVozVX783PnedQbNiBxGi/kRA/M+k7rAm3c24tRGgSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96393c6700cso103542241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 01:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958649; x=1780563449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOQGBHBqxMpQsOHiSMJOANdscDpYsZb967PigVYTEH0=;
        b=s1WsaVgNEes8RxzSQQ8K4Hewb8UGBYnSsv1hiFgTNQjpweLMVToL+zDamh08aInL6P
         rVEjY0jKb720NrwwuC5rPm93/Cs9j5CblS6r8KGiea3l1DJjkqIpuhNk6hE1OCp6a3CQ
         IKcr6LKzZAbBjfFO8EcwbilMuH62ic8fEF5dzenbl5ZrxP5TJxJ0q3jaX5oyH2mMwDeO
         Z+qvNkJPPUGKeDRRdcXWQlULm+tKl/t8H+k2au2cFLdZ8uGBU5qJEdpnj97dfhiuZPwb
         lZUeiwHp7SRPOKmfsQfdT8CERQLNulBybFOBUUoNlyVPbKU7Yzpp0fX5OBxCvr/lo5Pv
         Tjxg==
X-Forwarded-Encrypted: i=1; AFNElJ+uMvxmaXd6JQiIqXf3QXV5O4pOh4vqDJr5357byLxedHzxYM7MCJ0B44+xY9sAjBCAiPXGoFm7HW//To47hG7RsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7weehyzYPXG+3uT9QGlXZ4q2IKlSFIq/1QKHvJPTD5y+Qo7g3
	Lrx3k3CKEJtFRWUI5AVzyzQk/0Xcpor0fjQhyjF4VHRc2fjKJwKnOxAUK389Hok2BYY=
X-Gm-Gg: Acq92OFFMscHxnH6cm5xU7ihtGCVdh9+lLxs0cWnl5VV2x/MwM6xSriuUiOadLsEz/o
	a5NWNOo4XSm5Z8825uD6KFLDLVQGXuM49gUO3CFXppHNlom5oIZQJGRqcL0p4vJxGg8PLCxpvJ3
	OrAXAiqyypFLieQaxG5TZEeqwQj8TwRmvptNeKPvouqrrPFoue5Vyvod90d7lkhVCZ++8P7E0u+
	3plclI7/zz1QYYKIka0DgipKn65VSbbJgBAEFgyofNEKZlFFDxUA+S5RYWpMUTupotx+xpqnv+H
	hw+iI/kRzo4Hg8nhrgiAVFU9nqxfOoscpLTPBGCQHDzIRy6+kAPwQ5rv2u3u05buQ5SjYGy3uX9
	z4hB5g4PYUns38xUiMGzd5Qeb9oTmUoNBWvMXSDMhRIICyxRBdA9IqRflHZUgIYKXh0NmCtfRf7
	Q7/oZZPaYDsudkOQ/ciDid7UninaGfaAuwVBdKJjqFnhrkOaQJmg8gfcxSl4lIuIBjZuepOg3Oh
	U0=
X-Received: by 2002:a05:6102:508b:b0:62f:2f1f:599b with SMTP id ada2fe7eead31-67c76e8b9e0mr12759307137.7.1779958649271;
        Thu, 28 May 2026 01:57:29 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963909241d3sm1564494241.2.2026.05.28.01.57.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 01:57:28 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57513a91514so4241891e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 01:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84B7hI+Imrs8j6BmDmq9FsMstR9lvIjNtsuG9jWqdQJ7Db4qk+Oaqpshuuh2D5Q6IvdvO962pNzO9FT919hfkwtw==@vger.kernel.org
X-Received: by 2002:a05:6122:2404:b0:575:e902:bf83 with SMTP id
 71dfb90a1353d-586590103ffmr13726592e0c.0.1779958647483; Thu, 28 May 2026
 01:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com> <CA+V-a8vhCqdVf4iAusGj3rtCjkazAFqQJ4cwcnEGS0qK-EnVVw@mail.gmail.com>
In-Reply-To: <CA+V-a8vhCqdVf4iAusGj3rtCjkazAFqQJ4cwcnEGS0qK-EnVVw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 May 2026 10:57:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrKr=Y=Xe-J-udh+CqoBD6XCKCSLBX7-N2ayrnw5prSg@mail.gmail.com>
X-Gm-Features: AVHnY4I9H1eGF8fVLQOfT5PSdArnKqJgHxtwFeff4WqnVF15bhO3tOXP7xLSidc
Message-ID: <CAMuHMdVrKr=Y=Xe-J-udh+CqoBD6XCKCSLBX7-N2ayrnw5prSg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-33265-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 24D825EF488
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Wed, 27 May 2026 at 20:06, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Thu, May 14, 2026 at 10:02=E2=80=AFPM Fabrizio Castro
> <fabrizio.castro.jz@renesas.com> wrote:
> > The HW user manual for the Renesas RZ/T2H and the RZ/N2H states
> > that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> > interface pins have to be configured as specified below:
> > * SDn_CLK pin - drive strength: Ultra High, slew rate: Fast
> > * Other SDn_* pins: drive strength: High, slew rate: Fast,
> >   Schmitt trigger: disabled (not applicable to SDn_RST pins).
> >
> > HS DDR and DDR50 are currently not supported, and for every
> > other bus mode the eMMC/SDHI interface pins should be configured
> > as specified below:
> > * SDn_CLK pin - drive strength: High, slew rate: Fast
> > * Other SDn_* pins: drive strength: Middle, slew rate: Fast,
> >   Schmitt trigger: disabled (not applicable to SDn_RST pins).
> >
> > Adjust the pin definitions accordingly.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -275,12 +275,63 @@ data-pins {
> >                                  <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* S=
D0_DATA5 */
> >                                  <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* S=
D0_DATA6 */
> >                                  <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* S=
D0_DATA7 */
> > +                       drive-strength-microamp =3D <5000>;
> > +                       slew-rate =3D <1>;
> > +                       input-schmitt-disable;
> >                 };
> >
> > -               ctrl-pins {
> > -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /*=
 SD0_CLK */
> > -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
> > -                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> > +               clk-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /*=
 SD0_CLK */
> > +                       drive-strength-microamp =3D <9000>;
> > +                       slew-rate =3D <1>;
> > +               };
> > +
> > +               cmd-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /*=
 SD0_CMD */
> > +                       drive-strength-microamp =3D <5000>;
> > +                       slew-rate =3D <1>;
> > +                       input-schmitt-disable;
> > +               };
> > +
> > +               rst-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /*=
 SD0_RST# */
> > +                       drive-strength-microamp =3D <5000>;
> > +                       slew-rate =3D <1>;
> > +               };
> > +       };
> > +
> > +       sdhi0_emmc_pins_uhs: sd0-emmc-group-uhs {
> This needs to be sd0-emmc-uhs-group and to keep it consistent, we can
> rename sdhi0_emmc_pins_uhs to sdhi0_emmc_uhs_pins (and same for
> below). Since Geert has already reviewed, perhaps this can be fixed up
> while applying.
>
> Rest LGTM,
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks, will fix that while applying.

Apparently we've been consistent with using "-group" as a suffix,
but have a mix of "pins" in the middle and as a suffix.

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

