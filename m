Return-Path: <linux-renesas-soc+bounces-34203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LXVZA7jzM2rFJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 15:33:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B16A0970
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 15:33:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cV2EXpNN;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C199308BE10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 13:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1443EC2F7;
	Thu, 18 Jun 2026 13:29:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99BB279DCC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 13:29:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789349; cv=pass; b=n43bMWQuIDTMZ9m+J3vBlxD478iq1L+/5qI8oZJwND6J6W+EoMo7zRtW4OjC6VjtL6bRLBsx3e7/1SftcSEB1s5e9KKUKlKsCFjX9LPA0jWNzpl43QZDGNKR82H5f+/ABKBPAYji+MimrNSdAy4XbSLblYx1LW+MO6WAaBkcnz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789349; c=relaxed/simple;
	bh=Odn8V4Jyj7HSHR6zsb+AXJEMe1hlNU8CNhlMB76w9UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxRD8ulHvtQC2FyMdfQtY1ewwGyXJNkT9ICBMrpsRodeoTiOWh/zuNPH7A+e05Cxz4ma38robKJ3U2Pn0YngmoxLwgh6vizgWaJ3e4FmKwZxb/hYkxOhOQauvNCPngGvh2WBlbj54mW5HxPWm6v17yGc1Szsl4bA08VfIRePFIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV2EXpNN; arc=pass smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso10935065e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 06:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781789346; cv=none;
        d=google.com; s=arc-20240605;
        b=Uanwm9qcUcXFxtOdnWKKMXuJh9VMDsL8YmJBCkijOBAqNi06ckiVrf1+P0IsS2g1ag
         X2/3c2Rrqgxn7IbIDkLhLYKyEtw0xu/qesHXueyGMwPOwyyFv/HzPrA5cT/jRTlxIHib
         L5givwsR+kV320AXHja8qV0h6Gk4DmJQN0WSl/xI66mS2QpEgGbc3Uym5goEqnV0e0eU
         jUt267Q1yn/h0rvXny5K4/pu9aGABnbaThYxg9VSbspMgY8MavIb0voVpZppORMgJ8MC
         fMusOkJyjOnx7KBIHc5yqF+UkcdMdHgIX8HaX6tDOapi/y9dzI83Gc/39eprt5uhRXCS
         Losw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3QY9vRVEn5lFujWnbDukyrJMoT8zbIIk0s1XIR+6sY=;
        fh=tMQTOST4U0IHjhuOj8NW+9e1uxZRm/CjkCI2YZUfjQw=;
        b=YK4aBHR8caa7Dphw/hCKYmHdBDJvEA4ROq7IQjbD+M9jrrEKzrmitj99jj5nIVH1Fm
         NgIqdqzTCfeCEy3TH9f8eERYSzNWUxkSG6eEmFkrNEqGbMDGTxXYDy64Xr6gyaTKm0uF
         MzMDPETbp/zSIJFyCzmPnESLsrzE4D1tGYyZKIbYVqazsS3/r4q68uJLxULWSEDCpiNl
         jO6BHxtsvHDRk+YTCNh1i3cAPoUYw36XIeGGouiCJ/Io+AOH7LVqMGpiBk9BU2VmLnxM
         LQSMBmyNTg3Y7bN5+5Dfuf8MUGRqqrYnUlOv9VuMmEiQiuJPIp0tkXnBo203yKqyrBmd
         Dhhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781789346; x=1782394146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3QY9vRVEn5lFujWnbDukyrJMoT8zbIIk0s1XIR+6sY=;
        b=cV2EXpNNI4ws6wXdj7IVEfDHEHkFelEga4rqKEfuAoHNVuUel+PqNbZa0Sd9ugPXHS
         nGrUge/8C+1u/UZgN51JUMuT0jej9wLa1FCIMClEf+G42AEA0SsigrXUOav3CrkykmKE
         HX2EdTq3hbpWY7nqsM0kwF+ug9AmC/tI7q4O5Hnr+KnWcx7jSV7Ppe+UV33goRubKnwC
         a8IcRDHC6JwhFc/0ugLK1OxcnRMuX2HIbeizWRe9fjN7wqOAaR+YMgoGpeg7yWqzD+/L
         vGHHoPYIlpMrTJ+2LW5/fyPVOoQ7cKMQgxUKTMORF5KcE05a1iyLiOu+O6yzj3XCvCeh
         8e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789346; x=1782394146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3QY9vRVEn5lFujWnbDukyrJMoT8zbIIk0s1XIR+6sY=;
        b=rKEbFuvBNDGvmVf0qwEx5WVCoMZAe0Q53qyJgpXbSguAybzVo3pQcnOlzASMFNEMdZ
         ZkmtH6+FghayhSRaOKl4GIwu1VxzUPtcM7fhAsfbvL1uoqr4znJyCarcdvzNya93dmcJ
         eIh2Un5uXLzTo3VA/w9Gn9UxcY4zp/PvXu/oIBzPkFdIxyeXPBPfXBdVNFNb0B3ncA4w
         D1AhpIKfe5MTHvcBBeOyLl8o+ypa8ESv0aJTBnX6QdcvAFPJ2ZFlo4HtMNlLRiBTQCmq
         BtSYQZL38XQo28z26PPsxcnAaj0GnwtLeBZbWEfi5QpDF0TIl9E++/5pwyzD/JnNXAaq
         uJnA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ca1MRHzpIWcjJD+3jYbv55MaWkqDdutllxmD21nJZDSL8hCYuOWnSSRHWeZGIKFGt/h2r/Wp01x+ICW1Tl0VJjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfe1YLqplo8KpNxFE7yhxIQTxyq2qHWiOxu+MvTvhhLclI6VIX
	KGiVVgZEvPthef42BGNIfmeo4okc9nU+kk76tJxegvvi+nlLmo+pFCdNmBaDBQiYjO9xflR+/L0
	J2uzAOgzB6Au6ThzC7OFWhdqKU9LzPd5oVFMRDhkLSA==
