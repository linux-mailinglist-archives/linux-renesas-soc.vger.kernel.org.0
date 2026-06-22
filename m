Return-Path: <linux-renesas-soc+bounces-34319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ezsUDJBTOWqLqgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:24:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9D6B0AE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:23:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZF0KIOYR;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3C39300E27C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EF01547C0;
	Mon, 22 Jun 2026 15:22:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E5374E40
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:22:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141744; cv=pass; b=J2Fc3FKc0t4xFzC8+uvHzGItWaNxeP8FR4ZSg3VsPeRJO05XeeAMo5E0KeaXS5s0E25ehDPHx/K1kXgGOz+PnmQiLWGjwjBfynpO2CMsOIK301tdCeKJ506CEc4NWi7gqRNroVCjyWnHfRF87lQB3TlrrMihyd9Ez1zcxGgjWdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141744; c=relaxed/simple;
	bh=e1tTuZMCTbr9WABeIO5Ex8NGWc2k4NezfMpqJ50E/LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ns8FdyO1ttOk/+k9uuvYMJoxkMSrIbOM6V4JiweM124WjxQFk1jezphtW+fanA93RGZ/VB93PFtYsssPH1X49G+o6a2y75R/AhY5yVNu9HqiuJ6qQT0wEO14Qpv1Npv7GNVMdY1zse1JMVmCpOf49H0VR6mlE/DwCC+baneRiQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF0KIOYR; arc=pass smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so41910735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782141741; cv=none;
        d=google.com; s=arc-20240605;
        b=SoA2GnCPkqDPpx7j1dShv4jjjdm47zxE5n4JPiG9+63OjDoIHk0LBpln3Sc+Do2ZuX
         63qdHLO+GsQzlkZWrmaIuJd86oQKotElyU8xSGGBRMhgvZRr6pj1E7XgFkG2iB3aUIws
         QStxdxfoDpL0Z435Qg9Ot/1jpPrcutx9T0DwgwEkqu0M15bDiOfk4jPD7dbk51VjTPX3
         wDiySj70p+UU6LKVWbAGCuceZ4dj/js5qhDXLUVdDY4CtKVczYetP7NCwbk4PW7Rkkx4
         HBq0zDfhKof55WymquzXyLyepgXp6k/uPFd347ieCAzxEV+/J4+TnK78WR5PFj7U2NHt
         2ocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        fh=XEN3zw15qqfqyNm9FP3LKNIpSNxiFgF3QsCnvGoukiM=;
        b=Jgf+JpneaVZ8ECy8xXuOlpg8Xy8/zzCJIl0wvV+CY+L/zTsnL6g13mAHPlD7rnBrLa
         4zJM8vKjcCMM5zt22eFKYh7L3kf7LgKc1ffYkrHYNKaLFFlR48gS1M3ql+w8TqrqYjqW
         M0v69sE/fGCzLgV87Ko+F5BKueMkzPe+Mf5RcQ1JooEa3GpqMupVsRMStYaGbzYIHm0z
         eAsvAG1feb3nVkGl7QMnTxnvfnD9m7H97fiNSmzhd+zTv4ReH61O5baW0Nn458K3bB9w
         UuRCFMm2TwGpdFbw7lyDPmDNBVAvnwc7vK7NJAGbxkm65dYiOY04acAYsPhWoySAoR1P
         w24w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141741; x=1782746541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        b=ZF0KIOYRnIfgfUq3F7UiMUa0nz2rdPFiVNZRhgMKR3+rdzkt5DQcRyH4ZYLY5Equ+a
         Nreaoxhg9PLqYeMCfuq47KG+RtokqgAUjCaDUKy1v0fbBl1aDfhTLDaD03uVn1KRY+dG
         hcfzThTdGTi5UWl8ldvYE5ZMc+tMjjGkIRKE//Wn3VpapygIdEPhiLluLHilLW0Vft8s
         kKfBOt+PbAXH1/9/s1kH6JXmrRcKsUMrk5p8d+Eap1XpsLhLpByyFppAxqmb9fUwNmiy
         exnP3SXg6fRb739L78MAKGyyVTJYDCugKJ4Q74JKMIxPWn1cSc0UvmaxAyXJGqNngK0q
         NKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141741; x=1782746541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        b=sP9qH4lugMr7fF7mQqslStb0nRIT1inzy/WYk5MYBEVaTnsbayK3p/UAtDhe0/qCZs
         ujjvxFu4bu/7tpye7oKGsXrbUW6vVZ65vzh0GJUdfvuo2X7hqfjMz+5ggshVwN6I7xLu
         mku+gOBSDwWGBmK/YZKFjFzy9u5HARSZwcRzSrJ9ew7WspW0q+Has4eShTusVUkpUJwd
         GmHrmDJB3omS+Q/1wGhcal5095I3KAjJEFcjR5jgojg+CVJ908bxpU9TRtY1Q9Re1QWa
         m17H6pCSXML/gf/+SBLzsJ7Y9z5CIoyt3+i0h+0n6Uc0DPPEH6xkDVCFA9MAozfLQ+vk
         inmg==
