Return-Path: <linux-renesas-soc+bounces-32673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJO6Ay74BmogqAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:40:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E58954D86D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9183F305A257
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D28C3CF024;
	Fri, 15 May 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSZ9Vt1n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655DD3CC9E2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840435; cv=pass; b=EKk/rNqSjDBtYxhE4lkqNBCZHbYzXX+j03ZkJ/UyOghy+j4KdzZR7LY99B/2gLOohfTYDjh/LdQgVYxUCecYFHBC+oEeni0npaugwBo7zA868SI1PeyeZLzFAkKoRk2n8GRgIk+XXrm/wHvVykDqu1zsLhn0C5EmOOAXQCLAOsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840435; c=relaxed/simple;
	bh=GzrjWv00pV8g6pjr5FIMQp5/COnJUdT5thugdZxFpFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPteeEIgWATtWEUvmOu2F/rp6qvefSXuTUfEdSSicYoFn6Ncjf/m7fmy/F7G1q1Rtmkf6zc254qCCx0XXezIxOSsLQzHofLNlObcO0HhL5syu8n3UuUDfJCcA1NapcqkbNYN8MpG/irNWeoyDpmmSWh7hFr9IGTqD1g0zjx14xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSZ9Vt1n; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so3762323a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 03:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778840433; cv=none;
        d=google.com; s=arc-20240605;
        b=c4nT/E6+/cR0Ep0qeUvBq35tLJBvt1otIoPvcgMRfMEZKhB/5eiIUSTKFE08rbD2qc
         uTPAFn4GfzBt4htSJcUV8+rsNJ3RqRstmRoNvwc9Cdua1Fxq7XNvrvYg1vSHOMCUOJMz
         RTIpbj/Ep3fwqxyesLuX6LigGRO7MBjcuGm94I8q0Y+J6r1p2Sl/cJGbp5otvQYRhlmq
         7sVfzmbBd5tNG3IrcVmQ1q8b4+ZPf6jOmRvF0F90HS3qMpHvcJICFgtoBL5rq9yBneJu
         pOEqWK7R7aTjCxaK2EH2O912K5OsGJXZ5ypGTwjv+VL/+VSGFzvV/Qgvc3GcmCsxrMYa
         arxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        fh=POgVxXGs1T/Q4HFYd4/XfrLiz7LXad/RZ49um7z2s90=;
        b=OO37N5KVfFTBzicQX2E2QBGgY3wDfzPjhUursIfKhIgCg1o8Vs7jPj1RoyH1GkjICW
         idoUHrtY8c9H7GiFnOwmxRoDIMLvP0vk5+ficBTsQj7EgD7EzcWF8xat7Qt4+oRCklK0
         UYHmwD4wbMbTHamv56qe/WUnC6cMBIgEItX46QTYjYXnwx8zhKI9yIucMjH0ZaEm19aU
         pLSfRsvWIwC5DMLZwY2EMj0tZphp5VDfzMHtwHrBamzh1BSOb1OorHln9fBWitcY9oXF
         E1NLko9/DTEqM3MXdIj0RFCpI4R3VuS7Ek1rbe0sUl2dM+KGmGQOThKdNmJViMqkTQYf
         g8cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840433; x=1779445233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        b=jSZ9Vt1nguhgjqU41EKiXWmik5wjP5Ua9CGnLSMQPmRYyWHABatzlnrdGzbMcyWZ3K
         wGcAZjZLBkcJHPvJKAQq0zsGFfM3A38mZq112WfkOmNM+zc2zmIJ7wdPICVI/Go701nP
         tuyqY2g7W2UWRRAv6DQq/DQeLJd4eOTQ0I2RKkx8QcYfabeC4p/elDg9BJjlFEim9Q+S
         +jLwzrXgCn8ykQJywAl+sRg3gSHxrZmBmZtKAah1DAyJbzvBFNNhk0lCgBpg3m3Wmlf1
         X0AnEULfdcYs6uydjezJMDbicGJPBF7pcgd1ttbWCQUkJMstOSHmWt5f2bdXTxgBFrEu
         ZEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840433; x=1779445233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qw/k/s3Ldfl3EGSjsI6RZyS2GOUqWyHf5cmK/4bjNdE=;
        b=IwtVlDEq1eqaDobvgxD/V4vdurI+bl8GRVcls6rXWmPFksjTkoNH5VZdBmyCTUW+oU
         v12Cb7GaP4q5g4I2MmDrrDTI8YgxbKVzH+MR7DYACLmYyKZ6nJISiyi2RlYGwCKngCG8
         tfmCdifJ1+7r3EiIeEucSnWzY74jkVmZ2uxmoGCzbE5ftIt4otOZJbs7qaLl86J7MjML
         Tlg3kSV/e//TxhQqqz/SFTs9fhg0s/AbJjpEUY0VsbB3G7FqmtuJtrzCX1lxTdVaRcMp
         G85sAaz+bkF61DSt6DJa/1An/nH3/XiXwZ32BNqbZa+cYWTBrHkIYuAmEgqDT5Ukikj6
         vXnw==
