Return-Path: <linux-renesas-soc+bounces-35097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aJjmDgm9VGqAqQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 12:25:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB3749C34
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 12:25:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F500300F4FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 10:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F212241CB7;
	Mon, 13 Jul 2026 10:24:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646335F61A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 10:24:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938278; cv=none; b=cetWSeaGM4iqsLr1Fg/P+mRVRVXU/7du9dZ+7QRY1bHLTUE7BHWzgBU10niDNIRnVVDt1EXryPngyZ24KSvUU/bSPY48OZq4zvLQ10PYTAhwUXnm9lcRETkwnMOxVozf7fYbPh02CQeZxfqPUYiyu43gwruU3f0B4/M+f9PR6Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938278; c=relaxed/simple;
	bh=gnOONJI/FttYdj/hlauLNnplmzplZ3jAon5ohLlODbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOwBT8B+RGYwDieR4uuEivEerp8NGn5bPhtzFWR5pyE7biuJgVflZSqPjgIRJgOjVCS3+pBxcaQ5HOGnC9Fojsfg2jcQSh0rsUEKKhPqTMLNzUnDXIAQzJFR3/dQVzv1Zn2TtHldMyWKKOfyVrQbfQGSA3VIsXuMQLiTCmieX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so5309165a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 03:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938274; x=1784543074;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tbIGIghWWKNfDdw1F8tz0OtxhskaJuOiI918laGeFvQ=;
        b=BiX1sCYdmrM0NLb9EU7Kgt5N47fF1omxbhcATC6+yRZN5s7cXwAWDacSMWcAeM+acY
         knMLun69DjbqH1PU63M8ZaOcK5fwksWRs8M55zrUhrqP6ETlf7jJ1S1r/9ebax573ZR+
         27Y7iZkeUClQU1jIVjAHn178hXfIR1xjvWat7RK2DE8Ne9a0ctP/A1ciSFZumn3YEhQt
         tfNgY9xS2EXlSM8PV//XiAS6KqFfdrstLRF6fAvjDCCRP/PYVCeSQt2P/S7ruiTFYPz9
         yd1c3ju6/LQMjqo/ldWzXK9hT7wuGka4q02bhrXRyd+tCG/lwG8vtUU+Hytn99NIkwOf
         3qLg==
X-Gm-Message-State: AOJu0YyVnKko9O5hJRphHV3LE6C6fiOUyANCDFs5pzwb0EdAfuDWxbxB
	HY2HzOTR+ozN9hcY3j620QeSOa96Mmp37jnhGW1wRrN1htnwlAMb5Ub3HSmqJN4zo+8=
X-Gm-Gg: AfdE7cko7ckjyTryOpPmzS/bdiJJMfPMm7AxwwIWLCcvhEU23WgJCx1vKTFjGpMBMXZ
	AIhJV/RNzd6HH2MLG9K6ogNw/yBYr3nE6v8cvBGLvQCzZRqYlkO74rh5V9YmyxG+0FXXeSiINXd
	RocUVmZOmu42QpQ6rIC268v5DwFkEaPjlh0YmG6JsP4Oc3XNtzQPWcNh/ZGoyNDRa3tOLDu1R4G
	HmwJKKWQ8NSZ3L7nwg5EM5agU6sUBSnhLTOIt7Nx2t1Osb7cl1AbHRiB6Yio49f0B4UcjZ505XQ
	XZg0exWF4NioYtC84O/o1VfcIZTdTy31GASDmhkWm34qlxnZAwrIgDMVdh1DDfDn2L+KShVg8dw
	iPqMTNaHLTNhs350ACG5iW9QVJldI+lX/VpCydxxDhlu7egPCBCg5aayqIJvCUGgfV4uciG+uWk
	XnnCXLjIsy4AxW8La3NBHwRb9m59qPky3C2f9T5oYfdq+zms0VrQ==
X-Received: by 2002:a17:907:7251:b0:c12:5d9a:8ce6 with SMTP id a640c23a62f3a-c161e940108mr356868966b.5.1783938274285;
        Mon, 13 Jul 2026 03:24:34 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm547822266b.59.2026.07.13.03.24.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:24:33 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so5309145a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 03:24:33 -0700 (PDT)
X-Received: by 2002:a05:6402:a513:10b0:69c:72e2:5b5 with SMTP id
 4fb4d7f45d1cf-69c72e2091dmr2025764a12.19.1783938273267; Mon, 13 Jul 2026
 03:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com> <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
In-Reply-To: <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 12:24:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXD0EyaimogRnvbWg1HC91kE1EdEZtV7ct8s-JY9ho52w@mail.gmail.com>
X-Gm-Features: AUfX_mw0RXrcJVfmTIefgb2UHhGLLjrZR9uzD_wnzzRTLlX3FQIauo0umSvX6WE
Message-ID: <CAMuHMdXD0EyaimogRnvbWg1HC91kE1EdEZtV7ct8s-JY9ho52w@mail.gmail.com>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the
 buffer init
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35097-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EBB3749C34

Hi Bartosz,

On Mon, 13 Jul 2026 at 11:46, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 13 Jul 2026 11:20:02 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Sun, 12 Jul 2026 at 11:32, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> >> To avoid more false positive reports of "leaking memory" when
> >> fops_buf_size_set() returns an error.
> >
> > But who is freeing priv->blob.data when fops_buf_size_set() succeeds?
>
> In case I was too eager picking it up, let me drop it from my tree before I
> pushed it out and wait for Wolfram's response.

Sorry for being unclear: the issue is pre-existing.
I don't object to this patch.

I don't see how "people" would come up with these bug reports,
but probably I am not smart enough to understand the logic of the AI ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

