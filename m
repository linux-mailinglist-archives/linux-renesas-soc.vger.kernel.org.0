Return-Path: <linux-renesas-soc+bounces-32112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI1rJ6Tr+mkZUQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 09:20:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC094D7220
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 09:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF38F3054CDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 07:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5214C374736;
	Wed,  6 May 2026 07:19:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B44836BCC3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051990; cv=none; b=OWs6mnzeCnXJoqvfoe6HNZIl+6of86GQnCuAjsnW7lCukIyJw8cRuqxG9bNLn/25uWcv8kuRU9tRGuCmgiJ4N8gjzYyYMeZ7zVx3yGmf4xTtWTI9L95AUicHgTnrl47I/IKL7x3/8XL3itNvcWXqyu0+v7ZCTkKJqFx9Pey6MTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051990; c=relaxed/simple;
	bh=kCaOvIzrUuZaZ9zllpWZlClqzHH+Po6WdcxW6bwXC1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xq3G5fzqSwvA3oag3UpALJ2AEiubollpiF/+KxWB9zhDCEio/awBQLwdo7B9gPOb95gT+oP59QrS0xQ/OQhyrt/87ndM1MRFrY6KrJiQJUs7g3tTINZplFnx5ITdbOWiLP7IspSo2qjJl3tDKGCyoLYVNneZAlLbhBhuICNWMPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso6224117e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 00:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778051988; x=1778656788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFUn+S4/jA9VkVtPTANA9vhies8/mQGo7p0EcziVSIc=;
        b=XPLgt2oJcVfOY5cTYKX5B1ERPiH343Gnhd1rTuS4gaO+HhIVZAviM8lofQnJh/0T2l
         Hs3xAqXTHMWLEfYuwYzaoNPQDjSqb0n2NJm39ORrrooLPQl2KIIqMxqX+Z5FNrC8NNGD
         1AGHwxtgEdUHYB4mE/4tRBD9tpr+Tua5PUlUzCm8yUMJA2kgMv0V/3IsSyyk6jXoZi31
         UUonKmmZYk8u0svLmn1SAaM2qqRzbfLUL0wusGM66TZyUR2bTwqipGfAci0ZqBRMWTc6
         Du4X5kGVaIiChUbmiWs6c6ESfCqm9hmMvKA+9TsWO1PjvMxvg2f70tB6cQZJzciuo4HS
         AvTg==
X-Forwarded-Encrypted: i=1; AFNElJ9840//iN+n7Nci5pB5BZlRQeZgE1zfXohT+w06uxWTSlc75M2ejk5oETesiCjMftiGjEPa9jA1SyF4qK0041Nitg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHjQM+KbaI6gcKQNvr5j544tVwxz837w8pke978XLL3kvGLAZa
	u5Nl26V7+JD6eLFTM6cmM8CKo5xrZJTS9XInVX18iKKY4nOhk0V+oPrC2u6LFf7j
X-Gm-Gg: AeBDieuaNUsMNpkgm0pJbYJdvrZSaFtBzmsNTy5eMaaJVMo4a0O1Nu0EeKRs4zSIOuJ
	yGqIjG/N+ySWk2n2fGQGWSZuD16k6E+Lb1Y7An+Te8UyLwk9h6Px2IK1RasK5b1lqLxl1yZ9Ux7
	IYRZd4z2MNQl8T2jbJN6x0X5gnuSPoL0cOxKWxPHkEc4RjAHDfduE3Pgc1p1xt+0hS2acsoyXRB
	JTT0CzLvCl9zqMvKPcKuCQZc1DDYnJCtDgedmSJGKryLyxoYRTwLAT8/1dm0WzTpq02YTCOLD1e
	PjH/Bga0zqgVlKelwM52tG9CvIeiYpOu+atTP+/TmjtriyEzaLk9/hYLSx84vhXFG0i31RH/nL2
	sHQALJ4SvE1QFz55QrzKWAeYjQAQ5rOQhIi55ZyRBXJVlAhDEXwDr9iC3A0AX0xKHTEV68jsrWS
	U2fOzoQRYSpkMywEvkmPcDCxmK2MVL/SB+N/oCnAXVvU8ghBxQMKVECLwGwCxkUVGNohjkj6M/D
	9nZs89U5g==
X-Received: by 2002:a05:6123:163:b0:575:352f:ead0 with SMTP id 71dfb90a1353d-575595589f7mr1297492e0c.6.1778051987952;
        Wed, 06 May 2026 00:19:47 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b71f31sm8421828241.13.2026.05.06.00.19.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 00:19:46 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-628086439b6so4476806137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 00:19:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99Y2Aq45An7Goi1GBHLFhsonW9qWDzUA9eIjelPveGbh0XF5A/PcaLtkgIXMNcJM7jyRli9P+3E6GbigY5UFrEnA==@vger.kernel.org
X-Received: by 2002:a05:6102:5787:b0:62f:3abe:907f with SMTP id
 ada2fe7eead31-630f8e78da2mr845360137.4.1778051985729; Wed, 06 May 2026
 00:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com> <20260505-clk-determine-rate-noop-v3-8-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-8-f3f829fbacdf@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 09:19:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWBx0Ob8BUWaRzeK_4OEHA1wwhfdPcBSG+jGV7dbbqgw@mail.gmail.com>
X-Gm-Features: AVHnY4LSv9zQeRlq1BPG1reoiAmWUtec3W-OeL3hQqk0PVXd-J0IaxIjKyjNPVs
Message-ID: <CAMuHMdVWBx0Ob8BUWaRzeK_4OEHA1wwhfdPcBSG+jGV7dbbqgw@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] clk: renesas: rzg2l-cpg: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4CC094D7220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32112-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,mail.gmail.com:mid]

On Wed, 6 May 2026 at 02:50, Brian Masney <bmasney@redhat.com> wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

