Return-Path: <linux-renesas-soc+bounces-29499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHBjHaUcuGlYZAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:07:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38A29BFD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFE0A3069D7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D791D31B830;
	Mon, 16 Mar 2026 15:02:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763FB31771B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673352; cv=none; b=Ys/yLtKXvqtqvw0z64MAv7xJRNJ8XZ6n5zU8X9lUIwh9PPWCU5BCc2aYAh08ISFEI6ORE+DC9vPgsNyoXiWrlJzcszHTe/pcpjXSeS6HA4fCFLzKFSJkYwKq6ZUHw++bExTZJTOpWdbJhUmSMeWkSNkQrLdXJeGYiY3Bk1XxaD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673352; c=relaxed/simple;
	bh=zh7EYZGNDPnMnM88yRMZeCpFjFUClPEhquZR+Kx39I4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7HL3eRC39DJfErgujdx9XAXJZ42ionaKx+NU5dx9biQ/1gwJQM30EeuIlar+nFOjzz0h8KcSqI8iOVGr4Ros+hrTUYSBP6YLvriKSAbp4jzrLyAGAx5QUnlBL72syeuN+IMwJ3+sysMQfL8YaTK2HjGWr+FErYLMa6hJC8RJWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5fff77ff69bso953630137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673346; x=1774278146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRRMaU4Pumxni9lHAShpOdBtq5a3B8lIGVSSSz8RExM=;
        b=rxeg0fWmfMluIM3QwJCwFtEQfSeJ0RRZkEQh14E24DbLcWb8xW9lbT9pfpX5N8RP+p
         QygRYkpAwYn2Hprg9WCOYUx8NDBlczP4f92IrGK1+Ss0kdqPKoUxhUguTa39lY619eok
         we0E3I5ODhlJB9bie4jNEXtJjQq0E1yYUcphkny+CxdExJZ1P4aDXmb3lAU5pRerJV0c
         ZFpQ72Qx+2022rW4h0Avf9eqXNXpqmPk40dPNL6StTWTO3/4pZoPSofH0LtlHCla/gwr
         V5X1zJhx6ZVEiI+n1KvWpUpc7Fjzxg4nT0EVuQ2PZwLPRaIPFDCUcc3dRfcLOXQGTWIh
         CjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwsnWCjoGHBd9i3qyGcwUCWiu/OrviQCjMqUSffS/e7ehnQZL4tDECAwc+NfWcjrJMr0GYtkLBMyo/CQx17K7new==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqZdP/pomD43CcX2SkuqfzL4C51Zudj0E51IxLzuckEthO792J
	9pNTWel9ke/E5mr9geO2GMT/8ITRWHPIK90BQDaBQErm04Gbq4+zbzkxyQaE4LHH
X-Gm-Gg: ATEYQzxO0qJn57FLJYG1cyRJEbvpXPpRUI0x7B8kglbGwGp/3R61sLhA1ObKTe2bVLY
	TXS3DLguYBTWHgXqGsxnNCzkUqJp3cHKQlgQNmzneJfmxo1tvA82kOA9yOYiUlktjx5DXbMxpRp
	30TDYUdqvQdp3oagA+WS+vBjJ/eMZLcO+3pZAkU/qyH1b+SQXvKH3DW8IraSgyYsk61NzmLL+vg
	1VRdD9vIeJ8W93kvhd+a8BZCaDfAoYnUvl1vu5iPMP6QCbha2BQqFlWplzHxrJDXwTGuKmmalzx
	Ohg9TqAJZIQ7B6NqtudyD0NuriTRNbaUmssoQYKIX2WpYpQU42GvH2MMsd4GovxxivaLH+HrDPE
	68FPwS8oSxuL4fczZSeTKbSDYCGzmmjflnsoL5Pe7LUuzFbiwd1+2sTypr3FJwf+lPrdqmLicTi
	Q748L3phT3o5f/sYpB7UtRHY+ujZq+Wx3R+7+m+NXLPN/Lmk16jPBuC+EkjNqpN9lx
