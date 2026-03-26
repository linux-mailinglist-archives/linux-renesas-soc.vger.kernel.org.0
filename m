Return-Path: <linux-renesas-soc+bounces-30363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOLEAHVExWkU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:36:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5B336DE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62A9730CC81B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256753F99DD;
	Thu, 26 Mar 2026 14:28:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628F37F759
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535304; cv=none; b=jsX0yJeS3BsZgwpiei8Vvy0V8eqmuXNwxATFP1drL72HJ6Ob3e2Ue+oOts76gwe8WEPtitTLyDZ8RPR4vEs7BZQg2wqXNGrHxg1gWgzzqLFfvctiKIbTWlLK/hjNZa1Dk8mFJWwgRIDqXgHIIb+x/KAYT9yAs8EjmeOvy0XAIyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535304; c=relaxed/simple;
	bh=Qu3UrdHfRGUo+IQpch7jHWfBEGOhd/gFnZp38a4AiS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMDDDhtGcvb7r4fdrkqbitBtwE9nw3ZIDAblSHf+sc3puyS9E2hl8pc+pdvZgBDEBf3tY/EhIebNpL17KIbh2roHIzgzdrk5teyJQKzN0H9egJRHPzheQTdcAR1noe5hXz4dysTXKT6/95tQxhjEvNLQ4Io+NnCLm21HcpE1RvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-60291b2cd89so332002137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535302; x=1775140102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx17fbCum0HxJGLiZIM7+APW+qVuJWwyHiukjhC23hI=;
        b=Bt1FSI0B68IYhEdGitg/bXYt175GdGNAbCJO2jpXvVp1nVkqob7vPuwXquBwtvSxDU
         snu14ShV9zD+TUMhFjjvY34mPM2xhZyPJ+6dDDvBUDolwyMIJ3qETxfG2iqcR9JNGA8W
         ah5KdXyzIzM8Jn9OXDczwiW/dmfplLiRbu/Dr58cpu12BLbAHom+NDrGuF2jUuFzBcfC
         R6XPHlyomv5IbIhxuScfUTcg/lcPkkONH8478BghilZdMt4vwHOPkE0tDHqAl/X6oDt5
         3egRZIBljdNMDm6VYkPyl+JUFf2uG4bCdcGzRplhVwX8zZQIQMDK1J2gDrnctuxOV6gP
         HFXA==
X-Forwarded-Encrypted: i=1; AJvYcCX5o3TxUQtfMzwkkGkM3R2IacHD5Org8EsowiUDuWDk6wu0aB6TmOscC5TGcem7XPGiJnpIhpauoppjHqsUMBK/dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLdu48iYsy9VFZ5PhiVa5QTgLL8FqRhaF6UEVEOTpny27lOkKl
	NJfCvui+vqgI7ceezvaN6T4KqQRLDII2gVteNXIyE5yeNIOr6Io8xye4A5kEkXDb2Gc=
X-Gm-Gg: ATEYQzzvOzAmzIHH1YyvPbd3C0CSX6oYU6aZOBYQErTkf71SU4YZnQ0v2X5TGoVF4zH
	8xC1uuUa1xdQbwwEz47jHkqMi0L7wNo3WfPQX/iJZxkBjlLQLisIV9vLKuGJKikOagV2mLSHEmu
	sKyYVWtY/WipU8IKQuQEeTvTx9rfwg6Y3VBAk+z9tP+8NApV5hOt48Eu4XBvm6cAIfZ9ILhsTAG
	0bZM5Lo0RQYUTvNfq+vOX3j86gSp8MQBEdnXLKjz5pn6hXNYuNAVYQRMUojF+b7rWMcRzxFQXf2
	IJHsB3eNXLCZVv9kz+mjCbuswMPQSV9d2SoLuQ4seQMkNJnZkBJ7Jktt2pVonRAdKhg11OW7y0e
	thbwTo30vxayUGHjFmX9If11fhP8r/xP3jh1C3HbvAPlR8OgVGTOEKt/XgtZMBzEXJOeDbDrH1U
	KcXk6uEkfkGlAX915UpVV+jWZCvTvA+6ftUqptYYmKS9Y6/YL7ZjwRLsNJhJzdLIk1
X-Received: by 2002:a05:6102:4bc6:b0:5f1:72a7:f879 with SMTP id ada2fe7eead31-6038733a5c4mr3313364137.28.1774535301724;
        Thu, 26 Mar 2026 07:28:21 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1a149asm3766160241.7.2026.03.26.07.28.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:28:21 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so464354e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5pM0ZV1cE4+xKte08qiVVwXeKMzIpbD0sasQg1uw5eszuQdN7Wx9rEVrhX6Z4K8G7GVnhbEXEzkxqb2k/upEMUw==@vger.kernel.org
X-Received: by 2002:a05:6122:62f2:b0:56b:7a5b:3cee with SMTP id
 71dfb90a1353d-56d220699d4mr3816280e0c.12.1774535300726; Thu, 26 Mar 2026
 07:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com> <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:28:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQOQwZ9qgVaqWNrhA2mVe-5s5QcmJHD10QheSOcOn7qQ@mail.gmail.com>
X-Gm-Features: AQROBzAhM3AW6MrbB4cFj6sp3RlNTps86eZahrOvjSYvBr_GjZzQv99EoywigDk
Message-ID: <CAMuHMdWQOQwZ9qgVaqWNrhA2mVe-5s5QcmJHD10QheSOcOn7qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30363-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: 8FD5B336DE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 4 Mar 2026 at 08:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
> the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
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

