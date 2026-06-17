Return-Path: <linux-renesas-soc+bounces-34134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IcLrIJV2Mmpy0QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:27:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F73698785
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF1A43204229
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9E83F58FB;
	Wed, 17 Jun 2026 10:20:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C83F482B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 10:20:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691634; cv=none; b=OLPaUPDK4bYnD42d4j3vJecHihLSmgEB71fPNx7wzOA1UZSJl5WqdIADs2jvY5nVasmrb1G/8oZ65vdhEljnfDZIw9X25KiAEbAWLE7oQ/2ONJv94B9eH2VIwE6zj9fn2VJLyD/eyAkZLpK2A/2Nzy6nB1K74j3T/tgGIuQY6EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691634; c=relaxed/simple;
	bh=En+ahhOZBbXCaiFjFAYdFmkGS3nfp+aP8u8ut054atg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaxNVpVswjUBsn+0IPrnr1MsU8LHmDJiXni5qfs1+jPoxP570XLxLo/D0GHYz9BRsqT0CN8b+upqT5oTJ+2FXmjhnEL0C4pdRqTYBQ+EBVNe8NdzQftybwNiqYrEGLXoxWDj/f2mgit5+hqvIjqmghQAlLku62vc3JzrLJbJ4pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966db0b76daso292294241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691626; x=1782296426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiX1JmAxtorWhZ6jPKmVMMl1atN7mp+BVTNS7cQc1aU=;
        b=aDQNAk4nu7mHGtjeDQiQ65vzTLYZXD5SNUThetxc2i8jYiISNwyc2La3ON+fAQr5YQ
         66eG5rG8uGUSmzxXoiRzErtnGCbhUIQiEob6Nqtawpxsm21GEez9QUqHIrwrXoIhIQNj
         puKlwl64cjV3UxlnnPkVv94Ia+wU0xI7eBJ5Ax6pIzG79CA+EndUoVAiDpMAYsMIGdbI
         /vIR3Zoxflwie+QDUSd1eq5gChcBNZBEyI/Bf60O3bT6HcPcTRL/oQKRu17vXLNnHiB/
         UCK8gNQqpuCVuA3HwkQiLqrujEXL941zJuqrLbU0BP3E4Idr8ELjx0PSIv1PO2vAu3WH
         2zYg==
X-Forwarded-Encrypted: i=1; AFNElJ8L3D3FXKuTvHeMaDkvdQZ83Bnhrp6JptAneyN+FGFO8pyNU567p3tydRPATSFzq5g2s6rFShKFIsmxKhgCn4aNJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfjZWudy/mWXd+oZKwioS6O7kFHLbufM10ds9TM2e3Pfd5TlN
	4k6eCZVlMq18TxitYUGcSxjwJ1P2jcDE3fjeeW/1zl0SO0Gg39zhZP76hjDEDS2x
X-Gm-Gg: AfdE7ckADeUg0vN4zaODWX4FAHFhYccz56mYyG7S35R7Qll20iYVoZQSCYmi2prYWKj
	1iQ4VXjrnI0dcyJRzdEGwKz9yeK1ZDPEFsyMetonO73RQD4FAOLd/FpyAXM4dwgJ3Di8plAR8bZ
	x1kuPQbvpNogSPPz4+mSZ4r1cSVi05SfRk3epngf9ZHrjia5J7dVpASl2PoDg3gFz58Ma+qTX3U
	CWBr4U1vQo9b3Qf9oSO45U1RBzSq6D8rDWq9cVn+zS1tuIfwDodW0bZapVeg10ZsiUxnAqEvfbT
	HSCeIol2It/1Z3q6konbUKu2meA6XV34mOKSo+TX/TLrwRGm3z0q+Rvi3RbaBj7cy8ydu9L11oh
	eyIdaJwHd3tjPftMhWxyfkY2VEIY6ETZWPRnO2xk952Sl/Byavx0OQ7rN2wr8pL+k/wtuSXLYis
	TGOykbBADjUuvLjx5ID5uIeUWo3M4lVtH9b+grPy8N8K3TPhis1w==
X-Received: by 2002:a05:6102:80a0:b0:6ce:d923:7642 with SMTP id ada2fe7eead31-724f14e7ef6mr765143137.14.1781691626242;
        Wed, 17 Jun 2026 03:20:26 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72481eb4566sm1668692137.0.2026.06.17.03.20.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:20:25 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-72257ba51e3so669279137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+lX9dKugeog/24TU9SD3bp8lKAaykgpgR4Dak4VJh4aS0NSQPZ2uxQwzyX9UsHHWrWs1ymNRyLfSdwS3SctJ81zQ==@vger.kernel.org
X-Received: by 2002:a05:6102:82ed:b0:6d2:1633:1803 with SMTP id
 ada2fe7eead31-724f14e6aa2mr709969137.19.1781691625320; Wed, 17 Jun 2026
 03:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:20:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-FWgx0Z750_pVYS1iyH-eXgdf4ht0ZBdQ3itK-qL7Zw@mail.gmail.com>
X-Gm-Features: AVVi8CcyUMxm1Grgjsstg8ysHgy-x4YdUDopNzMau7jtRCWUtgAqkI2pm5pxbag
Message-ID: <CAMuHMdU-FWgx0Z750_pVYS1iyH-eXgdf4ht0ZBdQ3itK-qL7Zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add RTC clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34134-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0F73698785

On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the core and module clock definitions for the Real-Time Clock (RTC)
> peripheral on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