X-Forwarded-Encrypted: i=1; AFNElJ9oOr3HwD7/J0YucJIi2BIJScgRhu7skaNJYiet27iLDup4nLOiHiep29ZM5wgVb2a+S8K2Xvy75V4E+D6YYRL4GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdvSFcf0PcBb/Tqm1gqaDKpZh2HgLJhyM/ij5isYk7M0AkhTWP
	ggi9lEtJCwx7/itNzyv+Evsgitn3ay2Hqmy+6ysZBhPh8rF2SKneRIVzuuNLHRZHoHN9ON3nz3D
	m8+KXvpIlsryxKqSu75Sd9LjA6bUiYX9sdQGp
X-Gm-Gg: Acq92OHb7CdhWTsv3JRnuuNzlu1kHAyqvQN5BlOD+T4DqnuKMLAZvKOQnNx8dmkT/Nl
	mfV3CkC6JpEMzLLCy95NIu+ZtQJ25LSlCFZR8U8av3vMQOef7v1ADpzvOKJrqhOpmCaFdc8HY63
	U+39kz5M96SHp5Rux6lA5aCzROvpOtNn9qTyuFQvcATbJecgs5wXyVrKX/sRCz/VygWA2sLsruQ
	yl0XhZocf0DBLUJPH6ZMfRTFKzV8kjmqUVu/bhCKuvdQ9ie0Ew38gVXP8CAwfPgd9tUpP/CXxYJ
	8rIRD1Mo+qmr6lztFnwNVOQ/MioBNG1SJ2E7Hg==
X-Received: by 2002:a17:90b:4e86:b0:366:527:3c9a with SMTP id
 98e67ed59e1d1-36951b70055mr3660995a91.15.1778840432444; Fri, 15 May 2026
 03:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com> <20260515-transparent-calculating-ocelot-bdec04@quoll>
In-Reply-To: <20260515-transparent-calculating-ocelot-bdec04@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 17:20:20 +0700
X-Gm-Features: AVHnY4Lh5KBPxyvblSfmA-i77za6m-1v7JQnCckex2TWg9DTYm8lzeb1pEDNacw
Message-ID: <CAABR9nG2YFq2kNsXbCe-7XUNJT94rUMBz6hruC97aE6JFSP9CA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, 
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	magnus.damm@gmail.com, perex@perex.cz, robh@kernel.org, tiwai@suse.com, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5E58954D86D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32673-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com,linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Krzysztof,

On Fri, May 15, 2026 at 1:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> > The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled befo=
re
> > accessing its registers. Without this clock, any register access leads =
to
>
> But why are you adding all these clocks to sh73a0 as well?
>

The FSI IP and its clock management seem to be architecturally identical be=
tween
these two SoCs. For instance, both sh73a0 and r8a7740 use the exact same
register address 0xe6150084 for the SPU DIV6 clock control. Therefore,
it's highly
likely they share the same bus dependency for register access.

If there are further doubts regarding the sh73a0 internal bus topology, per=
haps
@Geert Uytterhoeven could kindly double-check if this SPU bridge clock
dependency also applies to sh73a0 as it does for r8a7740?



> >   - CPG DIV6 clocks (icka/b) as functional clock parents.
>
> You do not need to add parents of clocks.
>

I see your point. I will update the description to list icka/b simply as
'functional clocks' instead of 'parents', as their hierarchy is already
handled by the clock provider.



> >   - FSI internal dividers (diva/b) for audio clock generation.
>
> Internal dividers do not have representation. They are internal.

I see your point. What I intended to describe was the internal divider
configuration for Port A/B within the FSIDIV block, not separate clock
representations in CCF.
I will rephrase this as:
DIVA/DIVB divider settings used for audio clock generation.

In v1, I brought up this FSIDIV topic with Morimoto and Geert.

>> By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
>> In the legacy implementation, it was handled here:
>> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
>> Currently, this has not been ported to the Common Clock Framework (CCF) =
for
>>R8A7740, and it resides in a different register range from the core CPG.
>>For v2, would you prefer that I implement a small clock provider for
>> fsidiv within
>>the FSI driver, or should it be added under drivers/clk/renesas/?

> I think it should be under drivers/clk/renesas, but Geert ?

However, I haven't heard back from Geert yet.

> This cannot be flexible.
>
> > +        - fck  # Main FSI module clock
> > +        - spu  # optional SPU bus/bridge clock
> > +        - icka # optional CPG DIV6 functional clocks for FSI port A
> > +        - ickb # optional CPG DIV6 functional clocks for FSI port B
> > +        - diva # optional Internal FSI dividers for port A used for au=
dio clock generation
> > +        - divb # optional Internal FSI dividers for port B used for au=
dio clock generation
> > +        - xcka # optional External clock inputs for FSI port A provide=
d by the board
> > +        - xckb # optional External clock inputs for FSI port B provide=
d by the board

There is also an ongoing discussion about how strict/flexible
the DT clock constraints should be for FSI in this thread:
https://lore.kernel.org/all/CAABR9nEhOTz1-0NmCMTbz=3D-+782Pto0yovSQhBXrXqhL=
wMg80Q@mail.gmail.com/

Geert and Rob have already shared some opinions there,
so it may be useful to continue the discussion in that thread as well.

Best Regard,
Phuc

