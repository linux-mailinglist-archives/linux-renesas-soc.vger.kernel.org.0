Return-Path: <linux-renesas-soc+bounces-29914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFhwD8sYvGlEsQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:39:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0B2CDD56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A95E03025F38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEE03E63BA;
	Thu, 19 Mar 2026 15:32:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22137DEAB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934334; cv=none; b=u+u95PlHqUcVW5ze3nHFip0SErEwkTug90EKSooy5zs1FxNBPE9qyFqGvon9PfzZgE6q9MF0qi+gK5lVrdPSzvueKZOhoq3UGTo7OwftyvCoLYhuJPm2eeJQFWwKzspt5hLN/NrnnMdnfEE49H7gbWe/7/Bm7H+cm2uAnxROiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934334; c=relaxed/simple;
	bh=vXnxLZDFMsXbZH3qKkGOnVX/RNECvFZJUjIe10GDTaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjq5W28CLHZ/1ZZ59SAe7HtJKvjdLXoT3Tb+KBS2LeBaAm1UdJMHoOQKDd3W91Q2vt4QdtwwoIkR0IHOi5DZu8TFFqr2yy1cCmrcG9PLW5ZwMyvtTyBYzRDVHoOkJjeEiU2SrgF3C2R0jZZGoS1hOrhOzN5Ll7GoaJmSDhqlWT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso259599e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934331; x=1774539131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD0xj8TjVx8IaFOOza8lFHCZSv/B3KHnHlTToYvdOjc=;
        b=tMmTBCaNQXhkOqV8ycZLcbo/R0zWh/oIjAkTArEsDvRw5GjvWu8QlTaLNwttG4SLq/
         lzLBUakqJPaObqIsFpM2IeVyrzEnbtKIgSsje9+MMu0m7LDQkierRtWSnvIV7ILBceko
         iy28PohbxLdhT5nlL/rUYYTFsM7iF4qWPwzR1W2lT6I+wH+3zy/chSZRJIFwWK7hJWpm
         WRTOELHYPky22pPfFmpPmQDfPGH8KzqTA23ZWdFZ+BwfZnM3wOYaugoUjyDuWFTWa5Bx
         zz0ChiWVEqzqd9A8FICTiF6sCg7mtlIsaNr63qbztaxyqmkr86Z8hou1YDrERCzr6gP7
         fDkw==
X-Forwarded-Encrypted: i=1; AJvYcCX/RFc41h5jZmTmmepMfkm+31yVaosLpX5LIeEXmBx+rq+d2JptNpXnXbBr7kUd3tOCypiShLKnX2ymYHadon2f6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2UTBV+B2vIum9aSlogZOHlALM66LqcgLY2p04Y+Aeayl5DNpB
	8Kzo/FRE3nFHMHN+H39BuEKMB0pb2t3wtLoxpdujxZiS2I0jhCdLOE3MGoZDI+gu
X-Gm-Gg: ATEYQzx68FOiasQXdSiLaN1lT+n9N3Dx45rk8+VwJCn7xZLbqJb2Mr6uzfXdNd8ngKT
	cgCTTWuMbevAn0btSA0rQVjNoptIQpVmfg+MC7PFE+a0T+zxG9L5MuHDRuAjM6q8/TXdvebIH8Z
	IOXv85ULgSBgU+0Kt6pZZIZLl6qMcakU/9SEn0fKxAzE7SXH2mQw186kZXIRPK21CiOH8qG+LcE
	g1dd03ONhxx0MODUaxVxOs9uf5mrihWYHS6nN0tUvczD4Oqc45dwvO7jn8yujP9HexVebR9hMi6
	sZ7Qxwbz6oLzJmTzKx0glP2wXXaZNIdYIIOA/uhiA0pVVY0oUej7I24i8nBoR+5ojEBxb87vxUh
	B4h8IN8BJLJRXQ0qgFVRu6ykOtNv1+HP5WrrQb0u++rDKKV6JmJZ3Bdz4TNke8SRv7mN3a/aUVg
	6boCwrTIdQ3DAmFG4vJSOBUTcNsEY9v4a1UtNoUPjP4TXhOK4TiTopssBDBsIvxCKE
X-Received: by 2002:a05:6122:4888:b0:566:2711:d8ab with SMTP id 71dfb90a1353d-56ba7034c0emr4289663e0c.6.1773934331245;
        Thu, 19 Mar 2026 08:32:11 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e2f265sm3467152e0c.2.2026.03.19.08.32.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:32:06 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so307776e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:32:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhXOomeg3ZdxzCh3qMjp3ccqHUys9isVEultLjGg/TpDMqKVD+77EX/sKaeR1wgNx96cau68iKRKwgGiZBLud0zw==@vger.kernel.org
X-Received: by 2002:a05:6122:e183:b0:56b:7a5b:3cee with SMTP id
 71dfb90a1353d-56ba71419d6mr4293734e0c.12.1773934326451; Thu, 19 Mar 2026
 08:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com> <20260319125143.230377-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260319125143.230377-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 16:31:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhU=mBKb6urrJ=wPsCANgWHWmAOfSNgRKMbgjSznMPZQ@mail.gmail.com>
X-Gm-Features: AaiRm53xlVwi8FLwAu4pk5ImJpmsBy5XJ2IMtsQvF0FsPi9ny-Vah4lMnmzvt1Q
Message-ID: <CAMuHMdWhU=mBKb6urrJ=wPsCANgWHWmAOfSNgRKMbgjSznMPZQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29914-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.152];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,glider.be:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CA0B2CDD56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
> into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
> decouples the logic for setting module stop state on disabled clocks from
> the iteration loop, allowing it to be reused during resume to re-enable
> critical clocks.
>
> No functional change.
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

