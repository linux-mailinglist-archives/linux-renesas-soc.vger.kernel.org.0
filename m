Return-Path: <linux-renesas-soc+bounces-30848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPVpErGnz2mZyQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:42:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A56ED393C87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B41FC3030B2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 11:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164B33A758E;
	Fri,  3 Apr 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqGDyEQz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6381F3B27E0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216395; cv=pass; b=qspwttFZYzSQiRoZ+S2Jm1olA8zDzv8lnjQKpeiA38FpfIrwikpXoVvNVx2MEV+lJVZZABJZ97DDmxqVzPo0IoJnq+VHnY34RyHZ1ZYCR4BL2NhDE07uzs4GfkCXCNns80G/KRs+ZvCyiSCyPfjNRh7LsV7vDHkt/6sjEiO2pv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216395; c=relaxed/simple;
	bh=oq9iTLaWn0Mi2Ox9VNlSR3V+nuU7h8v5oKm2k62UzzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mx2zO3lIjk3jjN/ooiSZQpGZDnDqJhrUIikpKE6rwYldNP+tOMJQPh7z7E4EdqiYemSmqzMnA6w0MgLBPUOsT3JOouwNoYuktWa4koZkXPx14XQA084XitR89heCzvmtNYD+WHRjzr6fVzIZrTam0YOZXmEL9rkKQMKZqX6RKf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqGDyEQz; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c766a95a72dso1093297a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 04:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775216394; cv=none;
        d=google.com; s=arc-20240605;
        b=RCS3sE2SR+E22Bf/drDAkZyJ2mXuVo8wC64Es2AH1SGRy9hNE9S9sDyb2GcS6MzZ67
         3htB396wZmeNfBn/H5KOtOu2XqFyBYQYleDD47nVXOiWnmBqRuh0ZFsWG1CgRM5MTRFY
         ktQfcZDA9pwk/dXqpsxu0FVykXJFd0gTpkT+YXkrwZLpfGoKB1ScaAhvb7WS+XgxakkV
         z8zsVE/1UOGx8sI19FUae1NtQCNNLKPtNGQfY1NkP7vWKoqjMg7XMvBGkqGT6RMurSHK
         BIWuNvtif9OrJr0J3wPIEDaF9u0ivjeF1vv5p2JWL84Ry5nSA2D8Gk8aVdapXaNNpcJw
         wXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tmV4s8r4/9yWsoIHXbmcRcUkkyGttl7g/qLvdfyGD0=;
        fh=gdlx12qzeYbOS18vprXj5y95SdN32Q4jTx8FPh/m0ys=;
        b=fH8x2kE8rz5rTTNeB3tsrqzuZ3kIB6QpRwSoRWE02iVF2Qf3wIQQHgigW3WXLNNp+b
         0jkfWUviv28qopVR6ZJBlbE+15raeGp1gYgnCPgQ0GBLzIsjCoaPsjEsaAbSCfKUeLc/
         TqzxMXC5U+pVHSy4jFzSkjbBBAW2LBdsWbSQx2StdhXx4AB3JXe50ZrLyUUH3d2k1znq
         oCc0Yst5heG4M/5vv49HyNQiX15RR7QA3DWh9B4agIRt99kBQzVSOGTBUJk3QkpwffQK
         /9KPNg2P+iAkYJG0Kv5CJ43Iz0Fv3Y6/Bqqck5NNqgVco4q7lcMNquME5IfZjXzZNLL1
         /TzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216394; x=1775821194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tmV4s8r4/9yWsoIHXbmcRcUkkyGttl7g/qLvdfyGD0=;
        b=SqGDyEQz9PlBZc4JAULlRnbdccH0rXNHVXOWBkF3n7M6LQ5GEvwfU+QoBwhRAmtTSt
         CLbx2O04CvYY7kx8cD30FcQCXlzExKrEdkbqyXZwiUVaBCtg+bNjG7ECQw4pFr8e6lhP
         Ygd/sI6DrDxC0Ggi3Co567oy8qM91nlnpooNipd4LKnwhNC0ouZP40uuPSqzmpEoxMtx
         Zl2645Kt9//trpKLFDke2+Z4uc9whhNh6YnO2rpRSeVs++D7pZQlDlNjHRDD+EZIwLLh
         muYXmHfYX1WLF/eLGlmmbQDujye1EYyr2s1Ig7O1wllfMbISXhCGNCnLYFx5LvySUpN/
         VXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216394; x=1775821194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tmV4s8r4/9yWsoIHXbmcRcUkkyGttl7g/qLvdfyGD0=;
        b=CTuqR13V9oH8Hlac40hHETylyGjIgvFVQOd7KTWuIGh2zpLpxqoPYneKcBFdXrrWuj
         qLpXDvmBbx0rqPVZnzHaQpNKBDA/xVpwh7iizYCHWacxZt109uDFXUfAII4+r87ahl4K
         U3ATT3InlGluvmwm4cSgO3uLRlZiUT7jnGzHYPRcWiIiHPL4I4++08vPtZbJMr2GetSe
         qrYX069XPp4AHqi2zpISpYD2yxkkw9eCK7K2NyWp6UVGZTHuh1fhR9HMnYhV//rrKr7H
         IpdV3zxeGF40gJez3XGdA/Uagv80g8LDpzEy7qK+i0wO8RLeW2W+z24fynb5MR/TGqQ1
         GnpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfPp+8mE+1QOZpYN+AetcW6O+mlJCmFEvr+71MUsOaAfJik2PcuZDdl0JnlQsQH3qZW9eXWAw+GDv2InOkGN7laQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVrjeHdPhWKRpUvrFPKXZWP16phKJsNMz5x16cwXv3guLVglh
	TRMlRZNOIAsk3XivkYdspL/ZfE0fVGOaIjz5yT8lj/U3MwHgixlgnnJJmvub7S88dBZ1t4S2tKJ
	dBXRpPkfpdl0GPyTBnS6KvljQdcM/Jv4=
