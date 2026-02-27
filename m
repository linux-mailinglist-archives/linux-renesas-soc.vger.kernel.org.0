Return-Path: <linux-renesas-soc+bounces-28512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SML0HmlVoWk+sQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 09:27:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ABF1B4875
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 09:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 447B8308C59C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 08:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2476A36494B;
	Fri, 27 Feb 2026 08:20:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA363364931
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180424; cv=none; b=ndAX/9zSEGngl6x+9L9swH26wTClqP9hyzPv4edXRZFyep0TbJeq/LPLy8TgPLHTgQVFmvsXR+9hkKvRNlbiWLVEfPNzr/t2MBFfMg601pD6epD7YAyhwzxT63sOCKFVSzk+uKn88kGzN3KhBWAoguPybY3MRWAdSyChFkTkkm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180424; c=relaxed/simple;
	bh=qfGaDXK95+OOnoa2/Oo2k0+JRm83LeVTat62jVPLQws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbfQJls+lLXAjFBZjZh5jkKpSjTZl8d46XelRhmLrNnmKdzeIJZsr1MBA7lI2JqrDsmxne3OO3lwxs2QIRDmJd3i2ooRBtFMSM24ThkSgr+PceEKbWkfhaGSRuNIrL29K27ztC8XiMEdOGksaS5cmaLhVyXVOQ2FVRe3KubroL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso693176e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180422; x=1772785222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vM7kNTsRSuwTYb1u/IIFpUK3Lpu1QAEIlctXUAXXFc=;
        b=eQYkJvCjhb91Wd/QozsfotKBjP1qnvz+rD35Q+jMeBJW1upB05um0nff5MpPTCZW1S
         Vi3zzWKv0StNc1EIU3jnJfzKDJuLFyv+VNK8OiVsU3/7G7BkXRIbd2c5J1HhzG98ke4M
         nfwJwALy/Rx41z1RW3l3PdNaWQoo+efuKrVPRw0J/cug8DgtOfOF5bacEOXzvVOHAket
         pPUyNegA6b2VLiOovsF3eCHljkkYTQ0+2j9ifxHysZHXZU/8E/ttBhQ2xaHl66EoXI1R
         rDjJ4t0r/GOpfWpHLNUSUfJEpAmpbSYfifQbxKZlkpQ1JW/EcL3KbZHRm7l2nuf5P0Wf
         tUig==
X-Forwarded-Encrypted: i=1; AJvYcCW1mpWJ8BG43QtCX65Lnc41TntUZg5AxevulJ0KqSe0Nmqt0U+Ja4ogF4PBsUDTTbhzX3z0S3nUK6kMMweAoHCV/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDglJAPzjpNnqNgbwoRV7BzW1nzsNjHvdYuANRMCY2TbHo5nJT
	KLuU3Bt3whGikQOityhYGLzbGrF3El1cFcb3VoelzIaniQjy2x3NYMyWoe21vol5SNU=
X-Gm-Gg: ATEYQzy1WI/O3RbbNr3KhCXz3Rq/Qv1hVw95uxIiNMep3EqPSFS5ALG1eqNon9WRTB6
	c85cWNzcMq93FUjAlMvGSFGxcbYOpTtdvAghaHgBRtqCTogrZq67N8MXhelTh+ZmEgbIUJR7LT0
	GNhP5VEfc1QMOpeqSW6U4aBcH5nGxwm3Pk0jbnTkiD8mQr318Mv7HcIZL++/0n6rC3UAEBygFw/
	fVkt9nVB8jP0jqHY+C11yy+syejxO/mgOfId0mQwBdufacH5IepWKOA5q+eDyCQPWT4PJ2JyLeG
	pHhpwPLkuwF0oMnK6gRRw49yVqM8JXzh0zLKbHbC1LqXW3bE63B32QAfY3hZDcIgUooa8sJdYso
	fQpy7NQsEYUn090rSZzZNb33FG/sbc1YYSNuUD451K3BESl/59je9WOE+ldMfJeH6KUrSJcab+Y
	R/xpgqdauAG3Yn/y9aZ7o66gQfHr1FQ83N8ZxjwhieiGNhAeTRl09TYJyPDnA8
X-Received: by 2002:a05:6122:829f:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56aa0a1826emr1154926e0c.4.1772180421837;
        Fri, 27 Feb 2026 00:20:21 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a922afe47sm5281381e0c.20.2026.02.27.00.20.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:20:21 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ff10630b18so555334137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXqz2ytNCSXOQASMCjrO56L0J8Me6Zqpa9+GmuhiFK7tfFcLnczpO0r1Te9oa5o6HtznLM7L+ealG54fc4C4F0/cA==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5f0:2451:5f5 with SMTP id
 ada2fe7eead31-5ff3227b5fdmr919932137.7.1772180420917; Fri, 27 Feb 2026
 00:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
X-Gm-Features: AaiRm514zxc-j2wSE9hmPrV4K28ncYIEZUw_Gwmc4uNdGcUAjx-4leTB7pDypQg
Message-ID: <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-28512-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E8ABF1B4875
X-Rspamd-Action: no action

Hi Brian,

C Biju

On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -938,12 +938,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
>         return pll5_rate;
>  }
>
> -static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
> -                                          struct clk_rate_request *req)
> -{
> -       return 0;
> -}
> -
>  static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>                                      unsigned long rate,
>                                      unsigned long parent_rate)
> @@ -1015,7 +1009,6 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>
>  static const struct clk_ops rzg2l_cpg_sipll5_ops = {
>         .recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
> -       .determine_rate = rzg2l_cpg_sipll5_determine_rate,
>         .set_rate = rzg2l_cpg_sipll5_set_rate,
>  };
>
> @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>         init.name = core->name;
>         parent_name = __clk_get_name(parent);
>         init.ops = &rzg2l_cpg_sipll5_ops;
> -       init.flags = 0;
> +       init.flags = CLK_ROUNDING_FW_MANAGED;

Iff this is the Right Thing To Do (TM), it needs a comment, as this
clock is not managed by firmware.

>         init.parent_names = &parent_name;
>         init.num_parents = 1;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

