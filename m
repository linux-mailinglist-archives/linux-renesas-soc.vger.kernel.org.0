Return-Path: <linux-renesas-soc+bounces-30236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE2vFA7hw2kgugQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:20:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A3A32598E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D880E31B7294
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E5D3081D6;
	Wed, 25 Mar 2026 12:30:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B03A3D330D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441824; cv=none; b=TkbzMoIW+BEQy8Hxs4UmGla8kqDBuvIZM4xLKb2UL1QBRKvuWN8kXXlPbF3NzM0gWVljZwXGEiAS2q0NyZVXEwtXrqLz14Juk53/ZzV5AubuE26YOYEyG8vL8kb8MXoRghQXEqv/w90lcgwMdUoEVouBMIHRxUHZu7tcW/m2Pqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441824; c=relaxed/simple;
	bh=SPGwZItbyiGj9cWSO+7eVOaMo+esd8fhVRvkUl5+UcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+COqX2q4Metnbr/MWJxISiyoZ2MvLwt9yJVWOC2oPspn/zosnbIB0TpFAMPHHpu0uv5Co2LI6cCMK4v+XGC92SMd7jJE+zQn7uoYJw4F18/xjy61U3LwhipRplOQ69CdahORg/fmzRxAk4yxhVuQVTuNi1GY4rKjaEGuz4/NSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-60291b2cd89so1628144137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 05:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441821; x=1775046621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MagvQBlfcuzFnX7huBL5/4v4ny2T/Dp0z42O+1ynv88=;
        b=DrbAe0fUXCWh2WZEILDpFd2kxPElh3vwApQxbR7EiWoXLMDXD+5tkw+NgS3U1OZYKb
         Jbeutg656j4o4NeUDuQzCds5yXqeus1s4qvyg82WsHV1ffK2OQ4WIWS5CQBIxGeCPD6r
         dbgY2O756RP+fp9J30o/8mxC145kGiSyMKY2UtTD+1quoLoDBMTRYwpSwxXA2gRUME8I
         4vDnCKkFnhF0ixokOYntbPOBdWthQ5sJtsIpNJDBTMqh62HQy9lZBAeQjXEGIzCQiUlR
         SPyiJ2sCSPWwzDV8iuFxc4N9WuNZGJcpomADPeRDo7HqvOVh+ma0l08WDjoLovvvK+06
         Y7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6F2XMjkoIKg3klCuMp9CQAQZj8GyQDqzEfHo01Pt61zSYqRF3xFs5JiK57O/JtlUX7jSvoKgAXT1t4WQirdIJJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLFCcViqYope6RJkBpiZDnbxhPwy5MEwJXHQX3nRzp6+uWUvp
	Mn/PwDDZykvxlRp9CPcHf6aQngIq2fEgUEUp40MkqPpzAvzBwbkyTyHG6ddae7p67qk=
X-Gm-Gg: ATEYQzxFXnjg4db84M4rKD4MGnSFKMOKGVkk4HLC4wrWuFm1J12f3T+0IR6Lz5sf3S8
	c+El2P11zs3PcI484YQvZICeXRFgy47cj5HCfhyWTWdxSzxdCmIPwBfkjDDVs9A+rq+oIPNn/Hn
	FAuR5kZDZ3IlArqFrpnac93tLPS3cT9ntzs3RnjRBwYhX9xU0cI+GzCy0W4VTpYFpUlkzNQbpcl
	d0jeSfs4XTfexcLv+z0v/C636np7P1Mr7bfsAEZpu9J3GLEMSP5n2see9LxVf1X+sZC+vG8VDiH
	/SfoW8EEFxhh3gOsMLiZkSVn+hdAJOuVIq8g0/M2nJFdf+jxTLz1cjY7phlrubdlDBAXpP8ANkq
	DK01Otr9StPntHsu/+9s3TPgGwBttKhsTjivR+u7Nug6Zrq78G05PVcTcc3usgwXS4nuOWlOlY7
	p9O0YV756emiDpYpYY9CXmjS15e0H3Bjg+HJunoNisGkfh1A5bp7wc0LS3wHUHVNMv
X-Received: by 2002:a05:6102:3e8a:b0:602:a0df:bdc8 with SMTP id ada2fe7eead31-60379001e4cmr1499533137.5.1774441821053;
        Wed, 25 Mar 2026 05:30:21 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af853b1dsm13835523137.2.2026.03.25.05.30.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:30:19 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56cde757d3dso1834633e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 05:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOtFaIv20GNNFbswFCW/FEppRdylaZVNM6dHB1dFBypN2tw8/rQvPGcBRBuWh9zENom3tZ8fhPyJhGlM2DJhu1pQ==@vger.kernel.org
X-Received: by 2002:a05:6102:508b:b0:5ff:a4e0:193d with SMTP id
 ada2fe7eead31-60379001ddamr1568201137.2.1774441819157; Wed, 25 Mar 2026
 05:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325112039.464992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260325112039.464992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 13:30:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUV_UDHW6-CvoWz2av_YMVzA65K9rKs-kUUfsJ2sJoPKQ@mail.gmail.com>
X-Gm-Features: AQROBzAIcY15L6Naxddr5yUVr1T2XZAbydwo78ZmXjWvOA-eeKK6ZT76WMUzHz4
Message-ID: <CAMuHMdUV_UDHW6-CvoWz2av_YMVzA65K9rKs-kUUfsJ2sJoPKQ@mail.gmail.com>
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS
 detection logic
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Pavel Machek <pavel@nabladev.com>, linux-renesas-soc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30236-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,linaro.org,gmail.com,nabladev.com,vger.kernel.org,lists.infradead.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,nabladev.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 87A3A32598E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 at 12:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Read USB2_ADPCTRL once in rcar_gen3_check_id() instead of issuing
> multiple MMIO reads, and derive both IDDIG and VBUSVALID from the same
> value.
>
> Drop the redundant !! operator, as assigning a masked u32 value to a
> bool already performs the required normalization. Simplify the logic by
> comparing the ID and VBUS status directly, which is equivalent to the
> previous conditional but easier to follow.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/acJVCOdlchLiSe5n@duo.ucw.cz/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Rebased on top of latest next-20260324
> - Combined variable declarations and assignments and dropped
>   redundant !! operator
> - Updated commit message
> - Corrected the link for closes tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