X-Forwarded-Encrypted: i=1; AFNElJ/LrvAq4d+2yztm8WWGML9h5EzZtqznultWo1/fmKT6863tyNacwdcLlOPng+d8UPZ4dYPEypzbv23c19DS/DkwHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU09MZY+9jc/CnuRG74tKkdBx+qG0XenIZGbfs+wiZkD2V5K2K
	8bEutA4xKfkcUMxoZnyJtQSg2ALYHHB7644aZTHV7rlOUPmGcxCVpcdnw7A37EU1EL2l2d1syZd
	pZdV6yigmJn89UTkUiIVjdbTsPNRCJOE=
X-Gm-Gg: AfdE7ck73AEHV5aJgXgFPyohhsxLAjJAvGu7J1sJATL/rKn9VtqROfyPjsrgqM8mZvb
	/BZv6bK4q2/hYQXLori5Od0tNnBy3qrN6ibzzJBaeJX+/KsAcUi1tpSaGs/Rdlnqa8/UK5tjowu
	aAJLPbpLYXBWeJQZSN84wUasEErIDvKhm6ewsTOnvJJvA27EOUAdBGAMDtCUfRBxKLtUKQ2IoN5
	j4tnkO6veyM21gxLISf4MlY1BHdAy7Rye9QyWogvMIEu7MIEvFd8+PEoqAMD5yE9uTck4YxvEno
	S6BpnjPNQ/Zv3Kxh+ExtT3oRUYn0LXiUnqeBpYJY8ul1eouWFiYwre7Vdw==
X-Received: by 2002:a05:600c:6989:b0:490:c1cb:48f4 with SMTP id
 5b1f17b1804b1-49240a3522amr210880715e9.12.1782141741254; Mon, 22 Jun 2026
 08:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
In-Reply-To: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Jun 2026 16:21:54 +0100
X-Gm-Features: AVVi8CcDtgtBvFzbVVwQSngIAWRif_D-KM1kC97DgRsKUSf_oeP6yHr8E0ZMKtk
Message-ID: <CA+V-a8ucXgZkQDvdOc7fwVAeh8HLuj9d9z0toHJYeg8UBSKhYg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34319-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-m68k.org:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82B9D6B0AE2

Hi Geert,

Thank you for the review.

On Mon, Jun 22, 2026 at 2:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the clock definitions and PLL logic required to supply the LCDC
> > (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H displa=
y
> > subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> > clocks.
> >
> > Introduce a new PLL clock type and implement rate recalculation,
> > programming and locking sequences for PLL3 using the RZ/T2H specific
> > divider and VCO limits. Add the corresponding muxes and divider entries=
,
> > expose the LCDC core clock, and register the LCDC module clock using th=
e
> > correct PCLK parent.
> >
> > This enables the RZ/T2H clock driver to generate the display pipeline
> > clocking tree needed by the DU and VSP-based composition engines, allow=
ing
> > upcoming display support to be integrated without duplicating CPG logic=
.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3->v4:
> > - Added RB tag from Geert.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v7.3.
>
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
>
> The issue pointed out by Sashiko (req->rate is unsigned long, i.e. can
> be larger than u32 on 64-bit) is valid, but I believe it can't happen
> in practice.  Still, would be good to fix it in a subsequent patch.
>
Agreed.

Cheers,
Prahakar

