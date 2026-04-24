Return-Path: <linux-renesas-soc+bounces-31632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2hVJLvFn62n1MgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:54:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580345EB1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E21330097FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 12:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502A53D1709;
	Fri, 24 Apr 2026 12:53:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F0C38A714
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035230; cv=none; b=FuwZ8yHZrea3EGS7QxjiZGX0+2DX/67WV1/3llD2H1CY0FW4kIFO1el8qonGKDcxmrF3NOL9XkNqRL594AYo/ityUW8fSGqnNBOqWduxUjo2MRoogxzGtbkXVuDNXVohrCWyBwoZME4961+c7W1mrOGsuqMMcUj+s9pgvTcR2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035230; c=relaxed/simple;
	bh=JiJcoMrr81heW78mZh+WFRVFAEv9sq2yJAkgsjUca/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stI9q6xo2KCjs7q0s7+DgCRyE/RviHFfGhlP+okaWcNwlrHlLkCuMTQtXgvuYjZnhJ9rSh+UH06GE9o8oxOcQmA8IGOYuyJRk8HyCfTvS+fQ2tS+6tGeRExMn5rNLOUQ8t0+ytzWS9WSLc98NsBrYlWHxv4hUseOAVWvWKJV9Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c01854477so282583466b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035227; x=1777640027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWuPEQ4wuoknRAimbXn+PnxB1sExNMaFbd6EJBCrV98=;
        b=OGEbayhd7sHOyeck/HutdbUkr7QKlS5BKCm4hOawqAjeod8O0KxUscMYgavOY/6Pgm
         Ce5ZfHv24Q2KjUWXbIPqFXI5fpfb922dF9PHi2MKtll6ZXt+KUmFp+qihT0inBBiBFor
         IHChD+8Z/MjCj6cgeA0mHmLhiOT/jRXXTAVkQN1tGvEodH35Ou8MtTFRPSABYWxLXnK0
         y8J0Qp5IDyD8EPSP/kkDKxfG/Qbi9Hua4FWgEVkhT1RFqWDAdbfp8gAPGVzDvEguGiej
         Yzae4crZSLD0t/RbYRu4Q7+u1B2aKUBmgtDVq5/A7n/hJgZfwB3xruPbpasZiJIxntRy
         ZJ4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9E+G9f1xjAobzlQ1i+4uehtwD5ZBFyrd1soP0/4oujmBgQt9P8JoVIuClZ+IwQ6c4hZaoBmd18qSwZWAw1DjUVRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxptWbfQviw+pRn597n1uzWSsQwQ8FngYwWsAhNB7FMGii7VUEn
	heVtqnt8e59dsiRcAMA3DaxNxu354YjOW0ChxWibM1jVsh6hNLOnb4x5jKrdICSTJQ8=
X-Gm-Gg: AeBDieujMSDDjxD1DZeKXSzS8nX9aBQKOYheVt2x6e2pQ4wEMEg9wpxHqsUX6FIipPg
	0T7KmzlLGj1Nv+QjKlhYliNPngTTt3Lg/6VAE6MdSy77XaUqd5ISCTw03862NV9rrY5gEeFMuPf
	xxE7cK9orSn7ZxxGXwOyesnr92DhH/LK1MNmzEZzFJpUgHCCuGZf4A5A7VO4zPHxgIO0/b9jTk/
	Yy5VGECbdFgXTd4d1ytfPqnguqLqKfJJN8CTJiqnzPKVL8V634X+rfHqLS9lnmfgpQYAXCeE7JX
	MlvjZodnTe6Y7a+RkIhiqkCi/22yuCuWRKinEGx8S6NXO2io7h0MjAVcldrTiSpl/FCPNB+AVcA
	tibbuIniNtCEAZdG1uATjE+Gi9d9pfczeS0rEpQaqerRDY6x5EG51YckME+dS+QuQQ2Pt9+ZlOB
	BVN5RxVB7ealJI1LGv3c5VZ07f0SRuCDZcF9/aAW/hsnpjZwPcdZCVmHyyswHSqoHSKMgVykk=
X-Received: by 2002:a17:906:6a2a:b0:bad:d530:dbf7 with SMTP id a640c23a62f3a-badd530dcb9mr139767266b.32.1777035226778;
        Fri, 24 Apr 2026 05:53:46 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm793412466b.23.2026.04.24.05.53.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:53:44 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f97c626aaso325809566b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:53:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ91LoEOkakGNTHUfoq52NfN1NJ7AukmndkLQVPpKLa/4KuXDAcTg30AnyfODLJ8HLaz5+h8uZCWBE91FU5BCOpsmw==@vger.kernel.org
X-Received: by 2002:a17:907:6d19:b0:ba4:ea47:5a2b with SMTP id
 a640c23a62f3a-ba4ea47b226mr1389280366b.43.1777035224322; Fri, 24 Apr 2026
 05:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:53:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
X-Gm-Features: AQROBzAGxz8erWqURAZ8ygYPlnHfb7Kkb4p46nGFXzzCf7yAkuPcam_l3ELewTA
Message-ID: <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4580345EB1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31632-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]

Hi Biju,

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add CA55 core clock entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c

> @@ -25,15 +26,24 @@
>  #define G3L_DIVPL2A            DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
>  #define G3L_DIVPL2B            DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
>  #define G3L_DIVPL3A            DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
> +#define G3L_DIV_CA55_CORE0     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
> +#define G3L_DIV_CA55_CORE1     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
> +#define G3L_DIV_CA55_CORE2     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
> +#define G3L_DIV_CA55_CORE3     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
>  #define G3L_SDIV_ETH_A         DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
>  #define G3L_SDIV_ETH_B         DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
>  #define G3L_SDIV_ETH_C         DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
>  #define G3L_SDIV_ETH_D         DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
>
>  /* RZ/G3L Clock status configuration. */
> +#define G3L_DIVPL1_STS         DDIV_PACK(G3L_CLKDIVSTATUS, 0, 1)

G3L_DIVPL1_STS is unused.  Perhaps you wanted to add the I-clock, too?
If not, please let me know, and I can drop this while applying.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  #define G3L_DIVPL2A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
>  #define G3L_DIVPL2B_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
>  #define G3L_DIVPL3A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
> +#define G3L_DIV_CA55_CORE0_STS DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
> +#define G3L_DIV_CA55_CORE1_STS DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
> +#define G3L_DIV_CA55_CORE2_STS DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
> +#define G3L_DIV_CA55_CORE3_STS DDIV_PACK(G3L_CLKDIVSTATUS, 15, 1)
>
>  /* RZ/G3L Specific clocks select. */
>  #define G3L_SEL_ETH0_TX                SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

