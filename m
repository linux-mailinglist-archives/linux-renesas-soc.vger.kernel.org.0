Return-Path: <linux-renesas-soc+bounces-31609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD7BFQUS62lsIAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:47:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C669545A4F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9453A300B75E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 06:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6021DDC2B;
	Fri, 24 Apr 2026 06:47:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301CF3451B3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013249; cv=none; b=BRlxeqwl5KOv7ukerIaWyWHKHea5+ndPobvSRZwPymX8qNUy6GKI1iDe6bGMcEdEoW0pLVzlCf5zzr2pihiuZTdVOnFxGGRSGIeFC81T4rfdLOGX7gKr9kCD9PzuhIDnkzvjRxbdBkKEf2WInoIHBGvEaOgOcI4N9XaDvpbFwy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013249; c=relaxed/simple;
	bh=hPjbsKLyqV83oL2QS75IvKJ3APLZq8Ze2ke8fdqV9C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kf4malVeQ9cHFNT4+AiMXXK+8H18rp1fKq2cjOVttKTjJ7PaN+4g8aOeDsfdDDJBbCKWooZfRdXj1uJgsLhCDcNmO0z4XjC86Hn4NDwnLltJVoFcnF8ZhDo8HmtqRW0dHDW5xdnOIQIgl/zTIAbXR88C/Hmoq7zcl22AyNrE1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so3665420241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 23:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777013247; x=1777618047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu0q45d2E7oLscYVPbeGMb4gT2YaXOimO9bdtwCxdfg=;
        b=bkj0woECq9EQ8gYgruGNBMJYwNrx54AkjkG4lDN3nCYU/ESMjCVc4x2AS58zoQP6y5
         U9M8Cm4xWSqHrhg5Cz2Dgr5Sq1NE3zoCMyxbA9weqPesd6cUxw9GrkpXINxj1AN84fOH
         FXMK5KuXCvfOhhmcLf773D3Vt8hQ/ibxtGb8nN/ke6rEC9eWgW1iiOpJ2BxTHPaVmFJZ
         +fB26GKlenACsP5R824qx0sOVuMlIZFjtKxpWAad7tlhif7qgKro9LFPFLwsVq6TtvRf
         bpgkk6PRtRumOZ9+Y1l5xMgMpDD/uvuLIlpirezOMBOH7xRfZh8aNjpOS8jCb2lwk3u6
         7c9A==
X-Forwarded-Encrypted: i=1; AFNElJ/gnY30JlQDF2StP42Bx7cdigybQp6/HpLhlfOsAlERmGYYkZsKN7uBgQkDr2JwjHcizy2kpjVXsSkAS7gVUgt2Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLp0xWMnBmmmTL1KWaeASO71lxGHXttDPrGfBC8+ZlpojsWOwo
	8w2iv33xjsXNesRpn6TKBCXnnARkdp24Q9c8bCtSmD1ogUssjNhCEO5evg4C91QV144=
X-Gm-Gg: AeBDietZP67bdXYFL21ELq6ZqcwQ/iPAFpZz5k8jtVzMhN6QoxW2rStqdQVDL67U/Za
	uCPqzd883Ai4do1Bb7rPD33iw3vjKo+LzOwX94Q4oxp+jQdYdtHHRSUNXDjzLGXEvR5dfEsWH7g
	eOIHdQ+DpV0Cr5Xsm2XcUwbxGooCui0mx/DOqsQ8/S4KYeI4VgM7jpYfHKWnPog/yberG/eybzY
	TCVNWRdSDLO8gJarotuEl5Q5+YQB6eSFDRfkSNnHheXdRTkXr5/io5O9CIG78SLbi8OzysFxd5o
	PJZfgFyGcl2ey/mXYppHmHWHlQi/QYwxyX3ppvkvYDirBtPT3Ui2SBTigeuJcGRJuBsEkfLNuIM
	lElKAqV2g+dL6MrCMmfJ5Xdln7ridbZQxcuqIKdvul/7+I3tWgZUoUW1FrJ4WU0Wo5uKRwNy8l0
	u5piMQTpmmL2VazixD36Xis+F7AgBTvvAvS/dDuwk3t9y4eTCRSBGRNMFQ0/m+QJUs8vmu5hEZS
	rk=
X-Received: by 2002:a05:6102:94f:b0:605:852e:6022 with SMTP id ada2fe7eead31-616f464119amr16872311137.2.1777013247184;
        Thu, 23 Apr 2026 23:47:27 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bca3fdsm10625909241.10.2026.04.23.23.47.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:47:26 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso7156831e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 23:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yYkDtNUF9uaIreT7LBq7/iyW492XfoMTYEJ1++FVA2HdbLP602G6u17S9u6egrdXk+5eXiA2q0zzCHYieY3EKXA==@vger.kernel.org
X-Received: by 2002:a05:6122:3a0b:b0:56b:7d4d:4d11 with SMTP id
 71dfb90a1353d-56fa5808124mr16742384e0c.1.1777013246536; Thu, 23 Apr 2026
 23:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
 <20260402131020.143123-2-biju.das.jz@bp.renesas.com> <177628854701.543173.16954025159083410550.robh@kernel.org>
 <TY3PR01MB1134691789E55E415E315658C862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134691789E55E415E315658C862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 08:47:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWh3gRhr7V632Mjn-feMrC8j8v8UvaywUtsEFFrKLjZ8A@mail.gmail.com>
X-Gm-Features: AQROBzC_m7I4rDcckretBHhnhJcFIfI0ico-cqvyKrDaP8xZGRyxWrRj0fSwhbA
Message-ID: <CAMuHMdWh3gRhr7V632Mjn-feMrC8j8v8UvaywUtsEFFrKLjZ8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C669545A4F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31609-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]

Hi Biju,

On Fri, 24 Apr 2026 at 08:29, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Rob Herring (Arm) <robh@kernel.org>
> > On Thu, 02 Apr 2026 14:10:16 +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible
> > > with the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v1->v2:
> > >  * Collected tag
> > > ---
> > >  .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> >
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> FYI, this patch is superseded based on Krzysztof's comment to avoid
> flexible dma names for single DMA and the patch hit on [1]

Sorry, I don't understand.  The patch LGTM and is already applied?

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260423&id=5277c291968d87c6a093f50ef489df9d52cb3ca9

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

