Return-Path: <linux-renesas-soc+bounces-29826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFnPCl0au2k+fAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 22:34:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C80832C30CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 22:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F0D73197693
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 21:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCD1389106;
	Wed, 18 Mar 2026 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ziw9kxCH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258838756C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869435; cv=pass; b=idYjy8vIGsrHjUzfTxfFzbSQxRxGI9QwDTC1JjWI+Is5zcxIMavXkWL+NW90B4hkH7CEZsjV7Ngnz09OsXrQ8iMbiK/tcNRmtJH22qQyJIi4h5HaEuMT8J6MrIZYKJpECkHNQchlbnGSTxLJUzH+BfgP7nVTqAz/fqrV1KDi/o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869435; c=relaxed/simple;
	bh=c459NjjylC4DFrFzhntCSH782/XOuifEBUc6ew3uGZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVuoVH4pYyVIU7V97IG3AziBnL4kWaQ7l4pxWn9AHF2DeBEgWlKCoAGOfFstwfCWaAhXEys/XYTqVEnp3Vo1oBfOe6lGaxhXfxBezOWB0Gl3IzLnT0fu8Q0RP5iRyKvcS8guDj8HbAKLBpe3dm7w9uCzw2eoi3D7MLijxd5Yblw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ziw9kxCH; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b47b95a77so224870f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773869432; cv=none;
        d=google.com; s=arc-20240605;
        b=CZHHRTV3nuQXYIM/lDPoxXADGHMSdZcQ7Drj2Mn+7z5RcKZwIEErSCdhwYUgAhdEf7
         oiUj98EVO7LRG61p/r5FwaG7Ok+GLWRWtyrjXI21cpmkuVwbb9QgB1XpC574c4xifFTn
         8j5Y6VJ6HB/TblWOP+mH3ISygSKWLph6QvvH5hG4aFOxfcBuK7WeRhmDcOBdL9e7d1N7
         vvZPcaBbWxWDNgv6m9HRNegVYPpPhI2yZkpLrMS40wTjaw0PruJHiAq1+RhnyeX40pQ7
         NJkBLMYECvEFl54/ZkVjkN8D7hFkFG9SYhP9NWbiEHqnk2KR8Tsz9Dp5CXnTfifICTQA
         gcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyhjZuvEaxXX2v5n0TSA0ikgRXGcSbp95m6O9R5zvps=;
        fh=FunQ8oL0HOmLWgqUKb/OmXM2SsqyW7Q5kqNRSEBvrtE=;
        b=aaIQYQFTTFA2Ba2ZhYKlIypKbLl16nvumy8KXfOS4/xeiyCBFE70AvUimNwSA3t/uw
         E1Z0mkIHnbWRXqa9Euswrq4exk7b/zraHqK6KkfDJc+DIGW4Um4K1NzkI5i4D9WV2bMu
         OVpiXn7t8IjcDY4tyjNdd8chb6scyCSnDJI2zq/WxWnpWGcANxXoW36ZwB/tHHctYmdL
         a55ejU0JW/sfQjE3sKAJ0HqCJpqs25OF7U819ErfoJJRgxYyqdzNra56R4XoEV5aqfoW
         F2ABkimTn6pRa/87fzxLMXIxExkH5cdSXhR5uPLKN7ANr+tB6bubLpEMlpo/VUfdMsZ6
         iRsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773869432; x=1774474232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyhjZuvEaxXX2v5n0TSA0ikgRXGcSbp95m6O9R5zvps=;
        b=Ziw9kxCH5t9Bf1X5SXh7I9266pOcavsdA87ayusUBpL49bN0QXPTNl2WFkt6vVebVk
         2BixmEmpqBtXODPG1yhGruMJPR1t/c+CJ6cFAixg3MPe20N7dIoOgiYD2fJ0KJrkWP1R
         FwhF2xZe29Gklfw/yYrVkoNvcyuB9awfkFCOwkaOji+9I1C7GoL4/aYlMxgNuUBPuL6E
         segZ4TLYgv+FVsfKCio3A1U/IRNi5rHkmmIWckaXNUoQYzQRXDBIgZZybihnpGBBx6bQ
         2ZsFzbtXxtLOj9mboqeufmDm72rITgW0GRF9t1cBJtf5MVeUlIW8KNksLaql+KiXjLK0
         x27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773869432; x=1774474232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZyhjZuvEaxXX2v5n0TSA0ikgRXGcSbp95m6O9R5zvps=;
        b=fYeUQ6WazBAm+j8bx/7uGsJv3f6FSn6wqJQMpsxjvFgJzSRHX3Lys9SqfJlbAKU4x4
         q7Qc2R+PCHdgY+cK7FCrP/1PT8ELmLGxVf3Owl5nLUMcRCxBV7Jurdrrmo3eIsbI4QUP
         w05OMiIP0Rhrwl5OL5MNqxAS9N2eInFowBX0ZUY3QDvRBgcG+tzYUZUvAMA3uLkv/t9G
         Vzw/LsoCKW8RL+jvcrB9ksE0VoF7eDH7lixrt9L7YUVEMTtpd74OS9fJv1V1miSqXTPO
         SaqO9CJHMw1O8jLMK3pqGzlG/IHHdhyTDHEFJnul/puf5RAcLy6xkyK9zexpGPr3kP86
         pKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHJ/R0feynNGj8QdoGjP9CKGY2sot22dywRiMScOe8GWwXx0IpEi9W5+aRs36dCKni83UvU55YncGbN76br3esFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0AJrSzmGD5opMCFTyxb8M6L2OPbpazxyCBTl9xp6y5hVi0UGp
	w0UDyJ3QUbR2tw/r17hYFtaw7jn8Zz9qJdRvtzB3sLn9g7svdNXI8E6GRGPm36ZKLDSHKf6wrJL
	z3bSS/K4XZeT4hipfRdxpdtDeH6znzSY=
