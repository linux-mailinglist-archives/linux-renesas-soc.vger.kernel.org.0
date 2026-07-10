Return-Path: <linux-renesas-soc+bounces-35045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sBygHS3bUGpr6QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:44:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D654173A5E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:44:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07D053047D1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6DF4192FC;
	Fri, 10 Jul 2026 11:42:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A53C9EDD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:41:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683722; cv=none; b=sIL4JLVwRRUJfes1V/tbbTB+2a0TRW7fdQ1WeIvk6KGz+uJZiKPstHUpQ36cVQfpv3/Dolav4Z8H4brFHtqNa8wYMqgem2lKzXqZQT6j3mWnf9sGkPXMYFpY8Q452vMwlVLzIAOZRRoVKT4RfLOdLU0ib4GvMf5BYu57C+hHPJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683722; c=relaxed/simple;
	bh=cRN3DIVjjRem1Qh5/ryc/Kj1OzVUK/3+j5as2jsZXeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5DOoQYb+Wj8BlDQ1zeLjEGCskbJKOAb79lmv4+UmH1acvEGtGny9TbsjNzwqr+YaMWs/Pl3oyWXoPAWHcJwky9kz8vhJQJ1jOBNGl/I5O6SmL4Wi2HtJml6jcoa9G9QjIT5aQOqqLoUWp8iQfVMEeea1iJwRG7xhnw7okKIhcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-73b909fbb6bso498968137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683705; x=1784288505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sWZY8wb8dQToSEMAHOYY209Fxx7jwySHPe7FkR9+aYI=;
        b=WVGt9Ac47TNzAVv3J0Cg5Z8K8RZA6zgO7/tfqQntGdr7LwV9eoZ5YkwiZ9JZIyom2w
         UwHSLhCf60Emb0oxjCo9HsKvCu2f3VyU8XiJZ2ard8B1os/uzvojsUCekAPagB96CLjf
         L6LEMdkaFvSsUcPK/tS1eRApuEFz4EPEsCMrnGYf4pp3Xn4ZXDcIBaY+KG1z6AuwhIQI
         qEw7oxf1wCbJ+nmmG97ycnCv2VAdN3WAbKUmALxC2fCnysFq8fGcICwduzW4+s0fHYWn
         JCnF5y8zZwYh3LdkIx7mKtgkd6wWiL60+wKnQTMAkGtMLjoyNwojmQQvbqo/vNFrAzSI
         1fow==
X-Forwarded-Encrypted: i=1; AHgh+RqSmopm4VTVL7TM/sP9/D5NumfglskP8/Yxp/OrKC68KBaLRYx5zaF5zbEVBvd5APkFWeF41i0pjfs7bzm2K50twA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdM4Pmp4ctjVvTL+soCV6AfPTnBUZaoNH9a3powWaN2QFvl0J8
	ep2JoObx12pProLHXATFNMS7FO0qZUMM1RYvtdfuo/9x/5sVlEbhy4B6iZeHOE2lvY8=
X-Gm-Gg: AfdE7cm6rAajnrMZXwEqWRaUxo3gFocyYjzkfytwI+HX8m1Qv5Y64DnWox5Ot17kQ/N
	dppLPi03Xgf5OEWKehvC93ysLiUhSvqNirETfmwp58yz9fA2GJY8IHH7v1dIpHoLG31cbNkp1Rf
	WClmv0SPttUfrQxl5pFM/mF0E/1dIqRUXCfjrKJnz2PYn6/o5UMGtaTnd8vCRmeT2PbsnedLKZu
	ZEr7ZOezKis5FPnfa5iadlnBe33qw9Y9/ge89vimKSF+X9lHDLSwpptIHI+dYvQIegtLshzZq3c
	1W0zco/X8szup5FEYLOEqkkB3SXjXQcDG/axQzCMP77k8e34Gj1OE3/Z/fduvCwIb2Z8EJtoBjL
	ZJQ3aW8r+BytAOSoA5uRIq5vx94YZhmi+W7ACEPyOWe5Xv3ClIJ0IbDMi0mdBRalvyUjuHGjRvi
	dMmoeKqCQDX1QSjIowr4ZyvBkzByGCeUQvjkXfbDJq3nkWYgr1ajJoSQ==
X-Received: by 2002:a05:6102:4190:b0:650:9174:32b with SMTP id ada2fe7eead31-744dfde7d3bmr7002266137.1.1783683704644;
        Fri, 10 Jul 2026 04:41:44 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a90d4fsm5140041137.5.2026.07.10.04.41.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:41:44 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf5d4d5d67so553278e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:41:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RriDkCVJ04ISkoUYxy+n87D/rG6QqKMfxzYhIAfzmIFrHb4QRLX5oLdMZ7ArsVeFSRghIV69B05VXoaMChfJmmbug==@vger.kernel.org
X-Received: by 2002:a05:6122:793:b0:5bd:fb78:5461 with SMTP id
 71dfb90a1353d-5bf75a9d4ffmr6525009e0c.0.1783683703846; Fri, 10 Jul 2026
 04:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com> <20260707145135.247565-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260707145135.247565-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:41:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJP0tw3bOiPzEg42pS_cXgH-cknYRK+LM6oJODubGsVg@mail.gmail.com>
X-Gm-Features: AUfX_mxls9AoCaoJG5OMri9gWtJ-eSjx5f-xCDGMN1hXVtUnNc89fbMo53qNAh8
Message-ID: <CAMuHMdXJP0tw3bOiPzEg42pS_cXgH-cknYRK+LM6oJODubGsVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add USB2.0 function
 device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35045-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D654173A5E7

On Tue, 7 Jul 2026 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.
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

