Return-Path: <linux-renesas-soc+bounces-33330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD1iH2BaGWqtvggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:20:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC95FFD22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCB1E3013246
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BC6351C13;
	Fri, 29 May 2026 09:19:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DE33AD507
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046392; cv=none; b=CrfgjBfw1pzq+KzkAcxSFT8H2F5t07J4Cd9D7JoZ3LYO5+fRml4mHlndIsKTm2qThHwPmbjr7XB5kPf+wHwCeXGkwuZ2jbFHw/GB6BM7fm4p8pzkw+iS6R3+BBhDOEDwe4dTTx4Ig4uYV5ZxuOuV23gSTW9D8glE7b6pqCv2oJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046392; c=relaxed/simple;
	bh=oV2CAuJqeXrPOy57q4RphHZJTqsoxAZQc2f8difrQ+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsWGvcT4GWCvw/pjxEaHH3mimDtis8SW6xGFcvPfAvDLYQpv8cG0p7MjOo3w+Cb27LcZ8VJRtDnbWX8PqIRauWZzuLB6JmhDYUyavrchqCh/rmJS1Sj7rKxcxSdh+GK1u8PBMyhAF73hmPSbYvepzqh7vd3hS8rxXv7nwdxJg1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so2609607e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046389; x=1780651189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PINeLKm3kL0R1j/P7mEZaS9aKY06NtQ6TlFdhZaM4xo=;
        b=iTaIRe3MYqjytTRvNXd0nhv3oAieq+MkYHddKIyzBCHgnsUN1jwQmbOU0JUcQGshzu
         wqCHv42VXpqqXBlZmdfrzcbSMYnb32AfpkuqqKM2FWrKjXog/vFG0q8eXVHftRYJzH0/
         gjyS/mQl6hgCwQ7djRVbLigv7VMLQxGs1ENioRh8UB+aDLYw648TWyfULMG0seo/4Md2
         zgaZls5CW+yuRCsQVeN/0SvA3sBMUTNQJrbT2263WfDfpQUNxr1sWSB3WgixUilJoWOd
         Y+90VZ09Vm3qP2ys4KrsNIJqpSu+wsA5FqhHIPmCltiVEeTnOru+IUjSG5mW/TCxHcqB
         V4pg==
X-Forwarded-Encrypted: i=1; AFNElJ93ReTzTCu8LDeOrupwI0Gwc0hZP+aXSRLGxEJOWIcBQM1yVpKZOq5dTN0iK3nl4aIrd/Awxo10vqgRHz2j12jq6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxERAQanljh7X4VMmiRZMERz++KeQifzILtyYEXBZnFaxajeBUJ
	kPsjTJM0QYzAV+uuqL1qtjsZLL4DK35I6+GurL2y+qE/SpySElSdnQLzO8+TC500XIE=
X-Gm-Gg: Acq92OGuhq/eBbr0kdVqPkNrLdYYo24qk2jQlVURShhHwLUbVI9vki1KEUpjBLw2GPk
	Q6aywq8dM+Eh5RE1R2Zc1fFZ8J2MPLObwA6yosPhqsHs+tRKUjpV0UWku+4WsRSsey3jz+JRTWu
	lTyxmROVn03T3tts9ZXw9muYxhNT+dIwesPnsn+B+GALh16GbSZ48cLefSlyxBTGoY1RsINP5Mr
	cKQM5BTHxjGWJPIwsLcnBMsQWsG2QRSUowIB9uoT7aAySvGUQUXKDFa4ZbpmOz+CCMRijEJQKFA
	/Lat+mZhsCYxUmwZrtNCQqGDIpiQy5aO1NwsbRw37BbuFVeZsgWmBmuZ0+qgRvW5/4ao/7AS22b
	mnfILI04YxvdXEBf6HGM1LWEDGQ4RHDdx9Pbvl9RbtW+XyIyhiYMJNwxOR20hqr+655FCupeuaI
	cbDSWDWeLeOhAWo8mfPmVcvZaiHh2z5ApYi+MO48Fa2WwJsuxX37VDTZbjgXi79safZj2PGIc=
X-Received: by 2002:a05:6122:3404:b0:575:2f91:6fd3 with SMTP id 71dfb90a1353d-599f6cb0528mr540631e0c.5.1780046389580;
        Fri, 29 May 2026 02:19:49 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d92702d2sm776317e0c.11.2026.05.29.02.19.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:19:49 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9639b1ef167so481980241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/nIqaApwXZPVausquWPfYAoP87ZbjD4/WwpFqbtKGLH8Mj8SKue8qhFCGbmMoTenEh+4nXzO+slDlYlN6FlCwtJg==@vger.kernel.org
X-Received: by 2002:a05:6102:3c9d:b0:632:29a5:bbf5 with SMTP id
 ada2fe7eead31-6bf3b0353ecmr638347137.14.1780046388749; Fri, 29 May 2026
 02:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528070239.33352-1-biju.das.jz@bp.renesas.com> <20260528070239.33352-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260528070239.33352-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:19:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwboeT30Akf=bpex1b+OsmOL_4j73vZYOMZg2SZyFbcA@mail.gmail.com>
X-Gm-Features: AVHnY4L5q4t4ywhQ8g4z2FVSpxaYhp1qbbGIJUT0XRLeBom7yaAr_DPkj2kig0o
Message-ID: <CAMuHMdUwboeT30Akf=bpex1b+OsmOL_4j73vZYOMZg2SZyFbcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 I2C{2,3} devices
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33330-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: D2FC95FFD22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
> setting SW SYS.2 to OFF position.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag.

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