X-Gm-Gg: ATEYQzw5jiFlhYWsROa+69QTbJpRFQ2c08vlsr87dQFUB7sy4Cs6BRG1MB7JnVG8Vj/
	UV0kq3sG05ugyykpWaTxWR5dIeKvd8V9uWVCK16+ZjcG1L9b/7jDubhXSiSyAZsQPrpUPh4uQ6i
	RPsXguxwsPBTTarqTpZJm2eZHfjq5oTXSEtlTfJG+ierLOA6r5RGZDH7qJTWjocpq0teto37BUo
	abQjuhGMlR4XrBlXWPz2fTmHSuS2YHV5wupCEMt2KZXz2RrqZSwCZoZ/pVg4ejdxczGy/1da/OY
	p/KFA9SJPlI4L9cPFp0VfFfxlzxP1T70NbSCXA==
X-Received: by 2002:a05:6a20:3952:b0:39f:29ab:b35a with SMTP id
 adf61e73a8af0-39f2edf4f56mr2585039637.16.1775216393693; Fri, 03 Apr 2026
 04:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306104025.43970-1-phucduc.bui@gmail.com> <20260306111912.58388-1-phucduc.bui@gmail.com>
 <20260306111912.58388-4-phucduc.bui@gmail.com> <ac37o-N5lqFMwDCC@google.com> <CAMuHMdW6y4MkCYR-rgn=FA38ZUE_X=3oQWNOvfdyMo=D5_xoxA@mail.gmail.com>
In-Reply-To: <CAMuHMdW6y4MkCYR-rgn=FA38ZUE_X=3oQWNOvfdyMo=D5_xoxA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 3 Apr 2026 18:39:42 +0700
X-Gm-Features: AQROBzAplpcBbMUwl3WSWUof84440c_lG8zw5oOUTL7CqNiz6_JctFCHXOYYFdE
Message-ID: <CAABR9nEJBc7Wqp1r=d+fUES=_j=3UWRsi5bfxgJSmJNd25yPoQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] input: touchscreen: st1232: add system wakeup support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jeff LaBundy <jeff@labundy.com>, Bastian Hecht <hechtb@gmail.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-30848-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A56ED393C87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry, Geert,

Thank you, Dmitry, for the review and the explanation. You are
absolutely right; I realized the I2C core handles this automatically,
which is t=E1=BA=A1i sao I dropped those changes in the v4 series [1] as Ge=
ert
mentioned.

Thank you, Geert, for pointing that out and for your support.

While working on this, I also noticed similar redundant wakeup
handling in the mpr121 driver and sent a cleanup patch to remove
it [2].

[1] https://lore.kernel.org/20260309000319.74880-1-phucduc.bui@gmail.com
[2] https://lore.kernel.org/all/20260309071413.92709-1-phucduc.bui@gmail.co=
m/

Thanks,
Phuc

On Thu, Apr 2, 2026 at 1:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Dmitry,
>
> On Thu, 2 Apr 2026 at 07:17, Dmitry Torokhov <dmitry.torokhov@gmail.com> =
wrote:
> > On Fri, Mar 06, 2026 at 06:19:12PM +0700, phucduc.bui@gmail.com wrote:
> > > From: bui duc phuc <phucduc.bui@gmail.com>
> > >
> > > The ST1232 touchscreen controller can generate an interrupt when the
> > > panel is touched, which may be used as a wakeup source for the system=
.
> > >
> > > Add support for system wakeup by initializing the device wakeup
> > > capability in probe() based on the "wakeup-source" device property.
> > > When wakeup is enabled, the driver enables IRQ wake during suspend
> > > so that touch events can wake the system.
> > >
> > > If wakeup is not enabled, the driver retains the existing behavior of
> > > disabling the IRQ and powering down the controller during suspend.
> >
> > I do not believe this patch is needed: i2c core already handles
> > "wakeup-source" property and manages wakeup IRQ.
>
> No, it is not needed, as mentioned in the cover letter of v4[1],
> and as tested by me[2].
>
> [1] https://lore.kernel.org/20260309000319.74880-1-phucduc.bui@gmail.com
> [2] https://lore.kernel.org/CAMuHMdUqiaP=3DCOTkKU_jK6Hdii+YJ5+zXnxFkOOnhL=
ri5NakTw@mail.gmail.com
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

