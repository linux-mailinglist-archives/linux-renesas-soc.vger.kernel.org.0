Return-Path: <linux-renesas-soc+bounces-32577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHy4DHSDBGpwLAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:58:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C99ED534855
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F122431BC399
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C64B31E853;
	Wed, 13 May 2026 13:38:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CD2E1C4E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679534; cv=none; b=Sfs8Z9GVLvmK2arDts/MCGdQ5GdMj8q5cSdcyKYazhxceBIAeH5FgQj+DZ5wf+6MDJn2beIhwXrHUdaBd73FU6oJVRD/+eIHpXlnVCTiVjwBf8jkxOkY+Sgow9bdvAW5fnTYYOBtZYlaU2xHk+7Zus3aMav31p/qaWigf+1n+T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679534; c=relaxed/simple;
	bh=kPZ7A5cvokRvd7vF4xD+Y1QfccmxOHw5oZJ2oKw4NGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnabfGokR9qEKE7h7odewWd4v05fCzTW1xb7k/DLZfAF/jfOSpnyDaJQL99XOciueDuqBv/LAbA8DpCNjwWpqa/pDSdKituY9Wuw5C2qd6sqzKkdW5xiAbU7hq8dMGWcN7vcKZxdAnLr34/Vzol4BIwXAyb0tXRSE1t2koTCsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-575267e3398so4750997e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679532; x=1779284332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrwW8HJMZcY9Fq5J+G2ZrLwjCrrOc6AC4xQETMaCZKg=;
        b=aEtB5WIotmUCzY19BioihNUMXs/9HsHngEVt3ZGXbgCUfjajdYAERqv6tSKJ+0ZCT/
         J0u8ZgH2x+xshfpUR5uj4TfgD8wWvmMdKSU5nfMdwurc0eBF5iyd7D5adyDtkrun3sxU
         4+ZgA6LhaMYYeFoKBiQ+3/LKDZrJ8zc4GI1w8vl814uTxRpHr+AzfzOyYtlySrJyWNFH
         /UcnAGA9o4A8oJe28oI5ubHgA0B/WQilegxge5uaVU/BYdd+YAj65hPPc5dqyhuzUIz6
         SuzqTAjDqKmfNfte1zBbRJJRe0MWjCGIyyXGZjuLBFUPuYGDUtoHzLdxs3L7F5zuppvZ
         VZHg==
X-Forwarded-Encrypted: i=1; AFNElJ8f/B0nmU+cVfsLEwXjHxj9Q83yl4Cebj/hjGtr4oBUo7OM63UIIBmM/0Hny1O3CvUvy1t0/gUkFCsIK8nNp4nxzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaNKbknb6OQ5mSZzJF9kDhzmCEyXNMfiOtO7ztNYvMXRuWulfs
	tBpOgpIPKnDFV8SNQ/UGfS/AaC9zz+YFuFnGU3Ef+ntTdOqQ2nf3F30M/FEatkiz
X-Gm-Gg: Acq92OEOptXF5Sfb/u95o2jsUY6fUxP8ohTmLupfHnIDhp+QA47gmw8YZgPcxI2KROo
	b0qD4uQn1LD2HQJ0wJgvK7aRKKXtwRaXzX9/vIVMmF+tWRt1auKM1Eo9/qmmRUgUhFdFWlSfJjw
	qFFsX0fiPPkZ7hnFalvtsLkS20a4FrijSLycOrkMzMHFjsZebzM3JR903MQ0lfQSoIvGstLpyWl
	ay9nOznXBWl5raguTeSTkqykkfsm2lcuezScXGdi8TE1oYwov5/4BDNbEU7r3DrC/O5+UFmcA1P
	o807/rgnqDzZwADD6K+ePAAgX/xsekSCnaTiGjOqeogfzOF3MgGj4dHQr0P8XkXCJ0FpytOp8lz
	Jy0ntX+Zak0F5SrolbxO+axsfbl+AlOwXCikL2gk4/03BadyHr1pQWix6U1wVfS6HierEAn/hwz
	9i5Ax7lXLS7f3atyrXkmlkNwq6jNM/E96ExeEifIqb/P56NhIkVQ+zOtacmS7i
X-Received: by 2002:a05:6122:6e01:b0:575:e7e2:9c31 with SMTP id 71dfb90a1353d-575e7e29cd1mr1352445e0c.10.1778679531855;
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869c0499sm10236897e0c.4.2026.05.13.06.38.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-63127c440ccso4167334137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:38:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OmzBvCar4m6TYpTjiDqvckOPxyy6CEFqkWas+z9q31BDtWXnw5IK72P72vhhfL4ZZUoUpXBfpdAH3AyM3kGYU+w==@vger.kernel.org
X-Received: by 2002:a05:6102:2924:b0:631:b365:40f6 with SMTP id
 ada2fe7eead31-63775f441f7mr1566639137.23.1778679530826; Wed, 13 May 2026
 06:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-3-marek.vasut+renesas@mailbox.org> <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
 <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
In-Reply-To: <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:38:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
X-Gm-Features: AVHnY4LU1BBWpNxE_fkGvk4Rs-4viEWKSh1Rjw7iIL0Qt5GSNDkgP1kR7U3ItzU
Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C99ED534855
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32577-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, 13 May 2026 at 15:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 5/13/26 3:15 PM, Geert Uytterhoeven wrote:
> > On Sat, 2 May 2026 at 20:56, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > /sys/kernel/debug/clk/clk_summary looks a bit off to me:
> >
> >      zt                         0       0        0        208000000
> >      ztr                        0       0        0        277333334
> >
> >> --- a/drivers/clk/renesas/clk-r8a73a4.c
> >> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> >> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
> >>          { "m1", CPG_FRQCRA,  4 },
> >>          { "m2", CPG_FRQCRA,  0 },
> >>          { "zx", CPG_FRQCRB, 12 },
> >> +       { "ztr", CPG_FRQCRB, 16 },
> >
> > 20?
> >
> >> +       { "zt", CPG_FRQCRB, 12 },
> >
> > 16? (12 is zx, cfr. above).
> >
> > I.e. the same shifts as on R-Mobile A1.
> >
> >>          { "zs", CPG_FRQCRB,  8 },
> >>          { "hp", CPG_FRQCRB,  4 },
> >>          { NULL, 0, 0 },
> >
> > After fixing the shifts, I get:
> >
> >      zt                         0       0        0        277333334
> >      ztr                        0       0        0        277333334
> >
> > which looks much better. If you agree, I can fix this while applying.
>
> Yes please. I can confirm in APE6 RM v0.7 that the ZTFC is at bit offset
> 16 and ZTRFC at bit offset 20 . Thank you for spotting this.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

