Return-Path: <linux-renesas-soc+bounces-34113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X5p2IDtLMmoKyQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:22:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45C697237
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A004B3028EF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 07:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ECB3B9608;
	Wed, 17 Jun 2026 07:22:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC06E3B388C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 07:22:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680953; cv=none; b=u2zqCfa/ng+E3I3PdjLqOVHfNULrfDlic9QHPz9CiDeWq1jbi2QXp0mdNBFJs+rn2nVHhiGtgMVtxoZxdXBq+2G7Obl8AziL4jdyo3LTcTTaRXSu+ISqooTAe7axzDhNY5JCQgYWmXqas9EeQPGw1dAgzcGO0EL1lOqcXsXpvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680953; c=relaxed/simple;
	bh=zqRNRewoBpmHTp7Xk3UHetwxFmtfNMdTc5mpQ80sxZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ4x/65W4eKTUDKOfLScCiP+yEJWhlloY0k3KR6MeNETGTjLt86mQhsNXlELxr98Vu9s40aPKoZABwAO/iS33XG8HfmW7Bp3HJ1zuBOLFBLWwBSkIdj9YXSDlZh42QM/0mYI9RhQD+QFr9g7uURnuDO1g21zw4Pd7AQu8nRB3iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59e23d70dfaso2516005e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680951; x=1782285751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJJv1PNEf0VpJ/XXPLmaxN61dHusNzB2ydX0p6N48v8=;
        b=XuQpkc2Mr5dOfeap7GPAGHVMV1xHRxCAxNERFLOl7uAbLUXD0kno6lzk+s5DM/SIBS
         xt8Zp/J9FRyatloTEnGsvHgnAPizV64UvTq0L7dYv2xepyqZIi4E58I6GAp4Jc57JN1a
         grTVfLBNmHus8v2LIF/GJbCz6lplsiwVarAGztb6/d6/iezBb9LHmDZ9o7grpQFmMyMf
         8NzgmFmmJFjYOOPendHztFO8DTAiH0mnkKAUrlfo55UxsumJlr16kYjimioY9ejABCVq
         Db/FI6j6E+Hjqume5TSSSNENH/UMzz4abQNrHigpR58aexOdMFDrm/hj2cjiGwyFeHa0
         pLJg==
X-Forwarded-Encrypted: i=1; AFNElJ/0kaENWtjjFzFf1ABIulXF8RHKKjjaUfmNPa2IQXDs8+yVoFFC3qJFAGuaL4fNSuZmufZtMoe3oR+ckqT366Se2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4mtzhnga65UyX6P2JSmqyKGdg23nyOdYmTUreuVsWSRAdpHiq
	7N2rTUqsZ2RLQ5lkBQkh7NiNI88sYzZXYRKiLcdq0+JIE9f4UXoUmGCmXEa0UFX/
X-Gm-Gg: AfdE7cmYbY8bfnD7yTK3DOGWkfei6Nnlmuf6zaabSzsnCHgpkPjsJP81q0wZfzGgFD6
	cPAlFOEg0Pf+hpMF0ObDFmHB1wf+DIe3bfhyaszIH+5xZUVQCQ1lA2bKFYmasaSny1Po6fVt3cn
	KfiLkGwBUCaK0g+7dNdQw51GCdM2MsmuaQ1/t1WKGSZ2MXCji9NkohSazU7PZYi9RjF9KoDAVNc
	KDKE3lOeIw65/NQyBpsSZgDSxaBSmv/BNS1ej9/xTJA0zutA4Fnu286SKIh8JlQmsQQZPiF0kX3
	/Pgsuws9bD8BYgSO+ztGT06eTwpE4G9dbteRScZ2UE8oo/nBtfE8Q/HqOS/3uuPyNGZDn+k849s
	UoI+vvb2R3fLz9Et8tq270IVz8LJlX4/EfnNEHVx8FxKVcWsPE3qun3r20g7GPIPk/nzsl1Kj8y
	SMNwYMSXHCKAIbB5eGts0ObMC6xby+jwmZyZ/j5EXXmbQhT3PQ16NsFGlLdYUE
X-Received: by 2002:a05:6122:54a:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5bbc0d23109mr710476e0c.11.1781680950671;
        Wed, 17 Jun 2026 00:22:30 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb8ff961e3sm7964259e0c.3.2026.06.17.00.22.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:22:30 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6cfc8f8e127so2151679137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ytmVd0rQqbqykZtZlv2OZ3Pl8eq6foca/V/FULZhTmj19aHmk+lWF7tx0IjS6hjNJsFxLcg2gwCG6GESNszK6gQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2b9a:b0:62f:2d04:db5b with SMTP id
 ada2fe7eead31-7246d42dc41mr1280153137.24.1781680950072; Wed, 17 Jun 2026
 00:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:22:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXg16frnn88_P_jHRH+HPy00wWfoqNKdOv8teSWNpMEGg@mail.gmail.com>
X-Gm-Features: AVVi8Cf4OglYcZCFMrrSmgF7E4807IU6wsvfZGr3kR7N8sXGY6lLU3UyPN82lAM
Message-ID: <CAMuHMdXg16frnn88_P_jHRH+HPy00wWfoqNKdOv8teSWNpMEGg@mail.gmail.com>
Subject: Re: [PATCH 06/12] rtc: rzn1: Sort headers alphabetically
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34113-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,gmail.com,sang-engineering.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,glider.be:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD45C697237

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Sorting headers alphabetically helps locating duplicates, and make it
> easier to figure out where to insert new headers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -15,8 +15,8 @@
>  #include <linux/clk.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> -#include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/module.h>

Sorting of special characters w.r.t. alphanumericals is always
a bit fuzzy...

>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/rtc.h>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

