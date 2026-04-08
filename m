Return-Path: <linux-renesas-soc+bounces-31029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDk7Fl911mlQFggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:33:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 465613BE40E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1B9C3007B09
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CCC3AE71C;
	Wed,  8 Apr 2026 15:33:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79927603A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662414; cv=none; b=kvU3gf44m7MroynBlEDgaW8yZa7sv/1L23x54DvRS+N928wUlqeTY4hQ17XhTn1+HkbtA6hSU8kK+cMLsv5VwhpDGaqqldqz3gqw7w1jDQq8DJzcMb3p1WNTTyat1EbFeaeq7SdQGG33TLtfW1v2pHXtVBGmgpAixvaMcd8mNo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662414; c=relaxed/simple;
	bh=vYeJgs2mhHByy+98keZ4Gmzx63fvwUbvAUcdzqiDaN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EC6XzF5Q/xgw9kh3GKJTaygUTLplY9MpFRgQ9sqa3vFuWSw4kAerOE6mN9iChC9XY+b1+zqj3rDD3eUC+RF9DNUOLe94nZvNGzOIFAgbKfoUEF749pBPblLmIsOu07XzoKk6ShmpAUsdlNHmMwBHU+TttsZVffIoRAa1GzosKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-605823aec55so2080137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775662406; x=1776267206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9nRZNcvwximR5DCpG1zOL/aayiKQMfOUF5yCWv5e7g=;
        b=niuvqdXU4A/ak5Ac6SBk6EpvWQNEpnD95my4WedXAj3CZ9rpN1iDnfvxCcpu8VcBeN
         mSxIBHEI1mglW3oP9swELcXT5+PDSZKdqSiwZA1gWNodcpd5xfawpv1BRzh4NvDi1IDi
         ACDm+09t+9Pm1M4ntrdR7l0ONsVFCi3onegIr47s50OmiRyNE0m9Ko1rjJ4wNyiiKrWm
         u9hv/SU2ZQ7RQFgdqLFMte4JhookOMenm8vZ6+XrieG6nOTDIiUeDXg43/YngEmfDVoS
         FgFNGbFtesyj0ZRK7WKZXB6SV5uUPKN3j8D8gqUVTkhOHSkQXzSLo6xzATFvUg2ldBBh
         mUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5anO3O3+7MTMVuSS0k122dmCXWs5JsHYw9aF5c7nMM6UJjSWg/kckeMTd3N5CThx6awlhpOFVgRaBDq6SBcOQAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo515AYPMyawNuMB92eRiWMnw9KK4BYAdEfRwvSJRaTtEEsgz5
	eDYV352SmNG44Rxa8VFOn3dHG+SBuYPx9gHXtUUFZY0aMm8X8uoeJV+fcodCRdLy
X-Gm-Gg: AeBDieuH11VzksULzXkbgBepguZ3EmT+RtmU2G9EqkSRihwceowoUHboU50hca7sfYQ
	YYcJ8Qicg6npnEvjdwDlbdFVDvEYRtIi35WOjE1KKHGdEhbNV5pFfATYhJ0iDrrZTdYGprWJBN4
	uGaAYRL6ToOIbe4aT23G3MwJ4ZJJckxcP3MYk2Bw42HsDd4wjfmJI6S9OrYubamWpk6oF6PUtJh
	nS9apEz9E2Hq5VmGnIQ0HFNTQAbKZPcDhP9+jcS67PLAmy0LZxkzzIRREjtC0JLzzpeRg81uoBw
	vDosPJPTaFUPGJHzSd9Rn3WKOChECpQeOdebTMMhbQwQVzUdqEUC1s0iKlMojxliPycEKXrAx6g
	psJQpXdHTj+4e09XosL66mP7Vgp2puM93yhjlrcSuG0ys5qVrLeCFLEzqQKCZZGp3+iaLN8WLdS
	jl2JBlnbIJjzujywQ3+2eHIBzc8QDA5eWCLYY6uLbytvzud7OvJgw9cymN9G3A
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-605a50e32f0mr8162855137.29.1775662405867;
        Wed, 08 Apr 2026 08:33:25 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6af44sm16791130241.8.2026.04.08.08.33.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:33:25 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953a8eed138so3276813241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:33:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUncnf+mued/s8m3GV2YdYOy3o8O8yNLZL50VKVI6Ezb8EpSSHpPHkGUh+RKumS1rGFyBXjkBXL1ojsFuR9vw3yUA==@vger.kernel.org
X-Received: by 2002:a05:6102:5a92:b0:5ef:8ae:85a5 with SMTP id
 ada2fe7eead31-605a4fd0980mr9788654137.16.1775662405085; Wed, 08 Apr 2026
 08:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com> <20260403141341.2851926-4-claudiu.beznea.uj@bp.reneasas.com>
In-Reply-To: <20260403141341.2851926-4-claudiu.beznea.uj@bp.reneasas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:33:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFkVCDPziiRUpqqKmnwXKH4KAbf8v5JcE-LoPXze-aGw@mail.gmail.com>
X-Gm-Features: AQROBzDI1rHtPgAiWVAtygY72j8FMSmDElwmRff7Wzrfhiswi-VcJURy3lsQXyE
Message-ID: <CAMuHMdUFkVCDPziiRUpqqKmnwXKH4KAbf8v5JcE-LoPXze-aGw@mail.gmail.com>
Subject: Re: [PATCH 3/5] soc: renesas: r9a09g047-sys: Move common code to a helper
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31029-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.252];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tuxon.dev:email]
X-Rspamd-Queue-Id: 465613BE40E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026 at 16:13, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Move common code from rzg3e_regmap_{readable,writeable}_reg() to a
> helper and use it to avoid code duplication.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