X-Gm-Gg: AfdE7clK27TpYUtxwx0HWLM/AWB8xF96BtEQaCuj5NC/pgBLaZkdeL54i9ch73fbEkb
	MMDcLaGEQHltl7b073ZEW07YsW8CGDw2CEPKNlMnLWNwZ4C3BqQh9GpnHd1UzSLf1mX60DkqhmT
	pit+U2O0uJLLvP9QcroVqs0Clbr++wYXFRBt2zz5Y1+Fl/MbFbrQkB28qy7m9ckILXddJcbjD5p
	5ePehpOL9tC75+k/ynMR1m/49YNQNZZFpqjc5NnsMvuAZ/kq54xtOqobhpx5FeELIlzMxZ8JUOH
	EHMNTjr1I4GF9SXFEU9c7VFVpTiK1Jx+McPVyQsFNCAkdbkDFWtoMvD/FaIKKlcUvzkfSr8bkDY
	VzjtFA9b/MK5A9JOaHHBxiund2A==
X-Received: by 2002:a05:600c:4f84:b0:48f:d1b8:9ab1 with SMTP id
 5b1f17b1804b1-492381f0ed0mr59299565e9.9.1781789345605; Thu, 18 Jun 2026
 06:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajKAqn1F074JJazF@shikoro>
In-Reply-To: <ajKAqn1F074JJazF@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 14:28:39 +0100
X-Gm-Features: AVVi8CfPiYA_UbaiFhMeEgi8lZFPPJfpzknvE_2jphmqJ4vHnB1AeT84dC8Do0Y
Message-ID: <CA+V-a8uaNXhqMvw+SqiV5D-EsGGCjeu3Qz9e_RRrnJOqqE2g_Q@mail.gmail.com>
Subject: Re: [PATCH 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34203-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,sang-engineering.com:email,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A05B16A0970

Hi Wolfram,

Thank you for the review.

On Wed, Jun 17, 2026 at 12:10=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Jun 15, 2026 at 04:48:05PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add a new compatible string "renesas,r9a09g077-rtc" to the OF match tab=
le
> > to support the RTC IP variant found on the RZ/T2H and RZ/N2H SoCs.
> >
> > These newer SoCs integrate a closely related variant of the RZ/N1 RTC I=
P.
> > The RZ/T2H and RZ/N2H variants lack the RTCA0SUBU and RTCA0TCR  registe=
rs,
>
> The RTCA0TCR is also not on RZ/N1.
>
Ah, right I missed "Not available in this LSI.", I will update the
description accordingly in v2.

Cheers,
Prabhakar

> > those registers are not accessed or used when operating under the
> > rzn1_rtc_ops_scmp configurations, making the current infrastructure
> > compatible.
> >
> > The RZ/T2H RTC variant also supports a 1 Hz output signal on the
> > RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
> > marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
> > distinct RTC variant despite its overall compatibility with the RZ/N1
> > implementation.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> With that fixed:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>