X-Received: by 2002:a05:6102:304c:b0:5e5:66c6:d23e with SMTP id ada2fe7eead31-6020e1aa78bmr4895632137.1.1773673345681;
        Mon, 16 Mar 2026 08:02:25 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deb0278csm6597639137.11.2026.03.16.08.02.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:02:24 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56b7043c97eso711369e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyUj+RIWodfL9ujP7X36qtzXtqeF03woctj+Cxnz+YEokc/bV6eSS5mekh3zyl4oDRBC5p4B9I5hcAAmtz1T6V7w==@vger.kernel.org
X-Received: by 2002:a05:6122:659e:b0:56b:8d2a:8c8f with SMTP id
 71dfb90a1353d-56b8d2a9d66mr1234792e0c.11.1773673343363; Mon, 16 Mar 2026
 08:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <abgQpsArW3VrCAns@shikoro> <c3af22f6-d937-4539-8eb7-d7f0b0892ca2@kernel.org>
 <CAMuHMdWdyK6YKSrExmvzG9sPdr-xihJROAeZGLh=xAB6sObVsw@mail.gmail.com> <69524a11-95bb-4dc9-b59c-1b5a9b70ae18@kernel.org>
In-Reply-To: <69524a11-95bb-4dc9-b59c-1b5a9b70ae18@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 16:02:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTZGV72NKsHsYQ3J1EnQSGqUbSMKftOuR-vSQKG-tGBQ@mail.gmail.com>
X-Gm-Features: AaiRm50wxEIXVr4EULzN_3inwJzVzlQq8jvsLfXkufeb4_Iw3XuA9AzNN_MIMsc
Message-ID: <CAMuHMdWTZGV72NKsHsYQ3J1EnQSGqUbSMKftOuR-vSQKG-tGBQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,gmail.com,kernel.org,glider.be,bp.renesas.com,vger.kernel.org,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-29499-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.968];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1D38A29BFD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Mon, 16 Mar 2026 at 15:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 16/03/2026 15:34, Geert Uytterhoeven wrote:
> > On Mon, 16 Mar 2026 at 15:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 16/03/2026 15:16, Wolfram Sang wrote:
> >>>> Add a new compatible string "renesas,r9a09g077-xspi" for RZ/T2H while
> >>>> reusing the existing xspi_info_r9a09g047 OF data. This allows the driver
> >>>> to bind correctly on RZ/T2H while the register differences can be handled
> >>>> in future updates as the affected configuration registers are not currently
> >>>> accessed by the driver.
> >>>
> >>> This sounds fragile to me. Can you add a comment somewhere in the driver
> >>> or headers so people wanting to use these registers will find out that
> >>> the SoCs are not compatible anymore?
> >>
> >> IMO, this patch is not needed. If you need to handle differences in
> >> registers, then you add dedicated OF data.
> >>
> >> The change here (with the bindings) is actually confusing, because
> >> effectively it says two contradictory statements:
> >> 1. Driver patch: devices are different but they are compatible in
> >> meaning of DT,
> >> 2. Bindings: devices are not compatible
> >>
> >> So you need to decide which above, but not both.
> >>
> >> Eventually provide extensive arguments in terms of how DT understands
> >> compatibility.
> >
> > I disagree.  Using the same of_data can does not mean the devices are
> > 100% compatible.  It can also mean that the devices are different, but
>
> I did not say 100% compatible. I said compatible.

Fair enough.

> >   a) The differences are not handled yet, because the extra features of
> >      one variant (or both variants)  are not yet supported by the supported by the driver
> So that's why I mentioned how DT understands compatibility. Above does
> not matter, sorry.
>
> Extra features means subset/superset.

I haven't looked at the differences between the two variants here,
but I doubt one of them is a superset of the other. Probably both are
supersets of a common subvariant that doesn't really exist ;-)

> >   b) The differences are not handled explicitly, but implicitly,
> >      or elsewhere.
> >      E.g. the different number of resets is handled implicitly through
> >      devm_reset_control_array_get_exclusive().
>
> Still not an argument in meaning of DT compatibility. Implementation
> uses the same ABI (through devm_reset_control_array_get_exclusive),
> right? So devices are compatible for Linux kernel.

Linux is not the only user of DT.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

