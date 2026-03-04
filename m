Return-Path: <linux-renesas-soc+bounces-28748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGG4Ohztp2mWlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:28:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 956281FC99B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FBBB3116546
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 08:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CF5390219;
	Wed,  4 Mar 2026 08:24:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF892FFF89
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612684; cv=none; b=AgpzY/IbQNnVlBO3EGpXDm/oNu7kBrRY4da+oBoO6zVoEm6XTZPH9uy/hgYahe9B0jP/qt/WjOInhpKukJn/6xYfXZ1RwqoCc5ByLrZ5PK9W0hysM1szaqTvHhNI8dGd71ohZ1BQX1IIayAvWNUtIiQw6wjAakDCvS1aeUZPi6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612684; c=relaxed/simple;
	bh=hvVf8TlLuGjoIz83VTaI7zq1/9ObEux431OnwSCmqt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQNzE0cOPdsC0N/F8gPrHcZcJbgyFKn6+lBex3qJUFZTlRpnajWTCQq+fMVdRqSQph8ElC6tNIDKWXAxKVpO1QdI7qnqKuEe3yHxfv3rXxhL0pqS8mJ5eWBjUM9k0YKC9nmGDbx7X6wemWXNIZibwlu2Cz/iyD/EvsKt8uHYEL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ac5cb71feso1902394241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612682; x=1773217482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7u7uhYwMdf6c4DLmq4MuB0mDDGy2FQPNLYh8zUmWGI=;
        b=UD2Y2X/WIhjmSUuAy0TLew4lLlo+K5DbrhkadUr63iDyzcp0Mk2+oeBue6+hSefoXO
         CjWujc8eK218JxDVUikxuUmtkz/nn03f3uKZzYGSEKLXr9/CdGfUIJz96FUfRmvRmWcs
         MJpZe6Yz35BOb+/BNw/V92XYbO9SOMpdx/WmJLx/f60ThEral0MTUH5okkqoBRc8c9Ia
         aT+V11eCe/NNyrqS5jlYb+yzmdNJllibYAH+JUyOFI4dRajDDw9Om1rpO3Xp24c2Bl8r
         1SmPBMGBGyqCx6+EjCJirPYHw1ZD6+aDDQpINtxzj7KkUEb6UELl57PbpvKCqzGWutHI
         jZgA==
X-Forwarded-Encrypted: i=1; AJvYcCW7D0Rxv5FeIY3oFMlLepgOPO8uvnjFshB4sqkL6Xh2pt2KwG3HC8KswUKHJEvAHEZspLa4v4rC4jI3FN1fjnTNhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwThhQxBPiJR3aJV8FdHtgKNrzZFUrVgUr3kG0V2alHH9j5+8
	fc7Ex/etWl1p5kKuyL1+2Y0stmg6qnipeZ1qCEvbRQWDdLk6IIktrYG50XpDY5iM
X-Gm-Gg: ATEYQzxfjQZ3m9K9tLDn56+LBwAVPr0F0t+xC8KPHSLaVzMnfqipSzKsRQgVzI4rgsz
	dSxWDOcfBOZNEe6OoeUTtWZDCBrpD0CnGrh+3OM8j4DDLWj3UauscnDveLxbslmvzhLq/UktmYH
	NI1u/Sg54mcprlsyecbpqM21exurV93O2ZFZh6WlimCNZhGlOjAkTNPtRTh8zBu2PY9+u9Ty6LR
	UTrBBax7PB8Ypn0VLQOOXX+KD73ikOUFND1kNwVm5e1OenectLxCBLaJtxka0mvB5S0rFQ15Y02
	aPQi9rH5frLNwxZkx0LPUw4PeAvk0Cy06V4HekA1oxcu90l+hNoYZg3ljnxWUziUyNZ4bNtz+gv
	NGCdrQsG644snFt2xJKWbMjFE3xNIEiBvnOYrmcJ+8BL9Uaeh+jD5/4So6cckAU8nwKR+t0EXVB
	YtWCh2+Px+c127891zIPE5tN3NeTZ7y1An5y2ynM48owt9wTVZlXtmLUsxZIbd
X-Received: by 2002:a05:6102:32c1:b0:5ff:172c:2d96 with SMTP id ada2fe7eead31-5ffaaa867e8mr506598137.3.1772612681999;
        Wed, 04 Mar 2026 00:24:41 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df63d8abbsm17048236241.2.2026.03.04.00.24.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:24:41 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so1980064241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:24:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeJE1jrqFKXrz7neDdZlsYUJZUJAw+MuNGUGfaer8E/VukF29Hwjax6GxRdi1jl57kISG3RWBzvdT0/uIzJSeYSQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr500406137.7.1772612680850; Wed, 04 Mar 2026
 00:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com> <20260120125232.349708-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 09:24:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVd8w5EZHbdfzvV_Y6WF-UnAKXroBdZvN4nVXicQq8z-Q@mail.gmail.com>
X-Gm-Features: AaiRm512q2K67vjOqf-uWH841QxdlHR7tR8K1fivAq3UZU-sn0m1djMQb1Zv69w
Message-ID: <CAMuHMdVd8w5EZHbdfzvV_Y6WF-UnAKXroBdZvN4nVXicQq8z-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: serial: renesas,scif: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 956281FC99B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28748-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.254];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,glider.be:email]
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 at 13:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SCIF binding documentation for Renesas RZ/G3L SoC. SCIF block on the
> RZ/G3L is identical to one found on the RZ/G3S SoC.
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