X-Gm-Gg: ATEYQzyPLA52QNFFMYYs0OhsAqw2BEQL3lMxxk+z0sZEIDXtfltfHdw+PVgYXiecA7b
	HVTFQDD/iLOrwQMnM/zw/b1V5dyhV42vaXw6pPosEXJEHBcpFnHGX3P4M1YOBC7kfkTX2z2Hvig
	sVF15xjsk4h2XfzBhOYMDVTWFHL/l1ZM5j5il3ycDIssWqL8t1TMgAkImMhm2hLo8TjtZPAMRFX
	viqG3wcpPk/+E21Bf15bz+jV9jFEzaJ2vZwEaC+5GU7Ri/GBNJnOsCqrxJU2q8kTXqq4DVIpjkN
	r34qBqdAjKbWFXBK9L3wvJ4EIzThM2QNiHxaI32rSgeA1qf5mY6lStddKVmJcVJ+tH6QpR8=
X-Received: by 2002:a05:6000:2403:b0:439:b991:5c07 with SMTP id
 ffacd0b85a97d-43b527c812amr7998467f8f.40.1773869432250; Wed, 18 Mar 2026
 14:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud> <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
 <20251208-headgear-header-e17e162f0f52@spud> <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>
 <CAD++jL=J2UpxQSNrZhCMw2fJ0umM8NRtNys2zMBouAFBoK0m2A@mail.gmail.com>
In-Reply-To: <CAD++jL=J2UpxQSNrZhCMw2fJ0umM8NRtNys2zMBouAFBoK0m2A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Mar 2026 21:30:06 +0000
X-Gm-Features: AaiRm50eA_D4E1jWsVINHhsu8y7aHr1MUbAlUX-x9rRsI1Rjgut52QbZHmen1d8
Message-ID: <CA+V-a8vNeJdbjJ6K9QkedHgAprC=Z0ckUztwe1ZapSiqjPKEsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29826-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.559];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C80832C30CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

On Mon, Jan 19, 2026 at 12:10=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Lad,
>
> I think this back-and-forth must be a bit stressful. Sorry about that.
>
> On Wed, Jan 14, 2026 at 9:53=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>
> > > > > > > +      renesas,drive-strength:
> > > > > > > +        description:
> > > > > > > +          Drive strength configuration value. Valid values a=
re 0 to 3, representing
> > > > > > > +          increasing drive strength from low, medium, high a=
nd ultra high.
> > > > > >
>
> > I got the feedback from the HW team "The RZ/T2H drive strength
> > (driving ability) is expressed using abstract levels such as Low,
> > Middle, and High. These values do not correspond directly to specific
> > mA units.
>
> But they do correspond to *something* electrical inside the
> silicon do they not? Then what is that?
>
> I think it is just 1, 2, 3 or 4 driver stages.
>
> > To determine how much current the pin can actually drive,
> > the engineer must refer to the electrical characteristics table.
> > Therefore, the drive strength in RZ/T2H is a parameter that switches
> > the internal output transistor mode rather than directly representing
> > a physical drive current.
> >
> > Consequently, expressing RZ/T2H drive strength in milli- or
> > micro-amps, as suggested by the reviewer, is inappropriate. To
> > accurately reflect the SoC's hardware specification, introducing a
> > custom property is essential."
>
Sorry for the confusion , there was a miscommunication regarding the
specs, but it=E2=80=99s all been sorted out. The drive-strength settings on
this chip are 2.5/5/9/11.8 mA, I will represent them using the
drive-strength-microamp DT property and send a new version.

Cheers,
Prabhakar

