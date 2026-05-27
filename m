Return-Path: <linux-renesas-soc+bounces-33218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH3iBDILF2qH2QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:18:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FE85E6BBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 803FB3062CF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 15:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A103F39E7;
	Wed, 27 May 2026 15:07:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690B7421EFB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894436; cv=none; b=X6xP+bVEWwH1A5p8Wb1i5teS77qXc2p06Udmlb1pnT4mJJwcog3xZisbubny8UvtADdFGbQE0yNsVpXzVcJH0VJyospcsj9HFYkG/2BwtG5Hd5r5XgGRe3RPsPW+QR/o4JhhfBTMhC8UrqC/bRL48Z90Nw/jWFGd95DgkGK+Qw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894436; c=relaxed/simple;
	bh=H/HylOP18ZwqwzSynz7IVJuiEBoSrCg7QihznW7U1Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vzgzkn30VO6e6BhQnu9BobTyy0ASLcqsxymNjHSl5N+ETChU+QjcovVB5hEh38ipiGDtYFuJgao3C169AK5jHuWV/R6XMpFQjbvREp3keP086uRNmjKz7OU0cLvBr/zMFpxwZVMBzH2/b8jAawv2eRu3NkBztMBYJJXnvWU5rXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-956948531a1so3163119241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894434; x=1780499234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tLo8u1Vz2R4AkmN4sReuuk/c6zepEhZe6+0SFajHw8=;
        b=Uk5UZie1rQGb1l8RLCgHsAg62jhMAh4lxjSaAI6bx7Q32i9iovM7bf5GNgD8a30eAg
         qsjLm0O7AwjmuEvJSg4RSq3bciJW0XGENfIh91mSmYiezgYupY6iDd88JUwGa44WryiL
         JFzAzIhMBQ5h43+v+D8VUkVvqbyeShTKe8pxq7YHo+AALNyLCpscrpWOo/XK3rcsqjYo
         9SRGFVGYKqzAqS0SXgiTgTidEblAnmQ3ZDLfeSV2I41eoNaNmsfW2PopUM5nJ10VXxmq
         pKYgD34xKDHxRFs/whrhDRrg+eJdZHTiC/ees4SqPMM+YJt3s09mkRKciHr3QVZu78CV
         jxvA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ujw/P5Q2mD2c7vAXVGxiKmexnrXK7yNwT8VsJkq+Vi3t41z9+P4iO4u/BgAN+YP1z9SEtL91iYyNSj1lFw8R70Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7F4BOWBS4Vm1aRYrcTiNPvfBGB3PUln9WRHqgIxzmk70wME0E
	CHs+kj2c+XuR8/CEcK+ix7pUE9PTjkVGnjbQyMsyihorbQg9BSXA3XdlVU0/EibV/jg=
X-Gm-Gg: Acq92OEXDHyc2H3ur6EImXnaOGWe42iexVD37qMyqrfMDUDApa4p/o+M6U2g3HVQkyx
	BHVVbfSdV/U0SmEiWof0sz3kL/Po4Fv9KV2S0yM7lF0o2sdUnxbdE9SbJZp9rNlZc/Wtk/Y/6Pk
	BcgLTPN/abIiNCQBl2os4/ps0k0j1exxwxvZF9nZxwd8trUHWn4eEd9k9vT50ZQ1b26mBvoZjPo
	fhq1audCI1nwv3oqhOIOgkYn3WBUnoUaBt9kqLFJsDzW5u443xifhEIhlukqluFevT6EAwfytKC
	tURpvLfWgo7kUiFabRbLQOOzqixFNYSacMKv7CtGECIlxycWPsABVmhGUhSXe6+dv6lmsF582Zb
	0nMeU1/Q+oS5mupsezzSjrvr3qIRCeyrvAWUv7Iwp10YFiOgjzMlrmYFZpniq9+Brp0jqNmns7B
	8La5FOFyL9WAN3iNKmabCzrZ312K7sXAJswJVlbiZJbCPWbKPDD79/G84UWLz04h0X4Nck+no=
X-Received: by 2002:a05:6122:e465:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5865ec7ea17mr7587973e0c.7.1779894434159;
        Wed, 27 May 2026 08:07:14 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961738430e3sm17411672241.5.2026.05.27.08.07.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:07:13 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-956948531a1so3163098241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+AUk691W7yHlmMBMZV8jNGEHI7gdjhv+OqLVzZ7IRAoLs1oD3KGo4WMuKnKzlK5b538u+PVgxpXSpnaJCHgSURdw==@vger.kernel.org
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id
 71dfb90a1353d-5865e2b5250mr12717440e0c.4.1779894432539; Wed, 27 May 2026
 08:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbTQVF2XnC8CFkDnCr55Lf+sqC+SyVBouXSKZjxqObAg@mail.gmail.com>
X-Gm-Features: AVHnY4KHTobvA38i81edRkw1RH0rAYyI2YTU6RYcwFLR_hc61OTVaY-Gy3btGV4
Message-ID: <CAMuHMdXbTQVF2XnC8CFkDnCr55Lf+sqC+SyVBouXSKZjxqObAg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33218-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 04FE85E6BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add i2c{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
> As the place holders for i2c0 is removed, add the pincontrol
> device nodes to make it functional on the board DTS.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

