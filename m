Return-Path: <linux-renesas-soc+bounces-32147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKeUMgVk+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:53:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8FC4DDA9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8FAB30A2E5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9461C3EF0B0;
	Wed,  6 May 2026 15:40:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C253ED5B8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082003; cv=none; b=lJRETjE2+FkVm1AmIgQaPcPZArGq69r+dqVlZNXQL3R/UX6TE6cl8G88KuEDgLOHz66I0XggfVcdg6pERLA359FFMPh4bmSyW/Qp7HxtKYCAwAi4YdmaZL3Qq0YKj/7zw/HNvfPeVrpv/5HRdHmH1DLN1ZVi5kVk8iDnKaBnoJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082003; c=relaxed/simple;
	bh=jFDUbEx52SuR/UK+v6lyDx1IR/aux/fk+ZUTkvfYRnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjDY8Usb99EInBCWqjE/fo6/NmaNGO0g8uYADVHzXGytn1yuTlDuNXFIZFab1wVWySActc2elusaN/R3FuE/XAV05h+SUQmMrGTs867BNAAosIXY5d84qQ+zu44OilrHcCTEgqQP6rQCmMMrd4KsDz2RJ5VMNZZQ2eiCzu6BMtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5751136c561so810062e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082000; x=1778686800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPTG7o85JH1ALDa5WyNtpAiaild2aZc74qEel7NDRgI=;
        b=j6yn5uY72+wmtW89hXFrmxoCEJNI55+CQleH48Mln+X/qGvMQUBSgT543m2JxNLBLb
         YpZsOG5gPG+mbwC8FTt4IQYfSiGWbBVj10MUfezO23WUMrscfXai/FT/FG4n1pJzmEr4
         TmRruVzESyXl2NulnaYPdjRNexM+pv+u5rm1mVKwXxmS05Cb59Rk0ZGwjh55q6fW6s5I
         orsXZ4aNIk9cuWHVCjt3Kg02PyPQRGI+3eoJq54ZzpThzRsywYC0FkzdPLFi5zAuD6Pe
         hO4CupgWRibMIyrEhXFQ+9CmklDHFlA4IefiRYGvl6OE6oUkwr6aV0JmoJojOcukWjwT
         kxwg==
X-Forwarded-Encrypted: i=1; AFNElJ801fkd53bXZHMRiW9TvUckc+FKSM+bpGIwsOzdF+VSA04H3YkxPFcHpEWIUNOAuI8pl3xDjS5BRA2FR/Cm8Wa2qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLzfarG0qBP9vGWDJrcwwJblYRKOkEQHznAOm40J3XIzhrwH8
	LRD6Cmy0JpU5XH6b/8z28fV7ZwFVMSInaIREn1NK3Y2q0FIFLKzqn2rFv0QCy7XPk9U=
X-Gm-Gg: AeBDieujQZOyvlxh7R8NKhcDUCmxrjnmTygWgCQxd+AWqKMnPAO3bWZNPNHSKOQSiXn
	caEnGIYYKru6SoDs6o0qZcyY2RRBQHsUxZPfYfWoTOzdcG1x1pzJrlvicMOYpStWhrfkYwTYPYu
	5NGM3X2vv3AQnsICHoWOtwtjCioL6JV2ePGJk3V8ZKqpak+6u3giYeeglAKUV59s6GsroMwyv8T
	t39I1Eqg/jlXdf7VDXEQIBZjnY1sPGJxNki3pwewSfE9Z6/DvjzwlBW8afvA2p+sZ/8PyQptp1x
	ozZzgsd25MefMQAKy8B1abYpeg+2tBu899bzI5g/Dspk07HzhRXDx1WnQgVMtO+X8Xu92XWyl89
	Q597BO4EXvYPxXsG1kVBG179GnDGSWBtwRDxinfcYq+snZoO3oLmTyD35wyp/mi2MOrWl8xjcDt
	RdDTmruri2k3yLjhRWzwqqxznCSnzQSMzYo6lJ9E/l+A3DsrxJWqL+K2Eb0dkolpav+rg56Ag=
X-Received: by 2002:a05:6102:6c2:b0:62f:4854:8c53 with SMTP id ada2fe7eead31-62f55990e89mr4252076137.12.1778082000480;
        Wed, 06 May 2026 08:40:00 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af68c7sm9366006241.9.2026.05.06.08.40.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:40:00 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-62e7d2633e9so819988137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+1LEGK/yUIRry528s3MYO8PEeT2wLH38qa5D5oVmQSW/g39fKu8F0cWnbwpn/AtrY/Si9cyB2MZn8unM6PxeAuQ==@vger.kernel.org
X-Received: by 2002:a05:6102:548b:b0:62e:1ae1:cd6f with SMTP id
 ada2fe7eead31-62f557d05bbmr4437820137.3.1778082000132; Wed, 06 May 2026
 08:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:39:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhMoTggXHCcAjiptVuZ5yAwb08wCDaLb+uXn0dNVH52w@mail.gmail.com>
X-Gm-Features: AVHnY4KeoJQDYgUyJQpwX_pSlp7OMUhlkgW9yfuaAsg4WDlp4KfZjuWSD_EDeHM
Message-ID: <CAMuHMdVhMoTggXHCcAjiptVuZ5yAwb08wCDaLb+uXn0dNVH52w@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BC8FC4DDA9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32147-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pinctrl driver support for RZ/G3L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped extra white spaces in SD0_CLK and SD0_DATA0 entries.
>  * Renamed SD0_DATA* =E2=86=92 SD0_DAT* to match the pin function spreads=
heet.
>  * Renamed SCIF_{RXD,TXD} =E2=86=92 SCIF0_{RXD,TXD} to match the pin func=
tion
>    spreadsheet.
>  * .pin_to_oen_bit =3D rzg2l_pin_to_oen_bit() and dropped oen_max_port fr=
om
>    rzg3l_hwcfg.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

