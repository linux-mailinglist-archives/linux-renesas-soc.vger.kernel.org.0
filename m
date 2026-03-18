Return-Path: <linux-renesas-soc+bounces-29778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M1tN2qwumlXagIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:02:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FAD2BC8A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CDC4326C2CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161BC3DBD56;
	Wed, 18 Mar 2026 13:52:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8B3DBD47
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841925; cv=none; b=I2fcufxA/eG5HHdlMkBRDyzFhgPjaV1mtgaWCIHw+NAbDXmQkVj+zxd75x5sBNMDzGBPbsBTfwcyiuOhdgfdeTh09PiOCHFMR+v1CiSTtlxo+cLJuRCDHo2tYbvRxTszszrArEN6CEaGW1Buubvin69IrfqTv+cKBdQQ65fPeQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841925; c=relaxed/simple;
	bh=mc3ZFYJpuY7HB2PXajjFXvvAb7650Lo20RqY4OfXG3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/tmIs6p57Vph47R3MmvCQegSbA8IVpLK8+c1AGE5Od2Hd0EDwFEd/wEdODOcEd4Gef736Aajasauc8649vakY8ODPpumflKpOkm6edMt1pf04VWOoJBJV+d2zrHs4jgQ1iw2shuICSnz4FpKnTP7OyY/dA+RZvQAMOnypIvq24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso2743591e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841923; x=1774446723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6sswZwwQf+Uk3ubatnIwSJtpQ0I+frMKeY2sBRh71Q=;
        b=Wlf/EHpV1JyTuSQGr4h2mibG8/AuSCwYHlJYLUEbganQGR+Jn6OlPnYUFrxMr9JRYk
         olgQWtf+Qw7fzXdtcQs0I7TjTIuCOmbaPQYp+N4wTGscfIaKrksFOknZsZQ83DDa5L83
         dS9KlA5dXETdXTjGLYLIIQhq50SsGMKWXIZNjanxdKT/XRVTwYvj8fEuCwL9VAKcTS7m
         pImBuT5XIgJn8qC0EELql6gfUv0LoVSNNSJxqIw27/723TpqPvT8efMlZ9Me3ouZqpnG
         fxrsy1XtVxzD27CgghXvrQhIgubyL7rxtOK6iUeDKzw0bQLE66sin6uZjh7uKd7+50PE
         Ec6w==
X-Forwarded-Encrypted: i=1; AJvYcCWadc9dgAmVY4h2LAkdoiZtRDJdxy7rK5/99efAhi0c5s3wzbbVUxTYEZ1qmfMoPwNxSgQCr/PgClrUt1CeQgWNgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsCooj+GtMxgQXPW3R7eLcvqnu7c7zYj9zKbpICLDEgGcGaYU
	MSipcy27qFqrrgLF5EY+AObKHGzNM1E3M61XruZ9QCPiU30KRGiprIL3prcZh9dGyDU=
X-Gm-Gg: ATEYQzzuFftmxeAIRbI1EsUwFytGEUfAQo7S3OL8NYB18kzgYbhtA17jwg8MdifxrG7
	NFmdxe5Cat32w0VxXKd4u+IXfe8fV7EtcsDGpEvwGxsLF9Z2QtZe0+cxYUGA3MOeCHnvrw8CY6H
	+Az6p6eOmoaEbbV1aqzVq4KTEPHpxiZDz3mKn63e5lEPIWkwMgWrjAVJVDeCcIAmT91084c/FNM
	ID97gbz/rBO+OjDErVT/3MFX5YLfvtoOaef620K16UWvWPoDDviHEhmb8RT77M+Hb487xA1WW3j
	kYn31qOS1WmWCNriUGURspqd8EHPNiJJXnaj2zV834IPA3ZTi9jGfmKbbPaMMCWpd+LDI8J3X8+
	zRANizjLDevBx35RjEa75eAfdGTH+WvUvA6T/64P2aYZvbqAIPa7zpc1PIp8kMxmT7IFUV+65af
	Q6PoOgW4Cukb8+TojzEzth6vYYEcQI+T8sMO9FIdPqV5SR58QFaakgeIi1zE2m
X-Received: by 2002:a05:6122:4d05:b0:55b:305b:4e45 with SMTP id 71dfb90a1353d-56ba71ef676mr1597136e0c.17.1773841922654;
        Wed, 18 Mar 2026 06:52:02 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e72ffasm1618384e0c.5.2026.03.18.06.52.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:52:02 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so1798573137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7Q/AgnxLeOph0edMFAnhFztgUxTqWnwmQMa6hTKswygn8B5/XFZZk6uB6wkvbV74LxaLPIRgS4UETOGqww7FrQQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3593:b0:5ff:efdc:e225 with SMTP id
 ada2fe7eead31-6027d0a6617mr1533255137.3.1773841921455; Wed, 18 Mar 2026
 06:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260123225957.1007089-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260123225957.1007089-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 14:51:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWm4Yxe=Q_yafOoG_AZG0wMKGys+pi8dNqcE9xVjO85w@mail.gmail.com>
X-Gm-Features: AaiRm52Yqcbh7zN6n6HsuQX68d87mVfgXO7iiNKq2svci0KHhjSW3azun8ynZmA
Message-ID: <CAMuHMdWWm4Yxe=Q_yafOoG_AZG0wMKGys+pi8dNqcE9xVjO85w@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify
 SD0 power jumpers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29778-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 27FAD2BC8A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 24 Jan 2026 at 00:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Clarify the board setup requirements for using SDHI0 on the RZ/T2H EVK by
> documenting the CN78 jumper positions needed to supply SD0 power for
> either the default eMMC configuration or the SD card slot configuration.
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

