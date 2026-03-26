Return-Path: <linux-renesas-soc+bounces-30366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPT6HsBIxWkU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:54:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8683371C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907523015723
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48C93FD148;
	Thu, 26 Mar 2026 14:47:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5DE2D0614
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536478; cv=none; b=KdXl+iNRzVyYo8862GgOmFQOCS4dR0YQXqQGYeUkohQ5LubbfmW8R57S14lCbFbG1PjkrljsB/sscdHiKzg9QjOh3DFNjDqQ+tuoDC+V/rLxfQ4EQHavcBM4U8ruSmMA8o0v4/VPr0c5AJ5yE8F9OdVeRBy0s5uWvoCt53Zy4sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536478; c=relaxed/simple;
	bh=Mz7743cLHKjDcfZBNnXTh/3101R4N8P42GWsc5M0tE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+1+7sY+fGSJ/231pgKqhe40U6EuzqKMvOwp9WrygLGOWEPQjoL/kWGkny8/QWFR0CLm9NZMtMkTqJmmZIs8qX3GwcwvBIi97fJ7VA9d8wMYaz+CvEfXboNh9KDfT99XXDnYA53Dz8kXe8BJIKaejSyAyAXH8P0bfuS4hVGgLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-668d70fabc4so2045082a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536471; x=1775141271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VE2E786ICpZIcnAV4rwWupP+nyLC84JrXsMF73F6KhE=;
        b=HsXbBimFBgIClBsgZZBSMbqXqCNwQpGSqssWnZghzGl77y7ooXHYPKtRt8UUj4XXys
         C2x7TUCyBQYEVCyoUfVFwEc6CTk676pjxqTEX2SceEEe+g0lgPCbMGqPCqDpORAXuDBD
         O7NI+hSIoLutPtPnvQcWXgLjvRI84XEkReYgShBaAw6P/3OCyCfEX/9baxBD+tYv0Bok
         8uAbwVaK0ndXDEOd+XnpNkdMHNMijiMXEoNsekeVHYS92yzSj/NXl80jaVDJ6YtvaCYB
         xM2VJSNKT7o8nw7kKe+Pk+Fo6mma/MyvBpzmSD1TNJrEqHFEpDmLtpHqKJeF3kyXcgK9
         X5SA==
X-Forwarded-Encrypted: i=1; AJvYcCWys8FIxpYW3rNdOICeEi39hiHIITORRey0im/2zWRjb4sBlv3dK4qgpHea82BIlb2yAltmU0VfIKipFqAub2L6GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEhkFhHv9fhVukbxlIOu2IA2xF/oSBC6yLp/yIl/khgmt6C5EN
	+SqgO70DUkpHkSdvD78iAaHKfoBX+ElPN8wMlCzvkHsWQ1/qc3oqQgb+17k+SSPtRqw=
X-Gm-Gg: ATEYQzxbqkIf3FhyPtab8lJ3ws9U31JhQuaDBULuA6YJCDLxWa2NtHAaPuWNNKVAxmy
	DHrGGfYOhB8xp9sKkYz3apy9iodQdzGpfsSvrinIiCyijiZUmZ1GatjE7Sog3juRNv2Lzy/U4kt
	tlUQ4fcXxgYhPzvhhFvuwG4Ie/cNx9BdV190VSKFON6fONorVoSew9mbJn7LYH9amSGpVPKDTGl
	yDSOXJnWZq19glXg9GME6MLm7LVxBGRVjJyXxO2v2/GxDN4vESJPUkyY2CYdLv+hHo49WC4d3H8
	J1IRwwH9DAau7q8LYvrdVxbuoZiYZlhPpBTvvL+X6L4MJf6l9LB32B0msh1V7tJ6xFIZEH2zxDB
	ECAjMDfpuA/epsG9yzULYh5areHRJm02IloEX2P5zBJ0F/Jemd0ccGExRYMG173v8Nwl0TdL+yg
	xvyVasL7IkmjbxO2BsVBQ7cu45YALnma+CtmPl26ed5YxMrBvfkCXfAINE0Tax
X-Received: by 2002:a05:6402:439c:b0:663:8be1:362b with SMTP id 4fb4d7f45d1cf-66a82618527mr5218362a12.5.1774536471161;
        Thu, 26 Mar 2026 07:47:51 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b0bdf7590sm593405a12.6.2026.03.26.07.47.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:47:49 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66b05026e82so1304152a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:47:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0d/OuCs7psvUwrFT86TYx+WI2sY9+JJVMGp8CsuNdHUa1H2uavQFE7NYvb4G9ZX2TsLpNjLCHN43v2Iikq+3eMw==@vger.kernel.org
X-Received: by 2002:a05:6402:400a:b0:663:6d0a:6f97 with SMTP id
 4fb4d7f45d1cf-66a826e17a4mr5435034a12.27.1774536469098; Thu, 26 Mar 2026
 07:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312082708.98835-1-biju.das.jz@bp.renesas.com> <20260312082708.98835-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260312082708.98835-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:47:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUV9XEQQb6bX40UoeNrs1DsueLWXcyY8wMGmrW54xPD8Q@mail.gmail.com>
X-Gm-Features: AQROBzBG2_5XR9iswvQhc2D8hUfkOYm4fbALofzpvMNtbuFoQlJK3H7uau0MO3s
Message-ID: <CAMuHMdUV9XEQQb6bX40UoeNrs1DsueLWXcyY8wMGmrW54xPD8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: renesas,rsci: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30366-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD8683371C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 09:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the serial communication interface (RSCI) used on the Renesas
> RZ/G3L (R9A08G046) SoC. This SoC integrates the same RSCI IP block as
> the RZ/G3E (R9A09G047), but it has 3 clocks compared to 6 clocks on
> the RZ/G3E SoC. The RZ/G3L has a single TCLK with internal dividers,
> whereas the RZ/G3E has explicit clocks for TCLK and its dividers.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

