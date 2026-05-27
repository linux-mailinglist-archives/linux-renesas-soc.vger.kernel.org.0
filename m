Return-Path: <linux-renesas-soc+bounces-33215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLSfI7gGF2qn1gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:59:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 356155E6609
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E11B304AB3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719A9426EC1;
	Wed, 27 May 2026 14:57:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEE426EBB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893837; cv=none; b=Zh75yQocYl4Fm9gagT/RUPB4zcy5gjk8VTAMJOysUyIeIS91Pe1ksl4BhKd+VV8LTRXpON8aR2v/oGrxDHOkvFAlUWRauZ8UbXVfk2sp/A20+0SU2+/h/6C2YwTBEgS16dGoBeYxNLUdXADOGJK+NJv9Rx/0cdv6KhrVn9SmXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893837; c=relaxed/simple;
	bh=DcaIkOnu2qFiNVWG8uKRptjS0gHzV/XmFDChIo3exKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpJbjBkNAE49aMYkSN5oH6EJNWEK6eq2VORUCbZUzYsNG3VNuQigW6tllrHLAh7nGLWCGJ6MIDQczCtr535325KA4zkLucgQ+OfHBRpy5XChRe868qgruqnrvSWL3ZiKH+mSrLpZ51VCTa2otFgqiYWt7VjBRhXNr8wHgCKxgRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1673773e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893835; x=1780498635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSha8LAAaJOu6KHbf0LfPH49giEnF7hSPozKiiNNtTA=;
        b=ngU7QPm3dQ9nANNkIw1ysNkNowei11Q2X4gx5YmNr5oYtCRfzKPpLhF6tgeiV0hdGs
         kR410lMqlzpjAylXayiAcrTYkqDqpLDewmanEANx+RpQYB2YBZevyPMQDw6ZRc+Eu4bC
         T39QAfB/6WX3uT40F8S3RCL3UsA3ROKEG3kHpSlY2Q4Aq3Q4d/3GxJkDBAWQXTYf4lYr
         tASjtLvp5WojbMJr5G3E8wjDCX0zVRAQ5WxrmTeoZF/PztaGTSbqRvMksVFuLvVRGvBY
         f9V5CR0sjzk3tAw53GxKdCTU6K09zuLlK/7tlC8zLzsD+B3LfoPQUTR3U3E5PYG6CbDj
         JxUw==
X-Forwarded-Encrypted: i=1; AFNElJ89/0DicETt6O6jnYfFEnShyOuRj3GMlbGcwEXSE6F0vs8CjX8C4IKhn6RUiP5k0F5He2DuwzChCXNm0Is/62AqXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcelyDi18IUtXjLhUq3njL2gN1cQe9dd9CEIwLsDOOFLCcC25j
	xAqCtQ7a6MehNwfWuaIvM65FGVkMP0L5VAi/uW2qOX/OM0QOQ/px++b1VBZ3SmjVHns=
X-Gm-Gg: Acq92OHSLa/Ajz99WfBLdMfxea4XRQ2YlQ+aWKzJj6BAGVCKn+cQJnQShEP7SBPoXV0
	eipGMIxJLgiz2Tmtg+kuuKXzQHrqqvXl1u5QxDIAZYDPX8I53Bc3FI4KTyERAWspJgyyeo+bCmE
	WKhg0O2VT0mbcCXok8n1gXjun68D4MaSPvFluvKP0v+dhTf3QxLG4efnUeTdND1rYZ/2gPdW5gQ
	/01JyhWbP0gj9m5HciKn3IFhrC1NWxaQvM64DASos686voBP1QHj0abxTpZ89hIrptpVDUaagIe
	mSLs2BDgC3yu3SfL7n29mxz7hrtl9TkuMiczMJrZs8buiCd4kTPXvcun90yDsIRx4t/TBCGzji2
	I1EvybgLvJnvA9FVOpyFSq4P34dZJCzYr4r6h1jEk3UtDR/edydgKaycDvxKbx51wsDSY+zZ3F1
	IjlulUbxe7wkuSgiTDZYEs89eqjboaUULuQpsYznjiRVoKpmGop+LEgzCQJKed7GGvNcJQMvdD9
	rD+fVUjig==
X-Received: by 2002:a05:6102:2c1a:b0:631:26f6:701c with SMTP id ada2fe7eead31-67c82ffbf6bmr11962874137.31.1779893834815;
        Wed, 27 May 2026 07:57:14 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afdb54sm17394320241.8.2026.05.27.07.57.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 07:57:14 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6314cc192a4so3628570137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ao+JlYeCqQOYnIDEl5ZyitHkiAS3fr5uLX11eSrmAe3W4KuHRGScr7qIHt9c4wgJyx06X5ugWXasU0bpAiwvf3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:1621:b0:608:9a34:c8ea with SMTP id
 ada2fe7eead31-67c7300bc13mr11464897137.10.1779893833833; Wed, 27 May 2026
 07:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 16:57:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMroQsJpmuA2zD75t88PJkEyc0w1azKjVaK-PsCkiapw@mail.gmail.com>
X-Gm-Features: AVHnY4JP3NMEceEVoPKwkUHHjX1lg1TgZYFfh8s8DtDqG0A0XFH35vzd-hfGd2o
Message-ID: <CAMuHMdUMroQsJpmuA2zD75t88PJkEyc0w1azKjVaK-PsCkiapw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33215-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 356155E6609
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add scif{1..5} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

> +               scif5: serial@1004e000 {
> +                       compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";

renesas,scif-r9a08g046

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

