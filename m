Return-Path: <linux-renesas-soc+bounces-29349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICUzClEJtGlvfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:55:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B5A2834DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E8A83053CE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD79313E00;
	Fri, 13 Mar 2026 12:54:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79637F8B2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406453; cv=none; b=ctNv4vW/Um7rcRpmeLl/ypeN5t90OTRAm41NEQRxda6YwNnMn81W8PERAfHXDvoXhkjfH3xMhc48xb+e73aAXQNupCRkxOuRiOYFUHuA8NZunXkeCjO6q9B56mOXNaEo7H+HJYRg8mVvgyXxyQqDcCV5fmXXxMs9jYA+e3D8tX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406453; c=relaxed/simple;
	bh=vxa/x77WJ5AGvX0CT9JRJIvw1wM8eLtq3PY2GOtID/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2STTV/Lxv4k1Rm9PdYAOrnqxJ3G3Z2hLPiH4NWjauQN6Fd0ZqUeZMP6bEtCgh1TQcir3jRPrZm56b2Ugxup+YVM+2VHxmp1KzQvIAAg5BvSrgy02iHseiXEKog9z58SBt/Bfc7AM48nel9qnBU7fhuZKXWlJ/Sz88Z8SpaowiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso2027843e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 05:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406451; x=1774011251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8m47euTCCQIOJUm6ytaBLmoQ+LBUiglduKVqIO14BU=;
        b=JM/XS7t0UqrVg1WCuNWpdzLJTFgqnpsYMagr5idiA2Csbpa9R3FxFG0jRyMO+3Stfx
         RdiqFEQ8q0BqqWgBjsadopKBLKeMEFWNd6glLcX/oV6CsbSyaecIud0LmqmdGdjrYfAn
         p5WN8DyOlT6FiPY6j18+erEGuMT+7H5bnUYak2mVIJf2TXYasjVGdAQgINSX2bcsOiLU
         9taNQUxpR8l1rIFJ+eTQyTuoBZJkqi5CxQYMcZWlLsUI8GASY075G2zSKHVHkLRj97VL
         PH8OZgBNH2OGGuLysUMbzYOVG6fi/jiEZhLIoeNLEhTXc3oZlupvsSZZDs2IMyN7iUEx
         T8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCU6wavJwABAnw4dAOUriKkjbOupCaXEwfzskGbKqkLB3DbCqbZM1WIXSuEvgztsETOm34isOZGSwQETZasxHSUp7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1e2hTgGtLAJaFN/vR3W87YzqHzCWDdY9+6m7Jzm1olBCfbo2N
	M48KQuKK1S7QhUU7EF2KTeSni1QKURuZWv1cl6WPa/83bK1/gCr9MMMeRLCLZ7vy3fY=
X-Gm-Gg: ATEYQzx64jyrWr4kc1VaRju0vRGe8o4JGm4KgfRiXPdPO33mYEDG/rhFxDe3qlPop5k
	SMYhdaYv7H4RHPtnC/ll5xkWqixuTn2/ZjJiBIm19/Ob3FQoZtKAJ/8p6wSE/S44NnGeFFCFDFs
	VOcJzkmzVMtsXfokIwqzy2Qb9/P6RU07fSTzxrnc5qls7q2AyK83qOUsI8ylQv5J27fMezWI4Gf
	56wBbMp4DXJNMTBaqM9OuzdWV+5tZHNF5A5cBxaKLsCscZHrQHD6hWIIUIYRQUGeePQTCmuja8P
	b2A5en1lbg+AkQYt9qg+nY9n22DmuqfRCvm3EMxXOs0BIvQzDx4wQVGKjPDNmqidvYz3zNodr3v
	zBLmyOzljGebsqKLZxHay+OHZv787tPSRbQZWwzqRT3AcaHL7DXMZGY2ARxJhkVFWiZOwvawPNx
	9LsV+RL8AHMPsPw3UU+ER6Smtvmyfx2auSvXjI12itO/nVijtJfJPBcj8CqO/2
X-Received: by 2002:a05:6123:4213:10b0:56b:6adf:150c with SMTP id 71dfb90a1353d-56b6adf31bdmr242451e0c.5.1773406450918;
        Fri, 13 Mar 2026 05:54:10 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b59dc824bsm1842934e0c.4.2026.03.13.05.54.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:54:10 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ffb61b0babso1380854137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 05:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqjeKrcIr87YYEMtWvepAPHaQMgcQ/NOrt6ZYLLDt2aZXZ/6f8hLF4liG+v1KhP+ThqYOhxaCCYkIwZaBYbuwU8g==@vger.kernel.org
X-Received: by 2002:a05:6102:c4b:b0:5ff:ea89:44b5 with SMTP id
 ada2fe7eead31-6020e59061cmr1421380137.32.1773406450176; Fri, 13 Mar 2026
 05:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260309165946.3003731-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260309165946.3003731-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 13:53:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4GC+cJ00XEX1oYkLCDRU_mi9b5CgX9gTt3BMOGTBhbQ@mail.gmail.com>
X-Gm-Features: AaiRm506OmHc9PmeB4LavUlxVPzoBLdeWVpgdcdNb-nr7lY1k1F5XgNij3TCcXg
Message-ID: <CAMuHMdX4GC+cJ00XEX1oYkLCDRU_mi9b5CgX9gTt3BMOGTBhbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data
 as __initconst
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29349-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 90B5A2834DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 9 Mar 2026 at 18:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Annotate rzv2n_sys_init_data with __initconst as it is only used during
> initialization.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

