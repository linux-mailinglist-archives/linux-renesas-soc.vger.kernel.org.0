Return-Path: <linux-renesas-soc+bounces-30429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFdzHL5axmlgJAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 11:23:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1A342778
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 11:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AF0D308FBE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD273B38A1;
	Fri, 27 Mar 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn6UBzLC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B533AF647
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606629; cv=pass; b=SW+3XviGuuct/5ciRN3cM1pdf/yjlMt+M6ocKpQWHTVLwTho6cqvAVWEm8yW+C2YCNw/Br+HS/GdHDuHPRijfQVytJpxwg0o9T3Y633higP2ETiJxAVk58LF/AdagsHw6KnpYmywdsyUr6mEmR0PjA/7e46S4zMDK2JfwaEa7l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606629; c=relaxed/simple;
	bh=qS2Q9O7bG/xoCokg+S7YRoYhx+f6F9kSCLDT8bvQ+58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2BrgfCLUgbCak1yCaflr4uSq2EmJoi7dIk0xiu3O5kBk3Yyl/FwofCggXtELOMUWVOIV9TmH0DxeFJn+MbNH1F3VEc9GIzOwF8B54bo6tRfbipBhfcKV2JzNGGRu+5QpismqmJIG+H/l/WoPifezc5QSggyIo9Iwl1BiJ9gNSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn6UBzLC; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so14301475e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 03:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774606625; cv=none;
        d=google.com; s=arc-20240605;
        b=D66zMifWYCucrf3FItPR7AOgcrWCck+yy4Wc44jqzrGFW1oOYHgyjMvdotpjetVbne
         yD4n5d9W7BFFeAhPNKt4QpiMhEM8saYOEYmIJWwPq2ysVs86q1VjJBdh4MSmkcPUzAxE
         BjhiADBJqJVn81xgtQVFWBgYVBZzG3QeS+xTBYmzpN1dQXg7gZPMf3HdUuMXxVnTIbR3
         fTufLaRfpgonukCG6jf4oCHIE96ZO91whLSepEnTbChlc0Jx023Q7PKYPspii2Z7ZWVL
         rAXf881GfHo6M6B16ZArmz3DS8IiPEudm49MUxHUVTWimlSVtixPYa0qkK2AJWeNQ34+
         J72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        fh=tdW6tn8A8URU1bzCCLrG+GXQdY3OyoPggVv38FDurXA=;
        b=CDPLF2k7+YQEaoGwtRiEi9UcE0QFsfWkgOFDc7Zlb1wru4oU3Yz13NkfO2Y+S/uTan
         ZV0fqarLzM8aMPuOM9JO3Rqj3iQ+RUnn35SL28UESAvVboiUGb+WuKjG9UmQGUlyNTj+
         rvfbtrXHPdOWssL5QPoCJkm2WR55Mi613GEZ8sOKUFDgenR+h2zpO319ZoPf3THyvwnK
         CIxSZSEXXcsxFfJE4bse9vt9ORIhzaRP+N4sIi1XfDc5AVljG1gYSkv8YT0RAjv+u1KD
         OSzS62BOfhBgy6N/xfqKyQeS718kLKWZ5McsOnslOU/PXmmLV2ArUGLEefcJ6ORpaMlx
         Nlhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774606625; x=1775211425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        b=Qn6UBzLCj1XJ+cF8re6vgTipiZbzuYeTwOyEJodUpmiQvQ4Wp6yeVkkFnfrRz/QwXW
         afDlZ7QFYyFQxk64enp+IM3lTYwA2tlVfk0f++Ts/mUu+8kUksoLhZKTzgwNWeVZb93o
         /unh3umxrVCU7ZLRR2Qh7YBoZf9+gpbMDyzfiyRP4gHfCGUY09q41+agfze/tGuD9rfl
         HrGtT89aKSMZIuh9inOkK3wuNnKUtcoVASi++39J9agqsmnj05YZX2tGoC415gaKeE+b
         9dE9tF+bl82RqxlivYRThHsyjYZLkiL75SEzittSVqBx2djmEWrRH7T6O3YOduAIGqlk
         3a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606625; x=1775211425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        b=gBhif2m+11Azp/VLibn0Y2YSSDgm7UcNkBv7YPPqfnuK6T52eB1ps+m0NPSAvCo6Aa
         f/ZDytDmZixxTuzgmYiZO1RCoW5OLDkPwU/kh50TIE9ytpPhXySrsgx6gegdNiwDWFbq
         cNv9z2s5hSuLkMYDSInPyicjMq1mQQfEEUtqP1MrBYrB2O51qVzBwJEt8GKcc7uEDEK/
         ssfZ9NpRA2mFyipC0YoTgQqMWeCim2CX7zNOW89ZSEEsP4e8343FicprEiG0JWBJocmZ
         YrsZFAjG9FyWCfLIHZjDQSboq7VN0TSF0i3XIJf1UuWfP+rtHdnCCnf5GCK4XZ3XCfe9
         DptQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXSsVSc5kT3mzYImkoe3ZxMxtLhadjwTCFD0H3CyUCuCueUmevj48sZhjhIsD1+1v35jEuKIpn5YwZjiMCfoB/rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ODv6N/UObe+9c24AySpBhh6Czr0Muh1OnBPdYKKmcbuOWVl9
	0D+vxuFRnqfJ3uf7eUHz/2fziLlxJdqvBR81ytUjANMjTWoksDPmrMaB7zKNxeetoTC8MM9wBFg
	i9jqJ/pJGI4rTCQxBV4suH4j+k0isQXg=
