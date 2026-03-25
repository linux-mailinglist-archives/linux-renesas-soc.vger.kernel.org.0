Return-Path: <linux-renesas-soc+bounces-30262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM63KqoNxGk+vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:30:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AC329082
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EB2C301F5C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 16:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AF93E1CE5;
	Wed, 25 Mar 2026 16:24:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DA73F0768
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455896; cv=none; b=R8pyO3qRbgmUUJJQyzAmLFyOmR4DVkjTUD1sq+OAaXJ4TJoapCFzzHAJ2izHaCCPKDcsr4yx73aGVQiNkRPIj6CSuj6aJnCg+hg+VURI1IZ05IdMvi6/I6hJjgAvoV4JwMoV1wIEnMxGeZ+FuoqN3YxHPWXHC34NZA5N/0HOAFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455896; c=relaxed/simple;
	bh=rmeZVPSOtvHKsudTVqrd29mAkraoSiHAZ4PP1RwACbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdvaE1+XZeLYzA4HX2q0W3HBU2i+e6c+yba7gA77Xak3Xw1mfq17FwCFFTaEDaCjgW+GT3Gno1lxEFMmIcQRcVJcODTHAdeRqs35uqyEeDHLvEkhdyd29JqixMqe929pirzgk8xWsVZg+tvfqph2T3Ll8xj+mlVEup25ydi0wSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso90608e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455893; x=1775060693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gAXhHrpF27wFNXFA6QhJ48A7x34w2nxZZrvrXeYgHw=;
        b=KWVgrWl05XENSqFLz923nora+vXx5TcsN1Zq3SXkkpAszeMWhD8j+/G9irVMDqcrHh
         zsIG5EMnKkVAQaOod7oXacbcyXDkdHuUwRX2t0s3mS+Ag0Xi0eRUyCV4Il4zQ+yz7AGf
         bltnkBymClt04z1Fhq+R34/NnFE3CS02bYZPx9XbvCUgs8sJPpy3cQFxmGoPyVrUaAN0
         BM3XsusmOhJWGFRA1LPDFS2thA6fG1MpFpOnBepcKVT/mlD5s1E2CczLJIaymYpbiaKO
         0rGT+xfttXqSgwrzoAOPkevuaGOIsGstiV9GSGSqX4p1F9WXHVjIB2oWUbqwsJaWCt8u
         a33g==
X-Forwarded-Encrypted: i=1; AJvYcCWTgoPXAXKjMq5X7dnGhK3NbnkuXJH6OSkeQk57rqOI6HpFiFo9PDu14DZ8gt/H/WdkaFQrTWmbipSGEJ4cIFXnPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqm4nzDabiL1K05TZ00Xk2dBrgXw+AX0j+JkWEjgDOCLVfNrKX
	zkr+t7vs/3Qgfmtuanz/VrHV/ok8BLGP+xrReb6kHhR5UBohxlazsVF1hlcDFRRNdWk=
X-Gm-Gg: ATEYQzwVi1e0XqrdoPtF3Y98fHEMESzWk58dQSN2URgNhDPBh1EbNllbs5/36CUd0SG
	SGyfUfc7/GNPhBFq8zF6edevquqhUlxL79oH+VCSwZRy2IDqOWGPOtAU1L8bt6udFm2KbSU4Sfv
	bTMrbqPp8E2nlv9k+O2xm7h6QUrZFVofGRHDRG/c87VGkXZuG9fvN9+Dg5f4QDmmKFsW4FqWyev
	x67rnIWQXq3kCEQM8+Q4zsz6FBTcJp08cj8TKBZEyYP62uY7s2HowgNpOH9BMzSfgR378U3Aegx
	LekNuqxZYA1W2kOHfgF+8c9c7oHwEzj2Ay3naM9Bhb9sIW5llzp03UT+QhEFWmguwSnvWwdbqQ6
	x+PPaGcfGxUCDm2x9ubYaLbBpWh/AQ0oA7yGEeTNKdf7joPLCksyKYTla6wMQus5zJdpH5b9uWI
	8nQpmMQR5LIOP3C0EAknL++o68DSBj6QkEyNUmNZGBJkb1vO3gkFKJroZbB9neGkCa
X-Received: by 2002:a05:6122:4f88:b0:56a:a06c:c88c with SMTP id 71dfb90a1353d-56d221292c5mr2302227e0c.17.1774455892622;
        Wed, 25 Mar 2026 09:24:52 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d9f049sm371143e0c.17.2026.03.25.09.24.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:24:52 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso132977e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuTxiPy2sqrUMhREFf5LtB6DMV0q+Wmdjspi0/a/lwCAcFeekKXWZN3ppvzcbKv5+2imBInzB207ngiu9YDpeaQQ==@vger.kernel.org
X-Received: by 2002:a05:6123:4c:b0:56b:a534:42c0 with SMTP id
 71dfb90a1353d-56d220ef9f1mr2094685e0c.15.1774455891759; Wed, 25 Mar 2026
 09:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324021103.13651-1-rosenp@gmail.com>
In-Reply-To: <20260324021103.13651-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:24:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6tBG7zQX_eGuLnvp1he1kQxTxj+8QmYj=jbo2OTGbMg@mail.gmail.com>
X-Gm-Features: AQROBzCGGCNDC4VvyRbtehsEECFBYE5hrIOwkI-_9A4YzO91h6FhBZCpQfgFjIE
Message-ID: <CAMuHMdV6tBG7zQX_eGuLnvp1he1kQxTxj+8QmYj=jbo2OTGbMg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: use struct_size
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:RENESAS CLOCK DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30262-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: B29AC329082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 03:11, Rosen Penev <rosenp@gmail.com> wrote:
> struct_size is what is normally used when a flexible array member is
> present to avoid accidental mistakes. pm_size is still needed for the
> memcpy call below.
>
> Added __counted_by for extra runtime analysis.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

FTR, no changes in generated  code.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