X-Gm-Gg: ATEYQzxM3WBRluhDQiPKUFWxmpMYs3rOLUfTnbfeL3awFXjv2ERW83B4McvOqvXickb
	yDwbzGpFokqq/pym7x9T9SLIDiqyCnxDvdvaAQO47sba6rK0JlOCYkdt1hWVKI2YKBLFb2w3kK4
	Yj82rk758hFMcikw5j5i55cliiy+KeHCfKnmzN4IiCDYRyDr/F0wZhxKlPGYZdUzfZNLia6oWoW
	vIegKF+IwxWNX3Ce0xNLOwgT0sf/RhIHCrmo/oAHniVo1F5srjVZvkQGAPRw9egD4RJeCNAovbD
	u3cPpiw9wk8ESbdH+QcHUtEqi5JbMjX8zHC93sZ6ImhpJxx08+eNNpzWtNSYbWvc3ddOpQ==
X-Received: by 2002:a05:6000:2c10:b0:439:bd70:610f with SMTP id
 ffacd0b85a97d-43b9eab26famr2859930f8f.44.1774606624710; Fri, 27 Mar 2026
 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
In-Reply-To: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Mar 2026 10:16:38 +0000
X-Gm-Features: AQROBzA351V4-u031sU_LWBz8AfXD44IpEZr_5GEUWRa6g-PutLuycoQAmmlEFY
Message-ID: <CA+V-a8sRgOePfrEG2HfMp3XnCYXRay58s9fWjjg8yLjqYFvdnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30429-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 03C1A342778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Thu, Mar 26, 2026 at 4:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H So=
C
> > allows configuring several electrical characteristics through the DRCTL=
m
> > (I/O Buffer Function Switching) registers. These registers control bias
> > configuration, Schmitt trigger input, output slew rate, and drive
> > strength.
> >
> > Implement pinconf_ops to allow reading and updating these properties
> > through the generic pin configuration framework. The implementation
> > supports bias-disable, bias-pull-up, bias-pull-down,
> > input-schmitt-enable, slew-rate, and drive-strength-microamp.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Updated commit description
> > - Dropped 32 bit reg access for DRCTLm registers
> > - Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
> >   helper function
> > - Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
> >   switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA
>
> Thanks for the update!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
>
> > @@ -54,6 +56,16 @@
> >  #define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
> >  #define PFC_FUNC_INTERRUPT     0
> >
> > +#define DRCTL_PIN_SHIFT(pin)   ((pin) << 3)
>
> "* 8" sounds more logical to me.
>
Ok.

> > +#define DRCTL_DRV_PIN_MASK(pin)        (GENMASK_ULL(1, 0) << DRCTL_PIN=
_SHIFT(pin))
> > +#define DRCTL_PUD_PIN_MASK(pin)        (GENMASK_ULL(3, 2) << DRCTL_PIN=
_SHIFT(pin))
> > +#define DRCTL_SMT_PIN_MASK(pin)        (BIT_ULL(4) << DRCTL_PIN_SHIFT(=
pin))
> > +#define DRCTL_SR_PIN_MASK(pin) (BIT_ULL(5) << DRCTL_PIN_SHIFT(pin))
>
> I will drop DRCTL_PIN_SHIFT(), and replace it by "((pin) * 8)" while
> applying, for consistency with e.g. PFC_PIN_MASK() above.
>
Ok, thank you for taking care of it.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.1.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

